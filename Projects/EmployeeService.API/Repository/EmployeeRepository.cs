using EmployeeService.API.Model;
using EmployeeService.API.Utility;
using Microsoft.Extensions.Options;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace EmployeeService.API.Repository
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private readonly ConfigurationItem _configurationItem;

        public EmployeeRepository(IOptions<ConfigurationItem> configurationItem)
        {
            _configurationItem = configurationItem.Value;
        }
        public bool DeleteEmployeeById(int employeeId)
        {
            bool isDeleted = false;
            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_DeleteEmployeeById, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Id", employeeId);
                    command.ExecuteNonQuery();
                }
            }
            isDeleted = true;
            return isDeleted;
        }

        public Employee GetEmployeeById(int employeeId)
        {
            Employee employee = new();

            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_GetEmployeeById, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeId", employeeId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (employee.EmployeeId == null || employee.EmployeeId == 0)
                            {
                                employee.EmployeeId = Convert.ToInt32(reader["EmployeeId"]);
                                employee.EmployeeName = Convert.ToString(reader["EmployeeName"]);
                                employee.EmployeeDOB = Convert.ToDateTime(reader["EmployeeDOB"]);
                                employee.State = Convert.ToInt32(reader["State"]);
                                employee.City = Convert.ToInt32(reader["City"]);
                                employee.Gender = Convert.ToInt32(reader["Gender"]);
                                //employee.Photo.Photo = reader["Photo"] != null ? (byte[])reader["Photo"] : null;
                                //employee.Photo.Id = Convert.ToInt32(reader["PhotoId"]);
                            }

                            EmployeeHobbies item = new EmployeeHobbies
                            {
                                Id = Convert.ToInt32(reader["EmployeeHobbyId"]),
                                EmployeeId = employee.EmployeeId,
                                HobbyId = Convert.ToInt32(reader["HobbyId"])
                            };

                            employee.EmployeeHobbies.Add(item);
                        }
                    }
                }
            }
            return employee;
        }

        public List<Employee> GetEmployees()
        {
            List<Employee> employees = new();

            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_GetEmployees, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Employee employee = new Employee
                            {
                                EmployeeId = Convert.ToInt32(reader["EmployeeId"]),
                                EmployeeName = Convert.ToString(reader["EmployeeName"]),
                                EmployeeDOB = Convert.ToDateTime(reader["EmployeeDOB"]),
                                State = Convert.ToInt32(reader["State"]),
                                City = Convert.ToInt32(reader["City"])
                            };
                            employees.Add(employee);
                        }
                    }
                }
            }
            return employees;
        }

        public bool InsertEmployee(Employee employee)
        {
            bool isInserted = false;
            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();
                int newEmployeeId = 0;
                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_InsertEmployee, connection, transaction))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeName", employee.EmployeeName);
                    command.Parameters.AddWithValue("@EmployeeDOB", employee.EmployeeDOB);
                    command.Parameters.AddWithValue("@Gender", employee.Gender);
                    command.Parameters.AddWithValue("@Address", employee.Address);
                    command.Parameters.AddWithValue("@State", employee.State);
                    command.Parameters.AddWithValue("@City", employee.City);
                    command.Parameters.AddWithValue("@CreatedDate", employee.CreatedDate);

                    newEmployeeId = (int)command.ExecuteScalar();
                }

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_InsertEmployeePhoto, connection, transaction))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeId", newEmployeeId);
                    command.Parameters.AddWithValue("@Photo", employee.Photo?.Photo);
                    command.Parameters.AddWithValue("@CreatedDate", employee.CreatedDate);
                    command.ExecuteNonQuery();
                }

                DataTable table = new DataTable();
                table.Columns.Add("Id", typeof(int));
                table.Columns.Add("EmployeeId", typeof(int));
                table.Columns.Add("HobbyId", typeof(string));
                table.Columns.Add("CreatedDate", typeof(DateTime));
                table.Columns.Add("IsActive", typeof(bool));
                table.Columns.Add("ModifiedDate", typeof(DateTime));


                foreach (var item in employee.EmployeeHobbies)
                {
                    table.Rows.Add(item.Id, newEmployeeId, item.HobbyId, item.CreatedDate, item.IsActive, item.ModifiedDate);
                }

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_InsertOrUpdateEmployeeHobbies, connection, transaction))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeHobbies", table);
                    command.Parameters.AddWithValue("@EmployeeId", newEmployeeId);
                    command.ExecuteNonQuery();
                }

                transaction.Commit();
                isInserted = true;
            }
            return isInserted;
        }

        public bool UpdateEmployee(Employee employee)
        {
            bool isUpdated = false;
            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();
                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_UpdateEmployee, connection, transaction))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                    command.Parameters.AddWithValue("@EmployeeName", employee.EmployeeName);
                    command.Parameters.AddWithValue("@EmployeeDOB", employee.EmployeeDOB);
                    command.Parameters.AddWithValue("@Gender", employee.Gender);
                    command.Parameters.AddWithValue("@Address", employee.Address);
                    command.Parameters.AddWithValue("@State", employee.State);
                    command.Parameters.AddWithValue("@City", employee.City);
                    command.Parameters.AddWithValue("@ModifiedDate", employee.ModifiedDate);
                    command.Parameters.AddWithValue("@IsActive", employee.IsActive);
                    command.ExecuteNonQuery();
                }

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_UpdateEmployeePhoto, connection, transaction))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Id", employee.Photo?.Id);
                    command.Parameters.AddWithValue("@Photo", employee.Photo?.Photo);
                    command.Parameters.AddWithValue("@ModifiedDate", employee.ModifiedDate);
                    command.Parameters.AddWithValue("@IsActive", employee.IsActive);
                    command.ExecuteNonQuery();
                }

                DataTable table = new DataTable();
                table.Columns.Add("Id", typeof(int));
                table.Columns.Add("EmployeeId", typeof(int));
                table.Columns.Add("HobbyId", typeof(string));
                table.Columns.Add("CreatedDate", typeof(DateTime));
                table.Columns.Add("IsActive", typeof(bool));
                table.Columns.Add("ModifiedDate", typeof(DateTime));


                foreach (var item in employee.EmployeeHobbies)
                {
                    table.Rows.Add(item.Id, employee.EmployeeId, item.HobbyId, item.CreatedDate, item.IsActive, item.ModifiedDate);
                }

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_InsertOrUpdateEmployeeHobbies, connection, transaction))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeHobbies", table);
                    command.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                    command.ExecuteNonQuery();
                }

                transaction.Commit();
                isUpdated = true;
            }
            return isUpdated;
        }
        public void InsertLogDetails(LogDetails logDetails)
        {
            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_InsertLogDetails, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@LogLevel", logDetails.LogLevel);
                    command.Parameters.AddWithValue("@Message", logDetails.Message);
                    command.Parameters.AddWithValue("@InputParameters", logDetails.InputParameters);
                    command.Parameters.AddWithValue("@Exception", logDetails.Exception);
                    command.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}

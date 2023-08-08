using EmployeeService.API.Model;
using EmployeeService.API.Model.ViewModel;
using EmployeeService.API.Utility;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Options;

namespace EmployeeService.API.Repository
{
    public class GeneralRepository : IGeneralRepository
    {
        private readonly ConfigurationItem _configurationItem;
        public GeneralRepository(IOptions<ConfigurationItem> configurationItem) 
        {
            _configurationItem = configurationItem.Value;
        }
        public List<SelectListView> GetCity(int? stateId)
        {
            List<SelectListView> cities = new();

            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_GetCity, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@StateId", stateId);


                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            SelectListView city = new SelectListView()
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Name = Convert.ToString(reader["Name"])
                            };
                            cities.Add(city);
                        }
                    }
                }
            }
            return cities;
        }

        public List<SelectListView> GetHobbies()
        {
            List<SelectListView> hobbies = new();

            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_GetHobbies, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            SelectListView hobby = new SelectListView()
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Name = Convert.ToString(reader["Name"])
                            };
                            hobbies.Add(hobby);
                        }
                    }
                }
            }
            return hobbies;
        }

        public List<SelectListView> GetState()
        {
            List<SelectListView> states = new();

            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_GetState, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            SelectListView state = new SelectListView()
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Name = Convert.ToString(reader["Name"])
                            };
                            states.Add(state);
                        }
                    }
                }
            }
            return states;
        }

        public List<SelectListView> GetGender()
        {
            List<SelectListView> genders = new();

            using (SqlConnection connection = new SqlConnection(_configurationItem.EmployeeConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(EmployeeConstants.SP_GetGender, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            SelectListView gender = new SelectListView()
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Name = Convert.ToString(reader["Name"])
                            };
                            genders.Add(gender);
                        }
                    }
                }
            }
            return genders;
        }
    }
}

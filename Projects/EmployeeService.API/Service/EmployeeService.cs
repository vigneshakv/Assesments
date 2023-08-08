using EmployeeService.API.Model;
using EmployeeService.API.Repository;
using EmployeeService.API.Utility;
using Microsoft.Extensions.Primitives;
using System.Text;

namespace EmployeeService.API.Service
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IEmployeeRepository _employeeRepository;

        public EmployeeService(IEmployeeRepository employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }
        public bool DeleteEmployeeById(int employeeId)
        {
            bool isDeleted = false;
            ValidateEmployeeId(employeeId);
            isDeleted = _employeeRepository.DeleteEmployeeById(employeeId);
            return isDeleted;
        }

        public Employee GetEmployeeById(int employeeId)
        {
            Employee employee = new();
            ValidateEmployeeId(employeeId);
            employee = _employeeRepository.GetEmployeeById(employeeId);
            return employee;
        }

        public List<Employee> GetEmployees()
        {
            List<Employee> employees = new();
            employees = _employeeRepository.GetEmployees();
            return employees;
        }

        public bool InsertOrUpdateEmployee(Employee employee)
        {
            bool isInsertOrUpdated = false;
            validateEmployeeDetails(employee);
            setMetaData(employee);
            if(employee.EmployeeId > 0)
            {
                isInsertOrUpdated = _employeeRepository.UpdateEmployee(employee);
            }
            else
            {
                isInsertOrUpdated = _employeeRepository.InsertEmployee(employee);
            }
            return isInsertOrUpdated;
        }
        public void InsertLogDetails(LogDetails logDetails)
        {
            _employeeRepository.InsertLogDetails(logDetails);
        }

        #region Private Methods
        private void ValidateEmployeeId(int employeeId)
        {
            if (employeeId <= 0)
            {
                string errorFields = string.Format(EmployeeConstants.MandatoryFieldsError, "employeeId");
                throw new ArgumentException(errorFields);
            }
        }

        private void validateEmployeeDetails(Employee employeeDetails)
        {
            StringBuilder errorFields = new();
            errorFields.Append(string.IsNullOrEmpty(employeeDetails.EmployeeName) ? string.Format("{0}, ", EmployeeConstants.ValidateEmployee.EmployeeName.GetDescription()) : string.Empty);
            errorFields.Append(employeeDetails.EmployeeDOB != null? string.Empty : string.Format("{0}, ",EmployeeConstants.ValidateEmployee.EmployeeDOB.GetDescription()));
            errorFields.Append(employeeDetails.Gender <= 0 ? string.Format("{0}, ", EmployeeConstants.ValidateEmployee.EmployeeGender.GetDescription()) : string.Empty);
            errorFields.Append(string.IsNullOrEmpty(employeeDetails.Address) ? string.Format("{0}, ", EmployeeConstants.ValidateEmployee.Address.GetDescription()) : string.Empty);
            errorFields.Append(employeeDetails.State <= 0 ? string.Format("{0}, ", EmployeeConstants.ValidateEmployee.State.GetDescription()) : string.Empty);
            errorFields.Append(employeeDetails.City <= 0 ? string.Format("{0}, ", EmployeeConstants.ValidateEmployee.City.GetDescription()) : string.Empty);

            if(errorFields.Length > 0)
            {
                string error = string.Format(EmployeeConstants.MandatoryFieldsError, errorFields.ToString().Trim().TrimEnd(','));
                throw new ArgumentException(error);
            }
        }

        private static void setMetaData(Employee employee)
        {
            if(employee.EmployeeId > 0)
            {
                employee.ModifiedDate = DateTime.Now;
            }
            else
            {
                employee.CreatedDate = DateTime.Now;
            }
            employee.EmployeeHobbies.ForEach(x =>
            {
                x.CreatedDate = employee.ModifiedDate ?? employee.CreatedDate;
                x.ModifiedDate = employee.ModifiedDate;
            });
        }
        #endregion
    }
}

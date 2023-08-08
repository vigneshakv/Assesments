using EmployeeService.API.Model;
using EmployeeService.API.Utility;

namespace EmployeeService.API.Repository
{
    public interface IEmployeeRepository
    {
        List<Employee> GetEmployees();
        Employee GetEmployeeById(int employeeId);
        bool InsertEmployee(Employee employee);
        bool UpdateEmployee(Employee employee);
        bool DeleteEmployeeById(int employeeId);
        void InsertLogDetails(LogDetails logDetails);
    }
}

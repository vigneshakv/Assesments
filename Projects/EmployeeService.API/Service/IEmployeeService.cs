using EmployeeService.API.Model;
using EmployeeService.API.Utility;
using System.Text;

namespace EmployeeService.API.Service
{
    public interface IEmployeeService
    {
        List<Employee> GetEmployees();
        Employee GetEmployeeById(int employeeId);
        bool InsertOrUpdateEmployee(Employee employee);
        bool DeleteEmployeeById(int employeeId);
        void InsertLogDetails(LogDetails logDetails);
    }
}

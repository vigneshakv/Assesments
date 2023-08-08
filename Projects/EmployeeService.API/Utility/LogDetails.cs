using EmployeeService.API.Model;

namespace EmployeeService.API.Utility
{
    public class LogDetails : EntityBase
    {
        public string? LogLevel { get; set; }
        public string? Message { get; set; }
        public string? InputParameters { get; set; }
        public string? Exception { get; set; }
    }
}

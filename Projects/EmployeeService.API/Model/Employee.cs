namespace EmployeeService.API.Model
{
    public class Employee : EntityBase
    {
        public int? EmployeeId { get; set; }
        public string? EmployeeName { get; set; }
        public DateTime? EmployeeDOB { get; set; }
        public string? Address { get; set; }
        public int Gender { get; set; }
        public int State { get; set; }
        public int City { get; set; }
        public List<EmployeeHobbies> EmployeeHobbies { get; set; } = new();
        public EmployeePhoto? Photo { get; set; }
    }
}

namespace EmployeeService.API.Model
{
    public class EmployeeHobbies : EntityBase
    {
        public int? Id { get; set; }
        public int? EmployeeId { get; set; }
        public int? HobbyId { get; set; }
    }
}

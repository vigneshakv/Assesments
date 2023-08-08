namespace EmployeeService.API.Model
{
    public class EmployeePhoto
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public byte[]? Photo { get; set; }
    }
}

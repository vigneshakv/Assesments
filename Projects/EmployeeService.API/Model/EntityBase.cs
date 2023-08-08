namespace EmployeeService.API.Model
{
    public class EntityBase
    {
        public DateTime? CreatedDate { get; set; }
        public bool IsActive { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}

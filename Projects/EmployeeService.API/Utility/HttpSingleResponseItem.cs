namespace EmployeeService.API.Utility
{
    public class HttpSingleResponseItem<T>
    {
        public T? Data { get; set; }
        public int StatusCode { get; set; }
        public string? Exception { get; set; }
    }
}

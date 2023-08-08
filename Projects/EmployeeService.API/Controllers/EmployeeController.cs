using EmployeeService.API.Model;
using EmployeeService.API.Service;
using EmployeeService.API.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Text;
using System.Text.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeService.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _employeeService;

        public EmployeeController(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }

        [HttpGet]
        [Route("GetEmployee")]
        public HttpResponseItem<Employee> GetEmployee()
        {
            StringBuilder traceLog = new();
            HttpResponseItem<Employee> response = new();
            LogDetails logDetails = new();
            try
            {
                response.Data = _employeeService.GetEmployees();
                response.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "GetEmployee Completed.###";
            }
            catch (Exception ex)
            {
                response.StatusCode = 500;
                response.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method GetEmployee : {0}.###",ex.Message);
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
            }
            _employeeService.InsertLogDetails(logDetails);
            return response;
        }

        [HttpGet]
        [Route("GetEmployeeById")]
        public HttpSingleResponseItem<Employee> GetEmployeeById(int id)
        {
            StringBuilder traceLog = new();
            HttpSingleResponseItem<Employee> responseItem = new();
            LogDetails logDetails = new();
            try
            {
                responseItem.Data = _employeeService.GetEmployeeById(id);
                responseItem.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "GetEmployeeById Completed.###";
            }
            catch(Exception ex)
            {
                responseItem.StatusCode = 500;
                responseItem.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method GetEmployeeById : {0}.###", ex.Message);
                logDetails.Message = traceLog.ToString();
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
                logDetails.InputParameters = string.Format("Employee Id : {0}", id);
            }
            _employeeService.InsertLogDetails(logDetails);
            return responseItem;
        }

        [HttpPost]
        [Route("InsertOrUpdateEmployee")]
        public HttpSingleResponseItem<bool> InsertOrUpdateEmployee([FromBody] Employee employee)
        {
            StringBuilder traceLog = new();
            HttpSingleResponseItem<bool> responseItem = new();
            LogDetails logDetails = new();
            try
            {
                responseItem.Data = _employeeService.InsertOrUpdateEmployee(employee);
                responseItem.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "InsertOrUpdateEmployee Completed.###";
            }
            catch(Exception ex)
            {
                responseItem.StatusCode = 500;
                responseItem.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method InsertOrUpdateEmployee : {0}.###", ex.Message);
                logDetails.Message = traceLog.ToString();
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
                employee.Photo = null;
                logDetails.InputParameters = JsonSerializer.Serialize(employee);
            }
            _employeeService.InsertLogDetails(logDetails);
            return responseItem;
        }

        [HttpDelete]
        [Route("DeleteEmployeeById")]
        public HttpSingleResponseItem<bool> Delete(int id)
        {
            StringBuilder traceLog = new();
            HttpSingleResponseItem<bool> responseItem = new();
            LogDetails logDetails = new();
            try
            {
                responseItem.Data = _employeeService.DeleteEmployeeById(id);
                responseItem.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "Delete Completed.###";
            }
            catch (Exception ex)
            {
                responseItem.StatusCode = 500;
                responseItem.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method DeleteEmployeeById : {0}.###", ex.Message);
                logDetails.Message = traceLog.ToString();
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
                logDetails.InputParameters = string.Format("Employee Id : {0}", id);
            }
            _employeeService.InsertLogDetails(logDetails);
            return responseItem;
        }
    }
}

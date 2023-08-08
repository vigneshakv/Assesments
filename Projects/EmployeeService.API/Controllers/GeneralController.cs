using EmployeeService.API.Model;
using EmployeeService.API.Model.ViewModel;
using EmployeeService.API.Service;
using EmployeeService.API.Utility;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace EmployeeService.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneralController : ControllerBase
    {
        private readonly IGeneralService _generalService;
        private readonly IEmployeeService _employeeService;

        public GeneralController(IGeneralService generalService, IEmployeeService employeeService)
        {
            _generalService = generalService;
            _employeeService = employeeService;
        }

        [HttpGet]
        [Route("GetState")]
        public HttpResponseItem<SelectListView> GetState()
        {
            StringBuilder traceLog = new();
            HttpResponseItem<SelectListView> response = new();
            LogDetails logDetails = new();
            try
            {
                response.Data = _generalService.GetState();
                response.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "GetState Completed.###";
            }
            catch (Exception ex)
            {
                response.StatusCode = 500;
                response.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method GetState : {0}.###", ex.Message);
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
            }
            _employeeService.InsertLogDetails(logDetails);
            return response;
        }

        [HttpGet]
        [Route("GetCity")]
        public HttpResponseItem<SelectListView> GetCity(int? stateId)
        {
            StringBuilder traceLog = new();
            HttpResponseItem<SelectListView> response = new();
            LogDetails logDetails = new();
            try
            {
                response.Data = _generalService.GetCity(stateId);
                response.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "GetCity Completed.###";
            }
            catch (Exception ex)
            {
                response.StatusCode = 500;
                response.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method GetCity : {0}.###", ex.Message);
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
            }
            _employeeService.InsertLogDetails(logDetails);
            return response;
        }

        [HttpGet]
        [Route("GetHobbies")]
        public HttpResponseItem<SelectListView> GetHobbies()
        {
            StringBuilder traceLog = new();
            HttpResponseItem<SelectListView> response = new();
            LogDetails logDetails = new();
            try
            {
                response.Data = _generalService.GetHobbies();
                response.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "GetHobbies Completed.###";
            }
            catch (Exception ex)
            {
                response.StatusCode = 500;
                response.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method GetHobbies : {0}.###", ex.Message);
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
            }
            _employeeService.InsertLogDetails(logDetails);
            return response;
        }

        [HttpGet]
        [Route("GetGender")]
        public HttpResponseItem<SelectListView> GetGender()
        {
            StringBuilder traceLog = new();
            HttpResponseItem<SelectListView> response = new();
            LogDetails logDetails = new();
            try
            {
                response.Data = _generalService.GetGender();
                response.StatusCode = 200;
                logDetails.LogLevel = EmployeeConstants.LogLevels.Debug.GetDescription();
                logDetails.Message = "GetGender Completed.###";
            }
            catch (Exception ex)
            {
                response.StatusCode = 500;
                response.Exception = ex.Message;
                traceLog.AppendFormat("Exception occured in method GetGender : {0}.###", ex.Message);
                logDetails.LogLevel = EmployeeConstants.LogLevels.Error.GetDescription();
                logDetails.Exception = ex.Message;
            }
            _employeeService.InsertLogDetails(logDetails);
            return response;
        }
    }
}

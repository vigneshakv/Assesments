using EmployeeService.API.Model.ViewModel;

namespace EmployeeService.API.Service
{
    public interface IGeneralService
    {
        List<SelectListView> GetState();
        List<SelectListView> GetCity(int? stateId);
        List<SelectListView> GetHobbies();
        List<SelectListView> GetGender();
    }
}

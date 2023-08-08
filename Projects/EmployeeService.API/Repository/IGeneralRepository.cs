using EmployeeService.API.Model.ViewModel;

namespace EmployeeService.API.Repository
{
    public interface IGeneralRepository
    {
        List<SelectListView> GetState();
        List<SelectListView> GetCity(int? stateId);
        List<SelectListView> GetHobbies();
        List<SelectListView> GetGender();
    }
}

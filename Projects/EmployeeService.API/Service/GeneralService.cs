using EmployeeService.API.Model.ViewModel;
using EmployeeService.API.Repository;

namespace EmployeeService.API.Service
{
    public class GeneralService : IGeneralService
    {
        private readonly IGeneralRepository _gerneralRepository;
        public GeneralService(IGeneralRepository generalRepository)
        {
            _gerneralRepository = generalRepository;
        }
        public List<SelectListView> GetCity(int? stateId)
        {
            List<SelectListView> cities = new();
            cities = _gerneralRepository.GetCity(stateId);
            return cities;
        }

        public List<SelectListView> GetHobbies()
        {
            List<SelectListView> hobbies = new();
            hobbies = _gerneralRepository.GetHobbies();
            return hobbies;
        }

        public List<SelectListView> GetState()
        {
            List<SelectListView> states = new();
            states = _gerneralRepository.GetState();
            return states;
        }

        public List<SelectListView> GetGender()
        {
            List<SelectListView> gender = new();
            gender = _gerneralRepository.GetGender();
            return gender;
        }
    }
}

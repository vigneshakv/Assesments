using System.ComponentModel;

namespace EmployeeService.API.Utility
{
    public static class EmployeeConstants
    {
        public enum LogLevels
        {
            [Description("Error")]
            Error,
            [Description("Debug")]
            Debug
        }

        #region Stored Procedures
        public static readonly string SP_GetEmployees = "[dbo].[GetEmployees]";
        public static readonly string SP_GetEmployeeById = "[dbo].[GetEmployeeById]";
        public static readonly string SP_InsertEmployee = "[dbo].[InsertEmployee]";
        public static readonly string SP_InsertEmployeePhoto = "[dbo].[InsertEmployeePhoto]";
        public static readonly string SP_InsertOrUpdateEmployeeHobbies = "[dbo].[InsertOrUpdateEmployeeHobbies]";
        public static readonly string SP_UpdateEmployee = "[dbo].[UpdateEmployee]";
        public static readonly string SP_UpdateEmployeePhoto = "[dbo].[UpdateEmployeePhoto]";
        public static readonly string SP_DeleteEmployeeById = "[dbo].[DeleteEmployeeById]";

        public static readonly string SP_GetCity = "[dbo].[GetCity]";
        public static readonly string SP_GetState = "[dbo].[GetState]";
        public static readonly string SP_GetHobbies = "[dbo].[GetHobbies]";
        public static readonly string SP_GetGender = "[dbo].[GetGender]";

        public static readonly string SP_InsertLogDetails = "[dbo].[InsertLogDetails]";
        #endregion

        #region Error Fields
        public enum ValidateEmployee
        {
            [Description("EmployeeId")]
            EmployeeId,
            [Description("EmployeeName")]
            EmployeeName,
            [Description("EmployeeDOB")]
            EmployeeDOB,
            [Description("EmployeeGender")]
            EmployeeGender,
            [Description("Address")]
            Address,
            [Description("State")]
            State,
            [Description("City")]
            City,
            [Description("EmployeePhoto")]
            EmployeePhoto
        }
        #endregion

        #region Error Messages
        public static readonly string MandatoryFieldsError = "Mandatory Fields Missing Error : {0}.";
        #endregion
    }
}

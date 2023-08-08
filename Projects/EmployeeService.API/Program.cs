using EmployeeService.API.Repository;
using EmployeeService.API.Service;
using EmployeeService.API.Utility;
using Microsoft.Extensions.Configuration;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.Configure<ConfigurationItem>(
    builder.Configuration.GetSection("ConfigurationItem"));

builder.Services.AddSingleton<IEmployeeService, EmployeeService.API.Service.EmployeeService>();
builder.Services.AddSingleton<IEmployeeRepository, EmployeeRepository>();

builder.Services.AddSingleton<IGeneralService, GeneralService>();
builder.Services.AddSingleton<IGeneralRepository, GeneralRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

using ArtistsManager.Persistence.Data;
using ArtistsManager.Persistence.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace ArtistsManager.Persistence;

public static class DependencyInjection 
{ 
    public static IServiceCollection AddPersistence(this IServiceCollection services) 
    { 
        services.AddSingleton<IUnitOfWork, EfUnitOfWork>(); 
        return services; 
    } 
    public static IServiceCollection AddPersistence(this IServiceCollection services, DbContextOptions options) 
    {             
        services.AddPersistence().AddSingleton(new ApplicationDbContext((DbContextOptions<ApplicationDbContext>)options)); 
        return services; 
    } 
}
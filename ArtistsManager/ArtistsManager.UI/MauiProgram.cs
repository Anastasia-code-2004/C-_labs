using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using ArtistsManager.Application;
using ArtistsManager.Persistence;
using Microsoft.EntityFrameworkCore;
using ArtistsManager.Persistence.Data;
using Microsoft.Extensions.Configuration;
using System.Reflection;


namespace ArtistsManager.UI
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            string settingsStream = "ArtistsManager.UI.appsettings.json";

            var builder = MauiApp.CreateBuilder();
            var a = Assembly.GetExecutingAssembly();
            using var stream = a.GetManifestResourceStream(settingsStream);
            builder.Configuration.AddJsonStream(stream);

            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
            var connStr = builder.Configuration.GetConnectionString("SqliteConnection");
            string dataDirectory = FileSystem.Current.AppDataDirectory + "/";
            connStr = String.Format(connStr, dataDirectory);
            var options = new DbContextOptionsBuilder<ApplicationDbContext>() 
                .UseSqlite(connStr)
                .Options;
    		builder.Logging.AddDebug();
            builder.Services
                .AddApplication()
                .AddPersistence(options)
                .AddPersistence()
                .RegisterPages()
                .RegisterViewModels();
            DbInitializer.Initialize(builder.Services.BuildServiceProvider()).Wait();
#endif

            return builder.Build();
        }
    }
}

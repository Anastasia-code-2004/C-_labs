using Microsoft.Extensions.Logging;
using NikolaychikLAB1.Services;
using CommunityToolkit.Maui;

namespace NikolaychikLAB1
{
    public static class MauiProgram
    {
        //Класс MauiProgram устанавливает класс, который
        //запускается при запуске приложения и который устанавливает визуальный облик приложения.
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>() //как раз определяет класс, запускаемый при старте приложения и
                                   //задающий внешний вид приложения. По умолчанию это класс App из файла App.xaml.cs.
                .UseMauiCommunityToolkitMediaElement()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");

                    fonts.AddFont("Brands-Regular-400.otf", "FAB");
                    fonts.AddFont("Free-Regular-400.otf", "FAR");
                    fonts.AddFont("Free-Solid-900.otf", "FAS");

                });
                
            builder.Services.AddTransient<IDbService, SQLiteService>();
            builder.Services.AddTransient<ArtistSongsPage>();
            
            //builder.Services.AddTransient<IRateService, RateService>();
            builder.Services.AddHttpClient<IRateService, RateService>(client =>
            {
                client.BaseAddress = new Uri("https://www.nbrb.by/api/exrates/rates");
            });
            builder.Services.AddTransient<CurrencyConverterPage>();

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();     
        }
    }
}

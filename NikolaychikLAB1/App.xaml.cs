using System.Globalization;

namespace NikolaychikLAB1
{
    public partial class App : Application
    {
        public App()
        {
            //файл с кодом C#, с которого начинается выполнение приложения
            InitializeComponent();

            MainPage = new AppShell();

            CultureInfo ci = new("en-US");
            CultureInfo.CurrentCulture = ci;
            CultureInfo.CurrentUICulture = ci;
        }
    }
}

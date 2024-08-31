using System.Diagnostics;

namespace NikolaychikLAB1;

public partial class LoadingPage : ContentPage
{
	double progress = 0;
	string percents = "0 %";
	string currentText = "Welcome to .NET MAUI!";
    CancellationTokenSource cancelTokenSource;

    public LoadingPage()
	{
		InitializeComponent();
        cancelTokenSource = new();
        BindingContext = this;
        CancelBtn.IsEnabled = false;
    }
	public string CurrentText
	{
        get => currentText;
        set
		{
            if (currentText == value) return;
            currentText = value;
            OnPropertyChanged();
        }
    }
	public string Percents
	{
		get => percents;
		set
		{
            if (percents == value) return;
            percents = value;
            OnPropertyChanged();
        }
	}
	public double Progress
	{
        get => progress;
        set
		{
            if (progress == value) return;
            progress = value;
            OnPropertyChanged();
        }
    }
    
    private async Task<double> IntegralSinAsync(CancellationToken token)
    {
        double result = 0;
        double step = 0.001;
        int percents_ = 0;

        await Task.Run(() =>
        {
            for (double i = 0; i <= 1; i += step)
            {
                Debug.WriteLine($"In await. Thread ID: {Thread.CurrentThread.ManagedThreadId}");

                if (token.IsCancellationRequested)
                {
                    return;
                }

                result += Math.Sin(i) * step;

                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Debug.WriteLine($"Maybe mainThread. Thread ID: {Thread.CurrentThread.ManagedThreadId}");
                    Progress += step;
                    if (percents_ <= i * 100 && percents_ <= 99)
                    {
                        percents_++;
                        Percents = percents_.ToString() + " %";
                    }
                });
                for (int j = 0; j < 2000000; j++)
                {
                    int k = j * 2;
                }
            }
        }, token);
        return result;
    }
    async void Start_Clicked(object sender, EventArgs e)
    {
        CancelBtn.IsEnabled = true;
        StartBtn.IsEnabled = false;
        CancellationToken token = cancelTokenSource.Token;

        double result;

        Progress = 0;
        Percents = "0 %";
        CurrentText = "Calculating...";

        result = await IntegralSinAsync(token);

        if (!token.IsCancellationRequested)
        {
            CurrentText = $"Task completed! With result {Math.Round(result, 3)}";
        }
        else
        {
            CurrentText = $"Task canceled! With result {Math.Round(result, 3)}";
        }
        StartBtn.IsEnabled = true;
        CancelBtn.IsEnabled = false;

        Debug.WriteLine($"After await. Thread ID: {Thread.CurrentThread.ManagedThreadId}");
    }
    private void Cancel_Clicked(object sender, EventArgs e)
    {
        cancelTokenSource?.Cancel();
        CancelBtn.IsEnabled = false;
        StartBtn.IsEnabled = true;
        cancelTokenSource = new();
    }
}
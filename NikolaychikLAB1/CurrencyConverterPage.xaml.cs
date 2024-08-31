namespace NikolaychikLAB1;
using NikolaychikLAB1.Services;
using NikolaychikLAB1.Entities;
using System.Diagnostics;
using static SQLite.SQLite3;

public partial class CurrencyConverterPage : ContentPage
{
    readonly IRateService _rateService;
    private List<Rate> rates;
	public CurrencyConverterPage(IRateService _rateService)
	{
		InitializeComponent();
		this._rateService = _rateService;
        rates = [];
        DatePicker_DateSelected(null, new DateChangedEventArgs(DateTime.Now, DateTime.Now));
	}
    private async void DatePicker_DateSelected(object? sender, DateChangedEventArgs e)
    {
        CURentry.Text = BYNentry.Text = "";
        DateTime selectedDate = e.NewDate;
        rates = (List<Rate>)await _rateService.GetRates(selectedDate);

        string result = "";
        foreach (var rate in rates)
        {
            if (rate.Cur_Abbreviation is "RUB" or "EUR" or "USD" or "CHF" or "CNY" or "GBP")
            {
                result += rate.Cur_Scale + " " + rate.Cur_Abbreviation + " = " + rate.Cur_OfficialRate + " BYN" + '\n' + '\n';
            }
        }
        ResLab.Text = result;
    }
    private void Picker_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(BYNCur.Text == "BYN")
        {
            CURentry.Text = BYNentry.Text = "";
            Picker picker = (Picker)sender;
            ConvertCur.Text = picker.SelectedItem as string;
        }
    }

    private void BYNentry_TextChanged(object sender, TextChangedEventArgs e)
    {
        if (!Decimal.TryParse(BYNentry.Text, out _) || BYNentry.Text.Contains(','))
        {
            CURentry.Text = "";
            return;
        }
        if (BYNCur.Text == "BYN")
        {
            foreach (var rate in rates)
            {
                if (rate.Cur_Abbreviation == ConvertCur.Text)
                {
                    decimal forOne = (decimal)(rate.Cur_Scale / rate.Cur_OfficialRate);
                    CURentry.Text = Math.Round((forOne * Decimal.Parse(BYNentry.Text)), 4).ToString();
                    return;
                }
            }
        }
        else
        {
            foreach (var rate in rates)
            {
                if (rate.Cur_Abbreviation == BYNCur.Text)
                {
                    decimal forOne = (decimal)(rate.Cur_OfficialRate / rate.Cur_Scale);
                    CURentry.Text = Math.Round((forOne * Decimal.Parse(BYNentry.Text)), 4).ToString();
                    return;
                }
            }
        }
    }

    private void DirectionButton_Clicked(object sender, EventArgs e)
    {
        if(ConvertCur.Text is not null)
        {
            CURentry.Text = BYNentry.Text = "";
            (BYNCur.Text, ConvertCur.Text) = (ConvertCur.Text, BYNCur.Text);
        }
    }
}
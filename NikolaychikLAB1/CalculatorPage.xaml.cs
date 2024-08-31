namespace NikolaychikLAB1;

public partial class CalculatorPage : ContentPage
{
    private string number = "0";
    readonly string love = "Love rules the world, not numbers";
    string value1, value2;
    string mathOperator;
    public CalculatorPage()
	{
		InitializeComponent();
        BindingContext = this;
        value1 = value2 = mathOperator = "nothing";
	}

    public string Number
    {
        get => number;
        set
        {
            if (number == value) return;
            number = value;
            OnPropertyChanged();
        }

    }
    private void Love_Clicked(object sender, EventArgs e)
    {
        Number = love;
    }

    private void BtnClearAll_Clicked(object sender, EventArgs e)
    {
        Number = "0";
    }
    private void CheckLabel()
    {
        if(Number == "")
        {
            Number = "0";
        }
    }

    private void Percent_Clicked(object sender, EventArgs e)
    {
        if (double.TryParse(Number, out _) && double.Parse(Number) > 0)
        {
            Number = (double.Parse(Number) / 100).ToString("G9");
        }
        CheckLabel();
    }

    private void Digit_Clicked(object sender, EventArgs e)
    {
        Button button = (Button)sender;

        if (!double.TryParse(Number, out _))
        {
            Number = "";
            Number = button.Text;
        }
        else
        {
            if (Number.Length <= 7)
            {
                if (Number == "0")
                {
                    if (button.Text == "0")
                    {
                        Number = "0";
                    }
                    else
                    {
                        Number = "";
                        Number = button.Text;
                    }
                }
                else
                {
                    Number += button.Text;
                }
            }
        }
        //LabResult.Text = Number;
    }

    private void ClearOne_Clicked(object sender, EventArgs e)
    {
        if ((Number != "0" && Number.Length == 1) || Number.Contains('E') || (Number.Length == 2 && Number.Contains('-')))
        {
            Number = "0";  
        }
        if (double.TryParse(Number, out _) && Number.Length != 1)
        {
            Number = Number.Remove(Number.Length - 1);
        }
        CheckLabel();
    }

    private void Abs_Clicked(object sender, EventArgs e)
    {
        if (double.TryParse(Number, out _))
        {
            if (Number.First() == '-')
            {
                Number = Number.Remove(0, 1);
            }
        }
        CheckLabel();
    }

    private void DivideByX_Clicked(object sender, EventArgs e)
    {
        if(double.TryParse(Number, out _) && Number != "0")
        {
            double num = double.Parse(Number);
            num = 1 / num;
            Number = num.ToString("G9");
        }
        if(Number == "0")
        {
            Number = "Cannot divide by zero";
        }
        CheckLabel();
    }

    private void Square_Clicked(object sender, EventArgs e)
    {
        if(double.TryParse(Number, out _))
        {
            Number = Math.Pow(double.Parse(Number), 2).ToString("G9");
        }
        CheckLabel();
    }

    private void RootSqua_Clicked(object sender, EventArgs e)
    {
        if (double.TryParse(Number, out _) && double.Parse(Number) > 0)
        {
            Number = Math.Sqrt(double.Parse(Number)).ToString("G9");
        }
        CheckLabel();
    }

    private void Point_Clicked(object sender, EventArgs e)
    {
        if(double.TryParse(Number, out _) && !Number.Contains('.'))
        {
            Number += '.';
        }
        CheckLabel();
    }

    private void Equal_Clicked(object sender, EventArgs e)
    {
        if(Number == "")
        {
            Number = value1;
            value1 = value2 = mathOperator = "nothing";
        }
        else
        {
            value2 = Number;
            double result = 0;
            string warning = "";

            switch (mathOperator)
            {
                case "/":
                    if (double.Parse(value2) != 0)
                    {
                        result = double.Parse(value1) / double.Parse(value2);
                    }
                    else
                    {
                        warning = "Cannot divide by zero!";
                    }
                    break;

                case "*":
                    result = double.Parse(value1) * double.Parse(value2);
                    break;

                case "+":
                    result = double.Parse(value1) + double.Parse(value2);
                    break;

                case "-":
                    result = double.Parse(value1) - double.Parse(value2);
                    break;
            }

            
            if(warning != "")
            {
                Number = warning;
            }
            else
            {
                Number = result.ToString("G9");
            }
            value1 = value2 = mathOperator = "nothing";
        }
    }

    private void MathOper_Clicked(object sender, EventArgs e)
    {
        if(double.TryParse(Number, out _))
        {
            value1 = Number;

            Button button = (Button)sender;

            mathOperator = button.Text;

            Number = "";
        }
    }
}


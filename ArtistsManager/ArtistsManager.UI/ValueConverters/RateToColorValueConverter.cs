using System.Globalization;

namespace ArtistsManager.UI.ValueConverters;

internal class RateToColorValueConverter : IValueConverter
{
    public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if ((int)value < 6)
            return Colors.Orange;
        return Colors.Aquamarine;
    }

    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}
using System.Globalization;

namespace ArtistsManager.UI.ValueConverters;

internal class IdToImageSourceConverter : IValueConverter
{
    public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is int id)
        {
            var folderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures), "Images");
            var filePath = Path.Combine(folderPath, $"{id}.png");
            if (File.Exists(filePath))
            {
                return ImageSource.FromFile(filePath);
            }
        }
        return ImageSource.FromFile("singer.png");
    }

    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}
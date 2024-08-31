using ArtistsManager.Application.ArtistUseCases.Queries;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Diagnostics;


namespace ArtistsManager.UI.ViewModels;

public partial class AddArtistViewModel : ObservableObject
{
    private readonly IMediator _mediator;
    private byte[] _photoData;
    public AddArtistViewModel(IMediator mediator)
    {
        _mediator = mediator;
    }

    [ObservableProperty] private string _name;
    [ObservableProperty] private DateTime _dateOfBirth;
    [ObservableProperty] private ImageSource _selectedPhoto = ImageSource.FromFile("singer.png");
    
    [RelayCommand]
    async Task AddArtistAsync() => await AddArtistHandleAsync();
    [RelayCommand]
    async Task ChoosePhotoAsync() => await ChoosePhotoHandleAsync();
    private async Task AddArtistHandleAsync()
    {
        var artist = await _mediator.Send(new AddArtistCommand(Name, DateOfBirth));
        if (_photoData != null)
        {
            var folderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures), "Images");
            if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);
            Debug.WriteLine("Folder path: " + folderPath);
            var filePath = Path.Combine(folderPath, $"{artist.Id}.png");
            await File.WriteAllBytesAsync(filePath, _photoData);
        }
        await Shell.Current.Navigation.PopAsync();
    }
    private async Task ChoosePhotoHandleAsync()
    {
        var result = await MediaPicker.PickPhotoAsync();
        if (result != null)
        {
            await using (var stream = await result.OpenReadAsync())
            {
                _photoData = new byte[stream.Length];
                await stream.ReadAsync(_photoData, 0, _photoData.Length);
            }
            SelectedPhoto = ImageSource.FromStream(() => new MemoryStream(_photoData));
        }
    }
} 
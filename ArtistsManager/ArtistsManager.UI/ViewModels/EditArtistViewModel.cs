using ArtistsManager.Application.ArtistUseCases.Queries;
using ArtistsManager.Application.SongUseCases.Queries;
using ArtistsManager.Domain.Entities;
using ArtistsManager.UI.ValueConverters;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;


namespace ArtistsManager.UI.ViewModels
{
    [QueryProperty(nameof(ArtistId), "ArtistId")]
    public partial class EditArtistViewModel : ObservableObject
    {
        private readonly IMediator _mediator;
        private byte[] _photoData;
        public int ArtistId { get; set; }

        [ObservableProperty]
        Artist _artist;

        [ObservableProperty]
        private ImageSource _selectedPhoto;
        public EditArtistViewModel(IMediator mediator)
        {
            _mediator = mediator;
        }
        [RelayCommand]
        void UpdateInfo() => GetInfo();

        [RelayCommand]
        async Task EditArtistAsync() => await EditArtistHandleAsync();

        [RelayCommand]
        async Task ChoosePhotoAsync() => await ChoosePhotoHandleAsync();

        private async void GetInfo()
        {
            Artist = await _mediator.Send(new GetArtistByIdCommand(ArtistId));
            IdToImageSourceConverter converter = new();
            SelectedPhoto = converter.Convert(Artist.Id, typeof(ImageSource), null, null) as ImageSource;
        }
        private async Task EditArtistHandleAsync()
        {
            await _mediator.Send(new EditArtistCommand(Artist));
            if (_photoData != null)
            {
                var folderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures), "Images");
                var filePath = Path.Combine(folderPath, $"{Artist.Id}.png");
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
}

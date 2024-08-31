using ArtistsManager.Application.SongUseCases.Queries;
using ArtistsManager.Domain.Entities;
using ArtistsManager.UI.Pages;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;


namespace ArtistsManager.UI.ViewModels
{
    [QueryProperty(nameof(Song), "Song")]
    public partial class SongDetailsViewModel : ObservableObject
    {
        private readonly IMediator _mediator;
        [ObservableProperty]
        Song _song;
        public SongDetailsViewModel(IMediator mediator)
        {
            _mediator = mediator;
        }
        [RelayCommand]
        async Task DeleteSongAsync() => await DeleteSongHandleAsync();
        [RelayCommand]
        async Task MoveSongAsync() => await GotoMoveSongPageAsync();
        
        [RelayCommand]
        async Task EditSongAsync() => await GotoEditSongPageAsync();
        private async Task DeleteSongHandleAsync()
        {
            await _mediator.Send(new DeleteSongCommand(Song.Id));
            await Shell.Current.Navigation.PopAsync();
        }
        private async Task GotoMoveSongPageAsync()
        {
            IDictionary<string, object> parameters = new Dictionary<string, object>
            {
                { "Song", Song }
            };
            await Shell.Current.GoToAsync(nameof(MoveSongPage), parameters);
        }

        private async Task GotoEditSongPageAsync()
        {
            IDictionary<string, object> parameters = new Dictionary<string, object>
            {
                { "Song", Song }
            };
            await Shell.Current.GoToAsync(nameof(EditSongPage), parameters);
        }
    }
}
using System.Collections.ObjectModel;
using ArtistsManager.Application.ArtistUseCases.Queries;
using ArtistsManager.Application.SongUseCases.Queries;
using ArtistsManager.Domain.Entities;
using ArtistsManager.UI.Pages;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;


namespace ArtistsManager.UI.ViewModels;

public partial class ArtistsViewModel : ObservableObject
{ 
    private readonly IMediator _mediator;
    public ArtistsViewModel(IMediator mediator)
    {
        _mediator = mediator;
    }

    public ObservableCollection<Artist> Artists { get; set; } = [];
    public ObservableCollection<Song> Songs { get; set; } = [];
    
    [ObservableProperty]
    Artist selectedArtist;

    [RelayCommand]
    async Task UpdateArtistsAsync() => await GetArtistsAsync();
    
    [RelayCommand]
    async Task UpdateSongsAsync() => await GetSongsAsync();
    
    [RelayCommand]
    async Task AddArtistAsync() => await GotoAddArtistPageAsync();

    [RelayCommand]
    async Task AddSongAsync(int artistId) => await GotoAddSongPageAsync(artistId);

    [RelayCommand]
    async Task DeleteArtistAsync(int artistId) => await DeleteArtistHandleAsync(artistId);

    [RelayCommand]
    async Task EditArtistAsync(int artistId) => await GotoEditArtistPageAsync(artistId);

    [RelayCommand]
    async void ShowDetails(Song song) => await GotoDetailsPage(song);

    private async Task GetArtistsAsync()
    {
        var artists = await _mediator.Send(new GetArtistsByRequest());
        await MainThread.InvokeOnMainThreadAsync(() =>
        {
            Artists.Clear();
            foreach (var artist in artists)
            {
                Artists.Add(artist);
            }
        }
        );
    }

    private async Task GetSongsAsync()
    {
        IEnumerable<Song> songs = [];
        if (SelectedArtist != null)
        {
            songs = await _mediator.Send(new GetSongsByArtistRequest(SelectedArtist.Id));
        }
        await MainThread.InvokeOnMainThreadAsync(() =>
        {
            Songs.Clear();
            foreach (var song in songs)
            {
                Songs.Add(song);
            }
        });
    }
    private async Task GotoDetailsPage(Song song)
    {
        IDictionary<string, object> parameters = new Dictionary<string, object>
        {
            { "Song", song }
        };
        await Shell.Current.GoToAsync(nameof(SongDetailsPage), parameters);
    }
    private async Task GotoAddArtistPageAsync()
    {
        await Shell.Current.GoToAsync(nameof(AddArtistPage));
    }
    private async Task GotoAddSongPageAsync(int artistId)
    {
        IDictionary<string, object> parameters = new Dictionary<string, object>
        {
            { "ArtistId", artistId }
        };
        await Shell.Current.GoToAsync(nameof(AddSongPage), parameters);
    }

    private async Task DeleteArtistHandleAsync(int artistId)
    {
        await _mediator.Send(new DeleteArtistCommand(artistId));
        await GetArtistsAsync();
    }
    private async Task GotoEditArtistPageAsync(int artistId)
    {
        if(SelectedArtist == null) return;
        IDictionary<string, object> parameters = new Dictionary<string, object>
        {
            { "ArtistId", artistId }
        };
        await Shell.Current.GoToAsync(nameof(EditArtistPage), parameters);
    }
}
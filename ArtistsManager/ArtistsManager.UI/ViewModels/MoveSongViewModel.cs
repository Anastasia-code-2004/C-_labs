using System.Collections.ObjectModel;
using ArtistsManager.Application.ArtistUseCases.Queries;
using ArtistsManager.Application.SongUseCases.Queries;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace ArtistsManager.UI.ViewModels;

[QueryProperty(nameof(Song), "Song")]
public partial class MoveSongViewModel : ObservableObject
{
    private readonly IMediator _mediator;
    [ObservableProperty]
    Song _song;
    public MoveSongViewModel(IMediator mediator)
    {
        _mediator = mediator;
    }

    public ObservableCollection<Artist> Artists { get; set; } = [];
    [ObservableProperty] private Artist _selectedArtist;
    
    [RelayCommand]
    async Task UpdateArtistsAsync() => await GetArtistsAsync();
    [RelayCommand]
    async Task MoveSongAsync() => await MoveSongHandleAsync();
    private async Task GetArtistsAsync()
    {
        var artists = await _mediator.Send(new GetAllExceptIdArtistsCommand(Song.ArtistId));
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
    private async Task MoveSongHandleAsync()
    {
        if(SelectedArtist == null) return;
        await _mediator.Send(new MoveSongCommand(Song.Id, SelectedArtist.Id));
        await Shell.Current.Navigation.PopAsync();
    }
}
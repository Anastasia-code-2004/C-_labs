using ArtistsManager.Application.SongUseCases.Queries;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace ArtistsManager.UI.ViewModels;

[QueryProperty(nameof(Song), "Song")]
public partial class EditSongViewModel : ObservableObject
{
    private readonly IMediator _mediator;

    [ObservableProperty]
    Song _song;
    public EditSongViewModel(IMediator mediator)
    {
        _mediator = mediator;
    }

    [RelayCommand]
    async Task EditSongAsync() => await EditSongHandleAsync();
    private async Task EditSongHandleAsync()
    {
        await _mediator.Send(new EditSongCommand(Song));
        await Shell.Current.Navigation.PopAsync();
    }
}
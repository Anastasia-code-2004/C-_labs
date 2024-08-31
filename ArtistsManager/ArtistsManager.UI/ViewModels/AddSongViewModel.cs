using ArtistsManager.Application.SongUseCases.Queries;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.UI.ViewModels;

[QueryProperty(nameof(ArtistId), "ArtistId")]
public partial class AddSongViewModel : ObservableObject
{
    private readonly IMediator _mediator;
    public int ArtistId { get; set; }
    public AddSongViewModel(IMediator mediator)
    {
        _mediator = mediator;
    }
    [ObservableProperty] private string _title;
    [ObservableProperty] private string _genre;
    [ObservableProperty] private DateTime _releaseDate;
    [ObservableProperty] private int _chartPosition;

    [RelayCommand] async Task AddSongAsync() => await AddSongHandleAsync();
    private async Task AddSongHandleAsync()
    {
        await _mediator.Send(new AddSongCommand(Title, Genre, ReleaseDate, ChartPosition, ArtistId));
        await Shell.Current.Navigation.PopAsync();
    }
}


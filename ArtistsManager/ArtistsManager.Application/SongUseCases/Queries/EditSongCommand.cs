namespace ArtistsManager.Application.SongUseCases.Queries;

public sealed record EditSongCommand(Song Song) : IRequest<Song>
{
    
}
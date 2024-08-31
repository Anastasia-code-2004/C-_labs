namespace ArtistsManager.Application.SongUseCases.Queries;

public sealed record MoveSongCommand(int SongId, int ArtistId) : IRequest<Song>
{
    
}
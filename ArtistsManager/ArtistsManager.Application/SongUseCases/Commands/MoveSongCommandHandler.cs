using ArtistsManager.Application.SongUseCases.Queries;

namespace ArtistsManager.Application.SongUseCases.Commands;

internal class MoveSongCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<MoveSongCommand, Song>
{
    public async Task<Song> Handle(MoveSongCommand request, CancellationToken cancellationToken)
    {
        var song = await unitOfWork.SongRepository.GetByIdAsync(request.SongId, cancellationToken);

        song.AddArtist(request.ArtistId);
        
        await unitOfWork.SongRepository.UpdateAsync(song, cancellationToken);
        await unitOfWork.SaveAllAsync();

        return song;
    }
}
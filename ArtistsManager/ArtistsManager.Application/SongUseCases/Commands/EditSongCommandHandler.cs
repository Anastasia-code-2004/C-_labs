using ArtistsManager.Application.SongUseCases.Queries;

namespace ArtistsManager.Application.SongUseCases.Commands;

internal class EditSongCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<EditSongCommand, Song>
{
    public async Task<Song> Handle(EditSongCommand request, CancellationToken cancellationToken)
    {
        await unitOfWork.SongRepository.UpdateAsync(request.Song, cancellationToken);
        await unitOfWork.SaveAllAsync();

        return request.Song;
    }
}
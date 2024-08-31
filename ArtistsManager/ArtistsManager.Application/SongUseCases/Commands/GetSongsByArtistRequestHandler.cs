using ArtistsManager.Application.SongUseCases.Queries;

namespace ArtistsManager.Application.SongUseCases.Commands;

internal class GetSongsByArtistRequestHandler(IUnitOfWork unitOfWork) :
    IRequestHandler<GetSongsByArtistRequest, IEnumerable<Song>>
{
    public async  Task<IEnumerable<Song>> Handle(GetSongsByArtistRequest request, CancellationToken cancellationToken)
    {
        return await unitOfWork.SongRepository.ListAsync(t => t.ArtistId.Equals(request.Id), cancellationToken);
    }
}
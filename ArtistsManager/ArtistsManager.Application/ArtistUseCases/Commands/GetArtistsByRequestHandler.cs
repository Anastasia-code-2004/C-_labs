using ArtistsManager.Application.ArtistUseCases.Queries;

namespace ArtistsManager.Application.ArtistUseCases.Commands;

internal class GetArtistsByRequestHandler(IUnitOfWork unitOfWork) :
    IRequestHandler<GetArtistsByRequest, IEnumerable<Artist>>
{
    public async Task<IEnumerable<Artist>> Handle(GetArtistsByRequest request, CancellationToken cancellationToken)
    {
        return await unitOfWork.ArtistRepository.ListAllAsync(cancellationToken);
    }
}
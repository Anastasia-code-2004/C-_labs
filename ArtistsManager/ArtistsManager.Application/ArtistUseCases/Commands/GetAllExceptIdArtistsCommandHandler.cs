using ArtistsManager.Application.ArtistUseCases.Queries;

namespace ArtistsManager.Application.ArtistUseCases.Commands;

public class GetAllExceptIdArtistsCommandHandler(IUnitOfWork unitOfWork) :
    IRequestHandler<GetAllExceptIdArtistsCommand, IEnumerable<Artist>>
{
    public async Task<IEnumerable<Artist>> Handle(GetAllExceptIdArtistsCommand request, CancellationToken cancellationToken)
    {
        return await unitOfWork.ArtistRepository.ListAsync(entity => entity.Id != request.Id, cancellationToken);
    }
}
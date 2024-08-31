namespace ArtistsManager.Application.ArtistUseCases.Queries;

public sealed record GetAllExceptIdArtistsCommand(int Id) : IRequest<IEnumerable<Artist>>
{
    
}
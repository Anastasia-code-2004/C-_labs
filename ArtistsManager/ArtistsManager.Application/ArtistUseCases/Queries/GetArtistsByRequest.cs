namespace ArtistsManager.Application.ArtistUseCases.Queries;

public sealed record GetArtistsByRequest() :
    IRequest<IEnumerable<Artist>>
{
    
}

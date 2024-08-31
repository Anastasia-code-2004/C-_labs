namespace ArtistsManager.Application.ArtistUseCases.Queries;

public sealed record AddArtistCommand(string Name, DateTime DateOfBirth) : IRequest<Artist>
{
}

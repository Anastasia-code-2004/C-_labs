using ArtistsManager.Application.ArtistUseCases.Queries;

namespace ArtistsManager.Application.ArtistUseCases.Commands;

internal class AddArtistCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<AddArtistCommand, Artist>
{
    public async Task<Artist> Handle(AddArtistCommand request, CancellationToken cancellationToken)
    {
        var artist = new Artist(new Person(request.Name, request.DateOfBirth));
        await unitOfWork.ArtistRepository.AddAsync(artist, cancellationToken);
        await unitOfWork.SaveAllAsync();
        return artist;
    }
}


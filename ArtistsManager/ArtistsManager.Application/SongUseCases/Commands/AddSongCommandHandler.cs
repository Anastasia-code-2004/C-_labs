using ArtistsManager.Application.SongUseCases.Queries;


namespace ArtistsManager.Application.SongUseCases.Commands
{
    internal class AddSongCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<AddSongCommand, Song>
    {
        public async Task<Song> Handle(AddSongCommand request, CancellationToken cancellationToken)
        {
            var song = new Song(request.Title, request.Genre, request.RealeseDate, request.ChartPosition);
            if (request.ArtistId.HasValue)
            {
                song.AddArtist(request.ArtistId.Value);
            }
            await unitOfWork.SongRepository.AddAsync(song, cancellationToken);
            await unitOfWork.SaveAllAsync();
            return song;
        }
    }
}

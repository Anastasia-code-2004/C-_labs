using Microsoft.Extensions.DependencyInjection;

namespace ArtistsManager.Application
{
    public static class DbInitializer
    {
        public static async Task Initialize(IServiceProvider services)
        {
            var unitOfWork = services.GetRequiredService<IUnitOfWork>();
            await unitOfWork.DeleteDataBaseAsync();
            await unitOfWork.CreateDataBaseAsync();
            
            var artist1 = new Artist(new Person("Billie Eilish", new DateTime(2001, 12, 18)))
            {
                Id = 1
            };
            var artist2 = new Artist(new Person("Lida", new DateTime(1995, 5, 10)))
            {
                Id = 2
            };
            await unitOfWork.ArtistRepository.AddAsync(artist1);
            await unitOfWork.ArtistRepository.AddAsync(artist2);
            await unitOfWork.SaveAllAsync();
            
            var song1 = new Song("Bad Guy", "Pop", new DateTime(2019, 3, 29), 10)
            {
                Id = 1
            };
            
            song1.AddArtist(1);
            var song2 = new Song("Bury a Friend", "Pop", new DateTime(2019, 1, 30), 2)
            {
                Id = 2
            };
            song2.AddArtist(1);
            var song3 = new Song("ChSV", "Pop", new DateTime(2021, 1, 1), 1)
            {
                Id = 3
            };
            song3.AddArtist(2);
            var song4 = new Song("Emo HardCore", "Pop", new DateTime(2021, 1, 1), 2)
            {
                Id = 4
            };
            song4.AddArtist(2);

            await unitOfWork.SongRepository.AddAsync(song1);
            await unitOfWork.SongRepository.AddAsync(song2);
            await unitOfWork.SongRepository.AddAsync(song3);
            await unitOfWork.SongRepository.AddAsync(song4);
            await unitOfWork.SaveAllAsync();
        }
    }
}

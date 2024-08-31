using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;

namespace ArtistsManager.Persistence.Repository;

public class FakeRepositories
{
    public class FakeArtistRepository : IRepository<Artist>
    {
        private readonly List<Artist> _artists;

        public FakeArtistRepository()
        {
            _artists = [];
            var artist = new Artist(new Person("Adele", new DateTime(1988, 5, 5)))
            {
                Id = 1
            };
            _artists.Add(artist);
            artist = new Artist(new Person("Lana Del Rey", new DateTime(1985, 6, 21)))
            {
                Id = 2
            };
            _artists.Add(artist);
        }
        public Task<Artist> GetByIdAsync(int id, CancellationToken cancellationToken = default, params Expression<Func<Artist, object>>[]? includesProperties)
        {
            throw new NotImplementedException();
        }

        public async Task<IReadOnlyList<Artist>> ListAllAsync(CancellationToken cancellationToken = default)
        {
            return await Task.Run(() => _artists);
        }

        public async Task<IReadOnlyList<Artist>> ListAsync(Expression<Func<Artist, bool>> filter, CancellationToken cancellationToken = default,
            params Expression<Func<Artist, object>>[]? includesProperties)
        {
            var query = _artists.AsQueryable();
            if (includesProperties.Any()) // если includesProperties пустой - вернуться только основные свойства
            {
                foreach (Expression<Func<Artist, object>>? included in includesProperties)
                {
                    query = query.Include(included);
                }
            }
            if (filter != null)
            {
                query = query.Where(filter);
            }
            return query.ToList();
        }

        public Task AddAsync(Artist entity, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(Artist entity, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Artist entity, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task<Artist> FirstOrDefaultAsync(Expression<Func<Artist, bool>> filter, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }
    }
    
    public class FakeSongRepository : IRepository<Song>
    {
        private readonly List<Song> _songs;

        public FakeSongRepository()
        {
            _songs = [];
            var song = new Song("Hello, It's Me", "Pop", new DateTime(2015, 11, 20))
            {
                Id = 1
            };
            song.AddArtist(1);
            //song.UpdateChartPosition(10);
            _songs.Add(song);
            song = new Song("Someone Like You", "Pop", new DateTime(2011, 9, 29))
            {
                Id = 2
            };
            song.AddArtist(1);
            _songs.Add(song);
            song = new Song("West Coast", "Pop", new DateTime(2014, 4, 14))
            {
                Id = 3
            };
            song.AddArtist(2);
            _songs.Add(song);
            song = new Song("Summertime Sadness", "Pop", new DateTime(2012, 6, 22))
            {
                Id = 4
            };
            song.AddArtist(2);
            //song.UpdateChartPosition(6);
            _songs.Add(song);
        }
        public Task<Song> GetByIdAsync(int id, CancellationToken cancellationToken = default, params Expression<Func<Song, object>>[]? includesProperties)
        {
            throw new NotImplementedException();
        }

        public async Task<IReadOnlyList<Song>> ListAllAsync(CancellationToken cancellationToken = default)
        {
            return await Task.Run(() => _songs);
        }

        public async Task<IReadOnlyList<Song>> ListAsync(Expression<Func<Song, bool>> filter, CancellationToken cancellationToken = default,
            params Expression<Func<Song, object>>[]? includesProperties)
        {
            var query = _songs.AsQueryable();
            if (includesProperties.Any()) // если includesProperties пустой - вернуться только основные свойства
            {
                foreach (Expression<Func<Song, object>>? included in includesProperties)
                {
                    query = query.Include(included);
                }
            }
            if (filter != null)
            {
                query = query.Where(filter);
            }
            return query.ToList();
        }

        public Task AddAsync(Song entity, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(Song entity, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Song entity, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task<Song> FirstOrDefaultAsync(Expression<Func<Song, bool>> filter, CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }
    }
}
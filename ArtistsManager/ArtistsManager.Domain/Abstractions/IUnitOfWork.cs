using ArtistsManager.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Domain.Abstractions
{
    public interface IUnitOfWork
    {
        IRepository<Artist> ArtistRepository { get; }
        IRepository<Song> SongRepository { get; }
        public Task SaveAllAsync();
        public Task DeleteDataBaseAsync();
        public Task CreateDataBaseAsync();
    }
}

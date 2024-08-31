using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using NikolaychikLAB1.Entities;

namespace NikolaychikLAB1.Services
{
    public interface IDbService
    {
        IEnumerable<Artist> GetAllArtists();
        IEnumerable<Song> GetArtistSongs(int id);
        void Init();
    }
}

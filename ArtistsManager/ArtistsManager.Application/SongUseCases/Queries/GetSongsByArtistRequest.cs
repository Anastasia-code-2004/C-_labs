using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.SongUseCases.Queries;

public sealed record GetSongsByArtistRequest(int Id) :
    IRequest<IEnumerable<Song>>
{
}



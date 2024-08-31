using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.SongUseCases.Queries
{
    public sealed record AddSongCommand(string Title, string Genre, DateTime RealeseDate, int ChartPosition, int? ArtistId) : IRequest<Song>
    {
    }
}

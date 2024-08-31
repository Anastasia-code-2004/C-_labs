using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.ArtistUseCases.Queries
{
    public sealed record GetArtistByIdCommand(int Id) : IRequest<Artist>
    {
    }

}

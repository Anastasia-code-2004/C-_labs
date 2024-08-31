using ArtistsManager.Application.ArtistUseCases.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.ArtistUseCases.Commands
{
    internal class GetArtistByIdCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<GetArtistByIdCommand, Artist>
    {
        public async Task<Artist> Handle(GetArtistByIdCommand request, CancellationToken cancellationToken)
        {
            return await unitOfWork.ArtistRepository.GetByIdAsync(request.Id, cancellationToken);
        }
    }

}

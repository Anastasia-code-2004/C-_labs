using ArtistsManager.Application.ArtistUseCases.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.ArtistUseCases.Commands
{
    internal class EditArtistCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<EditArtistCommand, Artist>
    {
        public async Task<Artist> Handle(EditArtistCommand request, CancellationToken cancellationToken)
        {
            await unitOfWork.ArtistRepository.UpdateAsync(request.Artist, cancellationToken);
            await unitOfWork.SaveAllAsync();

            return request.Artist;
        }
    }
}

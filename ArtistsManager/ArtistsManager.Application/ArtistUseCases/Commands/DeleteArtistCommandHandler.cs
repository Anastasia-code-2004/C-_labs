using ArtistsManager.Application.ArtistUseCases.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.ArtistUseCases.Commands
{
    internal class DeleteArtistCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<DeleteArtistCommand, bool>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<bool> Handle(DeleteArtistCommand request, CancellationToken cancellationToken)
        {
            var artist = await _unitOfWork.ArtistRepository.GetByIdAsync(request.Id, cancellationToken);
            if (artist == null)
            {
                return false;
            }
            await _unitOfWork.ArtistRepository.DeleteAsync(artist, cancellationToken);
            await _unitOfWork.SaveAllAsync();
            return true;
        }
    }
}

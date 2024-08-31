using ArtistsManager.Application.ArtistUseCases.Queries;
using ArtistsManager.Application.SongUseCases.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Application.SongUseCases.Commands
{
    internal class DeleteSongCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<DeleteSongCommand, bool>
    {
        public async Task<bool> Handle(DeleteSongCommand request, CancellationToken cancellationToken)
        {
            var song = await unitOfWork.SongRepository.GetByIdAsync(request.Id, cancellationToken);
            if (song == null)
            {
                return false;
            }
            await unitOfWork.SongRepository.DeleteAsync(song, cancellationToken);
            await unitOfWork.SaveAllAsync();
            return true;
        }
    }
}


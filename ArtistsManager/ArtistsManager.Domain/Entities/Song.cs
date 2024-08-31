using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Domain.Entities
{
    public class Song : Entity
    {
        private Song() { }
        public Song(string title, string genre, DateTime releaseDate, int chartPosition = 0)
        {
            Title = title;
            Genre = genre;
            ReleaseDate = releaseDate;
            ChartPosition = chartPosition;
            ArtistId = 0;
        }
        public string Title { get; set; }
        public string Genre { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int ChartPosition { get; set; }
        public int ArtistId { get; private set; }
        public void AddArtist(int artistId)
        {
            if (artistId <= 0) return;
            ArtistId = artistId;
        }
        public void RemoveArtist()
        {
            ArtistId = 0;
        }
        
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.Domain.Entities
{
    public class Artist : Entity
    {
        private Artist() { }
        public Artist(Person personalData)
        {
            PersonalData = personalData;
        }
        public Person PersonalData { get; set; }
        private readonly List<Song> _songs = [];
        public IReadOnlyList<Song> Songs { get => _songs.AsReadOnly(); }
    }
}

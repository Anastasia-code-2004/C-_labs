using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NikolaychikLAB1.Entities;
using SQLite;

namespace NikolaychikLAB1.Services
{
    class SQLiteService : IDbService
    {
        private SQLiteConnection? _database;

        public IEnumerable<Entities.Artist> GetAllArtists()
        {
            Init();
            return _database.Table<Entities.Artist>().ToList();
        }

        public IEnumerable<Entities.Song> GetArtistSongs(int id)
        {
            Init();
            return _database.Table<Entities.Song>().Where(s => s.ArtistId == id).ToList();
        }

        public void Init()
        {
            string folderPath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            string dataBasePath = Path.Combine(folderPath, "ArtistSongs.db");
            if (File.Exists(dataBasePath))
            {
                Debug.WriteLine("Database already exists");
                _database = new SQLiteConnection(dataBasePath);
                return;
            }
            _database = new SQLiteConnection(dataBasePath);
            _database.CreateTable<Entities.Artist>();
            _database.CreateTable<Entities.Song>();


            Artist artist1 = new() { Name = "Beach House" };
            Artist artist2 = new() { Name = "Lana Del Rey" };
            Artist artist3 = new() { Name = "Olivia Rodrigo" };
            _database.Insert(artist1);
            _database.Insert(artist2);
            _database.Insert(artist3);
            Song song1 = new() { Name = "Space Song", ArtistId = artist1.Id };
            Song song2 = new() { Name = "Silver Soul", ArtistId = artist1.Id };
            Song song3 = new() { Name = "Master of None", ArtistId = artist1.Id };
            Song song4 = new() { Name = "Drunk in L.A.", ArtistId = artist1.Id };
            Song song5 = new() { Name = "Get free", ArtistId = artist2.Id };
            Song song6 = new() { Name = "West Coast", ArtistId = artist2.Id };
            Song song7 = new() { Name = "Bartender", ArtistId = artist2.Id };
            Song song8 = new() { Name = "Cherry", ArtistId = artist2.Id };
            Song song9 = new() { Name = "Good 4 u", ArtistId = artist3.Id };
            Song song10 = new() { Name = "Deja Vu", ArtistId = artist3.Id };
            Song song11 = new() { Name = "jelousy, jealousy", ArtistId = artist3.Id };
            Song song12 = new() { Name = "brutal", ArtistId = artist3.Id };
            _database.Insert(song1);
            _database.Insert(song2);
            _database.Insert(song3);
            _database.Insert(song4);
            _database.Insert(song5);
            _database.Insert(song6);
            _database.Insert(song7);
            _database.Insert(song8);
            _database.Insert(song9);
            _database.Insert(song10);
            _database.Insert(song11);
            _database.Insert(song12);
        }
    }
}

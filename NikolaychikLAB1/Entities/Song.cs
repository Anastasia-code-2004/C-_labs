using SQLite;

namespace NikolaychikLAB1.Entities
{
    [Table("Songs")]
    public class Song
    {
        [PrimaryKey, AutoIncrement, Indexed]
        public int Id { get; set; }

        [NotNull]
        public string Name { get; set; }

        [Indexed]
        public int ArtistId { get; set; }
    }
}

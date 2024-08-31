using SQLite;

namespace NikolaychikLAB1.Entities
{
    [Table("Artists")]
    public class Artist
    {
        [PrimaryKey, AutoIncrement, Indexed]
        public int Id { get; set; }

        [NotNull]
        public string Name { get; set; }
    }
}

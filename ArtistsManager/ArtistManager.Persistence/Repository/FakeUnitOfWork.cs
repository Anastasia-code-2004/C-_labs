using ArtistsManager.Persistence.Data;

namespace ArtistsManager.Persistence.Repository;

public class FakeUnitOfWork : IUnitOfWork
{
    private readonly ApplicationDbContext _context; 
    private readonly Lazy<IRepository<Artist>> _ArtistRepository; // ленивая инициализация - не будет создан до первого обращения к свойству Value
    private readonly Lazy<IRepository<Song>> _SongRepository;
    
    public FakeUnitOfWork(ApplicationDbContext context)
    {
        _context = context;
        _ArtistRepository = new Lazy<IRepository<Artist>>(() => new FakeRepositories.FakeArtistRepository());
        _SongRepository = new Lazy<IRepository<Song>>(() => new FakeRepositories.FakeSongRepository());
    }

    public IRepository<Artist> ArtistRepository => _ArtistRepository.Value;  
    public IRepository<Song> SongRepository => _SongRepository.Value;

    public Task SaveAllAsync()
    {
        throw new NotImplementedException();
    }

    public async Task CreateDataBaseAsync() => await _context.Database.EnsureCreatedAsync();         
    public async Task DeleteDataBaseAsync() => await _context.Database.EnsureDeletedAsync(); 

}
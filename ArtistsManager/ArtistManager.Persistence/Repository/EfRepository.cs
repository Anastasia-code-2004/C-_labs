using System.Linq.Expressions;
using ArtistsManager.Persistence.Data;
using Microsoft.EntityFrameworkCore;

namespace ArtistsManager.Persistence.Repository;

public class EfRepository<T> : IRepository<T> where T : Entity
{
    protected readonly ApplicationDbContext _context;
    protected readonly DbSet<T> _entities;
    public EfRepository(ApplicationDbContext context)
    {
        _context = context;
        _entities = context.Set<T>();
    }

    public async Task<T> GetByIdAsync(int id, CancellationToken cancellationToken = default, params Expression<Func<T, object>>[]? includesProperties)
    {
        IQueryable<T>? query = _entities.AsQueryable();
        if (includesProperties.Any()) // если includesProperties пустой - вернуться только основные свойства
        {
            foreach (Expression<Func<T, object>>? included in includesProperties)
            {
                query = query.Include(included);
            }
        }
        return await query.FirstOrDefaultAsync(x => x.Id == id);
    }

    public async Task<IReadOnlyList<T>> ListAllAsync(CancellationToken cancellationToken = default)
    {
        IQueryable<T>? query = _entities.AsQueryable();
        return query.ToList();
    }

    public async Task<IReadOnlyList<T>> ListAsync(Expression<Func<T, bool>> filter,
        CancellationToken cancellationToken = default,
        params Expression<Func<T, object>>[]? includesProperties)
    {
        IQueryable<T>? query = _entities.AsQueryable();
        if (includesProperties.Any()) // если includesProperties пустой - вернуться только основные свойства
        {
            foreach (Expression<Func<T, object>>? included in includesProperties)
            {
                query = query.Include(included);
            }
        }
        if (filter != null)
        {
            query = query.Where(filter);
        }
        return await query.ToListAsync();
    }

    public Task AddAsync(T entity, CancellationToken cancellationToken = default)
    {
        _context.Set<T>().AddAsync(entity, cancellationToken);
        //_context.Entry(entity).State = EntityState.Added;
        return Task.CompletedTask;
    }

    public Task UpdateAsync(T entity, CancellationToken cancellationToken = default)
    {
        _context.Entry(entity).State = EntityState.Modified;
        return Task.CompletedTask;
    }

    public async Task DeleteAsync(T entity, CancellationToken cancellationToken = default)
    {
        _context.Entry(entity).State = EntityState.Deleted;
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task<T> FirstOrDefaultAsync(Expression<Func<T, bool>> filter, CancellationToken cancellationToken = default)
    {
        IQueryable<T>? query = _entities.AsQueryable();
        return await query.FirstOrDefaultAsync(filter);
    }
}
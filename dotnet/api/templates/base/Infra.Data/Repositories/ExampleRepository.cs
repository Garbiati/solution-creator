using System;
using System.Collections.Generic;
using {{SOLUTION_NAME}}.Persistence.Repositories;
using {{SOLUTION_NAME}}.Domain.Entities;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using {{SOLUTION_NAME}}.Domain.Validations;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;

namespace {{SOLUTION_NAME}}.Infra.Data.Repositories;

public class ExampleRepository : BaseRepository<Example>, IExampleRepository
{
    public ExampleRepository(ApplicationDbContext context) : base(context) { }

    public async ValueTask<IReadOnlyCollection<Example>> GetByName(string filterName, int pageNumber, int pageSize)
    {
        if (string.IsNullOrWhiteSpace(filterName))
        {
            throw new ArgumentNullException(nameof(filterName));
        }

        if (pageNumber < 1)
        {
            throw new ArgumentOutOfRangeException(nameof(pageNumber));
        }

        if (pageSize < 1)
        {
            throw new ArgumentOutOfRangeException(nameof(pageSize));
        }

        return await Context.Examples
            .Where(x => x.Name.Contains(filterName))
            .Skip((pageNumber - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async ValueTask<int> CountByName(string filterName)
    {
        if (string.IsNullOrWhiteSpace(filterName))
        {
            throw new ArgumentNullException(nameof(filterName));
        }

        return await Context.Examples
            .Where(x => x.Name.Contains(filterName))
            .CountAsync();
    }
}

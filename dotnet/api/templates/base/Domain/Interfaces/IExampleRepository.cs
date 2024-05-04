using System;
using System.Collections.Generic;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Domain.Interfaces;

public interface IExampleRepository : IBaseRepository<Example>
{
    ValueTask<IReadOnlyCollection<Example>> GetByName(string filterNamename, int pageNumber, int pageSize);
    ValueTask<int> CountByName(string filterName);
}

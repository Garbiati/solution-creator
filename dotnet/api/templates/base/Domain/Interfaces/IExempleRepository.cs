using System;
using System.Collections.Generic;
using {{PROJECT_NAME}}.Domain.Entities;

namespace {{PROJECT_NAME}}.Domain.Interfaces;

public interface IExampleRepository : IBaseRepository<Example>
{
    ValueTask<IReadOnlyCollection<Example>> GetByName(string filterNamename, int pageNumber, int pageSize);
    ValueTask<int> CountByName(string filterName);
}

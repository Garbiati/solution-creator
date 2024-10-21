using System;

namespace {{SOLUTION_NAME}}.Domain.Exceptions
{
    public class NotFoundException : Exception
    {
        public NotFoundException() { }

        public NotFoundException(string message) : base(message) { }

        public NotFoundException(string message, Exception innerException) : base(message, innerException) { }

        public NotFoundException(string entityName, Guid id) : base($"Entity {entityName} with id {id} was not found.") { }
    }
}
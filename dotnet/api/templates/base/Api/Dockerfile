FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy AS publish

WORKDIR /src
COPY ["{{SOLUTION_NAME}}.Api/{{SOLUTION_NAME}}.Api.csproj", "{{SOLUTION_NAME}}.Api/"]
COPY ["{{SOLUTION_NAME}}.Application/{{SOLUTION_NAME}}.Application.csproj", "{{SOLUTION_NAME}}.Application/"]
COPY ["{{SOLUTION_NAME}}.Domain/{{SOLUTION_NAME}}.Domain.csproj", "{{SOLUTION_NAME}}.Domain/"]
COPY ["{{SOLUTION_NAME}}.Domain.Tests/{{SOLUTION_NAME}}.Domain.Tests.csproj", "{{SOLUTION_NAME}}.Domain.Tests/"]
COPY ["{{SOLUTION_NAME}}.Infra.Data/{{SOLUTION_NAME}}.Infra.Data.csproj", "{{SOLUTION_NAME}}.Infra.Data/"]
COPY ["{{SOLUTION_NAME}}.Infra.IoC/{{SOLUTION_NAME}}.Infra.IoC.csproj", "{{SOLUTION_NAME}}.Infra.IoC/"]

RUN dotnet restore "{{SOLUTION_NAME}}.Api/"
RUN dotnet tool restore

COPY . .

WORKDIR "/src/{{SOLUTION_NAME}}.Api"
RUN dotnet publish "{{SOLUTION_NAME}}.Api.csproj" -c Release -o /app/publish --no-restore
WORKDIR "/src"

# Etapa de execução
FROM mcr.microsoft.com/dotnet/aspnet:8.0-jammy AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN chmod -R a+w /app
USER app
ENV ASPNETCORE_URLS=http://+:8000
EXPOSE 8000
ENTRYPOINT ["dotnet", "{{SOLUTION_NAME}}.Api.dll"]

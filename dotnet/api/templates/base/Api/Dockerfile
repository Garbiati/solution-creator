# Etapa de build
FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy AS publish

WORKDIR /src
COPY ["{{PROJECT_NAME}}.Api/{{PROJECT_NAME}}.Api.csproj", "{{PROJECT_NAME}}.Api/"]
COPY ["{{PROJECT_NAME}}.Application/{{PROJECT_NAME}}.Application.csproj", "{{PROJECT_NAME}}.Application/"]
COPY ["{{PROJECT_NAME}}.Domain/{{PROJECT_NAME}}.Domain.csproj", "{{PROJECT_NAME}}.Domain/"]
COPY ["{{PROJECT_NAME}}.Domain.Tests/{{PROJECT_NAME}}.Domain.Tests.csproj", "{{PROJECT_NAME}}.Domain.Tests/"]
COPY ["{{PROJECT_NAME}}.Infra.Data/{{PROJECT_NAME}}.Infra.Data.csproj", "{{PROJECT_NAME}}.Infra.Data/"]
COPY ["{{PROJECT_NAME}}.Infra.IoC/{{PROJECT_NAME}}.Infra.IoC.csproj", "{{PROJECT_NAME}}.Infra.IoC/"]

RUN dotnet restore "{{PROJECT_NAME}}.Api/"
RUN dotnet tool restore

COPY . .

WORKDIR "/src/{{PROJECT_NAME}}.Api"
RUN dotnet publish "{{PROJECT_NAME}}.Api.csproj" -c Release -o /app/publish --no-restore
WORKDIR "/src"

# Etapa de execução
FROM mcr.microsoft.com/dotnet/aspnet:8.0-jammy AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN chmod -R a+w /app
USER app
ENV ASPNETCORE_URLS=http://+:8000
EXPOSE 8000
ENTRYPOINT ["dotnet", "{{PROJECT_NAME}}.Api.dll"]

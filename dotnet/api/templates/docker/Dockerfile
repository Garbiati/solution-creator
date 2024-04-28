FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy AS publish

WORKDIR /src
COPY ["Reminder.Api/Reminder.Api.csproj", "Reminder.Api/"]
COPY ["Reminder.Application/Reminder.Application.csproj", "Reminder.Application/"]
COPY ["Reminder.Domain/Reminder.Domain.csproj", "Reminder.Domain/"]
COPY ["Reminder.Domain.Tests/Reminder.Domain.Tests.csproj", "Reminder.Domain.Tests/"]
COPY ["Reminder.Infra.Data/Reminder.Infra.Data.csproj", "Reminder.Infra.Data/"]
COPY ["Reminder.Infra.IoC/Reminder.Infra.IoC.csproj", "Reminder.Infra.IoC/"]

RUN dotnet restore "Reminder.Api/"
RUN dotnet tool restore

COPY . .

WORKDIR "/src/Reminder.Api"
RUN dotnet publish "Reminder.Api.csproj" -c Release -o /app/publish --no-restore
WORKDIR "/src"

# runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0-jammy AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN chmod -R a+w /app
USER app
ENV ASPNETCORE_URLS=http://+:8000
EXPOSE 8000
ENTRYPOINT ["dotnet", "Reminder.Api.dll"]

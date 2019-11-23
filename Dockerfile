FROM mcr.microsoft.com/dotnet/core/aspnet:2.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build
WORKDIR /src
COPY ["sampledocker.csproj", "./"]
RUN dotnet restore "./sampledocker.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "sampledocker.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "sampledocker.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "sampledocker.dll"]

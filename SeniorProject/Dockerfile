FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["SeniorProject/SeniorProject.csproj", "SeniorProject/"]
RUN dotnet restore "SeniorProject/SeniorProject.csproj"
COPY . .
WORKDIR "/src/SeniorProject"
RUN dotnet build "SeniorProject.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SeniorProject.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SeniorProject.dll"]

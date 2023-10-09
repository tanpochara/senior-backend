FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-env
WORKDIR /app
COPY *.sln .
COPY ./SeniorProject/*.csproj ./SeniorProject/
COPY ./SeniorProject.UnitTests/*.csproj ./SeniorProject.UnitTests/
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime
WORKDIR /publish
COPY --from=build-env /publish .
EXPOSE 5000
ENTRYPOINT ["dotnet", "SeniorProject.dll"]
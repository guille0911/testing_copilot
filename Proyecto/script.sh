#!/bin/bash

# Crea un proyecto minimal api de .net 8
echo "Creando proyecto Minimal API..."
dotnet new webapi -n MinimalApi -f net8.0

# Crea un proyecto de pruebas para el proyecto minimal api
echo "Creando proyecto de pruebas..."
dotnet new xunit -n MinimalApi.Tests -f net8.0

#Asocia los dos proyectos
echo "Asociando proyectos..."
dotnet add MinimalApi/MinimalApi.csproj reference MinimalApi.Tests/MinimalApi.Tests.csproj

#Crea un archivo de solución
echo "Creando solución..."
dotnet new sln -n MinimalApiSolution

#Agrega los proyectos a la solución
echo "Agregando proyectos a la solución..."
dotnet sln MinimalApiSolution.sln add MinimalApi/MinimalApi.csproj
dotnet sln MinimalApiSolution.sln add MinimalApi.Tests/MinimalApi.Tests.csproj

#Agrega los paquetes necesarios para el proyecto de pruebas
echo "Agregando paquetes necesarios..."
dotnet add MinimalApi.Tests/MinimalApi.Tests.csproj package Microsoft.AspNetCore.Mvc.Testing
dotnet add MinimalApi.Tests/MinimalApi.Tests.csproj package MiniValidation

#Agrega un archivo docker en el pryecto de minimal api
echo "Creando Dockerfile..."
cat <<EOL > Dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY ./out ./
ENTRYPOINT ["dotnet", "minimalAPI.dll"]
EOL
echo "Dockerfile creado."


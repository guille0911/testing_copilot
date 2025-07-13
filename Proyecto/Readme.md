# MinimalApi

Este proyecto es una API mínima construida con .NET 8, diseñada para ser simple, ligera y fácil de desplegar. Utiliza el enfoque Minimal API de ASP.NET Core, ideal para microservicios, prototipos o aplicaciones que requieren bajo consumo de recursos y rápida puesta en marcha.

## Estructura del Proyecto

MinimalApiSolution.sln
Automatizacion/
  script.sh
MinimalApi/
  appsettings.Development.json
  appsettings.json
  Dockerfile
  MinimalApi.csproj
  MinimalApi.http
  Program.cs
  Properties/
    launchSettings.json
MinimalApi.Tests/
  MinimalApi.Tests.csproj
  UnitTest1.cs

- **MinimalApi/**: Contiene el código fuente principal de la API.
- **MinimalApi.Tests/**: Pruebas unitarias del proyecto.
- **Automatizacion/**: Scripts de automatización (por ejemplo, despliegue o construcción).
- **MinimalApiSolution.sln**: Solución que agrupa los proyectos.

## Uso

### Requisitos

- [.NET 8 SDK](https://dotnet.microsoft.com/download)
- [Docker](https://www.docker.com/) (opcional, para despliegue en contenedores)

### Ejecución local

1. Restaurar dependencias:

   ```sh
   dotnet restore
   ```

2. Construir el proyecto:

   ```sh
   dotnet build
   ```

3. Ejecutar la API:

   ```sh
   dotnet run --project MinimalApi/MinimalApi.csproj
   ```

La API estará disponible en `http://localhost:5000` (o el puerto configurado).

### Uso con Docker

1. Construir la imagen:

   ```sh
   docker build -t minimalapi -f MinimalApi/Dockerfile .

   ```

2. Ejecutar el contenedor:

   ```sh
   docker run -d -p 5000:80 minimalapi
   ```

## Configuración

- **appsettings.json** y **appsettings.Development.json**: Configuración de la aplicación y niveles de logging.
- **Dockerfile**: Define cómo se construye la imagen de Docker para el despliegue de la API.

## Pruebas

Para ejecutar las pruebas unitarias:

```sh
dotnet test
```

---

Este proyecto es un punto de partida para crear APIs RESTful rápidas y eficientes usando las Minimal APIs de .NET 8.

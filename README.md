# Pokémon App

Una aplicación web desarrollada en Flutter que muestra una lista de Pokémon y permite ver detalles de cada uno. Utiliza la PokeAPI para obtener datos y aplica la arquitectura Clean Architecture junto con BLoC para la gestión del estado.

## Características

- **Lista de Pokémon**: Muestra un listado de los primeros 100 Pokémon con su nombre y foto.
- **Detalles del Pokémon**: Muestra información detallada del Pokémon seleccionado, incluyendo experiencia base, altura, peso y habilidades.
- **Búsqueda**: Permite filtrar Pokémon por nombre utilizando un campo de búsqueda en el `AppBar`.

## Tecnologías Utilizadas

- **Flutter**: Framework para el desarrollo de la interfaz de usuario.
- **PokeAPI**: API pública para obtener datos de Pokémon.
- **BLoC**: Patrón de gestión de estado utilizado para manejar el estado de la aplicación.
- **Clean Architecture**: Estructura de código para mantener la separación de responsabilidades y escalabilidad.

## Instalación

1. **Clona el repositorio**:
   ```sh
   git clone https://github.com/tu-usuario/tu-repo.git
   cd tu-repo
   Instala las dependencias:
   ```

sh
Copiar código
flutter pub get
Ejecuta la aplicación:

sh
Copiar código
flutter run

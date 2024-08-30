# EV01 Proyecto Integrador
## 2 Data Access Object
Vamos a mejorar la arquitectura de nuestra aplicación.

### Lista de tareas a completar

#### 3 Arquitectura de la aplicación
Establece los cuatro directorios principales
* app
* assets
* utils
* persistence
* Añade el directorio templates

#### 4 Vistas
*Descarga el Famework Bootstrap*

- Añade los CSS y JS de Bootstrap dentro de la carpeta assets y modifica los enlaces de la cabecera para que apuntes a los archivos descargados.


*Establece las vistas dentro del directorio app*

- Establece las vistas dentro del directorio app

*Persistencia*

- Crea un archivo credentials.json para almacenar la configuración de conexión a base de datos dentro de persistence/conf

*Gestor de persistencia*

- Crea el archivo GenericDAO.php para definir las funciones CRUD
- Completa un script UserDAO que herede de GenericDAO.

*Utilidades*

- Traslada las funciones de tratamiento de sesiones en SessionHelper.php


*Modificaciones en la lógica*

Ahora, tenemos que tener en cuenta que parte de nuestra lógica y gestión de datos se encuentra en los archivos de las vistas; login.php, logout.php y signup.php
Vamos a modificar estos scripts para que hagan uso de los elementos que hemos añadido en esta versión.

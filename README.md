# IBD-P1-Grupo2

- Repositorio de la Práctica 1 para la asignatura de Infrastructura para Big Data.
Alumnos: Noa Chu, Che Cui, Carlota Medrano, Alejandro Pequeño

****
## Objetivo:
- Crear una imagen Docker, disponible en DockerHub, que despliegue un repositorio RDF con datos (en .ttl) extraídos de datos.gob
****

## Pasos:

### 1. Clonar repositorio de GitHub

En la terminal de tu ordenador, sitúate en la carpeta donde quieres clonar el repositorio (mediante `cd <path>`) y ejecuta el siguiente comando para clonar el repositorio en el path seleccionado:

`git clone "https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git"`

Dicha URL se encuentra en el archivo Repository.md

### 2. Crear el servicio virtual basado en Docker (creación de imagen Docker)

Gracias al clonado, encontrarás todos los archivos necesarios para realizar el objetivo comentado con anterioridad. Para conseguir dicho objetivo primero tenemos que construir la imagen; para ello, basta con poner `docker build -t <nombre> .` en tu terminal. Este comando ha buscado en la carpeta actual cualquier archivo `Dockerfile` y en base a esto construye la imagen con el nombre dado. Nosotros llamaremos a nuestra imagen: `ibd_g2`.

Perfecto! ya hemos creado una imagen Docker con los requisitos mencionados en el objetivo de la práctica. Puedes visualizarla ejecutando el siguiente comando en tu terminal: `docker images`:

REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ibd_g2       latest    64920a562003   10 minutes ago   681MB
...          ...       ...            ...              ...

### 3.Ejecución de la imagen (contenedor)

¡Perfecto! ya hemos creado una imagen Docker con los requisitos mencionados en el objetivo de la práctica. Pero esto no es suficiente ahora tenemos que ejecutarla. Para ello, debemos crear un contenedor con el siguiente comando en tu terminal:

`docker run -d -p 7200:7200 ibd_g2`

Ejecutamos el contendor en modo "detached" ejecutando el contenedor en segundo plano con `-d` y publicamos el puerto 7200 del contenedor en el host de Docker que será el mismo puerto que está escuchando nuestra imagen creada anteriormente (ver en el archivo Dockerfile: `EXPOSE 7200`)

### 4. Acceso web al servicio levantado

Gracias a la ejecución de la imagen y publicar los puertos ya podemos acceder al servicio vía web a través de la dirección local del puerto 7200: `http://localhost:7200/`.

### 5. Despliegue del repositorio RDF


### 6. Creación de la imagen con el repositorio RDF


### 7. Publicación de la imagen en DockerHub


### 8. Explorar y probar su contenido

Para comprobar el correcto funcionamiento de nuestra aplicación bastará con realizar con éxito una consulta SPARQL. Por ejemplo:

# IBD-P1-Grupo2

- Repositorio de la Práctica 1 para la asignatura de Infraestructura para Big Data. En este repositorio encontrarás diversos archivos para realizar el objetivo de la práctica 1 de la asignatura con éxito. También, encontrarás un archivo llamado MAC_guide que se trata de una guía para clonar repositorios GIT desde el sistema operativo MAC OS.

*Alumnos*: Noa Chu, Che Cui, Carlota Medrano, Alejandro Pequeño
****

## Objetivo:

- Crear una imagen Docker, disponible en DockerHub, que despliegue un repositorio RDF con datos (en .ttl) extraídos de datos.gob

## Pasos:

### 1. Clonar repositorio de GitHub

1.1 Dirígete al buscador de Windows y teclea `cmd` o `powershell` para abrir la terminal de tu ordenador.
    
**NOTA:** Si no tienes instalado Git en tu ordenador, puedes descargarlo desde [aquí](https://git-scm.com/downloads).

1.2 Una vez en la terminal, sitúate en la carpeta donde quieres clonar el repositorio y ejecuta el siguiente comando: `cd <path>`.

**NOTA:** Si su ruta tiene algún espacio o caracter especial, es necesario poner la ruta entre comillas dobles: `cd "<path>"`.

1.3 Una vez en la carpeta deseada, ejecuta el siguiente comando para clonar el repositorio:
`git clone "https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git"`

En el paso anterior, se ha proporcionado el HTTPS del repositorio de GitHub. Este link lo puedes encontrar en la página principal del [repositorio](https://github.com/AlejandroPqLz/IBD_Grupo2-P1) , en la parte superior derecha, pulsando en el botón verde "Code". En la ventana que se abre, selecciona la opción "HTTPS" y copia el link. 


### 2. Crear el servicio virtual basado en Docker (creación de imagen Docker)

Mediante el clonado anterior, podrás encontrar todos los archivos necesarios para realizar el objetivo comentado con anterioridad, es decir, todos los archivos del repositorio de GitHub se encontrarán en tu carpeta local que hayas elegido. Entre ellos, se encuentra el archivo `Dockerfile` que contiene las instrucciones necesarias para crear la imagen Docker. A partir de este archivo, se creará la imagen Docker que contendrá el servicio virtual que se desplegará en el contenedor. 

Para la construcción de la imagen: `docker build -t <nombre> .` 
    
**NOTA**: Nosotros llamaremos a nuestra imagen: `ibd_g2`.

Perfecto! ya hemos creado una imagen Docker con los requisitos mencionados en el objetivo de la práctica. Puedes visualizarla ejecutando el siguiente comando en tu terminal: `docker images`: ->

```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ibd_g2       latest    64920a562003   10 minutes ago   681MB
...          ...       ...            ...              ...
```

### 3.Ejecución de la imagen (contenedor)

¡Perfecto! ya hemos creado una imagen Docker. Pero esto no es suficiente ahora tenemos que ejecutarla. Para ello, debemos crear un contenedor con el siguiente comando en tu terminal:

`docker run -d -p 7200:7200 ibd_g2`

Ejecutamos el contendor en modo "detached", en segundo plano, con `-d` y publicamos el puerto 7200 del contenedor en el host de Docker que será el mismo puerto que está escuchando nuestra imagen creada anteriormente (veasé en el archivo Dockerfile: `EXPOSE 7200`)

### 4. Acceso web al servicio levantado

Gracias a la ejecución de la imagen y publicar los puertos ya podemos acceder al servicio vía web a través de la dirección local del puerto 7200: `http://localhost:7200/`.

### 5. Despliegue del repositorio RDF e importación de archivos

Una vez accedido al servicio via web, procedemos a crear nuestro repositorio RDF. Para ello, 

### 6. Creación de la imagen con el repositorio RDF

Ya tenemos importados todos los arcihvos .ttl de data.gob desde el repositorio "data". Ahora, debemos de

### 7. Publicación de la imagen en DockerHub

¡Ya queda poco!, tenemos la imagen Docker con todos los requisitos mencionados en el objetivo, pero ahora tenemos que hacer que este disponible en DockerHub. Este paso es muy sencillo y basta con escribir el siguiente comando: 

`docker push ibd-g2/export_data_gob`

Al terminar la operación, ya podremos acceder a DockerHub y ver que la imagen se encuentra ahí. Pero la imagen se encuentra sin ningún tipo de información por lo que desde DockerHub puede añadirle una descripción y un README.md (README_DH.md del repositorio que incluye la descripción) a nivel de usuario para que cualquiera con un `docker pull ibd-g2/export_data_gob` pueda obtener tu imagen, ejecutarla y saber qué imagen es y qué puede hacer.

### 8. Explorar y probar su contenido

Para comprobar el correcto funcionamiento de nuestra aplicación bastará con realizar con éxito una consulta SPARQL. Por ejemplo:

# IBD-P1-Grupo2

- En el siguiente repositorio, encontrarás todos los archivos necesarios para realizar la ***Práctica 1 de la asignatura de Infraestructura para Big Data***. Entre los archivos anteriormente mencionados están:

    - [Dockerfile](Dockerfile): instrucciones necesarias para crear la imagen Docker que contendrá el servicio virtual que se desplegará en el contenedor.
    - [License.md](License.md): licencia de uso de los archivos del repositorio.
    - [README.md](README.md): descripción de la práctica y los pasos a seguir para realizarla con éxito.
    - [MAC_guide.ipynb](MAC_guide.ipynb): guía para clonar repositorios GIT desde el sistema operativo MAC OS.

Todos los archivos han sido creados y modificados por los miembros del **Grupo 2** de la asignatura de IBD de ***Ciencia de Datos e Inteligencia Artificial de la Universidad Politécnica de Madrid*** (*UPM*): Noa Chu, Che Cui, Carlota Medrano, Alejandro Pequeño
****

## Objetivo:

- Crear una imagen Docker, disponible en DockerHub, que despliegue un repositorio RDF con los datos importados desde ficheros Turtle extraídos de un conjunto de datos disponible en[datos.gob](https://datos.gob.es/es)
****

## Pasos:

### 1. Clonación del Repositorio de GitHub

1.1 Dirígete al buscador de Windows y teclea `cmd` o `powershell` para abrir la terminal de tu ordenador.
    
**NOTA:** Si no tienes instalado Git en tu ordenador, puedes descargarlo desde [aquí](https://git-scm.com/downloads).

1.2 Una vez en la terminal, sitúate en la carpeta donde quieres clonar el repositorio y ejecuta el siguiente comando: `cd <path>`.

**NOTA:** Si su ruta tiene algún espacio o caracter especial, es necesario poner la ruta entre comillas dobles: `cd "<path>"`.

1.3 Una vez en la carpeta deseada, ejecuta el siguiente comando para clonar el repositorio:
`git clone "https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git"`

En el paso anterior, se ha proporcionado el HTTPS del repositorio de GitHub. Este link lo puedes encontrar en la página principal del [repositorio](https://github.com/AlejandroPqLz/IBD_Grupo2-P1) , en la parte superior derecha, pulsando en el botón verde "Code". En la ventana que se abre, selecciona la opción "HTTPS" y copia el link. 


### 2. Creación del Servicio Virtual basado en Docker (*creación de imagen Docker*)

Mediante el clonado anterior, podrás encontrar todos los archivos necesarios para realizar el objetivo comentado con anterioridad, es decir, todos los archivos del repositorio de GitHub se encontrarán en tu carpeta local que hayas elegido. Entre ellos, se encuentra el archivo `Dockerfile` que contiene las instrucciones necesarias para crear la imagen Docker. A partir de este archivo, se creará la imagen Docker que contendrá el servicio virtual que se desplegará en el contenedor. 

Para la construcción de la imagen: `docker build -t <image_name> .` 
    
**NOTA**: Nosotros llamaremos a nuestra imagen: `ibd_g2`.

Perfecto! ya hemos creado una imagen Docker con los requisitos mencionados en el objetivo de la práctica. Puedes visualizarla ejecutando el siguiente comando en tu terminal: `docker images`

```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ibd_g2       latest    64920a562003   10 minutes ago   681MB
...          ...       ...            ...              ...
```

### 3. Lanzamiento del Contenedor a partir de la Imagen

¡Perfecto! ya hemos creado una imagen Docker. Pero esto no es suficiente ahora tenemos que ejecutarla, es decir, crear un contenedor a partir de la imagen que nos permita acceder al servicio virtual que hemos creado. Para ello, ejecutamos el siguiente comando:

`docker run -d --name graphdb -p 7200:7200 ibd_g2`

Este comando lanza un contenedor llamado `graphdb` en segundo plano, en modo *"detached"* (`-d`) donde el parámetro `-p` especifica que el puerto `7200` del contenedor será mapeado al puerto `7200` del host de Docker. Esto permitirá acceder al servicio virtual que se está ejecutando dentro del contenedor a través de ese puerto en el host de Docker. `ibd_g2` es el nombre de la imagen a partir de la cual se creará el contenedor.

Para comprobar que el contenedor se ha creado correctamente, ejecutamos el siguiente comando: `docker ps`

```
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                              NAMES
ff9750105774   ibd_g2    "/opt/graphdb/dist/b…"   7 seconds ago   Up 5 seconds   0.0.0.0:7200->7200/tcp, 7300/tcp   graphdb
```

Como podemos ver, el contenedor se ha creado correctamente y se está ejecutando en segundo plano (`Up 5 seconds`).


### 4. Acceso al Servicio Web Desplegado

Una vez que hemos lanzado el contenedor a partir de la imagen creada, ya podemos acceder al servicio web a través de nuestro navegador. Para ello, simplemente abrimos una nueva pestaña en nuestro navegador y accedemos a la dirección local del puerto 7200: http://localhost:7200/.

De esta forma, podremos interactuar con el servicio virtual que hemos desplegado en el contenedor Docker de forma fácil y cómoda desde nuestra propia máquina. ¡Ya tienes tu servicio virtual desplegado y funcionando correctamente!


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

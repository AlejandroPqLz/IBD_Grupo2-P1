# IBD-P1-Grupo2

En el siguiente repositorio, encontrarás todos los archivos necesarios para realizar la ***Práctica 1 de la asignatura de Infraestructura para Big Data***. Entre los archivos anteriormente mencionados están:

- [Dockerfile](Dockerfile): instrucciones necesarias para crear la imagen Docker que contendrá el servicio virtual que se desplegará en el contenedor.
- [LICENSE](LICENSE.md): licencia de uso de los archivos del repositorio.
- [README](README.md): descripción de la práctica y los pasos a seguir para realizarla con éxito.
- [Repository](Repository.md): link del repositorio.
- [MAC_guide](MAC_guide.md): guía para clonar repositorios GIT desde el sistema operativo MAC OS.
- [DH_info](DH_info): archivo con la descripción y el README a nvl de usuario para la imagen de DockerHub.

Todos los archivos han sido creados y modificados por los miembros del **Grupo 2** de la asignatura de IBD de ***Ciencia de Datos e Inteligencia Artificial de la Universidad Politécnica de Madrid*** (*UPM*): Noa Chu, Che Cui, Carlota Medrano, Alejandro Pequeño
****

## Objetivo

- Crear una imagen Docker, disponible en DockerHub, que despliegue un repositorio RDF con datos Turtle (.ttl) extraídos de [datos.gob-incendios_forestales](https://datos.gob.es/es/catalogo/e05068001-estadistica-general-de-incendios-forestales). Nosotros lo haremos con el conjunto de datos sobre incendios forestales, pero puede elegir otros. Para más información sobre otros datasets puede consultar: [datos.gob](https://datos.gob.es/es)

## Requisitos

Para la realización de la práctica serán necesarios los siguientes servicios:

- Tener instalado **GIT** en su máquina. Si no, puedes descargarlo desde [aquí](https://git-scm.com/downloads).
- Tener instalado **Docker** en su máquina. Si no, puedes descargarlo desde [aquí](https://www.docker.com/products/docker-desktop/).

## Pasos

### 1. Clonado del repositorio de GitHub

**1.1** Dirígete al buscador de Windows y busca `cmd` o `powershell` para abrir la terminal de tu ordenador.

***NOTA***: si se realiza desde MAC OS teclee `cmd`+`espace` para buscar y abrir la terminal de tu ordenador.

<img src="/images/search.png" caption="Barra de buscador en MAC OS para buscar el terminal" width="500">

<img src="/images/terminal.png" caption="Buscar la terminal en MAC OS" width="500">


**1.2** Una vez en la terminal, sitúate en la carpeta donde quieres clonar el repositorio, puedes hacerlo usando el siguiente comando: `cd <path>`.

<img src="/images/desktop.png" caption="En este caso, nos situaremos en el escritorio para clonar la carpeta" width="500">

***NOTA***: Si su ruta tiene algún espacio o carácter especial, es necesario poner la ruta entre comillas dobles: `cd "<path>"`.

**1.3** Una vez en la carpeta deseada, ejecuta el siguiente comando para clonar el repositorio:
`git clone "https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git"`

<img src="/images/clone.png" caption="Clonamos el repositorio" width="500">
<img src="/images/cloned_folder.png" caption="Y la carpeta clonada aparecerá en el escritorio" width="500">

Para este paso, se ha proporcionado el HTTPS del repositorio de GitHub. Este link lo puedes encontrar en la página principal del [repositorio](https://github.com/AlejandroPqLz/IBD_Grupo2-P1), en la parte superior derecha, pulsando en el botón verde "Code". En la ventana que se abre, selecciona la opción "HTTPS" y copia el link. También puedes obtenerlo en el archivo [Repository.md](Repository.md) del repositorio de GitHub.

<img src="/images/https.png" caption="HTTPS" width="500">

Pero también se podría realizar mediente una llave SSH. Para ello, siga el fichero [MAC_guide](MAC_guide.md)

<img src="/images/ssh.png" caption="Llave SSH" width="500">


**1.4** Una vez clonado el repositorio, accede a la carpeta que se ha creado: `cd IBD_Grupo2-P1`.

<img src="/images/folder_path.png" caption="Comando para situarse en la carpeta recién clonada" width="500">

### 2. Creación del Servicio Virtual basado en Docker (*creación de imagen Docker*)

Mediante el clonado anterior, podrás encontrar todos los archivos necesarios para realizar el objetivo comentado con anterioridad, es decir, todos los archivos del repositorio de GitHub se encontrarán en tu carpeta local que hayas elegido. Entre ellos, se encuentra el archivo `Dockerfile` que contiene las instrucciones necesarias para crear la imagen Docker. A partir de este archivo, se creará la imagen Docker que contendrá el servicio virtual que se desplegará en el contenedor.

Para la construcción de la imagen: `docker build -t <nombre> .`

***NOTA***: Nosotros llamaremos a nuestra imagen: `ibd_g2`.

Perfecto!, ya hemos creado una imagen Docker con los requisitos mencionados en el objetivo de la práctica. Puedes visualizarla ejecutando el siguiente comando en tu terminal: `docker images`

```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ibd_g2       latest    64920a562003   10 minutes ago   681MB
...          ...       ...            ...              ...
```

### 3. Ejecución de la imagen (*creación de un contenedor Docker*)

¡Perfecto!, ya hemos creado una imagen Docker. Pero esto no es suficiente, ahora tenemos que ejecutarla. Para ello, debemos crear un contenedor con el siguiente comando en tu terminal:

`docker run -p 7200:7200 -d --name contenedor_rdf ibd_g2`

Ejecutamos el contendor en modo "detached", en segundo plano, con `-d` y publicamos el puerto 7200 del contenedor en el host de Docker, que será el mismo puerto que está escuchando nuestra imagen creada anteriormente (véase en el archivo Dockerfile: `EXPOSE 7200`).

### 4. Acceso web al servicio levantado

Una vez que hemos lanzado el contenedor a partir de la imagen creada, ya podemos acceder al servicio web a través de nuestro navegador. Para ello, simplemente abrimos una nueva pestaña en nuestro navegador y accedemos a la dirección local del puerto 7200: [http://localhost:7200/](http://localhost:7200/).

De esta forma, podremos interactuar con el servicio virtual que hemos desplegado en el contenedor Docker de forma fácil y cómoda desde nuestra propia máquina. ¡Ya tienes tu servicio virtual desplegado y funcionando correctamente!

### 5. Despliegue del repositorio RDF e importación de archivos

Una vez dentro de tu repositorio, selecciona la pestaña `Server files`. Si todo se ha realizado correctamente, ahí deberían estar todos los archivos .ttl de data.gob.es.

**5.1** Nos dirijimos al panel izquierdo de la pantalla y seleccionamos `setup` y posteriormente `Repositories`. 

**5.2** Una vez dentro, pulsamos en `create new repository` y después `GraphDB Repository`. Se nos reedigirá a una nueva pantalla donde deberemos de rellenar los siguientes campos:

- `Repository ID`: `data`
- Los demás campos los dejamos como están por defecto.

¡Ya hemos creado nuestro repositorio RDF! En este repositorio ya están todos los archivos `.ttl` importados. 

**5.3** Para poderlos visualizar, nos dirigimos nuevamente al panel izquierdo y seleccionamos `import`.

***NOTA***: Es posible que deba de seleccionar el repositorio `data` para poder visualizar los archivos. Para ello, en la parte superior derecha, despliegue los repositorios disponibles y seleccione `data`.

**5.4** Una vez dentro de tu repositorio, selecciona la pestaña `Server files`. Si todo se ha realizado correctamente, ahí deberían estar todos los archivos `.ttl` de [datos.gob-incendios_forestales](https://datos.gob.es/es/catalogo/e05068001-estadistica-general-de-incendios-forestales).



### 6. Creación de la imagen con el repositorio RDF

Ya hemos comprobado que el servicio web funciona correctamente y que tenemos todos los archivos `.ttl` importados correctamente en nuestro repositorio RDF llamado `data`. A continuación, lo que nos queda por hacer es guardar el estado actual del contenedor Docker, es decir, guardar la imagen Docker con el repositorio RDF creado. Para ello, debemos de crear una nueva imagen Docker a partir del contenedor que tenemos actualmente: `docker commit <container_name> <new_image>:<tag>`

***NOTA***: Utilizaremos la versión de nuestro último *release* de GitHub, que en este caso es la `v1.4`: `docker commit graphdb ibd_g2/export_data_gob:v1.4`

En el comando anterior, estamos creando una nueva imagen Docker a partir del contenedor `graphdb` a la que llamaremos `ibd_g2/export_data_gob` y le asignamos la versión `v1.4`.
Ejecutando el siguiente comando, debería de ver algo parecido a esto: `docker images`

```
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
ibd_g2/export_data_gob   v1.4      15439fac5958   19 minutes ago   1.73GB
ibd_g2                   latest    87f8be82a675   19 hours ago     1.67GB
```

Como podemos observar, hemos creado una nueva imagen Docker a partir del contenedor `graphdb` que se llama `ibd_g2/export_data_gob` y que tiene la versión `v1.4`. Esta imagen Docker contiene el repositorio RDF creado y todos los archivos `.ttl` importados, por tanto, deberíamos de poder ver que la nueva imagen tiene un tamaño mayor que la imagen original.


### 7. Publicación de la imagen en DockerHub

¡Ya queda menos! Ahora que tenemos una imagen Docker con todos los requisitos necesarios, necesitamos hacerla accesible al público en general. Para hacer esto, utilizaremos  [DockerHub](https://hub.docker.com/), un servicio de almacenamiento de imágenes Docker gratuito y público.

***NOTA***: Antes de subir la imagen a DockerHub, es necesario tener una cuenta en DockerHub.  Si no la tienes, puedes registrarte [aquí](https://hub.docker.com/signup).

7.1 Una vez registrado en tu cuenta, dirígite al panel superior y selecciones `Repositories`.

7.2 Una vez dentro, selecciona `Create Repository`. Se nos reedigirá a una nueva pantalla donde deberemos de rellenar los siguientes campos:

- Dejamos el usuario por defecto.
- `Name`: `ibd_g2/export_data_gob` 
- `Description`: Repositorio RDF con los datos de data.gob.es
- `Visibility`: Dejamos la opción `Public` por defecto.

7.3 Una vez que se haya creado el repositorio, regrese a la terminal. Antes de subir la imagen, inicie sesión en Dockerhub desde la terminal con el siguiente comando: `docker login -u <username>`

7.4 Después de iniciar sesión, etiquete su imagen con su nombre de usuario de DockerHub. Si no etiqueta su imagen, Docker no sabrá a qué repositorio de DockerHub subir su imagen:  `docker tag ibd_g2/export_data_gob:v1.4 <username>/ibd_g2/export_data_gob:v1.4 `

***NOTA***: `<username>` es su nombre de usuario elegido al registrarse en DockerHub.

7.5 Una vez etiquetada, ya podemos subir la imagen a DockerHub: `docker push <username>/ibd_g2/export_data_gob:v1.4`

7.6 Para comprobar que la imagen se ha publicado correctamente, inicie sesión en DockerHub y seleccione el repositorio que ha creado. Debería ver algo similar a esto:

<!IMG>

7.7 Otra forma de comprobar que la imagen se ha publicado correctamente es:
- OPCIÓN 1: Pedirle a un compañero que ejecute el siguiente comando: `docker pull <username>/ibd_g2/export_data_gob:v1.4`

- OPCIÓN 2: Dirigirse a [Play with Docker](https://labs.play-with-docker.com/), darle a `Login` y posteriormente a `docker` y finalmente a `Start`. Una vez dentro, en el panel izquierdo dale a `+ ADD NEW INSTANCE`. Se le abrirá una terminal nueva, en la que deberás de ejecutar el siguiente comando: `docker pull <username>/ibd_g2/export_data_gob:v1.4`

Si todo ha ido bien, la imagen debería de descargarse correctamente.

Finalmete hemos completado el objetivo de la práctica, pues tenemos una imagen (`ibd_g2/export_data_gob`) Docker utilizada para desplegar un repositorio RDF con los datos Turtle (.ttl) de un conjunto de datos de incendios forestales, disponibles en [datos.gob](https://datos.gob.es/es) e importados en GraphDB. Esta imagen se basa en la última versión de la plataforma GraphDB proporcionada por Ontotext.

***NOTA***: La información a añadir como descripción en DockerHub se encuentra en el archivo *DH_info.md* del repositorio.

### 8. Explorar y probar su contenido

Ahora que ha publicado su imagen, puede explorar y probar su contenido realizando una consulta **SPARQL** en su servicio RDF levantado (https://localhost:7200/). En el panel izquierdo, dirígase a `SPARQL` y escriba la siguiente consulta:

```
!query
```

***NOTA***: En caso de que no se levante el servicio, compruebe que el contenedor está corriendo con el comando `docker ps`. 
- Si en la lista no aparece el contenedor, para listar todos los contenedores creados, ejecute el comando `docker ps -a`. 
- Si el contenedor está parado, inícielo con el comando `docker start <container_name>`.
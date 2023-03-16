# IBD-P1-Grupo2

En el siguiente repositorio, encontrarás todos los archivos necesarios para realizar la ***Práctica 1 de la asignatura de Infraestructura para Big Data***. Entre los archivos anteriormente mencionados están:

**Archivos obligatorios:**

- [Dockerfile](Dockerfile): instrucciones necesarias para crear la imagen Docker que contendrá el servicio virtual que se desplegará en el contenedor.
- [LICENSE](LICENSE.md): licencia de uso de los archivos del repositorio.
- [README](README.md): descripción de la práctica y los pasos a seguir para realizarla con éxito.
- [Repository](Repository.md): link del repositorio.

**Archivos extra:**

- [MAC_guide](MAC_guide.md): guía para clonar repositorios GIT desde el sistema operativo MAC OS.
- [DH_info](DH_info): archivo con la descripción y el README a nivel de usuario para la imagen de DockerHub.
- [images](images): carpeta con imágenes para visualizar la reproductibilidad del repositorio.

Todos los archivos han sido creados y modificados por los miembros del **Grupo 2** de la asignatura de IBD de ***Ciencia de Datos e Inteligencia Artificial de la Universidad Politécnica de Madrid*** (*UPM*): Noa Chu, Che Cui, Carlota Medrano, Alejandro Pequeño.
****

## Objetivo

Crear una imagen Docker, disponible en DockerHub, que despliegue un repositorio RDF con datos Turtle (.ttl) extraídos de [datos.gob](https://datos.gob.es/). Nosotros lo haremos con el conjunto de datos sobre [incendios forestales](https://datos.gob.es/es/catalogo/e05068001-estadistica-general-de-incendios-forestales), pero se pueden elegir otros sin ningún problema. Para más información sobre otros datasets puede consultar: [datos.gob/catalogo](https://datos.gob.es/es/catalogo)

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

***NOTA***: Si su ruta tiene algún espacio o carácter especial, es necesario poner la ruta entre comillas dobles: `cd "<path>"`.

<img src="/images/desktop.png" caption="En este caso, nos situaremos en el escritorio para clonar la carpeta" width="500">


**1.3** Una vez en la carpeta deseada, ejecuta el siguiente comando para clonar el repositorio:

`git clone "https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git"`

<img src="/images/clone.png" caption="Clonamos el repositorio" width="500">
<img src="/images/cloned_folder.png" caption="Y la carpeta clonada aparecerá en el escritorio" width="500">

Para este paso, se ha proporcionado el HTTPS del repositorio de GitHub. Esta URL se puede encontrar también en la página principal del [repositorio](https://github.com/AlejandroPqLz/IBD_Grupo2-P1), en la parte superior derecha, pulsando en el botón verde "Code". En la ventana que se abre, selecciona la opción "HTTPS" y copia el link. También puedes obtenerlo en el archivo [Repository.md](Repository.md) del repositorio de GitHub.

<img src="/images/https.png" caption="HTTPS" width="200">

***NOTA***: Pero también se podría realizar mediante una llave SSH. Para ello, siga el fichero [MAC_guide](MAC_guide.md)

<img src="/images/ssh.png" caption="Llave SSH" width="200">

**1.4** Una vez clonado el repositorio, accede a la carpeta que se ha creado: `cd IBD_Grupo2-P1`. Esto se hace, pues, queremos ejecutar los archivos de la carpeta para la creación de la imagen a través del terminal.

<img src="/images/folder_path.png" caption="Comando para situarse en la carpeta recién clonada" width="500">

### 2. Creación del Servicio Virtual basado en Docker (*creación de imagen Docker*)

Mediante el clonado anterior, podrás encontrar todos los archivos necesarios para realizar el objetivo comentado con anterioridad, es decir, todos los archivos del repositorio de GitHub se encontrarán en tu carpeta local que hayas elegido. Entre ellos, se encuentra el archivo `Dockerfile` que contiene las instrucciones necesarias para crear la imagen Docker. A partir de este archivo, se creará la imagen Docker que contendrá el servicio virtual que se desplegará en cualquier contenedor con esa imagen.

Para la construcción de la imagen, dentro de la carpeta clonada en el **Paso 1**, ejecutamos: `docker build -t <image_name> .`. 

***NOTA***: <span style="color:red">***¡IMPORTANTE!***</style>: No se olvide del ` .` al final del comando. Este indica que se debe de buscar dentro del directorio actual el archivo `Dockerfile` para ejecutarlo y poder crear la imagen.

***NOTA***: Nosotros llamaremos a nuestra imagen: `ibd_g2`. Será un nombre sencillo, pues es la imagen "intermedia", no la final que subiremos a DockerHub. Esta sí tendrá los requisitos esperados en cuanto al nombre de una imagen.

<img src="/images/build_image.png" caption="Comando para construir la imagen" width="500">
<img src="/images/image.png" caption="Imagen en Docker" width="500">

¡Perfecto!, ya hemos creado una imagen Docker. Puedes visualizarla ejecutando el siguiente comando en tu terminal: `docker images`

```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ibd_g2       latest    64920a562003   6 minutes ago   681MB
...          ...       ...            ...              ...
```

### 3. Ejecución de la imagen (*creación de un contenedor Docker*)

Ahora bien, crear la imagen Docker no es suficiente, ahora tenemos que ejecutarla. Para ello, debemos crear un contenedor con el siguiente comando en tu terminal:

`docker run -p 7200:7200 -d --name contenedor_rdf ibd_g2`

Ejecutamos el contendor en modo "detached", en segundo plano, con `-d` y publicamos el puerto 7200 del contenedor en el host de Docker con `-p`, que será el mismo puerto que está escuchando nuestra imagen creada anteriormente (véase en el archivo Dockerfile: `EXPOSE 7200`).

<img src="/images/build_container.png" caption="Comando para construir el contenedor" width="500">
<img src="/images/container.png" caption="Contenedor en Docker" width="500">

### 4. Acceso web al servicio levantado

Una vez lanzado el contenedor a partir de la imagen creada, ya podemos acceder al servicio web a través de nuestro navegador. Para ello, simplemente abrimos una nueva pestaña en nuestro navegador y accedemos a la dirección local del puerto que hemos levantado al crear el contenedor y que está expuesta al crear la imagen, en este caso, el puerto 7200: [http://localhost:7200/](http://localhost:7200/).

De esta forma, podremos interactuar con el servicio virtual que hemos desplegado en el contenedor Docker de forma fácil y cómoda desde nuestra propia máquina. ¡Ya tienes tu servicio virtual desplegado y funcionando correctamente!

<img src="/images/db.png" caption="Servicio virtual desplegado" width="500">

***NOTA***: También se puede acceder desde Docker. En la parte derecha del nombre, clicamos sobre los tres puntos `፧`> Abrir en navegador `Open in browser`:

<img src="/images/open_browser.png" caption="Abrir el contendeor en el navegador" width="500">

### 5. Despliegue del repositorio RDF e importación de archivos

Ahora desplegaremos el repositorio RDF con los archivos `.ttl` de [datos.gob-incendios_forestales](https://datos.gob.es/es/catalogo/e05068001-estadistica-general-de-incendios-forestales).

**5.1** Nos dirigimos al panel izquierdo de la pantalla y seleccionamos `setup` y posteriormente `Repositories`.

<img src="/images/setup.png" caption="Nos dirijimos a la sección de setup para crear el repositorio" width="500">

**5.2** Una vez dentro, pulsamos en `create new repository` y después `GraphDB Repository`. Esto nos reedigirá a una nueva pantalla donde deberemos de rellenar los siguientes campos:

- `Repository ID`: `data`
- Los demás campos los dejamos como están por defecto.

<img src="/images/db_repository.png" caption="Crear un repositorio de tipo grafo" width="500">
<img src="/images/data.png" caption="Crear un repositorio de tipo grafo" width="500">

¡Ya hemos creado nuestro repositorio RDF! En este repositorio ya están todos los archivos `.ttl` importados.

**5.3** Para poderlos visualizar, nos dirigimos nuevamente al panel izquierdo y seleccionamos `import`.

***NOTA***: Es posible que deba de seleccionar el repositorio `data` para poder visualizar los archivos. Para ello, en la parte superior derecha, despliegue los repositorios disponibles y seleccione `data`.

<img src="/images/import_data.png" caption="Seleccionar el repositorio data" width="500">

**5.4** Una vez dentro de tu repositorio, selecciona la pestaña `Server files`. Si todo se ha realizado correctamente, ahí deberían estar todos los archivos `.ttl` de [datos.gob-incendios_forestales](https://datos.gob.es/es/catalogo/e05068001-estadistica-general-de-incendios-forestales).

<img src="/images/server_files.png" caption="Visualizaciónn de los archivos ttl" width="500">

### 6. Creación de la imagen con el repositorio RDF

Ya hemos comprobado que el servicio web funciona correctamente y que tenemos todos los archivos `.ttl` importados correctamente en nuestro repositorio RDF llamado `data`. A continuación, lo que nos queda por hacer es guardar el estado actual del contenedor Docker, es decir, guardar la imagen Docker con el repositorio RDF creado. Para ello, debemos de crear una nueva imagen Docker a partir del contenedor que tenemos actualmente, esto se hace sencillamente con el siguiente comando docker: 

`docker commit <container_name> <new_image_name>:<tag>`

***NOTA***: Utilizaremos la versión de nuestro último *release* de GitHub, que en este caso es la `v3.0`: `docker commit graphdb ibd_g2-export_data_gob:v3.0`. Nótese que esta ya es la imagen final que satisface los objetivos de la práctica. Por ello, por ser ya la imagen final, cumpliremos con los requisitos que se esperan de en cuanto al nombre de la imagen.

Para comprobar que todo se ha ejecutado correctamente, visualizamos las imagenes disponibles con: `docker images`

```
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
ibd_g2-export_data_gob   v3.0      15439fac5958   2 minutes ago   1.73GB
ibd_g2                   latest    87f8be82a675   6 hours ago     1.67GB
...                      ...       ...            ...              ...
```

Como podemos observar, hemos creado una nueva imagen Docker a partir del contenedor `graphdb` que se llama `ibd_g2-export_data_gob` y que tiene la versión más reciente de nuestro repositorio: `v3.0`. Esta imagen Docker contiene el repositorio RDF creado y todos los archivos `.ttl` importados, por tanto, deberíamos de poder ver que la nueva imagen tiene un tamaño mayor que la imagen anterior.

### 7. Publicación de la imagen en DockerHub

¡Ya queda menos! Ahora que tenemos una imagen Docker con todos los requisitos necesarios, necesitamos hacerla accesible al público en general. Para hacer esto, utilizaremos [DockerHub](https://hub.docker.com/), un servicio de almacenamiento de imágenes Docker gratuito y público.

***NOTA***: Antes de subir la imagen a DockerHub, es necesario tener una cuenta en el servicio de Docker, DockerHub. Si no la tienes, puedes registrarte desde [aquí](https://hub.docker.com/signup).

**7.1** Una vez registrado en tu cuenta, dirigirte al panel superior y selecciones `Repositories`.

**7.2** Una vez dentro, selecciona `Create Repository`. Se nos reedigirá a una nueva pantalla donde deberemos de rellenar los siguientes campos a rellenar:

- Dejamos el usuario por defecto.
- `Name`: `ibd_g2-export_data_gob`
- `Description`: Propocionada en el archivo [DH_info](DH_info)
- `Visibility`: Dejamos la opción `Public` por defecto.

Una vez rellenamos los campos, ciclamos en `Create` y aprovechamos en este paso para añadir el README a nivel de usuario que se encuentra en el archivo [DH_info](DH_info) donde se proporciona información sobre cómo utilizar la imagen que subiremos en los siguientes pasos.

**7.3** Una vez que se haya creado el repositorio, regrese a la terminal. Antes de subir la imagen, inicie sesión en Dockerhub desde la terminal con el siguiente comando: `docker login -u <username>`

**7.4** Después de iniciar sesión, etiquete su imagen con su nombre de usuario de DockerHub. Si no etiqueta su imagen, Docker no sabrá, a la hora de subir su imagne, a qué repositorio de DockerHub subirla:

`docker tag ibd_g2-export_data_gob:v3.0 <username>/ibd_g2-export_data_gob:v3.0`

***NOTA***: `<username>` es su nombre de usuario de DockerHub.

**7.5** Una vez etiquetada, ya podemos subir la imagen a DockerHub:

`docker push <username>/ibd_g2-export_data_gob:v3.0`

***NOTA***: Aquí es donde más importancia hay que dar a lo de la versión de la imagen, pues si no especificas una, Docker usar por defecto la versión `latest`.

**7.6** Para comprobar que la imagen se ha publicado correctamente, inicie sesión en DockerHub y seleccione el repositorio que ha creado. Debería ver algo similar a esto:

<!IMG>

**7.7** Otra forma de comprobar que la imagen se ha publicado correctamente es:

- *OPCIÓN 1:* Pedirle a un compañero que ejecute el siguiente comando: `docker pull <username>/ibd_g2-export_data_gob:v3.0`

- *OPCIÓN 2:* Dirigirse a [Play with Docker](https://labs.play-with-docker.com/), darle a `Login` y posteriormente a `docker` y finalmente a `Start`. Una vez dentro, en el panel izquierdo, dale a `+ ADD NEW INSTANCE`. Se le abrirá una terminal nueva, en la que deberás de ejecutar el siguiente comando: `docker pull <username>/ibd_g2-export_data_gob:v3.0`

Si todo ha ido bien, en ambas opciones, la imagen debería de descargarse correctamente.

Finalmente, hemos completado el objetivo de la práctica, pues tenemos una imagen (`ibd_g2-export_data_gob`) Docker utilizada para desplegar un repositorio RDF con los datos Turtle (.ttl) de un conjunto de datos de incendios forestales, disponibles en [datos.gob](https://datos.gob.es/es) e importados en GraphDB. Esta imagen se basa en la última versión de la plataforma GraphDB proporcionada por Ontotext.

### 8. Explorar y probar su contenido

Ahora que ha publicado su imagen, puede explorar y probar su contenido realizando una consulta **SPARQL** en su servicio RDF levantado (https://localhost:7200/). Para ello, en el panel izquierdo, diríjase a `SPARQL` y escriba la siguiente consulta de prueba:

``` sql
SELECT * 
WHERE 
    { ?s ?p ?o .} 
LIMIT 100 
```

***NOTA***: En caso de que no se levante el servicio, compruebe que el contenedor está corriendo con el comando `docker ps`.

- Si en la lista no aparece el contenedor, para listar todos los contenedores creados, ejecute el comando `docker ps -a`.

- Si el contenedor está parado, inícielo con el comando `docker start <container_name>`.
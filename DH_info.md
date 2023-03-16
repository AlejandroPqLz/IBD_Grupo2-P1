# DockerHub

- Este es un archivo markdown con la información necesaria para poder completar la *distribución del servicio* que generamos en esta práctica a la vez que el apartado de *reproducibilidad*. Es decir, se aportará una descripción de su contenido con información de utilización de la imagen `ibd_g2-export_data_gob`. Obviamente el contenido de este archivo es el mismo que el que se puede encontrar en DockerHub.

## Descripción

Imagen que despliega un repositorio RDF con datos Turtle de datos.gob e importados en GraphDB.

**NOTA**: La descripción es tan corta pues DockerHub solo admite 100 caracteres para esta.

## README.md

- Esta sección proporciona información sobre cómo utilizar la imagen `ibd_g2-export_data_gob` de Docker.

### Requisitos previos

Antes de utilizar esta imagen, asegúrese de que su sistema cumpla tenga Docker instalado y en funcionamiento.

### Cómo utilizar la imagen

Para utilizar esta imagen, siga los siguientes pasos:

**1.** Descargue la imagen desde DockerHub ejecutando el siguiente comando:

`docker pull carlotaupm/ibd_g2-export_data_gob:v3.2`

**2.** Cree un contenedor a partir de la imagen descargada:

`docker run -p 7200:7200 -d --name rdf-repo carlotaupm/ibd_g2-export_data_gob:v3.2`

Este comando creará un contenedor de Docker, en segundo plano, con el nombre "rdf-repo" y expondrá el puerto 7200 en el host local.

**3.** Acceda al repositorio RDF a través un navegador web: `http://localhost:7200`. Desde ahí podrá encontrar los archivos Turtle (.ttl) importados de [datos.gob-incendios_forestales](https://datos.gob.es/es/catalogo/e05068001-estadistica-general-de-incendios-forestales)

### Configuración avanzada

Para configurar esta imagen para sus necesidades específicas, puede seguir los siguientes pasos:

**1.** Cree un archivo Dockerfile en el directorio deseado con el siguiente contenido:

```
# A partir de nuestra imagen
FROM ibd_g2-export_data_gob:v3.1

# Configurar el repositorio GraphDB
RUN <comandos de configuración>

# Copiar sus archivos de datos al directorio de importación de GraphDB
COPY <path donde están los archivos> /root/graphdb-import

# Ejecutar la importación de datos en GraphDB
RUN <comandos de importación>

# Exponer el puerto 7200
EXPOSE 7200
```

**2.** Construya la imagen a partir del archivo Dockerfile:

`docker build -t nuevo_graphdb .`

**3.** Cree un contenedor a partir de la imagen construida:

`docker run -p 7200:7200 -d --name contendor_graphdb nuevo_graphdb`

### Soporte y contribuciones

Si necesita ayuda con esta imagen o desea contribuir con mejoras, puede hacerlo a través de la [página de GitHub del proyecto](https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git).

### Licencia

Esta imagen se distribuye bajo la licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional. Para más información, consulte el archivo LICENSE en la [página de GitHub del proyecto](https://github.com/AlejandroPqLz/IBD_Grupo2-P1.git).

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Licencia Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>

****

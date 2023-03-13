# DockerHub

- Este es un archivo markdown con la información necesaria para poder completar la distribución del servicio que generamos en esta práctica a la vez que el apartado de reproducibilidad. Es decir,se aportará una descripción de su contenido con información de utilización de la imagen `ibd-g2/export_data_gob`. Obviamente el contenido de este archivo es el mismo que el que se puede encontrar en DockerHub.

## Descripción

La imagen "ibd-g2/export_data_gob" es una imagen de Docker utilizada para desplegar un repositorio RDF con los datos Turtle de un conjunto de datos de incendios forestales disponibles en [datos.gob](https://datos.gob.es/es) importados en GraphDB. Esta imagen se basa en la última versión estable de la plataforma GraphDB proporcionada por Ontotext. La imagen es adecuada para su uso en entornos de producción y desarrollo.

Esta imagen ha sido diseñada por: Noa Chu, Che Cui, Carlota Mendrano y Alejandro Pequeño para realizar la práctica 1 de la asignatura de Infraestructuras de Big Data del grado de Ciencia de datos e Inteligencia Artificial de la UPM. La imagen es configurable y personalizable, por lo que se puede adaptar a las necesidades del usuario, además es ideal para la importación de grandes conjuntos de datos RDF.

## README.md

- Esta sección proporciona información sobre cómo utilizar la imagen "ibd-g2/export_data_gob" de Docker.

### Requisitos previos

Antes de utilizar esta imagen, asegúrese de que su sistema cumpla tenga Docker instalado y en funcionamiento.

### Cómo utilizar la imagen

Para utilizar esta imagen, siga los siguientes pasos:

**1.** Descargue la imagen desde DockerHub ejecutando el siguiente comando: `docker pull ibd-g2/export_data_gob`

**2.** Cree un contenedor a partir de la imagen descargada: `docker run -p 7200:7200 -d --name rdf-repo_ibd-g2/export_data_gob`

Este comando creará un contenedor de Docker, en segundo plano, con el nombre "rdf-repo" y expondrá el puerto 7200 en el host local.

**3.** Acceda al repositorio RDF a través un navegador web: `http://localhost:7200`

### Configuración avanzada

Para configurar esta imagen para sus necesidades específicas, puede seguir los siguientes pasos:

**1.** Cree un archivo Dockerfile en el directorio deseado con el siguiente contenido:

```
FROM ibd-g2/export_data_gob

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

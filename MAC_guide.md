# Clonar repositorios con el sistema operativo MAC OS

### Clonar repositorios de GitHub con una llave SSH

Debido a las nuevas versiones de git, ya no está permitido clonar el repositorio utilizando HTTPS para MAC OS. Esto es una manual para clonar un repositorio a través de una llave SSH. Para poder hacerlo se deberán seguir los siguientes pasos: 

### COMPROBAR LA EXISTENCIA DE UNA LLAVE SSH 

Para verificar la existencia de una *llave ssh* debemos ejecutar los siguientes comandos:

1. Abrir el terminal

2. Comprobar de si ya existe una *llave ssh*:
`ls -al ~/.ssh `

3. Aparecerá un listado de ficheros ssh. Comprobar si la *llave ssh* existe


### CREAR UNA LLAVE SSH
Para crear una *llave ssh* debemos ejecutar los siguientes comandos:

1. Abrir el terminal

2. Escribir el siguiente comando con el email utilizado en la cuenta de github:
`ssh-keygen -t ed25519 -C "<email>"` 

>NOTA: Si no funciona, probar con ` ssh-keygen -t rsa -b 4096 -C "<email>" ` 

3. Una vez creada, aparecerá el siguiente mensaje: 
\> Generating public/private rsa key pair

4. A continuación, aparecerá el siguiente mensaje: 
\> Enter file in which to save the key (/<file_path>).

5. Pulse enter para aceptar y continuar

6. Añadir una “contraseña”:  \> Enter passphrase (empty for no passphrase): 

7. Ya se ha creado la clave SSH


### AÑADIR UNA LLAVE SSH AL AGENTE SSH
Para añadir una *llave ssh* a un *agente SSH* debemos ejecutar los siguientes comandos:

1. Abrir el terminal

2. Aparecerá el siguiente mensaje: 
\>  > Agent pid <numero>

3. Comprobar que el fichero no existe:
`open ~/.ssh/config`

4. Si no existe, aparecerá el siguiente mensaje: 
\> The file ~/.ssh/config does not exist.

5. Crear el fichero: 
`touch ~/.ssh/config`

6. Abrir y editar el fichero con el id correspondiente: 
```
    Host github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/<id>
 ```

7. Guardar los cambios

8. Añadir la *llave ssh* con el id correspondiente:
ssh-add --apple-use-keychain ~/.ssh/<id>

### AÑADIR LLAVE SSH A UNA CUENTA DE GITHUB
Para añadir una *llave ssh* a una cuenta en github debemos ejecutar los siguientes comandos:

1. Abrir el terminal

2. Copiar y substituir el id para copiar la llave en el clipboard:
`pbcopy < ~/.ssh/<id>.pub`

3. Abrir y entrar en uan cuenta de github en el navegador

4. Desde la pestaña de github, dirigirse a Perfil > Ajustes > Llaves SSH and GPC (sección acceso) > nueva llave ssh

5. Crear la llave: añadir un titulo, especificar tipo de uso y pegar la informacion previamente copiada

6. Añadir y guardar

### CLONAR UN REPOSITORIO USANDO UNA LLAVE SSH
Para añadir una *llave ssh* a una cuenta de github debemos ejecutar los siguientes comandos:

1. Abrir github

2. Copiar url del repositorio bajo la pestaña SSH en vez de HTTPS
`pbcopy < ~/.ssh/<id>.pub`

3. Abrir el terminal

4. Clonar el reposotorio: 
`git clone <url>`

>NOTA: Para más ayuda visitar el siguiente enlace: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
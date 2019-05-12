# Ejercicios voluntarios Tema 7: Almacenamiento de datos

## Transparencias de Clase

### Ejercicios 1. Buscar información sobre los sistemas de ficheros en red más utilizados en la actualidad y comparar sus características. Hacer una lista de ventajas e inconvenientes de todos ellos, así como grandes sistemas en los que se utilicen.


### Ejercicio 2. Configurar en una máquina virtual un servidor NFS. Montar desde otra máquina virtual en la misma subred la carpeta exportada y comprobar que ambas pueden a acceder a la misma para la lectura y escritura.
Este ejercicio es el tema principal de la práctica 6 (voluntaria).
Puedes acceder a ella desde [aquí](https://github.com/pepitoenpeligro/SWAP/tree/master/practicas/p6).


## Desde el libro

### Ejercicio 3. ¿Qué tamaño de unidad RAID se obtendrá al configurar un RAID 0  a partir de dos discos de 100 GB y 100 GB?

Con un sistema RAID 0, la capacidad total es:
![](https://latex.codecogs.com/gif.latex?C_{total}&space;=&space;min({C_{HDD1},&space;C_{HDD2},...,&space;C_{HDDN}})*N)
Por lo que la capacidad será de 200 GB.



### Ejercicio 4. ¿Qué tamaño de unidad RAID se obtendrá al configurar un RAID 0 a partir de tres discos de 200 GB cada uno?
Con un sistema RAID 0, la capacidad total es:
![](https://latex.codecogs.com/gif.latex?C_{total}&space;=&space;min({C_{HDD1},&space;C_{HDD2},...,&space;C_{HDDN}})*N)
Como todos los discos tienen la misma capacidad el mínimo no existe, por lo que se sustituye por el valor 200GB, de forma que al tener tres discos, la capacidad total del sistema RAID 0 sea de 600 GB.


### Ejercicio 5. ¿Qué tamaño de unidad RAID se obtendrá al configurar un RAID 1 a partir de dos discos de 100 GB y 100 GB?

Con un sistema RAID 1, la capacidad total es:
![](https://latex.codecogs.com/gif.latex?C_{total}&space;=&space;min({C_{HDD1},&space;C_{HDD2},...,&space;C_{HDDN}}))

Por lo que la capacidad total del sistema RAID 1 será de 100GB.



### Ejercicio 6. ¿Qué tamaño de unidad de RAID se obtendrá al configurar un RAID 1 a partir de tres discos de 200 GB cada uno.

Con un sistema RAID 1, la capacidad total es:
![](https://latex.codecogs.com/gif.latex?C_{total}&space;=&space;min({C_{HDD1},&space;C_{HDD2},...,&space;C_{HDDN}}))

Por lo que la capacidad total del sistema RAID 1 será de 200 GB.


### Ejercicio 7. ¿Qué tamaño de unidad RAID se obtendrá al configurar un RAID 5 a partir de tres discos de 120 GB cada uno?

Con un sistema RAID 5, la capacidad total es:

https://latex.codecogs.com/gif.latex?C_{total}&space;=&space;min({C_{HDD1},&space;C_{HDD2},...,&space;C_{HDDN}})*(N-1)

Por lo que la capacidad total del sistema RAID 5 será de 240 GB.


### Buscar información sobre los sistemas de ficheros en red más utilizados en la actualidad y comprar sus características. Hacer una lista de ventarjas e inconvenientes de todos ellos, así como grandes sistemas en los que se utilicen.

1. Samba. Es un sistema de ficheros en red de Microsoft Windows que antiguamente se llamaba SMB para subsistemas UNIX. Samba configura directorios UNIX y LInux como recursos para compartir a través de la red. Para los usuarios de Windows aparecen como carpetas normales de red.
2. NFS. Es un protocolo de nivel de aplicación para el uso de sistemas de archivos distribuidos en un entorno de red de computadoras de área local desarrollado originalmente por Sun Microsystems.
3. GlusterFS. Es un sistema multiescalable de archivos para NAS que permite agregar varios servidores de archivos sobre Ethernet o interconexiones Inifiniband RDMA en un gran entorno de archivos en red en paralelo. Utiliza el espacio de usuario para no comprometer el rendimiento. Actualmente pertenece a Red Hat Inc.
4. Lustre. Es un sistema de archivos distribuido Open Source que se suele usar en cluster a gran escala. El proyecto intenta proporcionar una sistema de archivos para clusters de decenas de miles de nodos con petabytes de capacidad de almacenamiento sin comprometer al velocidad o la seguridad.
5. InterMezzo. Es un sistema de archivos distribuidopara Linux y se incluye en el kernel standard de Linux hasta la 2.4. Está diseñado para trabajar por encima de un sistema de archivos con registro como puede ser ext3 o JFS. Consiste en un servidor que mantiene la copia maestra del sistema de archivs y uno o más clientes con una caché del sistema de archivos.
6. Coda. Es un sistema de archivos distribuido desarrollado como un proyecto de investigación y desciende de una versión antigua de AFS. 
7. HARP. Es un sistema de ficheros tipo UNIX distribuido que replica la información y es accesible via interfaz VFS. Su nombre proviene de las siglas del inglés *High Available Reliable Persistent*. Provee alta disponibilidad y almacenamiento fiable de ficheros y garantiza que las operaciones sobre los ficheros son ejecutadas atómicamente a pesar de ejecutarse en un entorno con concurrencias y fallos.
8. Google File System. Es un sistema de archivos distribuidos propietario y desarrollado por Google Inc que soporta toda la infraestructura informática de procesamiento de información en la nube. Está especialmente diseñado para proveer de eficiencia, fiabilidad de acceso a datos usando sistmas masivos de cluster de procesamiento en paralelo. Actualmente tiene el nombre de Colossus.
9. Fossil. Es el sistema de archivos por defecto del sistema operativo Plan 9 de Bell Labs. Utiliza el protocolo de red 9P y se ejecuta como un demonio en espacio de usuario como la mayoría de los servidores de archivos de Plan 9. Permite tomar instantáneas del sistema de archivos entero ejecutando una orden o con un intervalo de tiempo predefino y se pueden guardar dichas instantáneas en el Fossil a lo largo de la partición en disco si ésta lo permite.
10. Global File System. Es un sistema de archivos distribuido para clusteres de servidores de sistemas GNU/Linux. No debe confundirse con el Google File System o el Gmail File System, que son sistemas propietarios de Google. Difiere de otros sistemas de archivos distribuidos porque permite que todos los nodos tengan acceso simultáneo directo al mismo bloque de almacenamiento compartido. Además, puede usarse como un sistema de archivos local.
11. General Parallel File System. Es un sistema de ficheros distribuido de alto rendimiento desarrollado por IBM y permite un acceso concurrente de alta velocidad a aplicaciones qeu se encuentran ejecutando en múltiples nodos de un cluster dando una visión de una disco compartido entre todos ellos, la configuración existente de mayor tamaño superaba los 2000 nodos. El tamaño máximo del volumen es de 2^99 bytes = 4 PiB. Es utilizado por el Magerit y el Marenostrum (dos supercomputadores alojados en España).
12. Hammer2. Es el sucesor de HAMMER y es un sistema de archivos distribuidos que soporta clustering, instantáneas, indexación de las entradas del directorio, múltiples puntos de montajes, compresión, encriptación, zero-detection, checksum de los metadatas a la vez de que usa un espacio mínimo en la memoria.
13. Xsan. Es un sistema de archivos distribuido para macOS. Es tolerante a fallos, permite montar varios sistemas de archivo y varios sistemas operativos.
14. DFS (Distributed File System). Es un conjunto de servicios cliente servidor que permite a una organización organizar múltiples SMB con tan solo usar servidores Microsoft Windows. Es un sistema redundante y transparente.
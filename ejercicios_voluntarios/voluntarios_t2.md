# Ejercicios voluntarios Tema 2: Alta disponibilidad y escalabilidad en servidores web

### Ejercicio 1. Calcular la disponibilidad el sistema si tenemos dos réplicas de cada elemento (habiendo en total 3 elementos en cada subsistema).

Aplicando lo que hemos aprendido en clase, sabemos que para calcular la disponibilidad de un sistema:
![](https://latex.codecogs.com/gif.latex?A_{s}&space;=&space;A_{cn-1}&space;&plus;&space;(1-&space;A_{cn-1})*A_{cn})

|  Componente 	| Disponibilidad inicial 	| Disponibilidad +1 réplica 	| Disponibilidad +2 réplicas 	|
|:-----------:	|:----------------------:	|:-------------------------:	|:--------------------------:	|
| Web         	|          0.85          	|           0.9775          	|          0.996625          	|
| Aplicación  	|           0.9          	|            0.99           	|            0.999           	|
| DB          	|          0.999         	|          0.999999         	|         0.999999999        	|
| DNS         	|          0.98          	|           0.9996          	|          0.999992          	|
| Cortafuegos 	|          0.85          	|           0.9775          	|          0.996625          	|
| Switch      	|          0.99          	|           0.9999          	|          0.999999          	|
| Datacenter  	|         0.9999         	|           0.9999          	|           0.9999           	|
| ISP         	|          0.95          	|           0.9975          	|          0.999875          	|



### Ejercicio 2. Buscar frameworks y librerías para diferentes lenguajes que permitan hacer aplicaciones altamente disponibles con relativa facilidad. Como ejemplo, examina PM2 que sirve para administrar clústeres de NodeJS.

1. Pacemaker. Es un CRM que nos da alta disponibilidad y escalabilidad.
2. Keepalived. Es un software de enrutamiento que permite un sistema robusto y simple de balanceo de carga y alta disponibilidad a sistemas UNIX.
3. Django. Es un framework para el desarrollo web de código abierto sobre la plataforma Python que libera al programador de reinventar factores como el enrutamiento de URL, el mapeo de objetos relacionales y la autenticación. 
4. Flask. Es un framework para el desarrollo web sobre la plataforma Python que permite hacer desarrollos muy rápidos. Concretamente lo usamos para hacer la aplicación de nuestro trabajo de exposición de la asignatura.
5. Spring MVC. Es un framework para el desarrollo web sobre las tecnologías JAVA Enterprise Edition para desplegar servicios REST y SOAP entre otros. Tienen una comunidad muy grande.
6. Struts2. Es un framework para el desarrollo de aplicaciones web orientada a empresas sobre las tecnologías JAVA Enterprise Edition.
7. Hibernate. ES un framewrok para realizar operaciones de base de datos sobre objetos JAVA y mantener persistencia en la misma.
8. Laravel. Es un framework que promete facilidad de sintaxis para la plataforma PHP. Tiene una comunidad muy grande y se puede ejecutar de forma asíncrona.


### Ejercicio 3. ¿Cómo analizar el nivel de carga de cada uno de los subsistemas en el servidor? Buscar herramientas y aprender a usarlas.

De base, los sistemas UNIX traen herramientas de monitorización nativas como top, htop, ps, lsof, netstat, iotop, df, dstat...
Pero a nosotros nos interesa analizar concretamente la carga web de servicios. A continuación proponemos algunas herramientas:

1. Cacti. Realiza gráficos de métricas del tráfico.
2. Inciga. Es un fork de Nagios y permite realizar tareas de monitorización, llevar un histórico de problemas y extender funcionalidades a través de módulos.
3. Munin. Es una herramienta para monitorizar los recursosde red y visualizarlo en gráficas. 



### Ejercicio 3. Buscar ejemplos de balanceadores software y hardware como productos comerciales.

En cuanto a balanceadores software tenemos:
1. Zevenet.
2. Enterprise VA MAX.
3. Nginx.
4. Pound
5. Pen.
6. Brocade.

En cuanto a balanceadores hardware tenemos:
1. Barracuda.
2. F5.
3. Cisco.
4. Kemp Technologies.


### Ejercicio 4. Buscar productos comerciales apra servidores de aplicaciones.

1. Microsoft Internet Information Services.
2. Apache tomcat.
3. Borland AppServer.
4. Windows Server
5. Oracle Application Server.
6. Microsoft Azure.


### Ejercicio 5. Buscar productos comerciales para servidores de almacenamiento.

1. Compose. Herramienta cloud para alojar bases de datos de diferentes gestores de bases de datos. Muy utilizado en múltiples desarrollos de proyectos sobre node.js.
2. Microsoft Azure. 
3. Amazon Web Services S3.
4. Google Cloud Storage.
5. mLab. Igual que Compose pero solo sirve para MongDB.
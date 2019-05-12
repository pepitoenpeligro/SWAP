# Ejercicios voluntarios Tema 4: Balanceo de carga

### Ejercicio 1. Buscar información sobre cuánto costaría en la actualidad un mainframe que tuviera las mismas prestaciones que una granja web con balanceo de carga y 10 servidores finales (p.ej).

1. En la asignatura *Arquitecturas de Computación de Altas Prestaciones* se realizó un ejercicio similar y se propuso el *IBM z13s* como un modelo mainframe (a diferencia de otros modelos por nodos). Tiene un precio estimado de 100.000 $ en su configuración base con 64 GB de RAM y se pueden configurar para diferentes ámbitos, desde ejecución de servidores Web en JAva (System z Application Assist Processor) hasta para realizar operaciones general (Central Processor System) o de computación criptográficas (CriptoExpress).
2. HPE. De este fabricante podemos obtener los DL580 Gen10. El servidor de escalabilidad vertical resiliente y altamente expandible para cargas de trabajo críticas para el negocio, que permite hasta 4 procesadores Intel Xeon de las series 5100, 6100 y 8100. Con un precio de partida de 21699.00 $
3. Si optamos por montar una granja web por nodos, una solución interesante sería los  *Smart Value Flexi  PowerEdge* , en conreto vamos a hablar de la gama T640. El modelo PowerEdge T640 es un servidor potente y versátil ideal para las oficinas medianas, los sitios remotos y los centros de datos. El servidor T640 combina un potente rendimiento y una enorme capacidad de almacenamiento interno en una plataforma torre o para rack. Haga frente a una amplia gama de cargas de trabajo y prepare su centro de datos para el futuro gracias a opciones flexibles de almacenamiento, rendimiento y E/S. Ideal para: Virtualización de servidores y virtualización de escritorios, Consolidación, Bases de datos y análisis e inteligencia empresariales, Aplicaciones y creación de imágenes para los sectores de la sanidad, las finanzas, la educación y la ciencia, ERP, CRM y HPC, Tecnologías definidas por software. Por defecto incorporan 1 unidad Intel® Xeon® Bronze 3104 1.7G, 6C/6T, 9.6GT/s, 8M Cache, No Turbo, No HT (85W) DDR4-2133, pero admite otra más y 8GB RDIMM, 2667MT/s de memoria RAM y 300GB 15K RPM SAS 12Gbps 512n 2.5in Hot-plug Hard Drive de disco duro a un precio actual de 1.466,32 €.


### Ejercicio 2. Buscar información sobre precio y características de balanceadores comerciales (hardware) específicos. Compara las prestaciones que ofrecen unos y otros.

Del fabricante Barracuda encontramos tres modelos con precios muy muy variados:

![](images/t4/BBF240A.png)
![](images/t4/BBF540A.png)
![](images/t4/BBF840A.png)

Del fabricante LoadBalancer tenemos una tabla comparativa bastante interesante:

![](images/t4/load_balancer_table.png)

Luego adjuntamos un enlace a una estudio realizado por la gente de [Nginx](https://www.nginx.com/blog/nginx-plus-vs-f5-big-ip-2018-price-performance-comparison/)
que refleja que a día de hoy los balanceadores de carga hardware son componentes que se han dejado sólo en el ámbito de centros de datos y que a día de hoy el rendimiento de su software como balanceador de carga es superior o casi igual con mucho menor precio:

![](images/t4/nginx_f5.png)


### Ejercicio 3. Instala y configura en una máquina virtual el balanceador Zevenet. Compara con la dificultad de la instalación y configuración usando nginx o haproxy.


Vamos a probar la [imagen comunidad](https://www.zevenet.com/es/productos/comunidad/), que a fecha de nuestra realización es la versión: 5.9.1

![](images/t4/installing_1)

Especificamos la dirección ip que queremos que tenga nuestro zevenet en nuestra subred:
![](images/t4/ip)
Le indicamos un nombre de dominio
![](images/t4/domain)

Ya tenemos la instalación hecha
![](images/t4/finish)

Iniciamos desde la consola para probar que el usuario creado durante la instalación funciona.
![](images/t4/init_user)

Accedemos a la interfaz web de zevenet desde un navegador desde el host.
![](images/t4/zevenet_init)

En la siguiente captura podemos ver el dashboard:
![](images/t4/dashboard)



### Ejercicio 4. Buscar información sobre los métodos de balanceo que implementan los dispositivos recogidos en el ejercicio 4.2 (o el software que hemos propuesto para la práctica 3)

Vamos a fijarnos en el fabricante [Barracuda](https://assets.barracuda.com/assets/docs/dms/Barracuda_Load_Balancer_ADC_DS_ES.pdf)

Las técnicas de balanceo que implementan son:

1. Round-robin
2. Round-robin ponderado
3. Servidor con menos conexiones
4. Adaptado por carga de CPU

Ahora vamos a fijarnos en el fabricante [F5](https://devcentral.f5.com/articles/intro-to-load-balancing-for-developers-ndash-the-algorithms)

1. Random
2. Round Robin
3. Weighted Round Robin
4. Dynamic Round Robin (Called Dynamic Ratio on the BIG-IP)
5. Fastest
6. Least Connections
7. Observed
8. Predictive


Básicamente son todos los que hemos visto en clase de teoría de la asignatura.

### Ejercicio 5. Probar las diferentes maneras de redirección HTTP. ¿Cuál es adecuada y cuál no lo es para hacer balanceo de carga global? ¿Por qué?

En el protocolo HTTP una redirección es una respuesta con un código de estado que comienza en 3 que provoca que el navegador muestre una página diferente. Si un cliente recibe un redirect, necesita tomar una serie de decisiones para manejar la redirección. Diferentes códigos de estado se utilizan por los clientes para: entender el objetivo de la redirección, saber cómo administrar el caching y saber qué método request usar para el request subsecuente.

HTTP/1.1 define varios códigos de estado HTTP para redirecciones (RFC 7231):

1. 300 multiple choices. Ofrece múltiples opciones para el resource que el cliente podría seguir, como diferentes formatos de vídeo, lista de archivos con diferentes extensiones, etc.
2. 301 moved permanently. Este y todos los requests futuros deberán redirigirse a la URI dada.
3. 302 found. La especificación HTTP/1.0 requería que el cliente ejecutara una redirección temporal, pero los navegadores populares implementaron la 302 con la funcionalidad de 303 See Other. Por esta razón HTTP/1.1 añadió los códigos de estado 303 y 307 para diferencias entre los dos comportamientos. Sin embargo, algunas aplicaciones web y frameworks utilizan el código 302 como si fuera el 303.
4. 303 see other. La respuesta al request puede encontrarse en otra URI utilizando un método GET. Cuando se recibe en respuesta a un POST (o PUT/DELETE) debería asumirse que el servidor ha recibido los datos y la redirección debería tratarse con un mensaje GET separado.
5. 307 temporary redirect. El request debería repetirse con otro URI, pero futuros requests deberán utilizar el URI original. En contraste a como 302 se implementó históricamente, el método request no está permitido que se cambie cuando se trata el request original. Por ejemplo, un POST request debería repetirse utilizando otro POST request.
6. 308 permanent redirect. El request, y todos los requests futuros deberán repetirse utilizando otro URI. 307 y 308 son paralelos a los comportamientos de 302 y 301, pero no permiten que cambie el método HTTP. 


Por tanto, las que nos permiten realizar redireccionamiento son:
1. 301
2. 307
3. 308

Toda esta información la podemos encontrar [aquí](https://diego.com.es/redirecciones-http)


### Ejercicio 6. Buscar información sobre los bloques de IP para los distintos países o continentes. Implementar en Javascript o PHP la detección de zona desde donde se conecta un usuario

La lista de los bloques IP asignados en función de los distintos paises la podemos encontrar en http://www.nirsoft.net/countryip/

Debido a mi proximidad natal con Gibraltar, he decidio investigar allí los bloques IP asignados (http://www.nirsoft.net/countryip/gi.html) y podemos ver como tiene asignado un total de 57.344 IPs a propiedad de *Broadband Gibraltar Limited* y de *Gibtelecom Ltd.*, mientras que en España, tenemos una lista de bloques asignados mucho mayor pero los propietarios están mucho más distribuidos, a pesar de la notoria presencia de *Vodafone ONO* y de *Telefonica de España*.

Para implementar en PHP la detección de la zona nos basta con usar el paquete *GeoIP* en la variable *$_SERVER['REMOTE_ADDR']*.

Sin embargo, la misma funcionalidad implementada en javascript no está como paquete local sino como servicio externo. Entre ellos podemos destacar: *DB-IP* y *Geobytes*

En mi caso, hace un tiempo usé *Geobytes* para realizar una funcionalidad de un alumno de *Desarrollo de Aplicaciones Multimedia* sobre una supuesta aplicación de gestión bancaria de usuario, en la que se pedía que si el cliente se conectaba desde una IP de otro país diferente al que ponía en el contrato (había una base de datos con ese dato), se generara una línea de texto en un archivo de alertas.

Una consulta tipo con *Geobytes* sería:

```
$.getJSON('http://gd.geobytes.com/GetCityDetails?callback=?', function(data) {
  console.log(JSON.stringify(data, null, 2));
});
```


### Ejercicio 7. Buscar información sobre métodos y herramientas para implementar GSLB.

Para realizar GLSB podemos usar el servicio de Amazon: [AWS Route53](https://aws.amazon.com/es/route53/). Amazon Route 53 es un servicio de DNS (sistema de nombres de dominio) web escalable y de alta disponibilidad en la nube. Está diseñado para ofrecer a los desarrolladores y las empresas un método fiable y rentable para redirigir a los usuarios finales a las aplicaciones en Internet mediante la traducción de nombres legibles para las personas como www.ejemplo.com en direcciones IP numéricas como 192.0.2.1 que utilizan los equipos para conectarse entre ellos. Amazon Route 53 también cumple con IPv6.

También podemos hacerlo con Google con su tecnología [Cloud DNS](https://cloud.google.com/dns/). Google Cloud DNS es un servicio escalable, fiable y administrado de sistemas de nombres de dominio (DNS) acreditados con la misma infraestructura que Google. Su baja latencia y alta disponibilidad lo convierten en una opción económica a la hora de ofrecer aplicaciones y servicios a tus usuarios. Con Cloud DNS, puedes convertir solicitudes de nombres de dominios como www.google.com en direcciones IP como 74.125.29.101. Además, Cloud DNS es programable: puedes publicar y administrar millones de zonas y registros DNS a través de su sencilla interfaz de usuario, su interfaz de línea de comandos o su API. 


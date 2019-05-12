# Ejercicios voluntarios Tema 6: Asegurar el sistema web

### Ejercicio 1. Aplicar con iptables una política de denegar todo el tráfico en una de las máquinas de prácticas. Comprobar el funcionamiento.

Hemos realizado un script para rechazar todo el trafico y dejar habilitado el tráfico de ssh para no quedarnos sin conexión remota a la máquina virtual:

```
iptables -P OUTPUT DROP 	# Rechazamos el trafico saliente
iptables -P INPUT DROP		# Rechazamos el trafico entrante
iptables -P FORWARD DROP


# Habilitamos las conexiones del bucle local
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT


# Habilitamos las conexiones por el puerto 22 para el tráfico SSH - SCP - RSYNC
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
```

Y ahora intentamos alguna conexión entrante o saliente. Podemos ver en la siguiente captura como es incapaz de conectarse para actualizar o a la sede de la UGR:

![](images/t6/rechazar.png)



### Ejercicio 2. Aplicar con iptables una política de permitir todo el tráfico en una de las máquinas de prácticas. Comprobar el funcionamiento.
Para permitir todo el tráfico nos basta con ejecutar:

```
sudo iptables -P INPUT ACCEPT && sudo iptables -P OUTPUT ACCEPT && sudo iptables -P FORWARD ACCEPT  && sudo iptables -F
```

Podemos ver que todo el tráfico está abierto con:

```
sudo iptables -L
```

![](images/t6/aceptar.png)



### Ejercicio 3. Comprobar qué puertos tienen abiertos nuestras máquinas, su estado, y qué programa o demonio lo ocupa.

Ejecutamos la siguiente orden para comprobar qué puertos están abiertos para escuchar y qué programas o demonios lo tiene ocupado:
```
sudo netstat -tlpn | grep ESCUCHAR
```
![](images/t6/puertosAbiertos.png)


### Ejercicio 4. Buscar información acerca de los tipos de ataques más comunes en servidores web (p.ej. secuestros de sesión). Detallar en qué consisten, y cómo se pueden evitar.
1. Ataque DDoS. En un ataque de denegación de servicio (DoS), un atacante intenta evitar la legitimidad de que los usuarios accedan a información o al servicios. El tipo más común y obvio de ataque DoS ocurre cuando un atacante "inunda" una red con información. Cuando escribimos una URL de un sitio web en particular en nuetro navegador, estamos enviando una solicitud al servidor web del sitio para poder ver la página en concreto. El servidor solo puede procesar una cierta cantidad de solicitudes de una vez, por lo que si un atacante sobrecarga el servidor con solicitudes, no puede procesarse dicha solicitud. Esto es una "denegación de servicio" ya que no se puede acceder al sitio.
2. Ping Flood. Ping flood se basa en enviar a la víctima una cantidad abrumadora de paquetes ping, usualmente usando el comando "ping" de UNIX como hosts (el indicador -t en los sistemas Windows tiene una función mucho menos maligna). Es muy simple de lanzar, el requisito principal es tener acceso a un ancho de banda mayor que la víctima.
3. Ping de la muerte. El atacante envía un paquete ICMP de más de 65.536 bytes. Como el sistema operativo no sabe cómo manejar un paquete tan grande, se congela o se cuelga en el momento de volver a montarlo. Hoy en día, el sistema operativo descarta dichos paquetes por sí mismo.
4. Escaneo de puertos. Esencialmente, un escaneo de puertos consiste en enviar un mensaje a cada puerto, uno a uno. El tipo de respuesta recibida indica si el puerto está a la escucha y, por lo tanto, puede probarse más detalladamente para detectar debilidad.
5. ARP Spoofing. ARP Poison Routing (APR), es una técnica utilizada para atacar una red cableada o inalámbrica de Ethernet. ARP Spoofing puede permitir que un atacante detecte frameworks de datos en una red de área local (LAN), modifique el tráfico o detenga el tráfico por completo. El ataque solo se puede usar en redes que realmente usan ARP y no en otro método de resolución de direcciones.
6. ACK flood. Esta es una técnica para enviar un paquete TCP / ACK al objetivo a menudo con una dirección IP falsificada. Es muy similar a los ataques de inundación TCP / SYN.
7. Ataque FTP Bounce. El atacante puede conectarse a los servidores FTP y tiener la intención de enviar archivos a otros usuarios / máquinas que usan el comando PORT. Para que el servidor FTP intente enviar el archivo a otras máquinas en un puerto específico y verifique que el puerto esté abierto.
8. TCP Session Hijacking. Es el caso cuando el "Hacker" toma la sesión TCP existente, ya establecido entre las dos partes. En la mayoría de las sesión TCP la autenticación ocurre al comienzo de la sesión, los piratas informáticos realizan este ataque en dicho momento.
9. Ataque Man-In-The-Middle. Un ataque MITM ocurre cuando una comunicación entre dos sistemas es interceptada por una entidad externa. Esto puede suceder en cualquier forma de comunicación en línea, como correo electrónico, redes sociales, navegación web, etc. No solo están tratando de escuchar nuestras conversaciones privadas, sino que también pueden dirigir toda la información dentro de los dispositivos.
10. Ataque Ingenieria Social. La ingeniería social es el arte de manipular a las personas para que renuncien a la información confidencial. Los tipos de información que buscan estos delincuentes pueden variar, pero cuando los individuos son blanco, los delincuentes generalmente intentan engañarlo para que le dé su contraseña o información bancaria, o acceda a su pc para instalar en secreto el software malicioso, que le dará acceso a su contraseñas e información bancaria, así como para darles control sobre el mismo.
11. KeyLoggers. Un keylogger puede ser un programa de software o un hardware que utiliza un atacante para registrar las pulsaciones de teclas en el teclado de un usuario. Con un Keylogger, un atacante puede conocer remotamente sus contraseñas, números de tarjetas de crédito / débito, mensajes, correos electrónicos y todo lo que escriba.
12. ICMP Tunneling. El tunneling se usa a menudo para eludir los firewalls que no bloquean los paquetes ICMP, o para establecer un canal de comunicación cifrado y difícil de rastrear entre dos computadoras sin interacción directa de la red. Un túnel ICMP establece una conexión encubierta entre dos computadoras remotas (un cliente y un proxy), utilizando solicitudes de eco ICMP y paquetes de respuesta. 
13. Ataque LOKI. LOKI es un programa cliente / servidor publicado en la publicación en línea Phrack. Este programa es una prueba de concepto que funciona para demostrar que los datos se pueden transmitir de forma secreta a través de una red escondiéndolos en el tráfico que normalmente no contiene cargas útiles.
14. Ataque de secuencia TCP. Un ataque de predicción de secuencia TCP es un intento de predecir el número de secuencia utilizado para identificar los paquetes en una conexión TCP, que se puede usar para duplicar paquetes que conducen al secuestro de la sesión.
15. CAM Table Overflow. La tabla CAM de un conmutador contiene información de red, como las direcciones MAC disponibles en los puertos físicos del conmutador y los parámetros de VLAN asociados. Los desbordamientos de la tabla CAM ocurren cuando una entrada de direcciones MAC se inunda en la tabla y se alcanza el umbral de la tabla CAM. Esto hace que el conmutador actúe como un concentrador, inundando la red con tráfico fuera de todos los puertos. La inundación causada por un desbordamiento de tabla CAM está limitada a la VLAN de origen, por lo tanto, no afecta a otras VLAN en la red.
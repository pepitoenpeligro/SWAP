# Ejercicios voluntarios Tema 5: Medición de prestaciones

### Ejercicio 1. Buscar información sobre cómo calcular el número de conexiones por segundo.


En nginx es muy fácil de hacer porque trae un módulo para realizar métricas sobre las conexiones activas sobre nuestra máquina.

Añadiremos la siguiente directiva sobre el contexto *http* en el archivo de configuración: *nano /etc/nginx/nginx.conf*

```
location /nginx_status {
	stub_status on;
	access_log   off;
	allow 127.0.0.1;
	deny all;
}
```

Reiniciamos el servicio:

```
sudo systemctl restart nginx
```

Y ahora accedemos a *http://127.0.0.1/nginx_status*

Y veremos algo parecido a lo siguiente:

![](images/t5/nginx_status.png)


### Ejercicio 2. Instalar wireshark y observar cómo fluye el tráfico de red en uno de los servidores web mientras se le hacen peticiones HTTP… o en la red de casa


Podemos ver en la siguiente captura la petición del *index.html* a la máquina *10.211.55.12* que es la máquina balanceadora.
![](images/t5/wireshark.png)

También se puede ver cómo hay paquetes ARP para resolver la dirección, que pertenece a la máquina virtual Parallels Desktop.



### Ejercicio 3. Buscar información sobre características, funcionalidad,disponibilidad para diversos SO, etc de herramientas para monitorizar las prestaciones de un servidor.Para empezar, podemos comenzar utilizando las clásicas de Linux:top,vmstat,netstat

1. top. Es un comando para linux que viene incluído por defecto en la mayoría de las distribuciones, fundamental para todo administrador de ti o sistemas, porque con estas tres letras podemos chequear el funcionamiento del equipo en una simple pantalla y ver que esta pasando, por eso la idea de esta publicación es simplemente explicar que es cada parte que muestra el comando sobre todo pensado para los que recién se inician.
2. vmstat. Da  información  sobre  procesos,  memoria,  paginación, E/S de bloque, trampas, y actividad de la CPU. El primer informe producido da medias  desde  el  último  arranque. Los  adicionales  dan información  en  un  período  de  muestreo  de  longitud interválico. En cualquier caso los informes de proceso y memoria son instantáneos.
3. netstat. Netstat muestra información de los subsistemas de red en Linux. Se  puede  ver  el  estado  de  las  conexiones  de red al listar los conectores (sockets) abiertos. Esta es la operación por  defecto:  si  no  se  especifica  ninguna  familia  de direcciones,  se  mostrarán  los conectores activos para todas las familias de direcciones configuradas. Con -e se puede obtener  información  adicional  (userid,  identificador  de usuario).  Con  el  modificador  -v se consigue que nestat muestre familias de direcciones conocidas no soportadas por el núcleo. La opción -o muestra  información  adicional  sobre los  temporizadores  de red.  -a muestra todos los conectores, incluyendo los conectores a la escucha en el servidor. La familia de direcciones inet mostrará los conectores de  tipo raw, udp y tcp.
4. Dstat es una herramienta de estadística de recursos versátil. Esta herramienta combina la capacidad de iostat, vmstat, netstat e ifstat. Dstat nos permite monitorear los recursos del sistema en tiempo real. Cuando necesite recopilar esa información en tiempo real, dstat se ajustará a sus necesidades. Dstat nos permite poder ver todos los recursos del sistema en tiempo real, nos brinda información detallada de todo el sistema en columnas, por ejemplo, podemos ver el espacio de disco en combinación con las interrupciones del controlador IDE.
5. Ntop. ntop (de Network Top) es una herramienta que permite monitorizar en tiempo real una red. Es útil para controlar los usuarios y aplicaciones que están consumiendo recursos de red en un instante concreto y para ayudarnos a detectar malas configuraciones de algún equipo, (facilitando la tarea ya que, justo al nombre del equipo, aparece sale un banderín amarillo o rojo, dependiendo si es un error leve o grave), o a nivel de servicio. 
6. Iftop. Esta herramienta es un monitor del sistema que nos permite conocer en tiempo real todos los procesos que se están ejecutando en nuestro sistema y pudiendo administrarlos fácilmente. Iftop es una aplicación similar a Top pero especializada en la monitorización de la red, pudiendo conocer así multitud de detalles respecto a la red y todos los procesos que están haciendo uso de ella.
7. Vnstat. Vnstat es un monitor de red que viene incluido, por defecto, en la mayoría de las distribuciones de Linux. Nos permite obtener un control en tiempo real sobre el tráfico enviado y recibido en un período de tiempo, elegido por el usuario.
8. Iptraf. Es una aplicación similar a la anterior Vnstat. Dispone de una pequeña interfaz basada en ncurses que permite configurarla fácilmente.
9. bwm-ng: es más simple que otras herramientas similares, su gran ventaja es que además de funcionar en modo interactivo, permite exportar la salida a un archivo CSV o html.
10. iptraf: al igual que la anterior es un clásico, se caracteriza por su interfaz ncurses desde el que se configura interactivamente. Ampliamente distribuida.
11. ibmonitor: en concepto es parecida a bwm-ng o vnstat, muestra el tráfico total por interfaz, tanto el enviado como el recibido.
12. nload: herramienta interactiva que muestra el consumo acumulado y además dibuja en modo texto gráficas (en ASCII claro).
13. tcptrack: aplicación que muestra el consumo por conexión. No está tan extendida como otras. herramientas similares.
14. ipband: también orientado a obtener datos por conexión. 
15. speedometer: más gráficas en ASCII para ver el tráfico en grandes números, permite obtener estadísticas de velocidad en la red.

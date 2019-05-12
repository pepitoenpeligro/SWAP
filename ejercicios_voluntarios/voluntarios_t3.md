# Ejercicios voluntarios Tema 3: La red de una granja web

### Ejercicio 1. Buscar con qué órdenes de terminal o herramientas gráficas podemos configurar bajo Windows y bajo Linux el enrutamiento del tráfico de un servidor para pasar tráfico de una subred a otra.

1. En Linux
    Debemos activar la opción de IP Forwarding para que los paquetes IP puedan comunicarse entre las interfaces existentes. Para ello editaremos el fichero
    */proc/sys/net/ipv4/ip_forward*/ añadiendole un 1 para indicar que activamos ese servicio.
    Posteriormente es necesario editar el archivo */etc/sysctl.conf* y darle el valor de 1:
    ```
    sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' "/etc/sysctl.conf"
    ```
    Una vez hecho esto, la configuración de IP Forwarding se mantendrá entre los diferentes inicios del sistema. A continuación tnemeos que habilitar el NAT:
    ```
    sudo /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    sudo/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state
   --state RELATED,ESTABLISHED -j ACCEPT
    sudo /sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

    ```
    
2. En Windows.
   Debemos buscar la opción *Servicios de Enrutamiento y Acceso Remoto* dentro de *Servicios de Acceso y Directivas de Redes* y esperar a que Windows aplique los cambios. Luego debemos de habilitar la opción *Traducción de direcciones de red NAT* y seleccionar la interfaz de red que queremos que sea la puerta de enlace *gateway*. El resto es configurar la ip, máscara de subred y DNS que queremos asociar. Podemos ver más información en la [documentación de Microsoft](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770798(v=ws.10))



### Ejercicio 2.  Buscar con qué órdenes de terminal o herramientas gráficas podemos configurar bajo Windows y bajo Linux el filtrado y bloqueo de paqutes.

1. En Windows. En la plataforma de Microsoft tenemos el firewall de Windows Defender. Para ello debemos de buscar *Firewall y protección de Red* y seleccionar sobre *Firewall de Windows Defender* para que nos salgan las opciones de configuración del Firewall y por tanto permitir el bloqueo de paquetes.
2. En Linux. Dentro de las distribuciones UNIX poseemos la herramienta iptables, siendo tan simple de bloquear paquetes como sigue:
```
iptables -A INPUT -s X.X.X.X -j DROP
service iptables save
```
3. (Adicional) En OS X. Para bloquear paquetes podemos hacer uso de la herramienta  *ipfw*:
```
ipfw add 100 fwd 127.0.0.1,8000 tcp from any to 192.168.99.100 80
```
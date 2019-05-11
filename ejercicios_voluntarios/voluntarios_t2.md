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
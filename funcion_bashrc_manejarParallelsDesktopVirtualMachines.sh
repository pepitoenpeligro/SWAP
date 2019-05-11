function swap(){
        M1IP=10.211.55.9
        M2IP=10.211.55.10
        M3IP=10.211.55.12


        help(){
            echo "Ayuda...\n\n"
	    	echo "swap <startall/stop/suspend/status>"
	    	echo "swap startall: 	inicia las maquinas virtuales sin interfaz grafica"
		    echo "swap stop:  	apaga las maquinas virtuales"
		    echo "swap suspend:	suspende las maquinas virtuales respetando el estado actual de cada maquin"
		

            echo "swap start mN"
            echo "swap start m1:	inicia la maquina virtual 1"
            echo "swap start m2:	inicia la maquina virtual 2"
            echo "swap start m3:	inicia la maquina virtual 3"

            
            echo "swap <{m1,m2,m3}> <curl/ip/ssh>"
            echo "swap mN curl:	realizar una peticion http a la maquina N"
            echo "swap mN ip:	devuelve la direccion IP de la maquina N"
            echo "swap mN ssh:	conecta por ssh a la maquina N"
        }

    if [ "$1" = 'help' ] ;then
            help
    fi
	
	if [ "$1" = 'suspend' ]; then
		echo "Suspendiendo la maquina 1"
		prlctl suspend u1
		echo "\nSuspendiendo la maquina 2"
		prlctl suspend u2
		echo "\nSuspendiendo la maquina 3"
		prlctl suspend u3
	fi

	if [ "$1" = 'stop' ]; then
		prlctl stop u1
                prlctl stop u2
                prlctl stop u3
		osascript -e 'quit app "Parallels Desktop"'
	fi

	if [ "$1" = 'status' ]; then
		echo "Maquina 1: "; ps aux -o pid,state,command | grep '[p]rl_vm_app --openvm /Users/pepe/Parallels/u1.pvm' | awk '{ print "Usuario: " $1 "\t", "Pid: " $2 "\t", "Estado: " $13 "\n\n" }'
		echo "Maquina 2: "; ps aux -o pid,state,command | grep '[p]rl_vm_app --openvm /Users/pepe/Parallels/u2.pvm' | awk '{ print "Usuario: " $1 "\t", "Pid: " $2 "\t", "Estado: " $13 "\n\n" }'
		echo "Maquina 3: "; ps aux -o pid,state,command | grep '[p]rl_vm_app --openvm /Users/pepe/Parallels/u3.pvm' | awk '{ print "Usuario: " $1 "\t", "Pid: " $2 "\t", "Estado: " $13 "\n\n" }'
	fi

	if [ "$1" = 'startall' ]; then
		echo "Iniciando la maquina 1"
		prlctl start u1
		echo "\nIniciando la maquina 2"
		prlctl start u2
		echo "\nIniciando la maquina 3"
		prlctl start u3
		#osascript -e 'quit app "Parallels Desktop"'
	fi

	if [ "$1" = 'start' ]; then
		if [ "$2"  = 'm1' ]; then 
			prlctl start u1
		fi
		if [ "$2"  = 'm2' ]; then
			 prlctl start u2
		fi
		if [ "$2"  = 'm3' ]; then
			prlctl start u3
		fi
	fi

        # Maquina 1
        if [ "$1" = 'm1' ]; then

            if [ "$2" = 'curl' ]; then
                date '+%Y-%m-%d %H:%M:%S';
                curl $M1IP
            fi


            if [ "$2" = 'ip' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                echo $M1IP
            fi

            if [ "$2" = 'ssh' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                ssh $M1IP
            fi
        fi


        # Maquina 2
        if [ "$1" = 'm2' ]; then

            if [ "$2" = 'curl' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                curl $M2IP
            fi


            if [ "$2" = 'ip' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                echo $M2IP
            fi

            if [ "$2" = 'ssh' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                ssh $M2IP
            fi
        fi

        # Maquina 3
        if [ "$1" = 'm3' ]; then

            if [ "$2" = 'curl' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                curl $M3IP
            fi


            if [ "$2" = 'ip' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                echo $M3IP
            fi

            if [ "$2" = 'ssh' ]; then
                date '+%Y-%m-%d %H:%M:%S'
                ssh $M3IP
            fi
        fi



}

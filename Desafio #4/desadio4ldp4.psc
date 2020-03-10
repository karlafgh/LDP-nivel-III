Subproceso mostrarMensaje (mensaje)
	mostrar mensaje
FinSubProceso

subproceso encontrarSucursal (nombre)
	definir nombreA como caracter
	Borrar Pantalla
	mostrar "Ingrese el nombre de la sucursal a buscar"
	leer nombreA
	
	si nombre[1]=nombreA Entonces
		Esperar 1 segundo
		mostrar ""
		mostrar "<" nombreA "> ya ha sido registrado en el sistema."
	SiNo
		esperar 1 Segundo
		mostrar ""
		mostrar "La sucursal <" nombreA "> no ha sido registrado anteriormente."
	FinSi
FinSubProceso

//para calcular el promedio.
Funcion promedio <- calcularPromedioSucursal(acumuladorVentas)
	promedio=acumuladorVentas/10
FinFuncion

//para saber cuales sucursales no superan el promedio.
Subproceso contarNoSuperan (ventas_t,promedio,acumuladorVentas,sNoSuperaron Por Referencia)
	promedio= calcularPromedioSucursal(acumuladorVentas)
	sNoSuperaron=0
	
	para i=1 hasta 10
		si ventas_t[i]<promedio entonces
			sNoSuperaron=sNoSuperaron+1
		FinSi
	FinPara
FinSubProceso

//para sacar el porcentaje de las sucursales que no superaron el promedio.
Funcion porc_no_superaron <- calcularPorcebntaje(sNoSuperaron)
	porc_no_superaron=sNoSuperaron/10*100
FinFuncion

//se guarda el nombre de las sucursales que superan el promedio.
SubProceso verificarSuperadas (ventas_t, promedio,nombre, nombresSupera por referencia)
	para i=1 hasta 10
		si ventas_t[i]>promedio entonces
			nombreSupera= nombre[i]+", "+nombre[i]
		FinSi
	FinPara
	mostrar "Sucursales cuyos montos de ventas fueron mayor al promedio: " nombreSupera
FinSubProceso

//modulo para imprimir ciertas salidas.
SubProceso mostrarResultados (montoMayor, nombreMontoMayor, montoMenor, nombreMontoMenor)
	mostrar "Monto mayor: " montoMayor "$ y fue obtenido por la sucursal <" nombreMontoMayor ">"
	mostrar "Monto menor: " montoMenor  "$ y fue obtenido por la sucursal <" nombreMontoMenor ">"
FinSubProceso

Algoritmo desafio4ldp3
	Dimension ventas_t[10]
	Dimension nombre[10]
	definir mensaje, mensaje2, mensaje3, mensaje4, nombreMontoMayor, nombreMontoMenor, answer como caracter
	definir ventas_t, acumuladorVentas, montoMayor, montoMenor Como Real
	mensaje="¡Buenos días!"
	mensaje2="¿Desea encontrar alguna sucursal (S) Si / (N) No?"
	mensaje3="Presione una tecla para ver los resultados de la semana."
	mensaje4="Porcentaje de sucursales que no superaron el promedio de ventas: "
	
	acumuladorVentas=0
	montoMayor=0
	montoMenor=1000000
	
	mostrarMensaje(mensaje)
	Para i=1 hasta 10
		mostrar "Ingrese el nombre de la sucursal " i "/10"
		leer nombre[i]
		mostrar "Por favor ingrese las ventas totales de <" nombre[i] ">"
		leer ventas_t[i]
		acumuladorVentas = acumuladorVentas + ventas_t[i]
		
		si ventas_t[i]>montoMayor entonces
			montoMayor=ventas_t[i]
			nombreMontoMayor=nombre[i]
		SiNo
			si ventas_t[i]<montoMenor entonces
				montoMenor=ventas_t[i]
				nombreMontoMenor=nombre[i]
			FinSi
		FinSi
		mostrar ""
	FinPara
	
	//llamado de los modulos.
	promedio <- calcularPromedioSucursal(acumuladorVentas)
	contarNoSuperan(ventas_t,promedio,acumuladorVentas,sNoSuperaron)
	porc_no_superaron <- calcularPorcebntaje(sNoSuperaron)
	
	Borrar Pantalla
	//se le pregunta al usuario si se desea encontrar una sucursal.
	Repetir
		mostrarMensaje(mensaje2)
		leer answer
		answer=Mayusculas(answer)
		
		si ~(answer="S" o answer="N")
			mostrar "¡Error! debes ingresar S o N"
		FinSi
	Hasta Que answer="S" o answer="N"
	
	segun answer
		"S":encontrarSucursal(nombre)
			mostrar ""
			mostrarMensaje(mensaje3)
			esperar tecla
			Borrar Pantalla
			mostrarResultados(montoMayor, nombreMontoMayor, montoMenor, nombreMontoMenor)
			verificarSuperadas(ventas_t, promedio,nombre, nombresSupera)
			mostrar mensaje4 calcularPorcebntaje(sNoSuperaron) "%"
			
		"N":mostrarMensaje(mensaje3)
			esperar tecla
			Borrar Pantalla
			mostrarResultados(montoMayor, nombreMontoMayor, montoMenor, nombreMontoMenor)
			verificarSuperadas(ventas_t, promedio,nombre, nombresSupera)
			mostrar mensaje4 calcularPorcebntaje(sNoSuperaron) "%"
	FinSegun
FinAlgoritmo

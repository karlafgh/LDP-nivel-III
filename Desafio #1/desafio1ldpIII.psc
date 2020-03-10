SubProceso capturarNombres(nombreSucursal Por Referencia)
	Para i=1 hasta 4
		mostrar "Ingrese el nombre de la sucursal #" i
		leer nombre
		nombreSucursal[i]=nombre
	FinPara
	borrar pantalla
FinSubProceso

SubProceso obtenerVentasTotales (ventasT por referencia)
	Para i=1 hasta 4
		mostrar "Ingrese el total de ventas de la sucursal #" i
		leer ventas
		ventasT[i]=venta
	FinPara
	borrar pantalla
FinSubProceso

SubProceso ingresarNombreyVentas(nombre, venta)
	capturarNombres(nombre)
	obtenerVentasTotales(venta)
FinSubProceso

Subproceso calcularPromedio(ventasT, promedio por referencia)
	para i=1 hasta 4
		promedio=promedio+ventasT[i]
	FinPara
	promedio=promedio/4
FinSubProceso

Subproceso verificarSiSeSuperaPromedio (promedio, ventasT, calculo por referencia)
	calculo= Falso
	
	Para i=1 hasta 4
		Si ventasT[i]>promedio
			calculo= verdadero
		FinSi
	FinPara
	
	mostrar "El promedio fue de: " promedio
	mostrar ""
Fin subproceso
	
Subproceso mostrarSiSupera(verificado)
	si calculo 
		mostrar "Si hay una sucursal que superó el promedio."
	SiNo
		mostrar "Ninguna de las sucursales superó el promedio."
	FinSi
FinSubProceso

Algoritmo Farmapatodo
	Dimension nombreSucursal[4]
	Dimension ventasT[4]
	
	Definir nombre, venta Como Caracter
	definir promedio como entero
	definir verificado como logico
	
	ingresarNombreyVentas(nombre,venta)
	calcularPromedio(ventasT,promedio)
	verificarSiSeSuperaPromedio(promedio, ventasT, verificado)
	mostrarSiSupera(verificado)
FinAlgoritmo

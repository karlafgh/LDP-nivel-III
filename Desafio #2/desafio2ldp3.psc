SubProceso obtenerDatos(nombre Por Referencia, cedula Por Referencia, sexo Por Referencia)
	Para i=1 hasta 15
		mostrar "Ingresar nombre del estudiante #" i
		leer nombre[i]
		mostrar "Ingresar el ID del estudiante #" i
		leer cedula[i]
		Repetir
			mostrar "Indicar el sexo (M/F) del estudiante #" i
			leer sexo[i]
			sexo[i]=mayusculas(sexo[i])
			mostrar "¡Error!"
			mostrar "Ud. debe ingresar [F]emenino o [M]asculino"
			mostrar ""
		Hasta Que sexo[i]="F" o sexo[i]="M"
		borrar pantalla
	FinPara
FinSubProceso

SubProceso mostrarMensaje (mensaje)
	Mostrar mensaje
FinSubProceso

SubAlgoritmo mostrarDatos (nombre,cedula,sexo)
	Limpiar Pantalla
	para i=1 hasta 15 hacer
		Mostrar "El nombre del " i "° estudiante: " nombre[i]
		mostrar "ID del " i "° estudiante es: " cedula[i]
		mostrar "El sexo del " i "° estudiante es: " sexo[i]
		mostrar ""
	FinPara
FinSubAlgoritmo

Algoritmo desafio2_LDP3
	definir mensaje, mensaje2 como caracter
	definir opc_menu como entero
	Dimension nombre[15]
	Dimension cedula[15]
	Dimension sexo[15]
	mensaje="Por favor ingresa las calificaciones del alumno"
	mensaje2="A continuación se mostrara el listado de los alumnos, sus notas y el promedio de la sección..."
	
	repetir 
		mostrar "Bienvenido al menu de control de estudiantes de CADIF1"
		mostrar "Seleccione una opción para continuar..."
		mostrar ""
		mostrar "1 - Ingresar datos."
		mostrar "2 - Mostrar los datos de los alumnos de dicha seccion."
		mostrar "3 - Registrar las notas de un alumno."
		mostrar "4 - Mostrar el listado de los alumnos sus notas y el promedio de la seccion."
		mostrar "5 - Salir."
		leer opc_menu
		borrar pantalla
		
		segun opc_menu
			1: obtenerDatos(nombre,cedula,sexo)
				mostrar ""
				Mostrar "Para volver al menu presione una tecla."
				Esperar Tecla
				Limpiar Pantalla
				
			2: mostrarDatos(nombre,cedula,sexo)
				Mostrar "Para volver al menu presione una tecla."
				mostrar ""
				Esperar Tecla
				Limpiar Pantalla
				
			3: mostrarMensaje(mensaje)
				mostrar ""
				Mostrar "Para volver al menu presione una tecla."
				Esperar Tecla
				Limpiar Pantalla
				
			4: mostrarMensaje(mensaje2)
				mostrar ""
				Mostrar "Para volver al menu presione una tecla."
				Esperar Tecla
				Limpiar Pantalla
				
			5: mostrar "Usted seleccionó la opcion <Salir>"
				mostrar "¡Hasta pronto!"
				
			De Otro Modo:
				mostrar "¡Ups!"
				mostrar "Me temo que has ingresado una opción que no está dentro de los parámetros."
				mostrar ""
				mostrar "Presiona una tecla para volver al menu principal"
				esperar tecla
				borrar pantalla
		FinSegun
	Hasta Que opc_menu=5
FinAlgoritmo

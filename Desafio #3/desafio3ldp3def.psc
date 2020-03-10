SubProceso mostrarMensaje (mensaje)
	mostrar mensaje
FinSubProceso

Funcion porc_aprob= func_Calc_estudiantes_a(estudiantesA)
	porc_aprob=(estudiantesA/12)*100
FinFuncion

Funcion promedioR= calcularPromedioR(notas_R, estudiantesR)
	promedioR=notas_R/estudiantesR
FinFuncion

Algoritmo menu_de_estudiante
	definir nombre, nom_MayNota, nom_MenNota, mensaje como caracter
	definir nota, opc como entero
	mensaje="Dentro de breve le mostraremos la información solicitada..."
	
	estudiantesA= 0
	estudiantesR=0
	notaA=0 
	notaR=0
	menorNota=100.1
	mayorNota=0
	
	Repetir
		mostrar "Bienvenido al menu de control de estudiantes de CADI F1"
		mostrar "Por favor ingresar una de las opciones para continuar..."
		mostrar ""
		mostrar "(1) Ingresar datos"
		mostrar "(2) Mostrar los datos de los alumnos de dicha seccion"
		mostrar "(3) Registrar las notas de un alumno" 
		mostrar "(4) Mostrar los calculos estadísticos"
		mostrar "(5) Salir"
		mostrar "" Sin Saltar
		leer opc
		esperar 1 segundo 
		Borrar Pantalla
		
		Segun opc hacer
			1: mostrarMensaje(mensaje)
				mostrar ""
				mostrar "Para volver al menu principal presione una tecla"
				esperar tecla
				borrar pantalla
				
			2: mostrarMensaje(mensaje)
				mostrar ""
				mostrar "Para volver al menu principal presione una tecla"
				esperar tecla
				borrar pantalla
				
			3: Para i=1 hasta 12 hacer
					mostrar "Ingrese el nombre del estudiante #" i
					leer nombre
					repetir
						mostrar "Ingrese la calificación del estudiante #" i
						leer nota
						si nota<0 o nota>100
							mostrar ""
							mostrar "Ud. ha ingresado una nota que no está entre 0 y 100 ptos."
						FinSi
					hasta que nota>0 y nota<=100
					
					si nota>=60 entonces
						notas_A=notas_A+nota
						estudiantesA= estudiantesA+1
					sino
						si nota<=59 entonces
							notas_R=notas_R+nota
							estudiantesR= estudiantesR+1
						FinSi
					FinSi
					
					Si nota=mayorNota entonces
						nom_MayNota=nom_MayNota+", "+Mayusculas(Nombre)
					FinSi
					
					Si nota>mayorNota entonces
						mayorNota=nota
						nom_MayNota=Mayusculas(Nombre)
					FinSi
					
					Si nota=menorNota entonces
						nom_MenNota=nom_MenNota+","+Mayusculas(Nombre)
					FinSi
					
					Si nota<menorNota
						entonces 
						menorNota=nota
						nom_MenNota=Mayusculas(Nombre)
					FinSi
					mostrar ""
				FinPara
				mostrar ""
				mostrar "Para volver al menu principal presione una tecla"
				esperar tecla
				borrar pantalla
				
			4: 	mostrar "Número de estudiantes aprobados: " estudiantesA
				mostrar "Número de estudiantes aplazados: " estudiantesR
				mostrar ""
				Mostrar "El porcentaje de los alumnos aprobados es: " Func_Calc_estudiantes_a(estudiantesA) " %"
				Mostrar "El promedio de notas entre los estudiantes reprobados: " calcularPromedioR(notas_R, estudiantesR)
				mostrar ""
				Mostrar mayorNota " es la mayor nota y fue obtenida por " nom_MayNota
				Mostrar menorNota " es la menor nota y fue obtenida por " nom_MenNota
				mostrar ""
				mostrar "Para volver al menu principal presione una tecla"
				esperar tecla
				borrar pantalla
				
			5: mostrar "Usted ha seleccionado la opcion <Salir>."
				mostrar ""
				mostrar "Hasta pronto, que tenga un feliz día."
				
			De Otro Modo:
				mostrar "¡Error!..."
				mostrar "Debe seleccionar una opcion correcta para poder continuar."
				mostrar "" 
				mostrar "Presione una tecla para volver al menu principal"
				esperar tecla
				borrar pantalla
		FinSegun
	Hasta que opc=5
FinAlgoritmo

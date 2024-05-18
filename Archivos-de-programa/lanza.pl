#!/usr/bin/perl
#**************************************************************
#         		Pontificia Universidad Javeriana
#     Autor: J. Corredor
#     Fecha: Febrero 2024
#     Materia: Sistemas Operativos
#     Tema: Taller de Evaluación de Rendimiento
#     Fichero: script automatización ejecución por lotes 
#****************************************************************/

# Definir la ruta actual y eliminar cualquier carácter de nueva línea al final
$Path = `pwd`;
chomp($Path);

# Nombre del ejecutable que se va a utilizar
@Nombre_Ejecutable = ("MM_clasico","MM_transpuesta");
# Tamaños de matriz para los cuales se ejecutará el programa
@Size_Matriz = ("200","1000","2000","4000");
# Números de hilos para los cuales se ejecutará el programa
@Num_Hilos = (1,2,4,6,8);
# Número de repeticiones para cada configuración
$Repeticiones = 30;

# Bucle para iterar sobre los diferentes tamaños de matriz y números de hilos
foreach $nombre (@Nombre_Ejecutable){
	foreach $size (@Size_Matriz){
	foreach $hilo (@Num_Hilos) {
  # Construir el nombre del archivo de datos
		$file = "$Path/$nombre-".$size."-Hilos-".$hilo.".dat";
    # Bucle para ejecutar el programa y guardar los resultados en el archivo de datos
		for ($i=0; $i<$Repeticiones; $i++) {
    # Ejecutar el programa y redirigir la salida al archivo de datos
    # Comentado para imprimir la ruta del ejecutable y los argumentos en su lugar
      system("$Path/$nombre $size $hilo  >> $file");
			printf("$Path/$nombre $size $hilo \n");
		}
    # Cerrar el archivo de datos
		close($file);
  # Incrementar la variable $p
	$p=$p+1;
	}
}
}


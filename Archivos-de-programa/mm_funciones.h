/***************************************************************
	 Pontificia Universidad Javeriana
	 Autor: J. Corredor
	 Fecha: Febrero 2024
	 Materia: Sistemas Operativos
	 Tema: Taller de Evaluación de Rendimiento
	 Fichero: fuente de multiplicación de matrices NxN por hilos.
	 Objetivo: Evaluar el tiempo de ejecución del 
						 algoritmo clásico de multiplicación de matrices.
						 Se implementa con la Biblioteca POSIX Pthreads
***************************************************************/
#ifndef MM_CLASICO_H
#define MM_CLASICO_H

#include <pthread.h>
#include <time.h>
#include <sys/time.h>

#define DATA_SIZE (1024*1024*64*3) 

extern pthread_mutex_t MM_mutex;
extern double *mA, *mB, *mC;

struct parametros{
		int nH;
		int idH;
		int N;
};

extern struct timeval start, stop; 

// Funcion para llenar las matrices
void llenar_matriz(int SZ);

// Funcion para imprimir una matriz
void print_matrix(int sz, double *matriz);

// Funcion para iniciar a contar el tiempo
void inicial_tiempo();

// Funcion para finalizar de contar el timepo y calcular el tiempo transcurrido
void final_tiempo();

// Funcion para multiplicar dos matrices
void *mult_thread(void *variables);

#endif

#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    // Funcion que se ejecutara en el hilo
    printf("Thread created\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t tid;

    pid = fork();
    if (pid == 0) { // Proceso hijo
        fork(); // Se crea un proceso hijo adicional
        pthread_create(&tid, NULL, thread_function, NULL); // Se crea un hilo
    }

    fork(); 
    int unique_processes = 7;


    int unique_threads = 1;

    printf("Numero de procesos unicos creados: %d\n", unique_processes);
    printf("Numero de hilos unicos creados: %d\n", unique_threads);

    return 0;
}

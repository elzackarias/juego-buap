#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#define getch() system("read -n1 -p ' ' key")
struct bitacora {
    int destruidos, vidas, balas, objetosCap;
};
main(){
	int menu();
	void nivel(int, int, int, struct bitacora*);
	int dist, vel, opcion, sigNivel =1, indice=0;
	struct bitacora *puntaje = NULL;
	do{
		if(sigNivel == 1){
			opcion = menu();	
		}else
			opcion = sigNivel;
		indice = opcion - 1;  // Damos un indice para indicar en que espacio de memoria estamos (en el nivel que se haya seleccionado (1,2,3) - 1)
		if (sigNivel == 1 && opcion != 4) {
            puntaje = (struct bitacora *)calloc(opcion, sizeof(struct bitacora));  // Damos memoria dinamica segun el nivel escogido por el usuario
            puntaje[indice].vidas = 2000;                                          // Asignamos al nivel que se va a cursar la vida establecida
            puntaje[indice].balas = 10000;                                         // Asignamos al nivel que se va a cursar las balas establecidas
        }
        nivel(opcion, sigNivel, indice, puntaje);
	}while(opcion != 5);
}

int menu(){
	int i, band, num;
	char resp[2];
	printf(" ______                  _____   _     _ _       \n|  ___ \\                (____ \\ | |   | | |      \n| | _ | | ____  ____ ___ _   \\ \\| |__ | | |      \n| || || |/ _  |/ ___)___) |   | |  __)| | |      \n| || || ( ( | | |  |___ | |__/ /| |   | | |_____ \n|_||_||_|\\_||_|_|  (___/|_____/ |_|   |_|_______)\n");
    printf("Bienvenido al juego 'Transportando plantas a marte\n'");
    printf("En el juego transportaras plantas a marte enfrentandote a todo tipo de cosas\n");
    printf("\t**DISFRUTA EL JUEGO**\n");
    printf("\033[0;37mSelecciona una de las siguientes opciones:\n");
    for (i = 1; i < 4; i++)	
		 printf("%d - Nivel %d\n", i, i);
    printf("4 - Puntuaciones\n");
    printf("5 - Salir\n");
    do {                                 // Se valida la respuesta del usuario
        scanf("%s", resp);               // Leemos como caracter
        num = atoi(resp);
        if (num >= 1 && num <= 4)  // Damos un rango de opciones validas
            return num;
        else {
            printf("Selecciona un numero del 1 al 4:\n");
            band = 0;  // Asignamos a la bandera 0 para seguir en el ciclo
        }
    } while (band == 0);	
}

nivel(int opcion, int sigNivel, int indice, struct bitacora* puntero){
	int iniciando(int);
	void recorrido(int);
	switch(opcion){	
			case 1:
			case 2:
			case 3:
				peligrosGen = iniciando(opcion);
				recorrido(peligrosGen);
				break;
		
			case 4:
				
			case 5:
				printf("Cerrando el juego, esperamos que hayas disfrutado jugando! :)\n");
                printf("Pulse cualquier tecla para continuar . . .");
                getch();
                break;
		}
}

int iniciando(int control){
	int temp;
	const char *peligros[] = {"planetas", "meteoros", "hoyos negros"};
	printf("Iniciando nivel %d...\n", control);
    sleep(3);
    printf("/-----------------------------------------------/\n");
    printf("/**NIVEL %d:**\n", control);  // Nivel
    printf("/-----------------------------------------------/\n");
    switch(control){
    	case 1: 
    		temp = rand()%3 + 4;break;
    	case 2:
    		temp = rand() % 5 + 7;break;  // Generando de 7 a 11 meteoros
    	case 3:
    		temp = rand() % 4 + 12;break;  // Generando de 12 a 15 agujeros negros
	}
    printf("Se generaron %d %s, de los cuales algunos son muy peligros\n", temp, peligros[control - 1]);
    sleep(3);
	return temp;          
}

int recorrido(int peligrosGen){
	void imprimirBitacoraViaje();
	void encontrastePeligro();
	int condiciones();
	void lejos();
	void destruir();
	void validarEntrada();
	void esquivado();
	int perdiste();
	void validarVida();
	void objetos();
	void nivelPasado();
	int peligrosGen;
	for (cont = 1; cont <= peligrosGen; cont++) {
		validarVida();
	}
}


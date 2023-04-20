#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ncurses.h>
#include <unistd.h>
#define getch() system("read -n1 -p ' ' key")
//#include<conio.h>
struct datos {
    int dist;
    int vel;
};
struct bitacora {
    int destruidos, vidas, balas, objetosCap;
};
int main() {
    const char *obj[] = {"Satelite", "Propulsor obsoleto", "Parte de nave abandonada", "Traje Espacial", "Objeto raro", "Jet Propulsor", "Armamento oxidado"};
    int cont, i, aleat1, peligrosGen, band1 = 0, vidaP = 0, opcion = 0, control = 0, perder = 0, sigNivel = 1, indice=0;
    struct datos peligro;
    struct bitacora *puntaje = NULL; //Inicializamos en NULL
    char resp[2];
    srand(time(NULL));
    do {
        if (sigNivel == 1) {
        	printf("\033[0;37mSelecciona una de las siguientes opciones:\n");
            for (i = 1; i < 4; i++)
                printf("%d - Nivel %d\n", i, i);
            printf("4 - Salir\n");
            do {                                 // Se valida la respuesta del usuario
                scanf("%s", resp);              // Leemos como caracter
                opcion = atoi(resp);             // Asignamos a opcion el numero ASCII al caracter que escribio el usuario o damos el numero (en entero) que el usuario dio
                if (opcion >= 1 && opcion <= 4)  // Damos un rango de opciones validas
                    band1 = 1;                   // Asignamos a la bandera 1 para salir
                else {
                    printf("Selecciona un numero del 1 al 4:\n");
                    band1 = 0;  // Asignamos a la bandera 0 para seguir en el ciclo
                }
            } while (band1 == 0);
        } else
            opcion = sigNivel;
        indice = opcion -1; //Damos un indice para indicar en que espacio de memoria estamos (en el nivel que se haya seleccionado (1,2,3) - 1)
        if (sigNivel == 1 && opcion != 4) {
            puntaje = (struct bitacora *)calloc(opcion, sizeof(struct bitacora)); //Damos memoria dinamica segun el nivel escogido por el usuario
            puntaje[indice].vidas = -2000; //Asignamos al nivel que se va a cursar la vida establecida
            puntaje[indice].balas = 10000; //Asignamos al nivel que se va a cursar las balas establecidas
        }
        if(opcion != 1){
        	printf("Puntaje de los niveles anteriores:\n");
        	printf("**********************************************************************************\n");
            printf("*                                   BITACORA DE VIAJE                            *\n");
            printf("**********************************************************************************\n\n");
            for (i = 0; i < indice; i++) {
            	printf("**********************************************************************************\n");
            	if (i == 0)
                    printf("| Planetas destruidos: %5d                                                     |\n", puntaje[i].destruidos);
                else if (i == 1)
                	printf("| Asteroides destruidos: %5d                                                   |\n", puntaje[i].destruidos);
            	printf("| Capsulas de la nave: %5d capsulas                                            |\n", puntaje[i].vidas);
                printf("| Balas restantes: %5d balas                                                   |\n", puntaje[i].balas);
                printf("| Objetos capturados: %5d objetos                                              |\n", puntaje[i].objetosCap);
                printf("**********************************************************************************\n");
        	}
        	printf("=>");
        	getch();
        	putchar('\n');
		}
        vidaP = band1 = aleat1 = control = perder = 0;  // Cada que terminemos un nivel, se reinician todas las variables que se necesitan en el proceso
        switch (opcion) {
            case 1:  // Nivel 1
                printf("Iniciando nivel 1...\n");
                sleep(3);
                printf("/-----------------------------------------------/\n");
                printf("/**NIVEL 1:**\n");  // Nivel 1
                printf("/-----------------------------------------------/\n");
                peligrosGen = rand() % 3 + 4;  // Generando de 4 a 6 planetas
                printf("Se generaron %d planetas, de los cuales algunos son muy peligros\n", peligrosGen);
                sleep(3);
                for (cont = 1; cont <= peligrosGen; cont++) {
                    if(puntaje[indice].vidas>=0 && puntaje[indice].balas>=0){
                        printf("La nave se ha quedado sin vidas o balas.\nHas perdido el juego ...\n");
                            printf("************************  GRACIAS POR JUGAR  ************************\n");
                            printf("Pulse cualquier tecla para regresar al menu principal.\n=>\n");
                            free(puntaje);
                            sigNivel = 1;
                            cont = peligrosGen+1;  // Se le asigna el valor de generados para que se acabe el ciclo for
                            perder = 1;          // Se usa una bandera para omitir la parte de la busqueda de objetos y el puntaje final
                    }
                    peligro.dist = rand()%311 + 200; //Distancia 200 a 510
                    peligro.vel = rand()%1301 + 200; //Velocidad 200 a 1500
                    aleat1 = rand() % 2;                                        // Genera un planeta vivo o muerto
                    printf("**********************************************************************************\n");
                    printf("*                               BITACORA DEL VIAJE                               *\n");
                    printf("**********************************************************************************\n");
                    printf("| Planetas avistados: %5d planetas                                             |\n", cont -1);
                    printf("| Planetas destruidos: %5d                                                     |\n", puntaje[indice].destruidos);
                    printf("| Capsulas de la nave: %5d capsulas                                            |\n", puntaje[indice].vidas);
                    printf("| Balas restantes: %5d balas                                                   |\n", puntaje[indice].balas);
                    printf("| Objetos capturados: %5d objetos                                              |\n", puntaje[indice].objetosCap);
                    printf("**********************************************************************************\n=>\n");
                    getch();
                    putchar('\n');
                    printf("**********************************************************************************\n");
                    printf("*                             ENCONTRASTE UN PLANETA                             *\n");
                    printf("**********************************************************************************\n");
                    printf("| Velocidad actual: %5.0d km/h                                                   |\n", peligro.vel);
                    printf("| Distancia con el planeta: %5.0d kilometros                                     |\n", peligro.dist);
                    printf("**********************************************************************************\n=>\n");
                    getch();                                                                               // Se espera a que el usuario presione cualquier tecla y se sigue con el juego
                    putchar('\n');                                                                         // Despues de que el usuario haya presionado la tecla, se da un salto de linea para que se escriba correctamente el prog.
                    printf("%s", aleat1 == 0 ? "El planeta no tiene vida\n" : "El planeta tiene vida\n");  // Operador terciario en funcion printf
                    printf("************************  Analizando las condiciones con el planeta...  ************************\n");
                    for (i = 0; i < 3; i++) { //Animacion
                        printf(".");
                        fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                        sleep(1);
                    }putchar('\n'); 
                    if ((peligro.dist > 400 && peligro.dist < 800) && (peligro.vel < 1000) && aleat1 == 0)  // Condiciones planetas
                        control = 2;
                    else if (peligro.dist >= 200 && peligro.vel > 200)
                        control = 1;
                    else if ((peligro.dist > 100 && peligro.dist < 200) && (peligro.vel > 1000))
                        control = 3;
                    else
                        control = 4;
                    switch (control) {  // Switch que determina el siguiente paso del juego
                        case 1:
                            printf("Estas tan lejos del planeta que no es necesario esquivarlo o destruirlo, sigues tu ruta sin problemas : \n=>\n");
                            break;
                        case 2:
                            printf("Puedes destruir el planeta, si es asi perderas 40 capsulas por bala\n");
                            printf("Escribe 1 para destruir o 0 para esquivar el planeta:\n=>\n");
                            do {  // Validamos la respuesta del usuario
                                scanf("%s", resp);
                                opcion = 2;                                  // Asignamos a opcion el numero 2 para que se acabe el ciclo do while
                                if (strcmp(resp, "1") == 0 && puntaje[0].balas >= 2) {  // Respuesta afirmativa
                                    if (&& puntaje[0].vidas>=60){
                                    aleat1 = rand() % 2 + 8;                 // Generando 2 a 8 balas
                                    vidaP = aleat1 * 30;                     // Se pierde 30 de vida por cada bala
                                    puntaje[indice].vidas -= vidaP;      // Se le resta la vida perdida
                                    puntaje[indice].balas -= aleat1;     // Se le restan las balas perdidas
                                    puntaje[indice].destruidos += 1;     // Contador de destrucciones
                                    printf("Haz destruido el planeta con exito\n");
                                    printf("Las balas que utilizaste fueron %d, por lo tanto te quedan %d balas\n", aleat1, puntaje[indice].balas);
                                    printf("Perdiste %d vidas, te quedan %d vidas\n=>", vidaP, puntaje[indice].vidas);
                                    } else
                                        {printf("NO tienes vidas suficientes, por lo tanto se esquiva el planeta en automatico\n=>\n");}
                                } else if (strcmp(resp, "1") == 0 && puntaje[indice].balas < 8)  // Si no tiene balas suficientes
                                    printf("NO tienes balas suficientes, por lo tanto se esquiva el planeta en automatico\n=>\n");
                                else if (strcmp(resp, "0") == 0)
                                    printf("Decidiste esquivar el planeta\n=>\n");  // Respuesta negativa
                                else {
                                    printf("Escribe la opcion correcta\n=>\n");  // Si el usuario escribio otro caracter
                                    opcion = 3;                                // Se asigna a opcion el valor de 3 para que no se salga del ciclo si escribio algo incorrecto
                                }
                            } while (opcion == 3);
                            break;
                        case 3:
                            printf("Por poco y no la cuentas! Has esquivado por los pelos al planeta\nProcura no estar en estas situaciones...\n=>\n");
                            break;
                        case 4:
                            printf("Oh no! A pesar de tus esfuerzos no se puede esquivar el planeta, sera un impacto total...\n");
                            sleep(1);
                            printf("Impactaras con el planeta en:\n");
                            for (i = 3; i > 0; i--) {  // Se hace un conteo regresivo de 3 hasta el 1, esperando un segundo entre cada numero
                                printf("%d\n", i);
                                sleep(1);
                            }
                            for (i = 0; i < 3; i++) { //Animacion espera
                                printf(".");
                                fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                                sleep(1);
                            }putchar('\n');
                            // Grafico de bomba
                            printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n\x1b[31m");
                            printf("La nave ha chocado de lleno contra el planeta.\nHas perdido el juego debido a un terrible accidente...\n");
                            printf("************************  GRACIAS POR JUGAR  ************************\n");
                            printf("Pulse cualquier tecla para regresar al menu principal.\n=>\n");
                            free(puntaje);
                            sigNivel = 1;
                            cont = peligrosGen;  // Se le asigna el valor de generados para que se acabe el ciclo for
                            perder = 1;          // Se usa una bandera para omitir la parte de la busqueda de objetos y el puntaje final
                            break;
                    }
                    getch();
                    putchar('\n');
                    if (perder != 1) {                                                                            // Se restringue esta parte de codigo para que solo se muestre en caso de que no se pierda
                    peligro.vel= rand()%2501 + 1000;
                        if (rand() % 4 <= 2 && peligro.vel > 1500 && 3000 < peligro.vel) {                      // Se genera una distancia con el objeto y se evalua si se puede tomar el objeto
                            aleat1 = rand() % 3 + 1;                                                              // Se crea una cantidad de objetos aleatorios entre 1 y 3
                            printf("Te haz encontrado con una cantidad de %d '%s' \n", aleat1, obj[rand() % 7]);  // Se encuentra con varios objetos del mismo tipo
                            for (i = 0; i < 3; i++) {
                                printf(".");
                                fflush(stdout);
                                sleep(1);
                            }putchar('\n');
                            if (rand() % 2 == 0) {                         // Se da una probabilidad de 50/50 de tomar o destruir los objetos
                                puntaje[indice].objetosCap += aleat1;  // Contador de cuantos objetos se han capturado
                                vidaP = aleat1 * 20;                     // Cada que se toma un objeto se pierden 20 capsulas de vida
                                puntaje[indice].vidas -= vidaP;
                                printf("Te haz quedado con los objetos, a cambio de ello perdiste %d capsulas de vida.\nTe quedan %d capsulas\n", vidaP, puntaje[indice].vidas);
                            } else
                                printf("Haz destruido los objetos.\n");
                        } else
                            printf("Encontraste un objeto pero desgraciadamente estabas muy lejos de el...\n");
                        printf("Ademas, ya que superaste un planeta en tu recorido obtienes 2 '%s'!\n=>\n", obj[rand() % 7]);
                        puntaje[indice].objetosCap += 2;
                        getch();
                        putchar('\n');
                    }system("clear");  // Limpiamos pantalla
                }                     // Fin del recorrido de planetas
                if (perder != 1) {    // Se restringue para que solo sea visible esta parte si el jugador no ha perdido
                    printf("Haz sobrevivido a este nivel, veamos tus estadisticas:\n");
                    printf("Vidas totales: %d \nBalas finales: %d \nPlanetas destruidos: %d \nObjetos capturados: %d\n=>\n", puntaje[indice].vidas, puntaje[indice].balas, puntaje[indice].destruidos, puntaje[indice].objetosCap);
                    getch();
                    putchar('\n');
                    if ((puntaje[indice].balas >= 7000 && puntaje[indice].vidas >= 1000) && (puntaje[indice].destruidos <= 2 && puntaje[indice].objetosCap >= 10)) {
                        printf("Felicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel.\n=>\n");
                        sigNivel++;  // Se pasa al siguiente nivel
                    } else {
                        printf("Oh no... No pudiste ganar debido a que te faltaron puntos... Intentalo de nuevo!\n=>\n");
                        sigNivel = 1;
                    }
                    getch();
                    putchar('\n');
                }system("clear");  // Limpiamos pantalla
                break;
            case 2:  // Nivel 2
                if (sigNivel == 2) {
                    printf("Ya que has ganado el nivel 1 se mantendra tu vida y tus balas, buena suerte!\n");
                    puntaje = (struct bitacora *)realloc(puntaje, 1 * sizeof(struct bitacora));
                    puntaje[indice].objetosCap = 0;
                    puntaje[indice].destruidos = 0;
                    puntaje[indice].balas = puntaje[0].balas;
                    puntaje[indice].vidas = puntaje[0].vidas;
                }
                printf("Iniciando nivel 2...\n");
                sleep(3);
                printf("/-----------------------------------------------/\n");
                printf("/**NIVEL 2:**\n");  // Nivel 2
                printf("/-----------------------------------------------/\n");
                peligrosGen = rand() % 5 + 6;  // Generando de 6 a 10 meteoros
                printf("Se generaron %d meteoros, de los cuales algunos son muy grandes...\n", peligrosGen);
                sleep(3);
                for (cont = 1; cont <= peligrosGen; cont++) { //Recorrido de Meteoros
                    peligro.dist = rand()%651 + 300; //distancia de 300 a 950
                    peligro.vel = rand()%2501 + 1000;//velocidad de 1000 a 3500
                    printf("**********************************************************************************\n");
                    printf("*                               BITACORA DEL VIAJE                               *\n");
                    printf("**********************************************************************************\n");
                    printf("| Meteoros avistados: %5d meteoros                                             |\n", cont -1);
                    printf("| Asteroides destruidos: %5d asteroides                                        |\n", puntaje[indice].destruidos);
                    printf("| Capsulas de la nave: %5d capsulas                                            |\n", puntaje[indice].vidas);
                    printf("| Balas restantes: %5d balas                                                   |\n", puntaje[indice].balas);
                    printf("| Objetos capturados: %5d objetos                                              |\n", puntaje[indice].objetosCap);
                    printf("**********************************************************************************\n=>\n");
                    getch();
                    putchar('\n');
                    printf("**********************************************************************************\n");
                    printf("*                             ENCONTRASTE UN METEORO                             *\n");
                    printf("**********************************************************************************\n");
                    printf("| Velocidad actual: %5.0d km/h                                                   |\n", peligro.vel);
                    printf("| Distancia con el planeta: %5.0d kilometros                                     |\n", peligro.dist);
                    printf("**********************************************************************************\n=>\n");
                    getch();
                    putchar('\n');
                    printf("************************  Analizando las condiciones con el meteoro...  ************************\n");
                    for (i = 0; i < 3; i++) { //Animacion
                        printf(".");
                        fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                        sleep(1);
                    }putchar('\n');
                    if (peligro.dist > 200 && peligro.dist < 350 && peligro.vel > 2000)
                        control = 2;
                    else if (peligro.dist > 600 && peligro.dist < 900 && peligro.vel < 2000)
                        control = 3;
                    else if (peligro.dist > 350)
                        control = 1;
                    else
                        control = 4;
                    switch (control) {
                        case 1:
                            puntaje[indice].destruidos += 10;
                        	puntaje[indice].vidas += 100;
                            printf("Estas tan lejos del meteoro que no es necesario esquivarlo o destruirlo.\nGanaste: 10 asteroides destruidos\n");
                            printf("La nave a recargado capsulas.\nObtienes 100 capsulas\n=>\n");
                            break;
                        case 2:
                            puntaje[indice].destruidos += 15;
                            puntaje[indice].vidas += 100;
                            printf("Evadiste con exito al meteoro aunque era arriesgado.\nGanaste: 15 asteroides destruidos\n=>\n");
                            printf("La nave a recargado capsulas.\nObtienes 100 capsulas\n=>\n");
                            break;
                        case 3:
                            printf("Puedes destruir el meteoro, si es asi perderas 40 capsulas por bala.\n");
                            printf("Escribe 1 para destruir o 0 para esquivar el meteoro:\n=>\n");
                            do {  // Validamos la respuesta del usuario
                                scanf("%s", resp);
                                opcion = 2;
                                if (strcmp(resp, "1") == 0 && puntaje[1].balas >=40) {
                                    aleat1 = rand() % 2 + 8;  // Generando 2 a 8 disparos
                                    vidaP = aleat1 * 40;      // Se pierden 40 capsulas de vida por cada disparo
                                    puntaje[indice].vidas -= vidaP;
                                    puntaje[indice].balas -= aleat1 * 20;  // por cada disparo suelta 20 balas
                                    puntaje[indice].destruidos += 30; //Contador de destrucciones
                                    printf("Haz destruido el meteoro con exito.\n Ganaste: 30 asteroides destruidos\n");
                                    printf("Los disparos que realizaste fueron %d, por lo tanto te quedan %d balas\n", aleat1, puntaje[indice].balas);
                                    printf("Perdiste %d vidas, te quedan %d vidas\n=>", vidaP, puntaje[indice].vidas);
                                } else if (strcmp(resp, "1") == 0 && puntaje[indice].balas < 40)
                                    printf("NO tienes balas suficientes, por lo tanto se esquiva el meteoro en automatico \n=>\n");
                                else if (strcmp(resp, "0") == 0)
                                    printf("Decidiste esquivar el meteoro\n=>\n");  // Respuesta negativa
                                else {
                                    printf("Escribe la opcion correcta\n=>\n");  // Si el usuario escribio otro caracter
                                    opcion = 3;
                                }
                            } while (opcion == 3);
                            break;
                        case 4:
                            printf("Oh no! El meteoro esta muy cerca, no puedes esquivarlo ni destruirlo...\n""Impactaras en:\n");
                            for (i = 3; i > 0; i--) {
                                printf("%d\n", i);
                                sleep(1);
                            }
                            for (i = 0; i < 3; i++) { //Animacion
                                printf(".");
                                fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                                sleep(1);
                            }putchar('\n');
                            // Grafico de bomba
                            printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n\x1b[31m");
                            printf("La nave ha chocado de lleno contra el meteoro.\nHas perdido el juego debido a un terrible accidente...\n");
                            printf("************************  GRACIAS POR JUGAR  ************************\n");
                            printf("Pulse cualquier tecla para regresar al menu principal\n=>\n");
                            free(puntaje);
                            sigNivel = 1;
                            cont = peligrosGen;  // Se le asigna el valor de generados para que se acabe el ciclo for
                            perder = 1;          // Se usa una bandera para omitir la parte de la busqueda de objetos y el puntaje final
                            break;
                    }
                    getch();
                    putchar('\n');
                    if (perder != 1) {
                        aleat1 = rand()%401 + 2400;  // Se da un numero random entre 2000 y 2800 (metros => 2km - 2.7km)
                        if (aleat1 <= 2500 && peligro.vel > 1500 && peligro.vel < 3000) {
                            aleat1 = rand() % 11 + 10;   // Generando de 10 a 20 objetos
                            printf("Te haz encontrado con una cantidad de %d '%s' \n", aleat1, obj[rand() % 7]);  // Se encuentra con varios objetos del mismo tipo
                            for (i = 0; i < 3; i++) { //Animacion
                                printf(".");
                                fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                                sleep(1);
                            }putchar('\n');
                            if (rand() % 2 == 0) {                         // Se da una probabilidad de 50/50 de tomar o destruir los objetos
                                puntaje[indice].objetosCap += aleat1;  // Contador de cuantos objetos se han capturado
                                vidaP = aleat1 * 30;                       // Cada que se toma un objeto se pierden 30 capsulas de vida
                                puntaje[indice].vidas -= vidaP;
                                printf("Te haz quedado con los objetos, a cambio de ello perdiste %d capsulas de vida.\nTe quedan %d capsulas\n", vidaP, puntaje[indice].vidas);
                            } else
                                printf("Haz destruido los objetos.\n");
                        } else
                            printf("Encontraste algunos objetos pero desgraciadamente estabas muy lejos de ellos...\n");
                        printf("Ademas, ya que superaste un meteoro en tu recorido obtienes 13 '%s'! \n=>\n", obj[rand() % 7]);
                        puntaje[opcion - 1].objetosCap += 13;
                        getch();
                        putchar('\n');
                    }system("clear");
                }  // Fin del recorrido de meteoros
                if (perder != 1) {
                    printf("Haz sobrevivido a este nivel, veamos tus estadisticas:\n");
                    printf("Vidas totales: %d \nBalas finales: %d \nAsteroides destruidos: %d \nObjetos Capturados: %d\n=>\n", puntaje[indice].vidas, puntaje[indice].balas, puntaje[indice].destruidos, puntaje[indice].objetosCap);
                    getch();
                    putchar('\n');
                    if (puntaje[indice].balas >= 5000 && puntaje[indice].vidas >= 700 && puntaje[indice].destruidos >= 100 && puntaje[indice].objetosCap >= 100) {
                        printf("Felicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel\n=>\n");
                        sigNivel=3;
                    } else {
                        printf("Oh no... No pudiste ganar debido a que te faltaron puntos...\n");
                        printf("Intentalo de nuevo!\n=>\n");
                        sigNivel = 1;
                    }
                    getch();
                	putchar('\n');
                }
                system("clear");
                break;
            case 3:
                if (sigNivel == 3) {
                    printf("Ya que has ganado el nivel 1 se mantendra tu vida y tus balas, buena suerte!\n");
                    puntaje = (struct bitacora *)realloc(puntaje, 1 * sizeof(struct bitacora));
                    puntaje[opcion - 1].objetosCap = 0;
                    puntaje[opcion - 1].destruidos = 0;
                    puntaje[opcion - 1].balas = puntaje[1].balas;
                    puntaje[opcion - 1].vidas = puntaje[1].vidas;
                }
                printf("Iniciando nivel 3...\n");
                sleep(3);
                printf("/-----------------------------------/\n");
                printf("/**NIVEL 3:**\n");  // Nivel 3
                printf("/-----------------------------------/\n");
                peligrosGen = rand() % 3 + 10;  //Generando de 10 a 12 agujeros negros
                printf("Cruzaras %d Hoyos Negros en este nivel, ten mucho cuidado!\n", peligrosGen);
                sleep(3);
                for (cont = 1; cont <= peligrosGen; cont++) {
                    peligro.dist = rand()%1351 + 250; //Distancia de 250 a 1600
                    peligro.vel = rand()%4001 + 1500; //Velocidad de 1500 a 5500
                    printf("**********************************************************************************\n");
                    printf("*                               BITACORA DEL VIAJE                               *\n");
                    printf("**********************************************************************************\n");
                    printf("| Hoyos Negros avistados: %5d hoyos negros                                     |\n", cont-1);
                    printf("| Hoyos Negros destruidos: %5d hoyos negros                                    |\n", puntaje[indice].destruidos);
                    printf("| Capsulas de la nave: %5d capsulas                                            |\n", puntaje[indice].vidas);
                    printf("| Balas restantes: %5d balas                                                   |\n", puntaje[indice].balas);
                    printf("| Objetos capturados: %5d objetos                                              |\n", puntaje[indice].objetosCap);
                    printf("**********************************************************************************\n=>\n");
                    getch();
                    putchar('\n');
                    printf("**********************************************************************************\n");
                    printf("*                            ENCONTRASTE UN HOYO NEGRO                           *\n");
                    printf("**********************************************************************************\n");
                    printf("| Velocidad actual: %5.0d km/h                                                   |\n", peligro.vel);
                    printf("| Distancia con el hoyo negro: %5.0d kilometros                                  |\n", peligro.dist);
                    printf("**********************************************************************************\n=>\n");
                    getch();
                    putchar('\n');
                    printf("El agujero negro se aproxima a ti, analizaremos que podemos hacer\n");
                    printf("************************  Analizando las condiciones con el agujero negro...  ************************\n");
                    for (i = 0; i < 3; i++) { //Animacion
                        printf(".");
                        fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                        sleep(1);
                    }putchar('\n');
                    if ((peligro.dist > 900 && peligro.dist < 1500) && peligro.vel < 3000) //Condiciones agujero negro
                        control = 1;
                    else if ((peligro.dist > 350 && peligro.dist < 500) && peligro.vel > 3000)
                        control = 2;
                    else if (peligro.dist > 500)
                        control = 3;
                    else
                        control = 4;
                    switch (control) {
                        case 1:
                            printf("Puedes destruir el agujero negro si es que lo desea, perdera 30 capsulas por cada bala disparada\n");
                            printf("Escriba 1 para destruir o 0 para esquivar el agujero negro:\n=>\n");
                            opcion = 3;
                            while (opcion == 3) {  // Validamos la respuesta del usuario
                                scanf("%s", resp);
                                opcion = 2;
                                if (strcmp(resp, "1") == 0 && puntaje[2].balas >= 8) {
                                    aleat1 = rand() %5  + 8;  // Generando 8 a 12 disparos
                                    vidaP = aleat1 * 30; //Por cada disparo se pierden 30 de vida
                                    puntaje[indice].vidas -= vidaP; //Se resta la vida
                                    puntaje[indice].balas -= aleat1*20; //Se pierden  20 balas por cada disparo 
                                    puntaje[indice].destruidos += 1; // Contador de de agujeros negros destruidos
                                    printf("Haz destruido el agujero negro con exito\n");
                                    printf("Los disparos que realizaste fueron %d, por lo tanto te quedan %d balas\n", aleat1, puntaje[indice].balas);
                                    printf("Perdiste %d vidas, te quedan %d vidas\n=>", vidaP, puntaje[indice].vidas);
                                } else if (strcmp(resp, "1") == 0 && puntaje[indice].balas < 8)
                                    printf("NO tienes balas suficientes, por lo tanto se esquiva el agujero negro en automatico \n=>\n");
                                else if (strcmp(resp, "0") == 0)
                                    printf("Decidiste esquivar el agujero negro, aunque era muy riesgoso...\n=>\n");  // Respuesta negativa
                                else {
                                    printf("Escribe la opcion correcta\n=>\n");  // Si el usuario escribio otro caracter
                                    opcion = 3;
                                }
                            }
                            break;
                        case 2:
                            printf("Evadiste con exito al hoyo negro aunque era arriesgado\n");
                            printf("Se evadio el hoyo negro %d tu distancia fue %d km y tu velocidad fue de %1.0d km/h \n=> ", cont, peligro.dist, peligro.vel);
                        	puntaje[indice].vidas += 200;
                            printf("La nave a recargado capsulas.\nObtienes 200 capsulas\n=>\n");
                            break;
                        case 3:
                            printf("Estas tan lejos del agujero negro que no es necesario esquivarlo o destruirlo. Sigues tu ruta sin problemas\n=>");
                            puntaje[indice].vidas += 200;
                            printf("La nave a recargado capsulas.\nObtienes 200 capsulas\n=>\n");
                            break;
                        case 4:
                            printf("Oh no! La distancia es insuficiente para esquivar o destruir el agujero negro!\n");
                            printf("Seras tragado por el agujero negro, preparate para ello...\n=>\n");
                            getch();
                            putchar('\n');
                            printf("Entraras al horizonte de sucesos en:\n");
                            for (i = 3; i > 0; i--) {
                                printf("%d\n", i);
                                sleep(1);
                            }
                            for (i = 0; i < 3; i++) { //Animacion espera
                                printf(".");
                                fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                                sleep(1);
                            }putchar('\n');
                            // Grafico de bomba
                            printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n\x1b[31m");
                            printf("La nave ha sido tragada y despedazada por el agujero negro.\nHas perdido el juego debido a un terrible accidente...\n");
                            printf("************************  GRACIAS POR JUGAR  ************************\n");
                            printf("Pulse enter para regresar al menu principal\n=>\n");
                            free(puntaje);
                            sigNivel = 1;
                            cont = peligrosGen;  // Se le asigna el valor de generados para que se acabe el ciclo for
                            perder = 1;          // Se usa una bandera para omitir la parte de la busqueda de objetos y el puntaje final
                            break;
                    }
                    getch();
                    putchar('\n');
                    if (perder != 1) {
                    	aleat1 = rand()%5; //Generamos un numero de 0 a 4
                        if (aleat1 <= 3 && (peligro.vel > 4000 && 5000 < peligro.vel)) {
                            aleat1 = rand() % 11 + 20;  // Genera de 20 a 30 objetos
                            printf("Te haz encontrado con una cantidad de %d '%s' \n", aleat1, obj[rand() % 7]);  // Se encuentra con varios objetos del mismo tipo
                            for (i = 0; i < 3; i++) { //Animacion espera
                                printf(".");
                                fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
                                sleep(1);
                            }putchar('\n');
                            if (rand() % 2 == 0) {
                                puntaje[indice].objetosCap += aleat1;  // Contador de cuantos objetos se han capturado
                                vidaP = aleat1 * 40;                       // Cada que se toma un objeto se pierden 40 capsulas de vida
                                puntaje[indice].vidas -= vidaP;
                                printf("Te haz quedado con los objetos, a cambio de ello perdiste %d capsulas de vida.\nTe quedan %d capsulas\n", vidaP, puntaje[indice].vidas);
                            } else
                                printf("Haz destruido el objeto\n");
                        } else
                            printf("Encontraste un objeto pero desgraciadamente estabas muy lejos de el...\n");
                        printf("Ademas, ya que superaste un planeta en tu recorido obtienes 90 '%s'! \n=>\n", obj[rand() % 7]);
                        puntaje[indice].objetosCap += 90;
                        getch();
                        putchar('\n');
                    }system("clear");
                }
                if (perder != 1) {
                    printf("Haz sobrevivido a este nivel, veamos tus estadisticas:\n");
                    printf("Vidas totales: %d\nBalas finales: %d\nAgujeros negros destruidos: %d\nObjetos capturados: %d\n=>", puntaje[indice].vidas, puntaje[indice].balas, puntaje[indice].destruidos, puntaje[indice].objetosCap);
                    getch();
                    putchar('\n');
                    if (puntaje[indice].balas >= 3000 && puntaje[indice].vidas >= 300 && puntaje[indice].destruidos >= 3 && puntaje[indice].objetosCap >= 1000){
                        printf(" Felicidades! Cruzaste el nivel 3\n");
                        // Letrero de felicidades en ASCII
                        printf("   ___   _   _  _   _   ___ _____ ___ \n  / __| /_\\ | \\| | /_\\ / __|_   _| __|\n | (_ |/ _ \\| .` |/ _ \\\\__ \\ | | | _| \n  \\___/_/ \\_\\_|\\_/_/ \\_\\___/ |_| |___|\n");
                        printf("**********************************************************************************\n");
                        printf("*                               BITACORA DEL TODO EL VIAJE                       *\n");
                        printf("**********************************************************************************\n");
                        for (i = 0; i < 3; i++) {
                            if (i == 0)
                                printf("| Planetas destruidos: %5d                                                     |\n", puntaje[i].destruidos);
                            else if (i == 1)
                                printf("| Asteroides destruidos: %5d                                                   |\n", puntaje[i].destruidos);
                            else
                                printf("| Hoyos Negros destruidos: %5d                                                 |\n", puntaje[i].destruidos);
                            printf("| Capsulas de la nave: %5d capsulas                                            |\n", puntaje[i].vidas);
                            printf("| Balas restantes: %5d balas                                                   |\n", puntaje[i].balas);
                            printf("| Objetos capturados: %5d objetos                                              |\n", puntaje[i].objetosCap);
                            printf("**********************************************************************************\n");
                        }
                        printf("Gracias por jugar!  :)\n");
                        printf("Pulse una tecla para continuar...");
                        getch();
                        putchar('\n');
                        free(puntaje);
                        return 0;
                    } else {
                        printf("Oh no... No pudiste ganar debido a que te faltaron puntos...\n");
                        printf("Intentalo de nuevo!\n=>");
                        sigNivel = 1;
                    }system("clear");
                }
                break;
            case 4:
                printf("Cerrando el juego, esperamos que hayas disfrutado jugando! :)\n");
                printf("Pulse cualquier tecla para continuar . . .");
                getch();
        }
    } while (opcion != 4);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
// #include <conio.h>
#include <unistd.h>  //Sirve para el sleep()
int main() {
    srand(time(NULL));  // se utiliza para que se produzca una secuencia de números aleatorios diferente
    int vida = 10000, vidap = 0, dist = 0, disO, aleat1, aleat2, opcion = 0, cont, balas = 10000, ans = 2, signivel = 1, peligros, contast, i, disN3[20], hoyos, contho, opc, conts[3] = {0};
    float vel, dis, velN3[20];
    char cad[3], cad1[3], cad2[3];

    // letrero inicio
    printf(" ______                  _____   _     _ _       \n|  ___ \\                (____ \\ | |   | | |      \n| | _ | | ____  ____ ___ _   \\ \\| |__ | | |      \n| || || |/ _  |/ ___)___) |   | |  __)| | |      \n| || || ( ( | | |  |___ | |__/ /| |   | | |_____ \n|_||_||_|\\_||_|_|  (___/|_____/ |_|   |_|_______)\n");
    printf("Bienvenido al juego 'MarsDHL\n'");
    printf("En el juego transportaras plantas a marte enfrentandote a todo tipo de cosas\n");
    printf("\t**DISFRUTA EL JUEGO**\n");
    do {
        // MENU
        // Solo se muestra el menu en caso que la opcion y signivel se mantengan con los valores iniciales
        if (opcion == 0 && signivel == 1) {
            printf("Selecciona una de las siguientes opciones\n");
            printf("1 - Nivel 1\n");
            printf("2 - Nivel 2\n");
            printf("3 - Nivel 3\n");
            printf("4 - Salir\n");
            // Se comprueba si se ingresó solo un numero, de lo contrario manda error
            if (scanf("%d", &opcion) != 1) {
                fprintf(stderr, "Solo se permiten numeros del 1 al 4\n");
                exit(1);
            }
        } else {
            // Al ganar un nivel, se incrementa en 1 a signivel, y se le asigna a opcion para ir directamente al sig. nivel sin el menu
            opcion = signivel;
        }
        switch (opcion) {
            case 1:
                printf("/-----------------------------------------------/\n");
                printf("/**NIVEL 1:**/\n");
                printf("/-----------------------------------------------/\n");
                peligros = rand() % 3 + 3; /*De 2 a 5 planetas*/
                printf("Se generaron %d planetas, de los cuales algunos son muy peligros\n", peligros);
                sleep(2);
                vel = rand() % 950 + 600; /*De 900 a 1550 km/h de velocidad*/
                // Planetas
                for (cont = 0; cont < peligros; cont++) { /*Para que el jugador pueda ganar, se deben de cruzar cada uno de lo()s obstaculos*/
                    dist = rand() % 150 + 90;             /*Distancia de 150 a 240 km*/
                    vel -= 10;
                    printf("Encontraste un planeta\n");
                    sleep(3);
                    printf("/-----------------------------------------------/\n");
                    printf("/**Tu velocidad actual: %1.0f km/h**\n", vel);
                    printf("/-----------------------------------------------/\n");
                    printf("Distancia con el planeta: %d kilometros\n", dist);
                    printf("/-----------------------------------------------/\n");
                    printf("/**Revisando si tiene vida o no**\n");
                    printf("/-----------------------------------------------/\n");
                    sleep(5);
                    if (dist > 200) {  // Si la distancia es mayor que 200 km, no nos importa si el planeta esta vivo o muerto, ya que aun asi lo pasara en ambos casos
                        printf("Estas tan lejos del planeta que no es necesario esquivarlo o destruirlo. Sigues tu ruta sin problemas\n");
                        sleep(3);
                    } else {
                        aleat1 = rand() % 2;  //*Generando planeta vivo o muerto
                        if (aleat1 == 0) {    // Planeta muerto
                            printf("Te haz encontrado con un planeta muerto\n");
                            sleep(3);
                            printf("/-----------------------------------------------/\n");
                            printf("**Revisando si puede destruir el planeta...**\n");
                            printf("/-----------------------------------------------/\n");
                            sleep(3);
                            if (((dist > 100) && (dist < 200)) && (vel <= 1000)) {  // Si la condicion se cumple se podra destruir el planeta
                                printf("Puedes destruir el planeta si es que lo desea\n");
                                sleep(3);
                                printf("Desea destruir el planeta? Si es asi perdera 30 capsulas por cada bala.\n");
                                sleep(3);
                                printf("Escriba SI para destruir el planeta o NO para esquivarlo:\n");
                                sleep(2);
                                do {  // Validacion de la respuesta del usuario
                                    scanf("%s", cad);
                                    cad1[0] = 'S';
                                    cad1[1] = 'I';
                                    cad1[2] = '\0';
                                    // strcmp -> Compara la cadena ingresada (cad) con la cadena esperada (cad1), le sumamos 1 y los seteamos como el valor
                                    //  de opcion, si nos da 1 significa que las cadenas coinciden, de lo contrario esto es falso
                                    opcion = 1 + strcmp(cad, cad1);
                                    if (opcion == 1) {
                                        if (balas >= 2) {
                                            aleat1 = rand() % 2 + 8;  // 2 a 8 balas
                                            // Por c/bala disparada pierdes 30 caps. vida
                                            vidap = aleat1 * 30;
                                            vida = vida - vidap;
                                            balas = balas - aleat1;
                                            conts[0]++;  // conts[0] es la flag de planetas destruidos
                                            printf("Haz destruido el planeta con exito\n");
                                            sleep(3);
                                            printf("Las balas que utilizaste fueron %d, por lo tanto te quedan %d balas\n", aleat1, balas);
                                            sleep(3);
                                            printf("Perdiste %d vidas, te quedan %d vidas\n", vidap, vida);
                                        } else {
                                            printf("NO tienes balas suficientes\n");
                                        }
                                    } else {
                                        // Si la sentecia anterior es falsa, entonces, ahora comparamos la cadena ingresada con la cad2,
                                        //  le sumamos 2 y si estas coinciden, nos retornara un 2, de lo contrario nos generara un 3
                                        cad2[0] = 'N';
                                        cad2[1] = 'O';
                                        cad2[2] = '\0';
                                        opcion = 2 + strcmp(cad, cad2);
                                        if (opcion == 2)
                                            printf("Decidiste esquivar el planeta\n");
                                        else {
                                            printf("Escribe la opcion correcta\n");
                                            opcion = 3;
                                        }
                                    }
                                } while (opcion == 3);
                            } else {  // Si el planeta muerto no puede ser destruido entonces se pasa a esquivarlo
                                printf("No puedes destruir el planeta, tienes que esquivarlo lo mas rapido posible\n");
                                printf("Se necesita una velocidad mayor a 1000 km/h para esquivar\n");
                                sleep(5);
                                printf("------------------------------------------------------------/ \n");
                                printf("La nave esta haciendo lo posible para esquivar el planeta... \n");
                                printf("------------------------------------------------------------/ \n");
                                sleep(5);
                                if (((dist > 100) && (dist < 200)) && (vel > 1000)) {  // Si la condicion se cumple se esquiva el planeta
                                    printf("Por poco y no la cuentas! Has esquivado por los pelos al planeta\n");
                                    sleep(3);
                                    printf("Procura no estar en estas situaciones...\n");
                                    sleep(3);
                                } else {  // Si no se puede esquivar el planeta entonces el jugador choca y el juego termina
                                    printf("Oh no! A pesar de tus esfuerzos no se puede esquivar el planeta, sera un impacto total...\n");
                                    sleep(1);
                                    printf("Impactaras con el planeta en:\n");
                                    printf("3\n");
                                    sleep(1);
                                    printf("2\n");
                                    sleep(1);
                                    printf("1\n");
                                    sleep(1);
                                    printf("...\n");
                                    sleep(5);
                                    // Grafico de bomba
                                    printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n\x1b[31m");
                                    printf("La nave ha chocado de lleno contra el planeta.\n");
                                    sleep(3);
                                    printf("Has perdido el juego debido a un terrible accidente...\n");
                                    sleep(2);
                                    printf("/-----------------------------------------------/\n");
                                    printf("\t**GRACIAS POR JUGAR**\n");
                                    printf("/-----------------------------------------------/\n");
                                    return 0;
                                }
                            }
                        } else {  // Planeta con vida
                            printf("Te has encontrado con un planeta con vida\n");
                            printf("No puedes destruir el planeta ya que tiene vida\n");
                            printf("Tienes que esquivar este planeta lo mas rapido posible, se necesita una velocidad mayor a 1000 km/h para esquivar\n");
                            sleep(6);
                            printf("/-----------------------------------------------/\n");
                            printf("/**Haciendo lo posible para esquivar el planeta...**\n");
                            printf("/-----------------------------------------------/\n");
                            sleep(5);
                            if (((dist > 100) && (dist < 200)) && (vel > 1000)) {  // Si la condicion se cumple se esquiva el planeta
                                printf("Por poco y no la cuentas! Has esquivado por los pelos al planeta\n");
                                sleep(3);
                                printf("Procura no estar en estas situaciones...\n");
                                sleep(3);
                            } else {  // Si no se puede esquivar el planeta entonces el jugador choca y el juego termina
                                printf("Oh no! A pesar de tus esfuerzos no se puede esquivar el planeta, sera un impacto total...\n");
                                sleep(1);
                                printf("Impactaras con el planeta en:\n");
                                printf("3\n");
                                sleep(1);
                                printf("2\n");
                                sleep(1);
                                printf("1\n");
                                sleep(1);
                                printf("...\n");
                                sleep(4);
                                // Grafico de bomba
                                printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n");
                                printf("La nave ha chocado de lleno contra el planeta.\n");
                                printf("Has perdido el juego debido a un terrible accidente...\n");
                                sleep(3);
                                printf("/-----------------------------------------------/\n");
                                printf("**GRACIAS POR JUGAR**\n");
                                printf("/-----------------------------------------------/\n");
                                return 0;
                            }
                        }
                    }
                    // Objetos
                    aleat1 = rand() % 6; /*Generando numero aleatorio de 0 a 5*/
                    if (aleat1 <= 2) {   // El jugador podra encontrarse con el objeto si solo si el numero aleatorio generado este entre 0 y 2
                        printf("Encontraste un objeto en tu recorrido\n");
                        sleep(3);
                        aleat2 = rand() % 2000 + 1000;  // Generando distancia de la nave al objeto de 1000m a 3000m
                        if (aleat2 <= 2000) {           // El jugador podra tomar el objeto si su distancia con el objeto es menor o igual a 2000
                            printf("No sabras que es el objeto hasta que lo tomes\n");
                            printf("Desea tomar el objeto? Si es asi, perderas 50 capsulas de vida. Escriba SI o NO):\n");
                            sleep(4);
                            do {
                                scanf("%s", cad);
                                cad1[0] = 'S';
                                cad1[1] = 'I';
                                cad1[2] = '\0';
                                opcion = 1 + strcmp(cad, cad1);
                                if (opcion == 1) {
                                    printf("Decidiste tomar el objeto\n");
                                    sleep(3);
                                    if (aleat1 == 0) {              // Objeto 1: Propulsor
                                        aleat2 = rand() % 50 + 100; /*Velocidad ganada de 50 a 150 km/h*/
                                        vel = vel + aleat2;
                                        printf("Tomaste un propulsor de %d km/h, ahora tienes mas velocidad\n", aleat2);
                                    } else if (aleat1 == 1) {      // Objeto 2: Vidas
                                        aleat2 = rand() % 31 + 50; /*De 30 a 80 capsulas de vida*/
                                        printf("Tomaste %d capsulas de vida, ahora tienes mas vida\n", aleat2);
                                    } else {                       // Objeto 3: Balas
                                        aleat2 = rand() % 41 + 20; /*De 40 a 60 balas*/
                                        printf("Tomaste %d balas, ahora tienes mas balas\n", aleat2);
                                    }
                                    vida -= 50;
                                    printf("Perdiste 50 capsulas de vida por agarrar el objeto\n");
                                } else {
                                    cad2[0] = 'N';
                                    cad2[1] = 'O';
                                    cad2[2] = '\0';
                                    opcion = 2 + strcmp(cad, cad2);
                                    if (opcion == 2) {
                                        printf("Decidiste no tomar el objeto\n");
                                    } else {
                                        printf("Escribe la opcion correcta\n");
                                        opcion = 3;
                                    }
                                }
                            } while (opcion == 3);
                        } else {
                            printf("Desgraciadamente estas muy lejos del objeto (%d m) para poder tomarlo...\n",aleat2);
                        }
                    } else {
                        printf("En tu recorrido no haz encontrado ningun objeto\n");
                    }
                    sleep(5);
                }
                /*Resultado del juego*/
                if (conts[0] <= 2)  // conts[0] -> Planetas destruidos
                    conts[0] = 1;
                if (balas >= 7000)  // conts[1] -> Total de balas
                    conts[1]++;
                if (vida >= 1000)  // conts[2] -> Total de vidas
                    conts[2]++;
                if ((conts[0] + conts[1] + conts[2]) == 3) {  // Si estas son igual a 3 puedes seguir
                    printf("Felicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel\n");
                    signivel++;
                    opcion = 0;
                } else
                    printf("Oh no... No pudiste ganar debido a que te faltaron puntos... Intentalo de nuevo!\n");
                sleep(2);
            case 2:
                printf("\n\n/-----------------------------------/\n");
                printf("/**NIVEL 2:**\n");
                printf("/-----------------------------------/\n");
                if (signivel != 1) {
                    printf("Ya que has ganado el nivel 1 se mantendra tu vida y tus balas\n");
                } else {
                    signivel = 2;
                }
                peligros = rand() % 4 + 6;  // Se generan meteoreos del rango de 6 a 9
                contast = 0;                // Contador de asteroides
                printf("Se generaron %d meteoros \n", peligros);
                sleep(2);
                for (cont = 0; cont < peligros; cont++) {
                    dist = (rand() % 216) + 185;  // distancia entre 185 y 400
                    vel = rand() % 1001 + 1500;   // velocidad 1500 a 2500
                    sleep(2);
                    printf("\n******************\n* Aparecio el meteoro %d *\n******************\n", cont + 1);
                    sleep(2);
                    printf(" \n ------ Velocidad %1.0f km/h ------\n", vel);
                    sleep(2);
                    printf("\n --- Distancia %d km --- \n", dist);
                    if (dist >= 350) {
                        contast += 10;
                        printf("Has esquivado el meteoro,\n Ganaste 10 asteroides destruidos\n");
                        sleep(3);
                    } else {
                        if (dist > 200 && dist < 350) {
                            if (vel > 2000) {
                                printf("Has evadido el meteoro :), \nGanaste 15 asteroides destruidos\n");
                                contast += 15;
                            } else {
                                printf("\nPuedes destruir el meteoro \n");
                                printf("Escriba 'SI' para destruir o 'NO' para evadirlo \n");
                                do {
                                    scanf("%s", cad);
                                    cad1[0] = 'S';
                                    cad1[1] = 'I';
                                    cad1[2] = '\0';
                                    opcion = 1 + strcmp(cad, cad1);
                                    if (opcion == 1) {
                                        if (balas >= 6 && vida >= 80) {
                                            aleat1 = rand() % 2 + 8;
                                            balas -= aleat1 * 3;  // aleat1 genera disparos y c/disparo contiene 3 balas
                                            vidap = aleat1 * 40;
                                            vida -= vidap;
                                            contast += 20;
                                            sleep(2);
                                            printf("Destruiste el meteoro con sus asteroides\n");
                                            printf("Realizaste %d disparos\n",aleat1);
                                            printf("Perdiste:\n %d Balas \n %d Vidas \n", aleat1 * 3, vidap);
                                            printf("Te Quedan: \n %d Vidas \n %d Balas\n", vida, balas);
                                            sleep(2);
                                        } else {
                                            printf("No lo puedes destruir, insuficiencia de balas o vidas\n");
                                        }
                                    } else {
                                        cad2[0] = 'N';
                                        cad2[1] = 'O';
                                        cad2[2] = '\0';
                                        opcion = 2 + strcmp(cad, cad2);
                                        if (opcion == 2) {
                                            printf("Decidiste no destruirlo. Continua el viaje :)\n");
                                        } else {
                                            printf("Escribe la opcion correcta\n");
                                            opcion = 3;
                                        }
                                    }
                                } while (opcion == 3);
                            }
                        } else {
                            sleep(2);
                            printf("\n No pudiste esquivar el meteoro, distancia insuficiente \nImpactaras en: \n");
                            printf("3\n");
                            sleep(1);
                            printf("2\n");
                            sleep(1);
                            printf("1\n");
                            sleep(1);
                            printf("...\n");
                            sleep(4);
                            // Grafico de bomba
                            printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n");
                            printf("Has perdido el juego :c\n");
                            return 0;
                        }
                    }
                    if ((cont % 4) == 0) {  // Se generan los objetos solo cuando el meteoro (cont) es multiplo de 4
                        sleep(1);
                        printf("\n °°°°Aparecio un objeto de interes\n");
                        dis = rand() % 3501;      // Se genera num. aleatorio entre 0 y 3.5km
                        dis = (float)dis / 1000;  // como rand() no genera num decimales, primero generamos un num entre 0 y 3500 y lo dividimos entre 1000
                        printf("Escriba 'SI' para tomarlo o 'NO' para esquivarlo \n");
                        do {
                            scanf("%s", cad);
                            cad1[0] = 'S';
                            cad1[1] = 'I';
                            cad1[2] = '\0';
                            opcion = 1 + strcmp(cad, cad1);
                            if (opcion == 1) {
                                if (dis >= 0 && dis <= 2.5) {  // Para tomar el objeto la distancia debe estar entre 0 y 2.5km
                                    sleep(1);
                                    printf("\nOuh!, tomaste el objeto de interes\nPerdiste: \n60 capsulas de vida\nGanaste: \n10 Balas \n 5 Asteroides destruidos\n");
                                    vida -= 60;
                                    balas += 10;
                                    contast += 5;
                                } else {
                                    sleep(1);
                                    printf("Lo siento! \n no conseguiste la distancia necesaria (%1.2f km) :(\n",dis);
                                }
                            } else {
                                cad2[0] = 'N';
                                cad2[1] = 'O';
                                cad2[2] = '\0';
                                opcion = 2 + strcmp(cad, cad2);
                                if (opcion == 2) {
                                    printf("\nEsquivaste el objeto de interes.\nContinuando el viaje \n");
                                } else {
                                    printf("Escribe la opcion correcta\n");
                                    opcion = 3;
                                }
                            }
                        } while (opcion == 3);
                    }
                }
                /*Resultado del juego*/
                sleep(2);
                printf("\nVidas totales %d  \n", vida);
                printf("Balas finales %d \n", balas);
                printf("Asteroides destruidos %d  \n", contast);
                if ((balas >= 5000) && (vida >= 700) && (contast >= 100)) {  // Se verifican las condiciones para poder pasar al siguiente nivel
                    printf("\aFelicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel\n");
                    sleep(2);
                    signivel++;
                    opcion = 0;
                } else {
                    printf("Oh no... No pudiste ganar debido a que te faltaron puntos...\n");
                    printf("Intentalo de nuevo!\n");
                }
                break;
            case 3:
                sleep(2);
                printf("\n\n\n/-----------------------------------/\n");
                printf("/**NIVEL 3:**\n");
                printf("/-----------------------------------/\n");
                peligros = rand() % 4 + 10;                    //* genera de 10 a 13 hoyo
                for (i = 0; i < peligros; i++) {               // Primero se almacenan las distancias y las velocidades de c/hoyo negro con el mismo indice
                    velN3[i] = 2500 + rand() % (4000 - 2500);  //* de 2500 a 4000 km/h
                    disN3[i] = rand() % 221 + 330;             // de 330 a 550 km
                }
                printf("\nCruzaras %d Hoyos Negros \n", peligros);
                for (i = 0; i < peligros; i++) {
                    if (disN3[i] >= 500) {  // Verifica que caso es, antes de entrar en switch(opc)
                        opc = '1';
                    } else {
                        if (disN3[i] > 350 && disN3[i] < 500) {
                            if (velN3[i] > 3000) {
                                opc = '2';
                            } else {
                                opc = '3';
                            }
                        } else {
                            opc = '4';
                        }
                    }
                    sleep(2);
                    printf("\n*************************\n Hoyo Negro: %d \n", i + 1);
                    sleep(3);
                    switch (opc) {
                        case '1':
                            printf("\nTe desviaste el Hoyo Negro %d, ya que tu distancia entre tu y el hoyo fue de %d km \n ", i + 1, disN3[i]);
                            break;
                        case '2':
                            printf("\nEvadiste el hoyo negro %d tu distancia fue %d km y tu velocidad fue de %1.0f km/h \n ", i + 1, disN3[i], velN3[i]);
                            break;
                        case '3':
                            printf(" \nPuedes destruir el Hoyo Negro \n Tu distancia fue %d km \n Tu velocidad alcanzada fue de %1.0f km/h \n", disN3[i], velN3[i]);
                            printf("Escriba 'SI' para destruir o 'NO' para evadirlo \n");
                            do {
                                scanf("%s", cad);
                                cad1[0] = 'S';
                                cad1[1] = 'I';
                                cad1[2] = '\0';
                                opcion = 1 + strcmp(cad, cad1);
                                if (opcion == 1) {
                                    printf("\nAtacaras el hoyo negro \n");
                                    sleep(2);
                                    if (balas >= 25 && vida >= 250) {
                                        aleat1 = 5 + rand() % (10 - 5);  // Generando de 5 a 9 disparos
                                        balas -= aleat1 * 5;             // Por cada disparo perderas 5 balas
                                        vidap = aleat1 * 50;
                                        vida -= vidap;
                                        contho++;  // Contador de hoyos negros destruidos
                                        printf("Destruiste el hoyo negro \n");
                                        printf("Realizaste %d disparos\n",aleat1);
                                        sleep(1);
                                        printf("Perdiste: \n %d Balas\n  %d Vida \n", aleat1 * 5, vidap);
                                        sleep(1);
                                        printf("------\nTe quedan:\n%d Balas\n%d Vida \n", balas, vida);
                                    } else {
                                        printf("Insuficiente de balas o vida \n");
                                    }

                                } else {
                                    cad2[0] = 'N';
                                    cad2[1] = 'O';
                                    cad2[2] = '\0';
                                    opcion = 2 + strcmp(cad, cad2);
                                    if (opcion == 2) {
                                        printf("Decidiste no destruir el hoyo negro \n");
                                    } else {
                                        printf("Escribe la opcion correcta\n");
                                        opcion = 3;
                                    }
                                }
                            } while (opcion == 3);
                            break;
                        case '4':
                            printf(" Tu distancia fue %d km \n", disN3[i]);
                            sleep(2);
                            printf("No pudiste esquivar el Hoyo Negro, distancia insuficiente \nImpactaras en: \n");
                            printf("3\n");
                            sleep(1);
                            printf("2\n");
                            sleep(1);
                            printf("1\n");
                            sleep(1);
                            printf("...\n");
                            sleep(4);
                            // Grafico de bomba
                            printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n");
                            printf("Has perdido el juego :c\n");

                            return 0;
                    }
                    if ((i % 4) == 0) {  // Los objetos aparecen solo si i es multiplo de 4
                        printf("\n °° Te has encontrado un objeto de interes \n");
                        printf("Escriba 'SI' para destruir o 'NO' para evadirlo \n");
                        do {
                            scanf("%s", cad);
                            cad1[0] = 'S';
                            cad1[1] = 'I';
                            cad1[2] = '\0';
                            opcion = 1 + strcmp(cad, cad1);
                            if (opcion == 1) {
                                disO = rand() % 5;
                                if (disO >= 0 && disO <= 3) {
                                    printf("Ohh!!!!!, has perdiste 70 capsulas de vida \nGanaste 15 balas \n");
                                    vida -= 70;
                                    balas += 15;
                                } else {
                                    printf("Lo siento no alcanzaste la distancia necesaria (%d km)\n",disO);
                                }
                            } else {
                                cad2[0] = 'N';
                                cad2[1] = 'O';
                                cad2[2] = '\0';
                                opcion = 2 + strcmp(cad, cad2);
                                if (opcion == 2) {
                                    printf("Decidiste no destruir el objeto de interes \n");
                                } else {
                                    printf("Escribe la opcion correcta\n");
                                    opcion = 3;
                                }
                            }
                        } while (opcion == 3);
                    }
                }
                // Resultados
                printf("Quedaste con %d balas\n", balas);
                printf("Quedaste con %d vida\n", vida);
                printf("Destruiste %d hoyos negros\n", contho);
                if (balas >= 3000 && vida >= 300 && contho >= 3) {
                    printf(" Felicidades! Cruzaste el nivel 3\n");
                    // Letrero de felicidades en ASCII
                    printf("   ___   _   _  _   _   ___ _____ ___ \n  / __| /_\\ | \\| | /_\\ / __|_   _| __|\n | (_ |/ _ \\| .` |/ _ \\\\__ \\ | | | _| \n  \\___/_/ \\_\\_|\\_/_/ \\_\\___/ |_| |___|\n");
                } else {
                    printf("No cruzaste el nivel 3 ;c \n");
                }
                break;
            case 4:
                printf("Saliendo del juego....\n");
                break;
            default:
                opcion = 0;
                printf("Por favor escribe una opcion disponible\n");
        }
    } while (opcion == 0);
    return 0;
}
#include <ncurses.h>
// #include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#define getch() system("read -n1 -p ' ' key")
typedef struct bitacora {
    char id[9];
    char nombre[50];
    int destruidos;
    int vidas;
    int balas;
    int objetosCap;
} puntajes;
puntajes puntaje;
int main() {
    srand(time(NULL));
    int opcion, sigNivel = 1;
    int menu();
    void nivel(int, int *sigNivel);
    do {
        if (sigNivel == 1)
            opcion = menu();
        else
            opcion = sigNivel;
        nivel(opcion, &sigNivel);
    } while (opcion != 5);
}

char generateRandomChar() {
    // Caracteres permitidos para el ID alfanumérico
    char characters[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    int numCharacters = sizeof(characters) - 1;

    // Generar un índice aleatorio dentro del rango de caracteres
    int randomIndex = rand() % numCharacters;

    // Retornar el carácter correspondiente al índice generado
    return characters[randomIndex];
}
void generateID(char *id) {
    int i;
    for (i = 0; i < 8; i++) {
        id[i] = generateRandomChar();
    }
    id[8] = '\0';  // Agregar el carácter nulo al final para terminar la cadena
}

void guardarRegistro(const puntajes *puntajes, FILE *archivo) {
    srand(time(NULL));  // Inicializar la semilla aleatoria con el tiempo actual
    char id[8 + 1];     // +1 para el carácter nulo
    generateID(id);
    fprintf(archivo, "%s;%s;%d;%d;%d;%d\n", puntajes->nombre, id, puntajes->destruidos, puntajes->vidas, puntajes->balas, puntajes->objetosCap);
    fclose(archivo);
}

void mostrarRegistros(FILE *archivo) {
    rewind(archivo);
    int primerCaracter = fgetc(archivo);
    if (primerCaracter == EOF) {
        printf("\n+----------------------------+\n|      No hay puntajes :(    |\n+----------------------------+\n");
    } else {
        rewind(archivo);  // Regresar al inicio del archivo
        while (fscanf(archivo, "%[^;];%[^;];%d;%d;%d;%d\n", puntaje.nombre, puntaje.id, &puntaje.destruidos, &puntaje.vidas, &puntaje.balas, &puntaje.objetosCap) == 6) {
            printf("\nNombre: %s\n", puntaje.nombre);
            printf("ID: %s\n", puntaje.id);
            printf("Destruidos: %d\n", puntaje.destruidos);
            printf("Vidas: %d\n", puntaje.vidas);
            printf("Balas: %d\n", puntaje.balas);
            printf("Objetos capturados: %d\n", puntaje.objetosCap);
            printf("\n");
        }
    }
}

void agregarRegistro() {
    FILE *archivo = fopen("datos.txt", "a+");
    printf("Ingrese su nombre: ");
    fgets(puntaje.nombre, sizeof(puntaje.nombre), stdin);
    puntaje.nombre[strcspn(puntaje.nombre, "\n")] = '\0';
    guardarRegistro(&puntaje, archivo);
    printf("Registro agregado correctamente.\n");
}

int menu() {
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
    do {                    // Se valida la respuesta del usuario
        scanf("%s", resp);  // Leemos como caracter
        num = atoi(resp);
        if (num >= 1 && num <= 5)  // Damos un rango de opciones validas
            return num;
        else {
            printf("Selecciona un numero del 1 al 4:\n");
            band = 0;  // Asignamos a la bandera 0 para seguir en el ciclo
        }
    } while (band == 0);
}

void nivel(int opcion, int *sigNivel) {
    int iniciando(int);
    void imprimirBitacora(int, int);
    void encontrastePeligro(int *, int *, int, int *);
    int condiciones(int, int, int, int);
    void lejos(int);
    void destruir(int);
    void esquivar(int);
    int juegoperdido(int *, int *, int, int);
    void objetos(int);
    int puntajeFinal(int);
    int peligrosGen, i, perder = 0, dist, vel, aleat1, control;
    switch (opcion) {
        case 1:
        case 2:
        case 3:  // Niveles
            puntaje.destruidos = 0;
            puntaje.vidas = 2000;
            puntaje.balas = 10000;
            puntaje.objetosCap = 0;
            peligrosGen = iniciando(opcion);
            for (i = 0; i < peligrosGen; i++) {
                if (puntaje.vidas <= 0) {
                    printf("La nave se ha quedado sin vidas o balas.\nHas perdido el juego ...\n");
                    printf("************************  GRACIAS POR JUGAR  ************************\n");
                    printf("Pulse cualquier tecla para regresar al menu principal.\n=>\n");
                    *sigNivel = 1;
                    i = peligrosGen;  // Se le asigna el valor de generados para que se acabe el ciclo for
                    perder = 1;       // Se usa una bandera para omitir la parte de la busqueda de objetos y el puntaje final
                }
                if (perder != 1) {  // Recorrido peligros
                    imprimirBitacora(opcion, i);
                    encontrastePeligro(&dist, &vel, opcion, &aleat1);
                    control = condiciones(dist, vel, aleat1, opcion);
                    switch (control) {
                        case 1:
                            lejos(opcion);
                            break;
                        case 2:
                            destruir(opcion);
                            break;
                        case 3:
                            esquivar(opcion);
                            break;
                        case 4:
                            *sigNivel = juegoperdido(&i, &perder, peligrosGen, opcion);
                            break;
                    }
                    getch();
                    putchar('\n');
                }  // Objetos
                if (perder != 1)
                    objetos(opcion);
            }  // Fin del juego
            if (perder != 1)
                *sigNivel = puntajeFinal(opcion);
            break;
        case 4:  // Puntajes
            printf("Mostrando puntajes:");
            FILE *archivo = fopen("datos.txt", "a+");  // Modo de apertura "a+" para leer y escribir al final del archivo
            if (archivo == NULL) {
                printf("Error al abrir el archivo.\n");
                // return 1;
            }
            mostrarRegistros(archivo);
            break;
        case 5:  // Salida
            printf("Cerrando el juego, esperamos que hayas disfrutado jugando! :)\n");
            printf("Pulse cualquier tecla para continuar . . .");
            getch();
            break;
    }
}
int iniciando(int opcion) {
    srand(time(NULL));
    const char *peligros[] = {"planetas", "meteoros", "hoyos negros"};
    int temp;
    printf("Iniciando nivel %d...\n", opcion);
    sleep(3);
    printf("/-----------------------------------------------/\n");
    printf("/**NIVEL %d:**\n", opcion);  // Nivel
    printf("/-----------------------------------------------/\n");
    switch (opcion) {
        case 1:
            temp = rand() % 3 + 4;
            break;  // Generando de 4 a 6 Planetas
        case 2:
            temp = rand() % 5 + 7;
            break;  // Generando de 7 a 11 meteoros
        case 3:
            temp = rand() % 4 + 12;
            break;  // Generando de 12 a 15 agujeros negros
    }
    printf("Se generaron %d %s, de los cuales algunos son muy peligrosos\n", temp, peligros[opcion - 1]);
    sleep(3);
    return temp;
}
void imprimirBitacora(int opcion, int i) {
    const char *peligros[] = {"Planetas", "Meteoros", "Hoyos negros"};
    printf("**********************************************************************************\n");
    printf("*                               BITACORA DEL VIAJE                               *\n");
    printf("**********************************************************************************\n");
    printf("| %s avistados: %7d %s                                   |\n", peligros[opcion - 1], i, peligros[opcion - 1]);
    printf("| %s destruidos: %4d %s                                     |\n", peligros[opcion - 1], puntaje.destruidos, peligros[opcion - 1]);
    printf("| Capsulas de la nave: %7d capsulas                                          |\n", puntaje.vidas);
    printf("| Balas restantes: %7d balas                                                 |\n", puntaje.balas);
    printf("| Objetos capturados: %7d objetos                                            |\n", puntaje.objetosCap);
    printf("**********************************************************************************\n=>\n");
    getchar();
    putchar('\n');
}
void encontrastePeligro(int *dist, int *vel, int opcion, int *aleat1) {
    const char *peligros[] = {"PLANETA", "METEORO", "HOYO NEGRO"};
    switch (opcion) {
        case 1:
            *dist = rand() % 411 + 90;  // Distancia 90 a 500
            *vel = rand() % 1001 + 500;
            *aleat1 = rand() % 2;
            break;  // Velocidad 500 a 1500
        case 2:
            *dist = rand() % 421 + 180;  // distancia de 195 a 600
            *vel = rand() % 1501 + 1500;
            break;  // velocidad de 1500 a 3000
        case 3:
            *dist = rand() % 301 + 350;  // Distancia de 350 a 650
            *vel = rand() % 2001 + 2000;
            break;  // Velocidad de 2000 a 4000
    }
    printf("**********************************************************************************\n");
    printf("*                             ENCONTRASTE UN %s                           *\n", peligros[opcion - 1]);
    printf("**********************************************************************************\n");
    printf("| Velocidad actual: %7d km/h                                                 |\n", *vel);
    printf("| Distancia con el planeta: %7d kilometros                                   |\n", *dist);
    printf("**********************************************************************************\n");
    if (opcion == 1)
        printf("El planeta %s\n", aleat1 == 0 ? "no tiene vida" : "tiene vida");
    printf("=>\n");
    getch();
}
int condiciones(int dist, int vel, int aleat1, int opcion) {
    switch (opcion) {
        case 1:  // Condiciones nivel 1
            if (dist > 100 && dist < 300 && vel < 1000 && aleat1 == 0)
                return 2;
            else if (dist >= 300)
                return 1;
            else if (((dist > 100 && dist < 300 && vel > 1000) && aleat1) || ((dist > 100 && dist < 300 && vel > 1000) && aleat1))
                return 3;
            else
                return 4;
        case 2:  // Condiciones nivel 2
            if (dist > 200 && dist < 400 && vel > 2000)
                return 3;
            else if (dist > 200 && dist < 400 && vel < 2000)
                return 2;
            else if (dist >= 400)
                return 1;
            else
                return 4;
        case 3:  // Condiciones nivel 3
            if (dist > 400 && dist < 600 && vel < 3000)
                return 2;
            else if (dist > 400 && dist < 600 && vel > 3000)
                return 3;
            else if (dist >= 600)
                return 1;
            else
                return 4;
    }
}
void lejos(int opcion) {
    const char *peligros[] = {"planeta", "meteoro", "hoyos negro"};
    int temp, vidaganada;
    printf("Estas tan lejos del %s que no es necesario esquivarlo o destruirlo\n", peligros[opcion - 1]);
    switch (opcion) {
        case 1:  // No se ganan planetas destruidos
            vidaganada = 70;
            break;
        case 2:
            temp = 20;  // Meteoros destruidos
            puntaje.destruidos += temp;
            vidaganada = 200;
            printf("Ganaste: %d %s destruidos\n", temp, peligros[opcion - 1]);
            break;
        case 3:
            temp = 40;  // objetos capturados
            puntaje.objetosCap += temp;
            vidaganada = 400;
            printf("Ganaste: %d %s destruidos \n", temp, peligros[opcion - 1]);
            break;
    }
    puntaje.vidas += vidaganada;
    printf("La nave a recargado capsulas\nObtienes %d capsulas\n=>\n", vidaganada);
}
void destruir(int opcion) {
    const char *peligros[] = {"Planeta", "Meteoro", "Hoyo negro"};
    int band, vidaP, aleat, vidaPDisparo;
    char resp[2];
    switch (opcion) {
        case 1:
            vidaPDisparo = 30;
            break;
        case 2:
            vidaPDisparo = 40;
            break;
        case 3:
            vidaPDisparo = 50;
            break;
    }
    printf("Puedes destruir el %s si lo deseas. Escribe 1 para SI o 0 para NO:", peligros[opcion - 1]);
    do {
        scanf("%s", resp);
        band = 1;
        if (strcmp(resp, "1") == 0 && puntaje.balas >= 120) {  // Respuesta afirmativa
            if ((puntaje.vidas >= 240 && opcion == 1) || (puntaje.vidas >= 320 && opcion == 2) || (puntaje.vidas >= 400 && opcion == 3)) {
                aleat = rand() % 3 + 8;        // Generando 8 a 10 disparos
                vidaP = aleat * vidaPDisparo;  // Se pierde 30 de vida por cada bala
                puntaje.vidas -= vidaP;        // Se le resta la vida perdida
                puntaje.balas -= aleat * 15;   // Se le restan las balas perdidas
                if (opcion == 1 || opcion == 3)
                    puntaje.destruidos += 1;  // Contador de destrucciones
                else
                    puntaje.destruidos += 20;
                printf("Haz destruido el %s con exito\n", peligros[opcion - 1]);
                printf("Las balas que utilizaste fueron %d, por lo tanto te quedan %d balas\n", (aleat * 15), puntaje.balas);
                printf("Perdiste %d vidas, te quedan %d vidas\n=>", vidaP, puntaje.vidas);
            } else
                printf("NO tienes vidas suficientes, por lo tanto se esquiva el %s en automatico\n=>\n", peligros[opcion - 1]);
        } else if (strcmp(resp, "1") == 0 && puntaje.balas < 120)  // Si no tiene balas suficientes
            printf("NO tienes balas suficientes, por lo tanto se esquiva el %s en automatico\n=>\n", peligros[opcion - 1]);
        else if (strcmp(resp, "0") == 0)
            printf("Decidiste esquivar el %s\n=>\n", peligros[opcion - 1]);  // Respuesta negativa
        else {
            printf("Escribe la opcion correcta\n=>\n");  // Si el usuario escribio otro caracter
            band = 0;                                    // Se asigna a opcion el valor de 3 para que no se salga del ciclo si escribio algo incorrecto
        }
    } while (band == 0);
}
void esquivar(int opcion) {
    const char *peligros[] = {"el planeta", "el meteoro", " el hoyo negro"};
    int temp, vidaganada;
    printf("Por poco y no la cuentas! Has esquivado por los pelos %s \nProcura no estar en estas situaciones...\n", peligros[opcion - 1]);
    switch (opcion) {
        case 1:
            // No se ganan planetas destruidos
            vidaganada = 50;
            puntaje.vidas += vidaganada;
        case 2:
            temp = 15;  // Meteoros destruidos
            puntaje.destruidos += temp;
            vidaganada = 100;
            puntaje.vidas += vidaganada;
            printf("\n Ganaste: 15 asteroides destruidos\n=>\n");
            break;
        case 3:
            temp = 30;  // objetos capurados
            puntaje.objetosCap += temp;
            vidaganada = 200;
            printf("Ganaste: %d objetos\n", temp);
            break;
    }
    printf("La nave a recargado capsulas\nObtienes %d capsulas\n=>\n", vidaganada);
}

int juegoperdido(int *i, int *perder, int peligrosGen, int opcion) {
    const char *peligros[] = {"Planeta", "Meteoro", "Hoyo negro"};
    int cont;
    printf("Oh no! A pesar de tus esfuerzos no se puede esquivar el %s, sera un impacto total...\n", peligros[opcion - 1]);
    sleep(1);
    printf("Impactaras con en:\n");
    for (cont = 3; cont > 0; cont--) {  // Se hace un conteo regresivo de 3 hasta el 1, esperando un segundo entre cada numero
        printf("%d\n", cont);
        sleep(1);
    }
    for (cont = 0; cont < 3; cont++) {  // Animacion espera
        printf(".");
        fflush(stdout);  // Con esta funcion hacemos que los caracteres se impriman inmediatamente
        sleep(1);
    }
    putchar('\n');
    // Grafico de bomba
    printf("                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n\x1b[31m");
    printf("La nave ha chocado de lleno contra el %s.\nHas perdido el juego debido a un terrible accidente...\n", peligros[opcion - 1]);
    printf("************************  GRACIAS POR JUGAR  ************************\n");
    printf("Pulse cualquier tecla para regresar al menu principal.\n=>\n");
    *i = peligrosGen;  // Se le asigna el valor de generados para que se acabe el ciclo for
    *perder = 1;       // Se usa una bandera para omitir la parte de la busqueda de objetos y el puntaje final
    return 1;
}

void objetos(int opcion) {
    const char *obj[] = {"Satelite", "Propulsor obsoleto", "Parte de nave abandonada", "Traje Espacial", "Objeto raro", "Jet Propulsor", "Armamento oxidado"};
    int distanciaObj, velocidad, aleat, i, band = 0, vidaP, objetoGanado;
    switch (opcion) {
        case 1:
            distanciaObj = rand() % 4;
            velocidad = rand() % 2501 + 1000;
            aleat = rand() % 3 + 1;
            vidaP = aleat * 20;  // Cada que se toma un objeto se pierden 20 capsulas de vida
            objetoGanado = 2;
            if (distanciaObj <= 2 && velocidad > 1500 && velocidad < 3000)
                band = 1;
            break;
        case 2:
            distanciaObj = rand() % 501 + 2300;  // Se da un numero random entre 2300 y 2800 (metros => 2.3km - 2.8km
            velocidad = rand() % 2001 + 2500;    // Genera una velocidad de 2500km/h a 4500km/h
            aleat = rand() % 11 + 10;
            vidaP = aleat * 30;
            objetoGanado = 13;
            if (distanciaObj <= 2500 && velocidad > 3000 && velocidad < 4000)
                band = 1;
            break;
        case 3:
            distanciaObj = rand() % 5;         // Se da un numero random entre 0 y 4 km
            velocidad = rand() % 2001 + 3500;  // Genra una velocidad de 3500km/h a 5500km/h
            aleat = rand() % 11 + 20;
            vidaP = aleat * 90;
            objetoGanado = 13;
            if (distanciaObj <= 3 && velocidad > 4000 && velocidad < 5000)
                band = 1;
            break;
    }
    if (band == 1) {
        printf("Te haz encontrado con una cantidad de %d '%s' \n", aleat, obj[rand() % 7]);  // Se encuentra con varios objetos del mismo tipo
        for (i = 0; i < 3; i++) {                                                            // Animacion Espera
            printf(".");
            fflush(stdout);
            sleep(1);
        }
        putchar('\n');
        if (puntaje.vidas >= vidaP) {
            puntaje.objetosCap += aleat;  // Contador de cuantos objetos se han capturado
            puntaje.vidas -= vidaP;
            printf("Te haz quedado con los objetos, a cambio de ello perdiste %d capsulas de vida.\nTe quedan %d capsulas\n", vidaP, puntaje.vidas);
        } else
            printf("No tienes vida necesaria para tomar los objetos ");
    } else
        printf("Encontraste un objeto pero desgraciadamente estabas muy lejos de el...\n");
    printf("Ademas, ya que superaste un peligro en tu recorido obtienes %d '%s'!\n=>\n", objetoGanado, obj[rand() % 7]);
    puntaje.objetosCap += objetoGanado;
    getch();
    putchar('\n');
}
int puntajeFinal(int opcion) {
    int sigNivel, valores[4];
    void subirPuntaje();
    switch (opcion) {
        case 1:
            valores[0] = 7000;
            valores[1] = 1000;
            valores[2] = 2;
            valores[3] = 10;
            break;
        case 2:
            valores[0] = 5000;
            valores[1] = 700;
            valores[2] = 100;
            valores[3] = 100;
            break;
        case 3:
            valores[0] = 3000;
            valores[1] = 300;
            valores[2] = 3;
            valores[3] = 1000;
            break;
    }
    printf("Valores: %d\n", valores[0]);
    // printf("Balas: %d\nVidas: %d\nDestruidos: %d\nObjetos Cap: %d\n",puntaje.balas,puntaje.vidas,puntaje.destruidos,puntaje.objetosCap);
    printf("Haz sobrevivido a este nivel, veamos tus estadisticas:\n");
    printf("Vidas totales: %d \nBalas finales: %d \nPeligros destruidos: %d \nObjetos Capturados: %d\n=>\n", puntaje.vidas, puntaje.balas, puntaje.destruidos, puntaje.objetosCap);
    getch();
    putchar('\n');
    if (puntaje.balas >= valores[0] && puntaje.vidas >= valores[1] && puntaje.destruidos >= valores[2] && puntaje.objetosCap >= valores[3]) {
        if (opcion != 3) {
            printf("Felicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel\n=>\n");
            printf("Pero antes escribe tu nombre para enlistarte en los puntajes:\n");
            fflush(stdin);
            subirPuntaje();
            return opcion++;
        } else
            printf("Felicidades, Has pasado el ultimo nivel con exito! Gracias por jugar\n=>\n");
        printf("Pero antes escribe tu nombre para enlistarte en los puntajes:\n");
        fflush(stdin);
        subirPuntaje();
        return 5;
    } else {
        printf("Oh no... No pudiste ganar debido a que te faltaron puntos...\n");
        printf("Intentalo de nuevo!\n=>\n");
        return 1;
    }
    getch();
    putchar('\n');
}
void subirPuntaje() {
    agregarRegistro();
}

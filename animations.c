#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void print_spaces(int n) {
    for (int i = 0; i < n; i++) {
        printf(" ");
    }
}

void print_spaceship(int width) {
    for (int i = 1; i <= width; i++) {
        print_spaces(i);
        printf("_\n");
        print_spaces(i);
        printf("| \\\n");
        print_spaces(i);
        printf("\\==[_|□)--._____\n");
        print_spaces(i);
        printf("/==[+--,-------'\n");
        print_spaces(i);
        printf(" [|_/¯¯\n");
        sleep(1);
        fflush(stdout);
        system("clear");
    }
}

int main() {
    system("clear");
    print_spaceship(20);
    return 0;
}
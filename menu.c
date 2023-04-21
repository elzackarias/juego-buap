#include <ncurses.h>

int main() {
  initscr();
  cbreak();
  noecho();

  WINDOW *yeswin = newwin(3, 10, 10, 20);
  WINDOW *nowin = newwin(3, 10, 10, 40);

  box(yeswin, 0, 0);
  box(nowin, 0, 0);

  wprintw(yeswin, "Sí");
  wprintw(nowin, "No");

  refresh();
  wrefresh(yeswin);
  wrefresh(nowin);

  int c;
  while ((c = getch()) != '\n') {
    if (c == 's') {
      wmove(yeswin, 1, 1);
      wattron(yeswin, A_REVERSE);
      wattroff(nowin, A_REVERSE);
    } else if (c == 'n') {
      wmove(nowin, 1, 1);
      wattron(nowin, A_REVERSE);
      wattroff(yeswin, A_REVERSE);
    }
    wrefresh(yeswin);
    wrefresh(nowin);
  }

  delwin(yeswin);
  delwin(nowin);
  endwin();
  return 0;
}
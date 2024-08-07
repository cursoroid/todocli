#include <ncurses.h>

int main()
{
  initscr();

    addstr("Hello Prathamesh ! \n");
    refresh();

    getch();

  endwin();
  return 0;
}

#include "select_class_dialog.h"
#include <QApplication>

int main(int argc, char *argv[])
{
  QApplication a(argc, argv);
  SelectClassDialog w;
  w.show();

  return a.exec();
}

#include "entersecretcodewindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
  QApplication a(argc, argv);
  EnterSecretCodeWindow w;
  w.show();

  return a.exec();
}

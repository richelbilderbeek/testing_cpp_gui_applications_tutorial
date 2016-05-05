#include "secretcodedialog.h"
#include <QApplication>

int main(int argc, char *argv[])
{
  QApplication a(argc, argv);
  SecretCodeDialog w;
  w.show();

  return a.exec();
}

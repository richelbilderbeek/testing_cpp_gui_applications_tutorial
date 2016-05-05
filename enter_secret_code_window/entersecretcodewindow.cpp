#include "entersecretcodewindow.h"
#include "ui_entersecretcodewindow.h"

EnterSecretCodeWindow::EnterSecretCodeWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::EnterSecretCodeWindow)
{
  ui->setupUi(this);
  this->setWindowTitle("Enter secret code");
}

EnterSecretCodeWindow::~EnterSecretCodeWindow()
{
  delete ui;
}

void EnterSecretCodeWindow::on_pushButton_clicked()
{
  close();
}

void EnterSecretCodeWindow::on_spinBox_valueChanged(int arg1)
{
  ui->pushButton->setEnabled(arg1 == 4242);
}

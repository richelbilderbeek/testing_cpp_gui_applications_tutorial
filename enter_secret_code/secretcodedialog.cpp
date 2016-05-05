#include "secretcodedialog.h"
#include "ui_secretcodedialog.h"

SecretCodeDialog::SecretCodeDialog(QWidget *parent) :
  QDialog(parent),
  ui(new Ui::SecretCodeDialog)
{
  ui->setupUi(this);
}

SecretCodeDialog::~SecretCodeDialog()
{
  delete ui;
}

void SecretCodeDialog::on_spinBox_valueChanged(int arg1)
{
  ui->pushButton->setEnabled(arg1 == 4242);
}

void SecretCodeDialog::on_pushButton_clicked()
{
  close();
}

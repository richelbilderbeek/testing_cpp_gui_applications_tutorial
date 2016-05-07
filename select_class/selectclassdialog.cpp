#include "selectclassdialog.h"
#include "ui_selectclassdialog.h"
#include <QMessageBox>

SelectClassDialog::SelectClassDialog(QWidget *parent) :
  QDialog(parent),
  ui(new Ui::SelectClassDialog)
{
  ui->setupUi(this);
}

SelectClassDialog::~SelectClassDialog()
{
  delete ui;
}

void SelectClassDialog::on_button_warrior_clicked()
{
  QMessageBox b;
  b.setWindowTitle("You've picked: warrior");
  b.setText("You've picked: warrior");
  b.exec();
  close();
}

void SelectClassDialog::on_button_mage_clicked()
{
  QMessageBox b;
  b.setWindowTitle("You've picked: mage");
  b.setText("You've picked: mage");
  b.exec();
  close();
}

void SelectClassDialog::on_button_thief_clicked()
{
  QMessageBox b;
  b.setWindowTitle("You've picked: thief");
  b.setText("You've picked: thief");
  b.exec();
  close();
}

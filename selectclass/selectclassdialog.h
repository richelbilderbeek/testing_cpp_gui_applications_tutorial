#ifndef SELECTCLASSDIALOG_H
#define SELECTCLASSDIALOG_H

#include <QDialog>

namespace Ui {
  class SelectClassDialog;
}

class SelectClassDialog : public QDialog
{
  Q_OBJECT

public:
  explicit SelectClassDialog(QWidget *parent = 0);
  ~SelectClassDialog();

private slots:

  void on_button_warrior_clicked();

  void on_button_mage_clicked();

  void on_button_thief_clicked();

private:
  Ui::SelectClassDialog *ui;
};

#endif // SELECTCLASSDIALOG_H

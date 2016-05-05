#ifndef SECRETCODEDIALOG_H
#define SECRETCODEDIALOG_H

#include <QDialog>

namespace Ui {
  class SecretCodeDialog;
}

class SecretCodeDialog : public QDialog
{
  Q_OBJECT

public:
  explicit SecretCodeDialog(QWidget *parent = 0);
  ~SecretCodeDialog();

private slots:
  void on_spinBox_valueChanged(int arg1);

  void on_pushButton_clicked();

private:
  Ui::SecretCodeDialog *ui;
};

#endif // SECRETCODEDIALOG_H

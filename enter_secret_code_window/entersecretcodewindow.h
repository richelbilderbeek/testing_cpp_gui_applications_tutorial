#ifndef ENTERSECRETCODEWINDOW_H
#define ENTERSECRETCODEWINDOW_H

#include <QMainWindow>

namespace Ui {
  class EnterSecretCodeWindow;
}

class EnterSecretCodeWindow : public QMainWindow
{
  Q_OBJECT

public:
  explicit EnterSecretCodeWindow(QWidget *parent = 0);
  ~EnterSecretCodeWindow();

private slots:
  void on_pushButton_clicked();

  void on_spinBox_valueChanged(int arg1);

private:
  Ui::EnterSecretCodeWindow *ui;
};

#endif // ENTERSECRETCODEWINDOW_H

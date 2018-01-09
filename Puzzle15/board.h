#ifndef BOARD_H
#define BOARD_H

#include <QObject>

//qml has array of objects, accessible by their number
//c++ has two-dimensional array - disposition

class Board : public QObject
{
    Q_OBJECT
public:
    explicit Board(QObject *parent = nullptr, const QString &configPath = "config.txt");

private:
    int disposition [15];

public:

signals:
//    void onInitStateReady(QVariantList initState);

public slots:
};

#endif // BOARD_H

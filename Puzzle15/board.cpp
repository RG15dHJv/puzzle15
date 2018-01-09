#include "board.h"

#include <QFile>
#include <QTextStream>
#include <QDebug>

Board::Board(QObject *parent, const QString &configPath) : QObject(parent)
{
    QString config;
    QFile configFile (configPath);

    if (configFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
            QTextStream stream(&configFile);
            config = stream.readLine();
    }

    qDebug() << config;
}

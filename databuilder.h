#ifndef DATABUILDER_H
#define DATABUILDER_H

#include <QObject>
#include <QtCharts>

class DataBuilder: public QObject
{
    Q_OBJECT
public:
    explicit DataBuilder(QObject * parent = nullptr);

    Q_INVOKABLE void paintChart(QXYSeries *series, int dataLen);

private:

};

#endif // DATABUILDER_H

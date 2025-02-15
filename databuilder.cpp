#include "databuilder.h"
#include <QXYSeries>
#include <QRandomGenerator>

DataBuilder::DataBuilder(QObject *parent): QObject{parent}
{}

void DataBuilder::paintChart(QXYSeries *series, int dataLen)
{
    QList<QPointF> points;
    int minDataVal = 0;
    int maxDataVal = 100;
    for(int i = 0; i < dataLen; i++){
        points.append(QPointF(i,QRandomGenerator::global()->bounded(minDataVal, maxDataVal + 1)));
    }
    series->replace(points);
    if(series->attachedAxes().size() >= 2)
    {
        series->attachedAxes().at(0)->setMax(dataLen); // x axis
        series->attachedAxes().at(1)->setMax(maxDataVal + 1); // y axis
        series->attachedAxes().at(1)->setMin(minDataVal - 1); // y axis
    }
}

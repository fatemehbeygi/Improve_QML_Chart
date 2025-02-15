#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databuilder.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    //when using qt charts instead of QGuiApplication, QApplication must be used
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DataBuilder dBuilder;
    engine.rootContext()->setContextProperty("databuilder", &dBuilder);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
#include "chatserver.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

     ChatServer cs;
    engine.rootContext()->setContextProperty("object",&cs);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

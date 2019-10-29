#include <QApplication>
#include <QQmlApplicationEngine>
#include "datasource.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DataSource dataSource( nullptr );
    engine.rootContext()->setContextProperty("dataSource", &dataSource);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    engine.load(url);

    return app.exec();
}

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "datasource.h"
#include "metermodel.h"

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DataSource dataSource( nullptr );
    engine.rootContext()->setContextProperty("dataSource", &dataSource);

#if METER_MODEL
    MeterModel meterModel;
    engine.rootContext()->setContextProperty("MeterModel", &meterModel);
#endif

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    engine.load(url);

    return app.exec();
}

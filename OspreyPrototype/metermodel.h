#ifndef METERMODEL_H
#define METERMODEL_H

#include <QObject>

class MeterModel : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(int opMode READ getOpMode WRITE setOpMode NOTIFY modeChanged)

public:
    MeterModel(){
        m_opMode=0;
        m_running=false;
    }

    int getOpMode() const { return m_opMode; }
    bool getRunning() const { return m_running; }

signals:
    void modeChanged();
    void runningChanged( bool running );

public slots:
    void setOpMode( int opMode );
    void setRunning( bool running );

private:
    int m_opMode;
    bool m_running;
};

#endif // METERMODEL_H

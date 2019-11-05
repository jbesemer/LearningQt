#if false
#include "metermodel.h"

void MeterModel::setOpMode( int opMode ){
    m_opMode=opMode;
    emit modeChanged();
}

void MeterModel::setRunning( bool running ){
    m_running=running;
    emit runningChanged(m_running);
}

#if false
void MeterModel::modeChanged(){
}

void MeterModel::runningChanged( bool running ){
}

#endif // false
#endif // false

#include "metermodel.h"

void MeterModel::setOpMode( int opMode ){
    m_opMode=opMode;
    emit modeChanged();
}

void MeterModel::setRunning( bool running ){
    m_running=running;
    emit runningChanged(m_running);
}

void MeterModel::modeChanged(){
}

void MeterModel::runningChanged( bool running ){
}


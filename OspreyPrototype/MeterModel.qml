import QtQuick 2.0

Item {
    id: meterModel

    // Zeroing //////////////////////////////////////////////////////

    property bool zeroing: false

    signal zeroingSucceeded()
    signal zeroingFailed()

    function startZeroing(){
        zeroing = true
        zeroingTimer.start()
    }

    function finishZeroing(){
        console.log("finishZeroing");
        var rand = Math.random()
        if( rand < 0.2){
            zeroingFailed()
        }else{
            zeroing = false
            zeroingSucceeded()
        }
    }

    Timer {
        id: zeroingTimer
        property int seconds: 2
        interval: seconds * 1000
        running: false
        repeat: false
        onTriggered: finishZeroing()
    }

    // OpMode & Continuous //////////////////////////////////////////

    property int opMode: 0

    function setOpMode( mode ){
        opMode=mode
    }

    property bool continuous: false

    onContinuousChanged: console.log("meter.Continuous: ", continuous )

    // Running //////////////////////////////////////////////////////

    property bool running: false
    property bool wasRunning: false

    onRunningChanged: {
        console.log("meter.running changed: ", wasRunning, "->", running )
        if(running){
            refreshTimer.repeat = continuous
            refreshTimer.start()
            started()
        }else{
            refreshTimer.stop()
            stopped()
        }
        wasRunning=running
    }

    function start(){ running=true }
    function stop(){ running=false }

    signal started()
    signal stopped()
    signal updateChart()

    Timer {
        id: refreshTimer
        interval: 1 / 60 * 1000 // 60 Hz
        running: false
        repeat: true
        onTriggered: {
            //console.log("Meter.Timer.UpdateChart" )
            updateChart()
            //console.log("Meter.Timer.Continuous: ", continuous )
            if(!continuous){
                meterModel.stop()
            }
            //dataSource.update(chartView.series(0));
            //dataSource.update(chartView.series(1));
        }
    }
}

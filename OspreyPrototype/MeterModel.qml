import QtQuick 2.0

Item {
    id: meterModel

    property bool zeroing:false

    signal zeroingSucceeded()
    signal zeroingFailed()

    function startZeroing(){
        zeroing = true
        zeroingTimer.start()
    }

    function finishZeroing(){
        console.log("finishZeroing");
        var rand = Math.random()
        if( rand < 0.5){
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

    property int opMode: 0

    function setOpMode( mode ){
        opMode=mode
    }

    property bool continuous: true

    property bool running: false

    function setRunning( isRunning ){
        running=isRunning
        if(running)
            start()
        else
            stop()
    }


    function start(){
        refreshTimer.repeat = continuous
        refreshTimer.start()
        started()
    }

    function stop(){
        refreshTimer.stop()
        stopped()
    }

    signal started()
    signal stopped()
    signal updateChart()

    Timer {
        id: refreshTimer
        interval: 1 / 60 * 1000 // 60 Hz
        running: false
        repeat: true
        onTriggered: {
            updateChart()
            if(!continuous)
                stop()
            //dataSource.update(chartView.series(0));
            //dataSource.update(chartView.series(1));
        }
    }
}

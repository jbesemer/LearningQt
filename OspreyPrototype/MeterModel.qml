import QtQuick 2.0

Item {
    id: meterModel

    property int opMode:0
    property bool running:false

    signal zeroingSucceeded()
    signal zeroingFailed()

    function setOpMode( mode ){
        opMode=mode
    }

    function setRunning( isRunning ){
        running=isRunning
    }

    function startZeroing(){
        zeroingTimer.start()
    }

    function finishZeroing(){
        console.log("finishZeroing");
        var rand = Math.random()
        if( rand < 0.5){
            zeroingFailed()
        }else{
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
}

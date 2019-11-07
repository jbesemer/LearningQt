import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

// ToolBar.qml

ColumnLayout{
    id:controls
    height:40

    function startRunning(){
        console.log("toolbar.startRunning");
        controlPanel.startRunning()
        runPauseButton.running = true
        isEnabled=false
    }

    function stopRunning(){
        console.log("toolbar.stopRunning");
        controlPanel.stopRunning()
        runPauseButton.running = false
        isEnabled=true
    }

    function startZeroing(){
        console.log("startZeroing");
        errors.hide()
        controls.enabled=false
        meterModel.startZeroing()
        messages.show( "Zeroing Meter" )
    }
    function zeroingSucceeded(){
        console.log("zeroingSucceeded");
        messages.hide()
        errors.hide()
        controls.enabled=true
    }
    function zeroingFailed(){
        console.log("zeroingFailed");
        errors.show( "Zeroing error")
    }

    property int isEnabled: !(meterModel.running || meterModel.zeroing)

    RowLayout{
        id:buttons
        Layout.fillWidth: true
        spacing: 4

        ImageButton{
            id:burgerButton
            image.source: "images/burger2.png"
            onClicked: burgerMenu.open()

            Menu{
                id:burgerMenu
                y:burgerButton.height

                MenuItem { text: "System Menu Item1" }
                MenuItem { text: "System Menu Item2" }
                MenuItem {
                    text: "Power Off"
                    onTriggered: Qt.quit()
                }
            }
        }

        Text {
            text: "Osprey"
            font.pointSize: 16
            color: "white"
        }

        ToggleButton{
            id:runPauseButton
            //height:parent.height
            //width: 40
            onChanged: {
                zeroingButton.enabled=!running
                //scopeView.isRunning=running
                meterModel.running=running;
            }
        }

        ImageButton{
            id: zeroingButton
            width:32; height: 32
            image.source:"images/download.png"

            onClicked:{
                startZeroing()
            }
        }

        ControlPanel {
            id: controlPanel

            function sourceNameToId(source){
                if (source === "sine")return 0;
                else if (source === "square")return 1;
                else if (source === "pulse")return 2;
                else
                    return 3;
            }

            property int currentSourceId: 0;
            property double currentAcquisitionRate: 0;

            onSignalSourceChanged: {
                currentSourceId = sourceNameToId(source);
                currentAcquisitionRate=acquisitionRate;
                dataSource.changeAcquisitionRate(currentAcquisitionRate);
                dataSource.generateData(currentSourceId, 6, sampleCount );
                scopeView.axisX().max = sampleCount;
            }
            onSeriesTypeChanged: scopeView.changeSeriesType(type);
            onRefreshRateChanged: scopeView.changeRefreshRate(rate);
            onAntialiasingEnabled: scopeView.antialiasing = enabled;
            onOpenGlChanged: scopeView.openGL = enabled;
            onOpModeChanged: {
                console.log("opModeChanged: ", opMode, continuous )
                meterModel.setOpMode( opMode )
                meterModel.continuous = continuous
            }
        }
    }
}


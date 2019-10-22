import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int isEnabled: 1

    RowLayout{
        id:toolbar
        anchors.topMargin: 0
        anchors.leftMargin: 0

        ToggleButton{
            id: startStop
            width:32; height: 32
            onChanged: {
                text.text = running?"On":"Off"
                zeroingButton.enabled = !running
            }
            enabled:isEnabled
        }   

        ToggleButton{
            id: zeroingButton
            width:32; height: 32
            image.source:"images/download.png"

            onClicked:{
                toolbar.enabled=false
                zeroingTimer.start()
                zeroingPopup.open()
            }

            Timer {
                id: zeroingTimer
                property int seconds: 4
                interval: seconds * 1000
                running: false
                repeat: false
                onTriggered: {
                    zeroingPopup.close()
                    toolbar.enabled=true
                }
            }
            Popup {
                id:zeroingPopup
                padding:4
                contentItem:Text{
                    font.pointSize: 18
                    text:"Zeroing Meter"
                }
            }
        }

        ColumnLayout{
            Text{
                text:"Samples"
                font.pointSize: 6
            }

            ComboBox {
                id: sampleCountButton
                height:20;width:30
                padding: 0

                property variant currentValue: model.get(currentIndex).value
                signal signalSourceChanged(variant selection)


                //text: "Samples: "
                textRole:"key"
                model: ListModel{
                   ListElement {key: "1K"; value: 1024 }
                   ListElement {key: "3K"; value: 3000 }
                   ListElement {key: "10K"; value: 10000 }
                   ListElement {key: "30K"; value: 30000}
                }

                onActivated: {
                    currentValue = model.get(index).value
                    console.log("Activated: ", index, currentValue);
                    signalSourceChanged(currentValue)
                }

                onSignalSourceChanged: {
                    console.log("Changed:", selection)
                }
            }
        }

        Text{
            id:text
            text:"Unk"
        }

        Button{
            text: "Start"
            onClicked: {
                startStop.setRunning(1)
            }
        }
        Button{
            text: "Stop"
            onClicked: {
                startStop.setRunning(0)
            }
        }
        Button{
            text: "Enabled"
            onClicked: {
                isEnabled=1
            }
        }
        Button{
            text: "Disabled"
            onClicked: {
                isEnabled=0
            }
        }
        Button{
            id:enButton
            text:"DoIt"
            icon.source:"images/action_stop.png"
            display:AbstractButton.IconOnly
            enabled:isEnabled
            onClicked: text.text="Donit"
        }
    }
}

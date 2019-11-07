import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

Item {
    id: button
    property string text: "Option: "
    property variant items: ["first"]
    property Menu menu
    property variant currentSelection: items[0]
    signal selectionChanged(variant selection)

    function select(index){
        currentSelection = index
        selectionChanged()
    }

    implicitWidth: buttonText.implicitWidth + 5
    implicitHeight: buttonText.implicitHeight// + 2//10

    Button {
        id: buttonText
        width: parent.width
        height: parent.height
        onClicked: menu.open()

        style: ButtonStyle {
            label: Component {
                Column{
                    //anchors.fill: parent
                    spacing: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: button.text
                        font.italic:true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 8
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: button.items[currentSelection]
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }
                }
            }
        }
    }
}

import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle{
    id:statistics
    color: "lightgreen"

    ListModel {
        id:statsModel

        ListElement {
            name: "Count"
            value: "1200"
        }
        ListElement {
            name: "Mean"
            value: "132.6 mW"
        }
        ListElement {
            name: "Minimum"
            value: "-3.21 mW"
        }
        ListElement {
            name: "Maximum"
            value: "1.23 W"
        }
    }

//    Column{
 //      Label {
   //         text: "Statistics Panel"
     //   }
    //}

    Component {
        id: statsDelegate

        Item {
            width: grid.cellWidth;
            height: grid.cellHeight

            Row{
                Text {
                    text:name
                    anchors{ left: parent.left }
                }
                Text {
                    text: value
                    anchors { right: parent.right }
                }
            }
        }
    }
    //Component {
      //  id: appHighlight
        //Rectangle { width: 80; height: 80; color: "lightsteelblue" }
    //}

    GridView {
        id:grid
        anchors.fill: parent
        cellWidth: 60; cellHeight: 20
        model: statsModel
        delegate: statsDelegate
        focus: true
        //highlight: appHighlight
    }
}

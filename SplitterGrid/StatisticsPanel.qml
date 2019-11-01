//import QtQuick 2.13
//import QtQuick.Controls 2.13
import QtQuick 2.2
import QtQuick.Controls 1.5
import QtQml.Models 2.2

Rectangle{
    id:statistics
    color: "lightgreen"

    TableView  {
        id: table
        anchors.fill: parent
        model: StatsModel {}

        TableViewColumn{
            id: name
            role:"name"
            title:"Name"
            horizontalAlignment : Text.AlignRight
            width: 100 // parent.width / 2
        }

        TableViewColumn{
            id: value
            role:"value"
            title:"Value"
            horizontalAlignment : Text.AlignLeft
            width: 150 // parent.width / 2
        }

        onWidthChanged: {
            name.width = width / 2
            value.width = width / 2
        }
    }
}

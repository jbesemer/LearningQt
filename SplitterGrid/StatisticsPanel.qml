//import QtQuick 2.13
//import QtQuick.Controls 2.13
import QtQuick 2.2
import QtQuick.Controls 1.5
import QtQml.Models 2.2

Rectangle{
    id:statistics
    color: "lightgreen"

    TableView  {
        anchors.fill: parent
        model: StatsModel {}

        TableViewColumn{
            role:"name"
            title:"Name"
            width:40
        }
        TableViewColumn{
            role:"value"
            title:"Value"
            width:40
        }

    }
}

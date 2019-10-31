import QtQuick 2.13
//import QtQuick.Controls 2.13

Rectangle{
    id:statistics
    color: "lightgreen"

    TableView  {
        anchors.fill: parent
        columns:2
        columnSpacing: 1
        rowSpacing: 1
        clip:true
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

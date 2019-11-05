import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

// GraphicsPanel.qml
ColumnLayout {
    property alias scopeView: scopeView

    TabBar {
        id: bar
        width: parent.width
        height: 10
        currentIndex: 0

        TabButton {
            text: qsTr("Trend")
            height: parent.height
        }
        TabButton {
            text: qsTr("Tuning")
            height: parent.height
            width:80
        }
        TabButton {
            text: qsTr("Histogram")
            height: parent.height
            width: 100
        }
        TabButton {
            text: qsTr("Beam Position")
            height: parent.height
            width: 100
        }
    }

    StackLayout {
        id:stack
        width: parent.width
        currentIndex: bar.currentIndex

        property alias scopeView: scopeView

        Item {
            id: trendTab
            ScopeView{
                id:scopeView
                anchors.fill: parent
            }
        }
        Item {
            id: tuningTab
            Text {
                text: qsTr("Tuning")
            }
        }
        Item {
            id: histogramTab
            Text {
                text: qsTr("Histogram")
            }
        }
        Item {
            id: beamPositionTab
            Text {
                text: qsTr("Beam Position")
            }
        }
    }
}

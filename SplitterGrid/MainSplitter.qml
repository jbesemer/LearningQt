// MainSplitter.qml

import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

SplitView {
    //anchors.fill: parent
    orientation: Qt.Horizontal

    SplitView {
        orientation: Qt.Vertical
        SplitView.fillWidth: true
        //SplitView.minimumWidth: 50

        MeasurementPanel{
            Layout.row:1
            Layout.column: 0
            Layout.fillWidth: true
        }

        ScopeView{
            Layout.row:2
            Layout.column: 0
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    StatisticsPanel{
        Layout.row:1
        Layout.column: 1
        Layout.rowSpan: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}

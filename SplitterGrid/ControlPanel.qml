import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

RowLayout {
    property alias openGLButton: openGLButton
    property alias antialiasButton: antialiasButton
    Layout.fillWidth: true
    signal animationsEnabled(bool enabled)
    signal seriesTypeChanged(string type)
    signal acquisitionRateChanged(variant rate);
    signal refreshRateChanged(variant rate);
    signal signalSourceChanged(string source, int signalCount, int sampleCount, double acquisitionRate);
    signal antialiasingEnabled(bool enabled)
    signal openGlChanged(bool enabled)
    signal opModeChanged(string opMode, bool continuous)

    readonly property int defaultSignalCount: 5;

    property int firstIndex:0
    property int lastIndex:4
    property int maxIndex:6
    property int scrollingIconWidth:8

    function scrollLeft(){
        if( firstIndex > 0 ){
            firstIndex--
            lastIndex--
        }
    }

    function scrollRight(){
        if( lastIndex < maxIndex ){
            firstIndex++
            lastIndex++
        }
    }

    ImageButton{
        image.source: "images/action_left.png"
        width:scrollingIconWidth
        enabled: firstIndex > 0
        onClicked:scrollLeft()
    }

    MultiButton {
        id: operatingModeButton
        text: "Op Mode"
        items: ["Power", "Energy", "BTU/F'night"]
        currentSelection: 0
        onSelectionChanged: opModeChanged( selection, continuousButton.currentSelection );
        property int index:0
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        id: acquisitionRateButton
        text: "Acq Speed"
        items: ["10", "30", "100", "300"] //, "500", "1200"]
        currentSelection: 2
        onSelectionChanged: signalSourceChanged(
                                signalSourceButton.items[signalSourceButton.currentSelection],
                                defaultSignalCount,
                                sampleCountButton.items[sampleCountButton.currentSelection],
                                selection);
        property int index:1
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        id: sampleCountButton
        text: "Samples"
        items: ["1024", "3000", "10000", "30000"]
        currentSelection: 1
        onSelectionChanged: signalSourceChanged(
                                signalSourceButton.items[signalSourceButton.currentSelection],
                                defaultSignalCount,
                                selection,
                                acquisitionRateButton.items[acquisitionRateButton.currentSelection]);
        property int index:2
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        id: continuousButton
        text: "Continuous"
        items: ["Continuous", "OneShot"]
        currentSelection: 1
        onSelectionChanged: opModeChanged( operatingModeButton.currentSelection, selection );
        property int index:3
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        text: "Refresh rate"
        items: ["1", "3", "10", "30", "100", "300" ]
        currentSelection: 2
        onSelectionChanged: refreshRateChanged(items[currentSelection]);
        property int index:4
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        id: signalSourceButton
        text: "Source"
        items: ["sine", "square", "pulse"]
        currentSelection: 0
        onSelectionChanged: signalSourceChanged(
                                selection,
                                defaultSignalCount,
                                sampleCountButton.items[sampleCountButton.currentSelection],
                                acquisitionRateButton.items[acquisitionRateButton.currentSelection]);
        property int index:5
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        id: openGLButton
        text: "OpenGL"
        items: ["false", "true"]
        currentSelection: 1
        onSelectionChanged: openGlChanged(currentSelection == 1);
        property int index:6
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        text: "Graph"
        items: ["line", "scatter"]
        currentSelection: 0
        onSelectionChanged: seriesTypeChanged(items[currentSelection]);
        property int index:7
        visible: firstIndex <= index && index <=  lastIndex
    }

    MultiButton {
        id: antialiasButton
        text: "Antialias"
        items: ["OFF", "ON"]
        enabled: true
        currentSelection: 0
        onSelectionChanged: antialiasingEnabled(currentSelection == 1);
        property int index:8
        visible: firstIndex <= index && index <=  lastIndex
    }

    ImageButton{
        image.source: "images/action_right.png"
        width:scrollingIconWidth
        enabled: lastIndex < maxIndex
        onClicked:scrollRight()
    }

    ImageButton{
        id:gearButton
        image.source: "images/gear.png"
        onClicked: gearMenu.open()

        Menu{
            id:gearMenu
            y:gearButton.height

            MenuItem {
                text: "Open GL"
                checkable: true
                checked:true
                onTriggered: antialiasingEnabled(checked);
            }

            MenuItem {
                text: "Line Graph"
                checkable: true
                checked:true
                onTriggered: seriesTypeChanged(checked ? "line" : "scatter")
            }

            MenuItem {
                text: "Antialias"
                checkable: true
                checked:true
                onTriggered: antialiasingEnabled(checked)
            }

            MenuItem { text: "Configuration Menu Item2" }
            MenuItem { text: "Configuration Menu Item3" }
        }
    }
}

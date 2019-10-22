import QtQuick 2.13
import QtQuick.Controls 2.3
//import QtQuick.Controls.Styles 2.5

Item{
    id:comboButton

    property string text: "Option: "
    property variant items: [First]
    property int currentSelection: 0
    property variant currentValue: none
    signal selectionChanged(variant selection)


    ComboBox{
        id:comboBox
        width: parent.width
        height: parent.height
        model:items
        currentIndex: currentSelection

        onActivated: {
            currentSelection=index
            currentValue=items[index]
            selectionChanged(currentValue)
        }
    }
}

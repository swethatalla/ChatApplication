import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Coding Challenge Chat Tool")
    property string message: ""
ChatForm{
    width:parent.width
    height:parent.height
}
}

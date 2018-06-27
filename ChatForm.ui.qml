import QtQuick 2.4
import QtQuick 2.9
import QtQuick.Controls 1.4

Rectangle {
    id: rectangle
    property alias rectangle: rectangle
    property alias user1: user1
    property alias username1: username1
    property alias user1_msg: user1_msg
    property alias user1_send: user1_send
    property alias userOneMessageText: userOneMessageText
    property alias user2: user2
    property alias username2: username2
    property alias user2_msg: user2_msg
    property alias user2_send: user2_send
    property alias userTwoMessageview: userTwoMessageview
    property alias userTwoMessageText: userTwoMessageText
    property alias userOneMessageview: userOneMessageview
    Rectangle {
        width: parent.width
        height: parent.height * 0.5
        id: user1
        border.color: qsTr("black")
        border.width: 2
        Label {
            id: username1
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 15
            anchors.leftMargin: 15
            text: qsTr("Ian")
            font.pixelSize: 22
            color: qsTr("blue")
        }
        TextField {
            id: user1_msg
            anchors.top: username1.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 2
            height: 50
            width: parent.width - 150
            placeholderText: qsTr("Enter message ...")
        }
        Button {
            id: user1_send
            anchors.top: username1.bottom
            anchors.topMargin: 10
            anchors.left: user1_msg.right
            height: 50
            width: 100
            text: qsTr("Send")
        }
        ScrollView {
            id: userOneMessageview
            property alias messageText: userOneMessageText.text
            anchors {
                left: parent.left
                right: parent.right
                top: user1_msg.bottom
                bottom: parent.bottom
                margins: 4
            }

            TextEdit {
                id: userOneMessageText
                readOnly: true
                textFormat: Text.RichText // enables HTML formatting
                font.family: "Helvetica"
                font.pointSize: 14
                color: "blue"
            }
        }
    }
    Rectangle {
        width: parent.width
        height: parent.height * 0.5
        anchors.top: user1.bottom
        id: user2
        border.color: qsTr("black")
        border.width: 2
        Label {
            id: username2
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 15
            anchors.leftMargin: 15
            text: qsTr("Coding Challenge")
            font.pixelSize: 22
            color: "blue"
        }
        TextField {
            id: user2_msg
            anchors.top: username2.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 2
            height: 50
            width: parent.width - 150
            placeholderText: qsTr("Enter message ...")
        }
        Button {
            id: user2_send
            anchors.top: username2.bottom
            anchors.topMargin: 10
            anchors.left: user2_msg.right
            height: 50
            width: 100
            text: qsTr("Send")
        }
        ScrollView {
            id: userTwoMessageview
            property alias messageText: userTwoMessageText.text
            anchors {
                left: parent.left
                right: parent.right
                top: user2_msg.bottom
                bottom: parent.bottom
                margins: 4
            }

            TextEdit {
                id: userTwoMessageText
                readOnly: true
                textFormat: Text.RichText // enables HTML formatting
                font.family: "Helvetica"
                font.pointSize: 14
                color: "blue"
            }
        }
    }
}

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
    user1_send.onClicked:  {
        if(user1_msg.text.length>0){
          userOneMessageview.messageText+="<b><font color=\"red\">Ian: </b>"+ user1_msg.text
          userTwoMessageview.messageText+="<b><font color=\"red\">Ian: </b>"+ user1_msg.text

            }


        user1_msg.text="";

        }

    user2_send.onClicked:  {
        if(user2_msg.text.length>0){
            userOneMessageview.messageText+="<b><font color=\"blue\">Coding Challenge: </b>"+ user2_msg.text
            userTwoMessageview.messageText+="<b><font color=\"blue\">Coding Challenge: </b>"+ user2_msg.text
        user2_msg.text="";

        }
    }

}
}

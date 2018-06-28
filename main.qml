import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Coding Challenge Chat Tool")
    property string message: ""
ChatForm{
    id:cf
    width:parent.width
    height:parent.height
    Component.onCompleted: {
        registerUsers();

    }
    function registerUsers()
    {
        var obj1 = {
            'username':"Ian",
            'color': "Red",
        };
        var obj2 = {
            'username':"Coding Challenge",
            'color': "Blue",
        };
    object.registerUser(obj1);
    object.registerUser(obj2);
    }
    Connections {
        target: object
     onUpdate: {
        console.log(object.client);
         if(object.client.username==="Ian")
             cf.userOneMessageview.messageText+="<b><font color=\" "+ object.client.color+"\">"+from+": </b>"+ object.message;
         else if(object.client.username==="Coding Challenge")
             cf.userTwoMessageview.messageText+="<b><font color=\" "+ object.client.color+"\">"+from+": </b>"+ object.message;

     }
    }

    user1_send.onClicked:  {
        if(user1_msg.text.length>0){
            object.sendMessage("Ian","Coding Challenge",user1_msg.text);
             userOneMessageview.messageText+="<b><font color=\"red\">Ian: </b>"+ user1_msg.text;
               user1_msg.text="";

            }
        }

    user2_send.onClicked:  {
        if(user2_msg.text.length>0){
            object.sendMessage("Coding Challenge","Ian",user2_msg.text);
            userTwoMessageview.messageText+="<b><font color=\"blue\">Coding Challenge: </b>"+ user2_msg.text;
             user2_msg.text="";

        }
    }

}
}

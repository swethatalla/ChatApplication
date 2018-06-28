import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Coding Challenge Chat Tool")
ChatForm{
    id:cf
     property var color:["Red","Blue"];
    width:parent.width
    height:parent.height
    Component.onCompleted: {
        registerUsers();

    }
    function registerUsers()
    {
        for (var i = 0; i < cf.children.length; i++)
        {
        console.log("item "+i);
        console.log(cf.children[i].children[0].text);
            var obj = {
                'username':cf.children[i].children[0].text,
                'color': color[i]
            };
            object.registerUser(obj);
        }
    }
    Connections {
        target: object
     onUpdate: {
        console.log(object.client);
         for (var i = 0; i < cf.children.length; i++)
         {
         console.log("item "+i);
         console.log(cf.children[i].children[0].text);
         if(object.client.username===cf.children[i].children[0].text)
         {
             cf.children[i].children[3].messageText+="<b><font color=\" "+ object.client.color+"\">"+from+": </b>"+ object.message;
         }
         }

     }
    }

    user1_send.onClicked:  {
        if(user1_msg.text.length>0){
                        object.client.username=username1.text;
                      object.client.color=color[0];
                       object.message=user1_msg.text;
                       object.sendMessage(username2.text);
                     userOneMessageview.messageText+="<b><font color=\"red\">"+username1.text+": </b>"+ user1_msg.text;
            user1_msg.text="";

            }
        }

    user2_send.onClicked:  {
        if(user2_msg.text.length>0){
                       object.client.username=username2.text;
                        object.client.color=color[1];
                        object.message=user2_msg.text;
                        object.sendMessage(username1.text);
                        userTwoMessageview.messageText+="<b><font color=\"blue\">"+username2.text+": </b>"+ user2_msg.text;
                        user2_msg.text="";

        }
    }

}
}

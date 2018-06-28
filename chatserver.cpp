#include "chatserver.h"
#include<iostream>
#include <QDebug>
ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{

}
void ChatServer::setMyclient(const MyStruct &cli)
{
    v_client=cli;
}
MyStruct ChatServer::getMyclient()
{
    return v_client;
}
void ChatServer::registerUser(const QVariant &user)
{
    QVariantMap userMap = user.toMap();
    std::map<string,struct MyStruct>::iterator it;
    it = clients_.find(userMap.value("username").toString().toStdString());
    if (it == clients_.end())
    {
      qDebug() << "Setting user"+userMap.value("username").toString();
      MyStruct user;
      user.m_color=userMap.value("color").toString();
      user.m_username=userMap.value("username").toString();
      setMyclient(user);
      clients_.insert(std::make_pair(getMyclient().m_username.toStdString(),getMyclient()));
      for (std::map<string,struct MyStruct>::iterator it=clients_.begin(); it!=clients_.end(); ++it)
      {
          QString var =QString::fromStdString(it->first);
          qDebug()<<var;
      }
    }
}

void ChatServer::sendMessage(const QVariant &to)
{

    MyStruct from1;
    MyStruct to1;
    std::map<string,struct MyStruct>::iterator it;
    std::map<string,struct MyStruct>::iterator it1;
    QString from_user=getMyclient().m_username;
    it = clients_.find(from_user.toStdString());
     if (it != clients_.end())
     {
          qDebug() << "in from";
     it1 = clients_.find(to.toString().toStdString());
      if (it1 != clients_.end())
      {
          MyStruct from=it->second;

          qDebug() << "in client";
          to1=it1->second;
          to1.m_color=from.m_color;

          setMyclient(to1);
      }
    emit update(from_user);
     }
}

QVariant ChatServer:: message(){
    return v_message;
}

void ChatServer:: setMessage(const QVariant &msg)
{
    if(v_message==msg)
    {
        return;
    }
    v_message=msg;

}


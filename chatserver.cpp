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
      qDebug() << "Setting user "+userMap.value("username").toString();
      MyStruct user;
      user.m_color=userMap.value("color").toString();
      user.m_username=userMap.value("username").toString();
      setMyclient(user);
      clients_.insert(std::make_pair(getMyclient().m_username.toStdString(),getMyclient()));
      qDebug() << "Users";
      for (std::map<string,struct MyStruct>::iterator it=clients_.begin(); it!=clients_.end(); ++it)
      {
          QString var =QString::fromStdString(it->first);
          qDebug()<<var;
      }
    }
}

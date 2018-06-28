#ifndef CHATSERVER_H
#define CHATSERVER_H
#include <QObject>
#include <QString>
#include <QVariant>
using namespace std;
struct MyStruct {
    Q_GADGET
public:
    QString m_username;
    QString m_color;
    Q_PROPERTY(QString username MEMBER m_username)
    Q_PROPERTY(QString color MEMBER m_color)
};
 Q_DECLARE_METATYPE(MyStruct)
class ChatServer: public QObject
{
    Q_OBJECT
    Q_PROPERTY(MyStruct client READ getMyclient WRITE setMyclient)
    Q_PROPERTY(QVariant message READ message WRITE setMessage NOTIFY update)
public:
    Q_INVOKABLE void registerUser(const QVariant&  user);
    Q_INVOKABLE void sendMessage(const QVariant&  from, const QVariant&  to, const QVariant&  msg);

    QVariant message();
    void setMessage(const QVariant&);

    void setMyclient(const MyStruct&) ;
    MyStruct getMyclient();

    explicit ChatServer(QObject *parent = nullptr);

signals:
    void update(const QString& from, const MyStruct&  to, const QVariant&);

private:
    QVariant v_message;
    MyStruct v_client;
    std::map<string, struct MyStruct>clients_;

};

#endif // CHATSERVER_H

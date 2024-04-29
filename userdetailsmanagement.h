#ifndef USERDETAILSMANAGEMENT_H
#define USERDETAILSMANAGEMENT_H

#include <QObject>
#include <QtSql>

class UserDetailsManagement : public QObject
{
    Q_OBJECT
public:
    explicit UserDetailsManagement(QObject *parent = nullptr);

public slots:
    void saveUserDetails(const QString &username, const QString &email, const QString &password);
    bool authenticateUser(const QString &username, const QString &password);

private:
    QSqlDatabase m_database;
    bool openDatabase();
};

#endif // USERDETAILSMANAGEMENT_H

#include "userdetailsmanagement.h"

#include <QDebug>

UserDetailsManagement::UserDetailsManagement(QObject *parent)
    : QObject{parent}
{
    if (!openDatabase()) {
        qDebug() << "Failed to open database.";
    }
}

bool UserDetailsManagement::openDatabase()
{
    m_database = QSqlDatabase::addDatabase("QSQLITE");

    // Update the path based on your project file location
    m_database.setDatabaseName("C:/Users/prana/OneDrive/Desktop/QT-QML-projects/QMLLoginPage/user_database.db");

    if (!m_database.open()) {
        qDebug() << "Failed to open database:" << m_database.lastError().text();
        return false;
    }

    QSqlQuery query;
    if (!query.exec("CREATE TABLE IF NOT EXISTS users ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "username TEXT,"
                    "email TEXT,"
                    "password TEXT)")) {
        qDebug() << "Failed to create table:" << query.lastError().text();
        return false;
    }

    return true;
}

void UserDetailsManagement::saveUserDetails(const QString &username, const QString &email, const QString &password)
{
    QSqlQuery query;
    query.prepare("INSERT INTO users (username, email, password) VALUES (:username, :email, :password)");
    query.bindValue(":username", username);
    query.bindValue(":email", email);
    query.bindValue(":password", password);

    if (!query.exec()) {
        qDebug() << "Failed to insert user details:" << query.lastError().text();
        return;
    }

    qDebug() << "User details saved successfully.";
}

bool UserDetailsManagement::authenticateUser(const QString &username, const QString &password)
{
    QSqlQuery query;
    query.prepare("SELECT * FROM users WHERE username = :username AND password = :password");
    query.bindValue(":username", username);
    query.bindValue(":password", password);
    if (!query.exec()) {
        qDebug() << "Query failed:" << query.lastError().text();
        return false;
    }
    return query.next();
}

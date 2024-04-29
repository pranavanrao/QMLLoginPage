import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.0

Item {
    id: root

    Rectangle {
        width: parent.width
        height: parent.height
        color: "lightgreen"

        Image {
            id: backButton
            source: "qrc:/images/back-button.png"
            width: 40
            fillMode: Image.PreserveAspectFit

            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 20
                topMargin: 20
            }

            MouseArea {
                anchors.fill: parent

                onClicked: stack.pop()

                onPressed: backButton.width = 35
                onReleased: backButton.width = 40
            }
        }

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            Text {
                text: "Signup"
                font.bold: true
                font.pixelSize: 20
            }

            TextField {
                id: usernameField
                placeholderText: "Username"
            }

            TextField {
                id: emailField
                placeholderText: "Email"
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
            }

            TextField {
                id: confirmPasswordField
                placeholderText: "Confirm Password"
                echoMode: TextInput.Password
            }

            Button {
                text: "Signup"
                onClicked: {
                    var username = usernameField.text
                    var email = emailField.text
                    var password = passwordField.text
                    var confirmPassword = confirmPasswordField.text

                    if (password != confirmPassword) {
                        messageBox.visible = true;
                        return;
                    }

                    var userDetails = {
                        "username": username,
                        "email": email,
                        "Password": password
                    }

                    var file = Qt.createFile("user")

                    console.log("Signup details saved:", fileText);
                }
            }

            Text {
                id: messageBox
                text: ""
                color: "red"
                visible: false
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

Item {
    id: root

    Rectangle {
        width: parent.width
        height: parent.height
        color: "lightblue"

        BackButton {}

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

            ButtonWidget {
                txt: "Signup"

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (passwordField.text !== confirmPasswordField.text) {
                            messageBox.color = "red";
                            return;
                        }
                        userDetailsManager.saveUserDetails(usernameField.text, emailField.text, passwordField.text);
                    }
                }
            }

            Text {
                id: messageBox
                text: "Password doesn't match confirm password"
                color: "transparent"
            }
        }
    }
}

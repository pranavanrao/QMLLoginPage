import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

Item {
    id: root

    property string userName: ""
    property string email: ""
    property string password: ""
    property string confirmPassword: ""

    BackButton {}

    Rectangle {
        width: parent.width
        height: parent.height
        color: "lightblue"

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
                onTextChanged: root.userName = text
            }

            TextField {
                id: emailField
                placeholderText: "example@example.com"
                onTextChanged: {
                    root.email = text
                }
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
                onTextChanged: root.password = text
            }

            TextField {
                id: confirmPasswordField
                placeholderText: "Confirm Password"
                echoMode: TextInput.Password
                onTextChanged: root.confirmPassword = text
            }

            ButtonWidget {
                txt: "Signup"

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (userName.trim() === "" || email.trim() === "" || password.trim() === "" || confirmPassword.trim() === "") {
                            dialog.visible = true
                            dialogText.text = "Enter all fields!!!"
                            return;
                        }

                        if (passwordField.text !== confirmPasswordField.text) {
                            dialog.visible = true
                            dialogText.text = "Password do not match!!!"
                            return;
                        }

                        if (!emailValidation(root.email)) {
                            dialog.visible = true;
                            dialogText.text = "Enter valid email!!!"
                            return;
                        }

                        userDetailsManager.saveUserDetails(usernameField.text, emailField.text, passwordField.text);
                        stack.pop();
                    }
                }
            }

            Dialog {
                id: dialog
                title: "Error"
                standardButtons: Dialog.Ok
                visible: false
                Text {
                    id: dialogText
                    text: ""
                    font.bold: true
                }
            }
        }
    }

    function emailValidation(email) {
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return emailPattern.test(email);
    }
}

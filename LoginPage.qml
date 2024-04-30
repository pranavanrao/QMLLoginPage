import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property color colorNormal: "black"
    property color colorHover: "blue"
    property color colorPressed: "darkblue"

    Rectangle {
        width: parent.width
        height: parent.height
        color: "lightblue"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            Text {
                text: "Login"
                font.bold: true
                font.pixelSize: 20
            }

            TextField {
                id: usernameField
                placeholderText: "Username"
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
            }

            ButtonWidget {
                txt: "Login"

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        var username = usernameField.text
                        var password = passwordField.text

                        if (userDetailsManager.authenticateUser(username, password)) {
                            stack.push("qrc:/homePage.qml")
                        } else {
                            dialog.visible = true;
                        }
                    }
                }
            }

            Text {
                id: signupText
                text: "Don't have account, signup."
                color: root.colorNormal
                font.pointSize: 10

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: signupText.color = root.colorHover
                    onExited: signupText.color = root.colorNormal
                    onPressed: signupText.color = root.colorPressed
                    onReleased: signupText.color = root.colorHover
                    onClicked: stack.push("qrc:/SignupPage.qml")
                }
            }

            Dialog {
                id: dialog
                title: "Error"
                standardButtons: Dialog.Ok
                visible: false
                Text {
                    text: "Invalid username or password!!!"
                    font.bold: true
                }
            }
        }
    }
}

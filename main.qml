import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 300
    title: "Login Page"

    Rectangle {
        id: loginRect
        width: 300
        height: 200
        anchors.centerIn: parent
        border.color: "lightblue"
        border.width: 2
        radius: 10

        Column {
            id: loginForm
            spacing: 10
            anchors.centerIn: parent

            TextField {
                id: usernameInput
                width: 200
                placeholderText: "Username"
                font.pixelSize: 16
                focus: true
            }

            TextField {
                id: passwordInput
                width: 200
                placeholderText: "Password"
                font.pixelSize: 16
                echoMode: TextInput.Password
            }

            Button {
                id: loginButton
                width: 100
                text: "Login"
                onClicked: {
                    var username = usernameInput.text;
                    var password = passwordInput.text;

                    if (username === "admin" && password === "admin") {
                        console.log("Login successful");
                        Qt.quit(); // Quit the application
                    } else {
                        console.log("Login failed");
                        messageBox.text = "Invalid username or password!";
                        messageBox.visible = true;
                    }
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

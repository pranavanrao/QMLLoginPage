import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

Rectangle {
    id: homePage

    color: "#F4FF9B"

    // BackButton {}

    ButtonWidget {
        txt: "Logout"
        btnColorNormal: "red"
        btnColorHovered: "darkred"

        anchors {
            top: parent.top
            right: parent.right
            margins: 20
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                dialog.visible = true
            }
        }
    }

    Text {
        id: homeText
        text: qsTr("You have successfully logged in to the home page!!!")
        font.pixelSize: homePage.width / 40
        font.bold: true
        font.family: "Courier New"
        anchors.centerIn: parent
    }

    Dialog {
        id: dialog
        title: "Error"
        standardButtons: Dialog.Ok
        visible: false
        Text {
            id: dialogText
            text: "Are you sure?"
            font.bold: true
        }
        onAccepted: stack.pop();
    }
}

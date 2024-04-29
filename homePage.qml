import QtQuick 2.15

Rectangle {
    id: homePage

    color: "#F4FF9B"

    BackButton {}

    Text {
        id: homeText
        text: qsTr("You have successfully logged in to the home page!!!")
        font.pixelSize: homePage.width / 40
        font.bold: true
        font.family: "Courier New"
        anchors.centerIn: parent
    }
}

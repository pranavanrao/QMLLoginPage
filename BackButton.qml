import QtQuick 2.15

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

import QtQuick 2.15

Item {
    id: btnWidget

    width: 150
    height: 60

    property color btnColorNormal: "green"
    property color btnColorHovered: "darkgreen"

    property string txt

    Rectangle {
        id: btnRect
        anchors.fill: parent
        color: btnWidget.btnColorNormal
        radius: 10

        Text {
            id: btnTxt
            text: btnWidget.txt
            color: "white"
            anchors.centerIn: parent
            font.pointSize: 12
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: btnRect.color = btnWidget.btnColorHovered
            onExited: btnRect.color = btnWidget.btnColorNormal
        }
    }
}

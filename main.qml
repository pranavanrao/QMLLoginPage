import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Simple Login Page")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: login
    }

    Component {
        id: login
        LoginPage {}
    }

    Component {
        id: signup
        SignupPage {}
    }
}

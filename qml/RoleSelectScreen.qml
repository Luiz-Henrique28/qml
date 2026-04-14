import QtQuick 6.4
import QtQuick.Shapes 1.0

Item {
    id: roleSelectScreen

    signal irParaLogin()
    signal voltar()

    // Fundo cinza claro
    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.45
        color: "#F8F9FA"

        Rectangle {
            x: 20; y: 20
            width: 30; height: 30
            radius: 15
            color: "#E0E0E0"
            Text {
                anchors.centerIn: parent
                text: "<"
                font.pixelSize: 18
                font.bold: true
                color: "#1A3FA3"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: roleSelectScreen.voltar()
            }
        }

        MedCrossLogo {
            anchors.centerIn: parent
            width: 90
            height: 90
        }
    }

    Shape {
        id: curva
        anchors.bottom: painel.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 60

        ShapePath {
            fillColor: "#0052CC"
            strokeColor: "transparent"
            startX: 0
            startY: curva.height
            PathLine { x: 0; y: curva.height }
            PathQuad {
                x: curva.width
                y: curva.height
                controlX: curva.width / 2
                controlY: -10
            }
            PathLine { x: curva.width; y: curva.height }
            PathLine { x: 0; y: curva.height }
        }
    }

    Rectangle {
        id: painel
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.55
        color: "#0052CC"

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.75

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Você é:"
                font.pixelSize: 26
                font.bold: true
                color: "#FFFFFF"
            }

            // Botão Paciente
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: 52
                radius: 26
                color: "transparent"
                border.color: "#FFFFFF"
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    text: "Paciente"
                    font.pixelSize: 17
                    font.bold: true
                    font.underline: true
                    color: "#FFFFFF"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: roleSelectScreen.irParaLogin()
                }
            }

            // Botão Médico
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: 52
                radius: 26
                color: "transparent"
                border.color: "#FFFFFF"
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    text: "Médico (a)"
                    font.pixelSize: 17
                    font.bold: true
                    font.underline: true
                    color: "#FFFFFF"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: roleSelectScreen.irParaLogin() // Por enquanto leva para o mesmo login
                }
            }
        }
    }
}

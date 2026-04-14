import QtQuick 6.4
import QtQuick.Shapes 1.0

Item {
    id: welcomeScreen

    signal irParaLogin()
    signal irParaCadastro()

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.5
        color: "#EEF2F8"

        Column {
            anchors.centerIn: parent
            spacing: 14

            MedCrossLogo {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 90
                height: 90
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "AGÊNCIA MED"
                font.pixelSize: 22
                font.bold: true
                font.letterSpacing: 1.5
                color: "#1A3FA3"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "BEM-ESTAR NA PALMA DA SUA MÃO"
                font.pixelSize: 10
                color: "#8899BB"
            }
        }
    }

    Shape {
        id: curva
        anchors.bottom: painel.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 60

        ShapePath {
            fillColor: "#1B3FA3"
            strokeColor: "transparent"
            strokeWidth: 0
            startX: 0
            startY: curva.height
            PathLine { x: 0; y: curva.height }
            PathQuad { x: curva.width; y: curva.height; controlX: curva.width / 2; controlY: -10 }
            PathLine { x: curva.width; y: curva.height }
            PathLine { x: 0; y: curva.height }
        }
    }

    Rectangle {
        id: painel
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.5
        color: "#1B3FA3"

        Column {
            anchors.top: parent.top
            anchors.topMargin: 36
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 14
            width: parent.width * 0.75

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Seja bem-vindo"
                font.pixelSize: 28
                font.bold: true
                color: "#FFFFFF"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Selecione uma das opções abaixo:"
                font.pixelSize: 14
                color: "#C8D8F0"
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            Item { width: 1; height: 10 }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: 50
                radius: 25
                color: "transparent"
                border.color: "#FFFFFF"
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    text: "Entrar"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FFFFFF"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: welcomeScreen.irParaLogin()
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Cadastrar"
                font.pixelSize: 15
                font.underline: true
                color: "#FFFFFF"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: welcomeScreen.irParaCadastro()
                }
            }
        }
    }
}

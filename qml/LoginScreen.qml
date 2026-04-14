import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Shapes 1.0

Item {
    id: loginScreen

    signal fazerLogin(string usuario, string senha)
    signal irParaCadastro()
    signal voltar()

    function exibirErro() {
        msgErro.visible = true
    }

    onVisibleChanged: {
        if (!visible) {
            campoUser.text = ""
            campoPass.text = ""
            msgErro.visible = false
        }
    }

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
                onClicked: loginScreen.voltar()
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
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            spacing: 25

            Text {
                id: msgErro
                visible: false
                text: "Usuário ou senha incorretos."
                color: "#FF4444"
                font.pixelSize: 14
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: campoUser
                width: parent.width
                placeholderText: "usuário"
                placeholderTextColor: "#A0C0FF"
                color: "white"
                font.pixelSize: 18
                background: Rectangle {
                    color: "transparent"
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: "white"
                    }
                }
            }

            TextField {
                id: campoPass
                width: parent.width
                placeholderText: "senha"
                placeholderTextColor: "#A0C0FF"
                color: "white"
                font.pixelSize: 18
                echoMode: TextInput.Password
                background: Rectangle {
                    color: "transparent"
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: "white"
                    }
                }
            }

            Text {
                text: "Não tem conta? Cadastre-se"
                color: "white"
                font.pixelSize: 14
                font.underline: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: loginScreen.irParaCadastro()
                }
            }

            Item { width: 1; height: 20 }

            Rectangle {
                width: parent.width
                height: 50
                radius: 25
                color: "#F8F9FA"

                Text {
                    anchors.centerIn: parent
                    text: "Entrar"
                    color: "#0052CC"
                    font.pixelSize: 20
                    font.bold: true
                    font.underline: true
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        msgErro.visible = false
                        loginScreen.fazerLogin(campoUser.text, campoPass.text)
                    }
                }
            }
        }
    }
}

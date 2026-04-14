import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Shapes 1.0

Item {
    id: registerScreen

    signal cadastrar(string usuario, string email, string telefone, string papel, string senha)
    signal voltar()

    onVisibleChanged: {
        if (!visible) {
            fUser.text = ""
            fEmail.text = ""
            fTel.text = ""
            fPass.text = ""
            msgErroCadastro.visible = false
        }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.35
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
                onClicked: registerScreen.voltar()
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
        height: parent.height * 0.65
        color: "#0052CC"

        Column {
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            spacing: 15

            Text {
                id: msgErroCadastro
                visible: false
                text: "Preencha todos os campos!"
                color: "#FF4444"
                font.pixelSize: 14
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: fUser
                width: parent.width
                placeholderText: "usuário"
                placeholderTextColor: "#A0C0FF"
                color: "white"
                background: Rectangle { color: "transparent"; Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "white" } }
            }

            TextField {
                id: fEmail
                width: parent.width
                placeholderText: "email"
                placeholderTextColor: "#A0C0FF"
                color: "white"
                background: Rectangle { color: "transparent"; Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "white" } }
            }

            TextField {
                id: fTel
                width: parent.width
                placeholderText: "telefone"
                placeholderTextColor: "#A0C0FF"
                color: "white"
                background: Rectangle { color: "transparent"; Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "white" } }
            }


            TextField {
                id: fPass
                width: parent.width
                placeholderText: "criar senha"
                placeholderTextColor: "#A0C0FF"
                color: "white"
                echoMode: TextInput.Password
                background: Rectangle { color: "transparent"; Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "white" } }
            }

            Item { width: 1; height: 20 }

            Rectangle {
                width: parent.width
                height: 50
                radius: 25
                color: "#F8F9FA"

                Text {
                    anchors.centerIn: parent
                    text: "Cadastrar"
                    color: "#0052CC"
                    font.pixelSize: 20
                    font.bold: true
                    font.underline: true
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (fUser.text === "" || fEmail.text === "" || fPass.text === "") {
                            msgErroCadastro.visible = true
                        } else {
                            msgErroCadastro.visible = false
                            registerScreen.cadastrar(fUser.text, fEmail.text, fTel.text, "paciente", fPass.text)
                        }
                    }
                }
            }
        }
    }
}

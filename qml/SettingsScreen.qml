import QtQuick 6.4
import QtQuick.Controls 6.4

Item {
    id: settingsScreen

    signal voltar()

    Rectangle {
        anchors.fill: parent
        color: "#F6F7F9"

        // Botão voltar
        Rectangle {
            x: 20; y: 20
            width: 36; height: 36
            radius: 18
            color: "#E5E5E5"
            Text {
                anchors.centerIn: parent
                text: "<"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: settingsScreen.voltar()
            }
        }

        // Logo MedCross
        MedCrossLogo {
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            scale: 1.5
        }

        // Lista de Botões
        Column {
            anchors.top: parent.top
            anchors.topMargin: 280
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            Repeater {
                model: [
                    "Segurança",
                    "Privacidade",
                    "Notificações",
                    "Idioma e Região",
                    "Dispositivos Sincronizados",
                    "Registro Médico",
                    "Termos e Políticas",
                    "Fale conosco"
                ]

                Rectangle {
                    width: 250
                    height: 42
                    radius: 8
                    color: "#0F5BB5"

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        color: "white"
                        font.pixelSize: 14
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicou na configuração: " + modelData)
                        }
                    }
                }
            }
        }
    }
}

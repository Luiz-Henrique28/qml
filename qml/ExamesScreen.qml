import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Layouts 1.15

Item {
    id: examesScreen

    property string nomePaciente: "Maria Alice"
    property string emailPaciente: ""
    
    signal voltar()
    signal sair()
    signal irParaConfiguracoes()

    readonly property string inicial: nomePaciente.length > 0 ? nomePaciente.charAt(0).toUpperCase() : "?"

    Rectangle {
        anchors.fill: parent
        color: "#F8F9FA"

        // Fundo Azul com Borda Arredondada Embaixo
        Rectangle {
            id: cabecalhoBase
            z: 1
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 180
            color: "#0A58CA"
            radius: 35
            
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 30
                color: "#0A58CA"
            }
        }

        // Faixa Menu Principal Ciano Arredondada
        Rectangle {
            id: faixaMenu
            anchors.top: cabecalhoBase.bottom
            anchors.topMargin: -25
            anchors.left: parent.left
            anchors.right: parent.right
            height: 70
            color: "#00B4D8"
            radius: 25

            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 25
                color: "#00B4D8"
            }

            Text {
                text: "EXAMES"
                color: "white"
                font.bold: true
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.topMargin: 35
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: cabecalhoBase.height
            z: 2 

            // Botão Voltar
            Rectangle {
                id: backButton
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 60
                width: 30; height: 30
                radius: 15
                color: "#80B3D4"
                opacity: 0.8
                Text {
                    anchors.centerIn: parent
                    text: "<"
                    font.pixelSize: 16
                    font.bold: true
                    color: "white"
                }
                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: examesScreen.voltar() }
            }

            // Botão Configurações
            Rectangle {
                id: configButton
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 60
                width: 30; height: 30
                radius: 15
                color: "transparent"
                
                Item {
                    anchors.centerIn: parent
                    width: 20; height: 20
                    Rectangle { anchors.centerIn: parent; width: 14; height: 14; radius: 7; color: "transparent"; border.width: 2; border.color: "#A0C0FF" }
                    Rectangle { anchors.centerIn: parent; width: 4; height: 20; color: "#A0C0FF" }
                    Rectangle { anchors.centerIn: parent; width: 20; height: 4; color: "#A0C0FF" }
                    Rectangle { anchors.centerIn: parent; width: 4; height: 20; color: "#A0C0FF"; rotation: 45 }
                    Rectangle { anchors.centerIn: parent; width: 20; height: 4; color: "#A0C0FF"; rotation: 45 }
                    Rectangle { anchors.centerIn: parent; width: 8; height: 8; radius: 4; color: "#0A58CA" }
                }

                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: examesScreen.irParaConfiguracoes() }
            }

            // Informações do Usuário
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: backButton.bottom
                anchors.topMargin: 15
                spacing: 15

                // Imagem de Perfil Placeholder
                Rectangle {
                    width: 60; height: 60
                    radius: 30
                    color: "#1ECCD8"
                    border.width: 2
                    border.color: "#FFFFFF"

                    Text {
                        anchors.centerIn: parent
                        text: examesScreen.inicial
                        font.pixelSize: 26
                        font.bold: true
                        color: "white"
                    }
                    clip: true
                }

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 2
                    Text {
                        text: "Olá, " + examesScreen.nomePaciente
                        font.pixelSize: 20
                        font.bold: true
                        color: "white"
                    }
                    Text {
                        text: "000.000.000-00" 
                        font.pixelSize: 14
                        color: "white"
                    }
                }
            }
        }

        // Conteúdo
        Flickable {
            anchors.top: faixaMenu.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            contentHeight: contentCol.height + 40
            clip: true

            Column {
                id: contentCol
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "RESULTADO DOS EXAMES"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#051A49"
                }

                GridLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    columns: 2
                    columnSpacing: 15
                    rowSpacing: 15

                    Repeater {
                        model: ["ULTRASSOM", "SANGUE", "ECG", "GLICEMIA", "URINA", "RAIO X"]

                        Rectangle {
                            width: 150
                            height: 120
                            color: "#D9D9D9"
                            
                            Column {
                                anchors.centerIn: parent
                                spacing: 6
                                width: parent.width - 20
                                
                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: modelData
                                    font.pixelSize: 13
                                    font.bold: true
                                    color: "#052C65"
                                }
                                
                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "NOME DO MÉDICO\nESPECIALIDADE"
                                    font.pixelSize: 7
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    color: "black"
                                    lineHeight: 1.2
                                }
                                
                                Rectangle {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    width: 14; height: 14
                                    color: "#0A58CA"
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: "↓"
                                        color: "white"
                                        font.pixelSize: 10
                                        font.bold: true
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: downloadPopup.open()
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }

    // Popup Modal de Sucesso do Download
        Popup {
            id: downloadPopup
            width: parent.width - 60
            height: 265
            x: Math.round((parent.width - width) / 2)
            y: Math.round((parent.height - height) / 2)
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            
            background: Rectangle {
                color: "#023773"
                radius: 35
            }

            contentItem: Column {
                anchors.fill: parent
                anchors.margins: 25
                spacing: 12

                Text {
                    text: "Download\nconcluído com\nsucesso!"
                    color: "white"
                    font.pixelSize: 22
                    font.bold: true
                    lineHeight: 1.1
                }

                Item { width: 1; height: 5 } // Spacer

                // Botão "Salvar em arquivos"
                Rectangle {
                    width: parent.width
                    height: 35
                    radius: 17
                    color: "white"
                    Text {
                        anchors.centerIn: parent
                        text: "Salvar em arquivos"
                        color: "#023773"
                        font.pixelSize: 13
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: downloadPopup.close()
                    }
                }

                // Botão "Ir para menu principal"
                Rectangle {
                    width: parent.width
                    height: 35
                    radius: 17
                    color: "white"
                    Text {
                        anchors.centerIn: parent
                        text: "Ir para menu principal"
                        color: "#023773"
                        font.pixelSize: 13
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            downloadPopup.close()
                            examesScreen.voltar()
                        }
                    }
                }
                
                Item { width: 1; height: 10 } // Espaçador final extra
            }
        }
    }
}

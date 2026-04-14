import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Layouts 1.15

Item {
    id: perfilScreen

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
                text: "PERFIL"
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
                color: "#80B3D4" // Cor parecida com a imagem
                opacity: 0.8
                Text {
                    anchors.centerIn: parent
                    text: "<"
                    font.pixelSize: 16
                    font.bold: true
                    color: "white"
                }
                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: perfilScreen.voltar() }
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

                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: perfilScreen.irParaConfiguracoes() }
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
                        text: perfilScreen.inicial
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
                        text: "Olá, " + perfilScreen.nomePaciente
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

        // Formulário Perfil
        Flickable {
            anchors.top: faixaMenu.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            contentHeight: formColumn.height + 100
            clip: true

            Column {
                id: formColumn
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 30
                anchors.rightMargin: 30
                spacing: 15



                LabeledField { labelText: "Nome" }
                LabeledField { labelText: "CPF" }

                RowLayout {
                    width: parent.width
                    spacing: 15
                    
                    LabeledField {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 2
                        labelText: "Celular"
                        showIcon: false
                    }

                    Column {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        spacing: 4
                        Text {
                            text: "Sexo"
                            font.pixelSize: 13
                            font.bold: true
                            color: "#052C65"
                        }
                        Row {
                            spacing: 8
                            height: 35
                            // Radio F
                            Row {
                                spacing: 4
                                anchors.verticalCenter: parent.verticalCenter
                                Text { text: "F"; font.pixelSize: 13; font.bold: true; color: "#052C65"; anchors.verticalCenter: parent.verticalCenter }
                                Rectangle {
                                    width: 14; height: 14; radius: 7; border.width: 1; border.color: "#333"
                                    color: "transparent"
                                    anchors.verticalCenter: parent.verticalCenter
                                    MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor }
                                }
                            }
                            // Radio M
                            Row {
                                spacing: 4
                                anchors.verticalCenter: parent.verticalCenter
                                Text { text: "M"; font.pixelSize: 13; font.bold: true; color: "#052C65"; anchors.verticalCenter: parent.verticalCenter }
                                Rectangle {
                                    width: 14; height: 14; radius: 7; border.width: 1; border.color: "#333"
                                    color: "transparent"
                                    anchors.verticalCenter: parent.verticalCenter
                                    MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor }
                                }
                            }
                        }
                    }
                }

                RowLayout {
                    width: parent.width
                    spacing: 15
                    
                    LabeledField {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 3
                        labelText: "Município"
                    }

                    LabeledField {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        labelText: "UF"
                    }
                }

                LabeledField { labelText: "Tipo Sanguíneo" }
                LabeledField { labelText: "Restrições Médicas?" }

                Item { width: 1; height: 10 } // Espaçador

                // Botão Cadastrar paciente dependente
                Rectangle {
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 40
                    radius: 20
                    color: "#00B4D8"
                    Text {
                        anchors.centerIn: parent
                        text: "Cadastrar paciente dependente"
                        color: "white"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Item { width: 1; height: 5 } // Espaçador

                // Botão Sair/Trocar de conta
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Sair/Trocar de conta"
                    font.pixelSize: 12
                    color: "#052C65"
                    font.underline: true
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: perfilScreen.sair()
                    }
                }
            }
        }
    }
}

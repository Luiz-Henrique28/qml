import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Layouts 1.15

Item {
    id: consultasScreen

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
                text: "CONSULTAS"
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
                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: consultasScreen.voltar() }
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

                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: consultasScreen.irParaConfiguracoes() }
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
                        text: consultasScreen.inicial
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
                        text: "Olá, " + consultasScreen.nomePaciente
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
                anchors.leftMargin: 30
                anchors.rightMargin: 30
                spacing: 25



                Column {
                    width: parent.width
                    spacing: 15
                    LabeledField { labelText: "Especialidade" }
                    LabeledField { labelText: "Médico" }
                }

                // Calendário Background Branco
                Rectangle {
                    width: parent.width
                    height: 310
                    radius: 12
                    color: "white"

                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 15

                        Text {
                            text: "Datas disponíveis"
                            font.pixelSize: 16
                            font.bold: true
                            color: "#052C65"
                        }

                        // Cabeçalhos (Dias da semana)
                        RowLayout {
                            width: parent.width
                            spacing: 0
                            Repeater {
                                model: ["dom", "seg", "ter", "qua", "qui", "sex", "sab"]
                                Text {
                                    Layout.fillWidth: true
                                    text: modelData
                                    font.pixelSize: 13
                                    color: "#5C6A8C"
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }

                        // Grid de Dias (1 a 31)
                        GridLayout {
                            width: parent.width
                            columns: 7
                            rowSpacing: 5
                            columnSpacing: 0

                            Repeater {
                                model: 31
                                
                                Item {
                                    Layout.fillWidth: true
                                    height: 30
                                    
                                    // Dias destacados baseados na imagem: 3,4,12,13,25,26,27,30
                                    property bool isAvailable: [3, 4, 12, 13, 25, 26, 27, 30].indexOf(modelData + 1) !== -1

                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: parent.width
                                        height: 25
                                        color: isAvailable ? "#BBEBEE" : "transparent"
                                        
                                        // Linha divisória fina embaixo dos dias, mas só se tiver na mesma semana, 
                                        // pelo visual as linhas horizontais cruzam o grid todo.
                                        Rectangle {
                                            anchors.bottom: parent.bottom
                                            width: parent.width
                                            height: 1
                                            color: "#EAEAEA"
                                            visible: true
                                        }

                                        Text {
                                            anchors.centerIn: parent
                                            text: (modelData + 1).toString()
                                            font.pixelSize: 13
                                            color: "#333333"
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: isAvailable ? Qt.PointingHandCursor : Qt.ArrowCursor
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Shapes 1.0

Item {
    id: homeScreen

    property string nomePaciente: ""
    property string emailPaciente: ""

    signal irParaConfiguracoes()
    signal sair()
    signal irParaPerfil()
    signal irParaExames()
    signal irParaAgendamentos()

    readonly property string inicial: nomePaciente.length > 0 ? nomePaciente.charAt(0).toUpperCase() : "?"

    Rectangle {
        anchors.fill: parent
        color: "#F8F9FA"

        // Fundo Azul com Borda Arredondada Embaixo
        Rectangle {
            id: cabecalhoBase
            z: 1 // Garante que a borda inferior arredondada fique por cima do ciano
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 180
            color: "#0A58CA"
            radius: 35 // Aumentado para 35 para destacar o arredondamento do azul escuro
            
            // Corrige o topo para não ser arredondado (ficar quadrado em cima)
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
            anchors.topMargin: -25 // Sobe proporção reduzida para sobrepor a curva do azul escuro
            anchors.left: parent.left
            anchors.right: parent.right
            height: 70
            color: "#00B4D8"
            radius: 25

            // Corrige a parte superior para ser quadrada e se fundir ao azul escuro
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 25
                color: "#00B4D8"
            }

            Text {
                text: "MENU PRINCIPAL"
                color: "white"
                font.bold: true
                font.pixelSize: 16
                // Centralizando no topo considerável da "aba visível"
                anchors.top: parent.top
                anchors.topMargin: 35
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        // Botões do Cabeçalho e Informações do Usuário precisam estar em z: 2
        Item {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: cabecalhoBase.height
            z: 2 // Garante que fiquem visíveis por cima do z: 1 da base

            Rectangle {
                id: configButton
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 60
                width: 30; height: 30
                radius: 15
                color: "transparent"
                
                // Ícone Engrenagem via Primitivas Vectoriais
                Item {
                    anchors.centerIn: parent
                    width: 20; height: 20
                    Rectangle { anchors.centerIn: parent; width: 14; height: 14; radius: 7; color: "transparent"; border.width: 2; border.color: "#A0C0FF" }
                    // Dentes da engrenagem
                    Rectangle { anchors.centerIn: parent; width: 4; height: 20; color: "#A0C0FF" }
                    Rectangle { anchors.centerIn: parent; width: 20; height: 4; color: "#A0C0FF" }
                    Rectangle { anchors.centerIn: parent; width: 4; height: 20; color: "#A0C0FF"; rotation: 45 }
                    Rectangle { anchors.centerIn: parent; width: 20; height: 4; color: "#A0C0FF"; rotation: 45 }
                    Rectangle { anchors.centerIn: parent; width: 8; height: 8; radius: 4; color: "#0A58CA" }
                }

                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: homeScreen.irParaConfiguracoes() }
            }

            // Informações do Usuário
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: configButton.verticalCenter
                spacing: 15

                Rectangle {
                    width: 60; height: 60
                    radius: 30
                    color: "#1ECCD8"
                    border.width: 2
                    border.color: "#FFFFFF"

                    Text {
                        anchors.centerIn: parent
                        text: homeScreen.inicial
                        font.pixelSize: 26
                        font.bold: true
                        color: "white"
                    }
                }

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 2
                    Text {
                        text: "Olá, " + homeScreen.nomePaciente
                        font.pixelSize: 20
                        font.bold: true
                        color: "white"
                    }
                    Text {
                        text: "000.000.000-00" // CPF Fictício do protótipo
                        font.pixelSize: 14
                        color: "white"
                    }
                }
            }
        }

        // Categorias e Mural (Rolável em telas menores)
        Flickable {
            anchors.top: cabecalhoBase.bottom
            anchors.topMargin: 90
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
                spacing: 15

            Text {
                text: "Categorias"
                font.pixelSize: 18
                font.bold: true
                color: "#052C65"
            }

            Row {
                anchors.left: parent.left
                spacing: 20

                // PERFIL
                Rectangle {
                    id: cardPerfil
                    width: 100; height: 100
                    radius: 15
                    color: mouseAreaPerfil.pressed ? "#CCCCCC" : "#E2E2E2"
                    border.width: 2; border.color: "#D0D0D0"
                    Column {
                        anchors.centerIn: parent
                        spacing: 8
                        Rectangle {
                            width: 36; height: 36; radius: 18; color: "transparent"
                            border.width: 3; border.color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                            Rectangle { width: 14; height: 14; radius: 7; color: "white"; anchors.centerIn: parent; anchors.verticalCenterOffset: -4 }
                            Rectangle { width: 22; height: 10; radius: 5; color: "white"; anchors.bottom: parent.bottom; anchors.bottomMargin: 2; anchors.horizontalCenter: parent.horizontalCenter }
                        }
                        Text { text: "PERFIL"; font.pixelSize: 11; font.bold: true; color: "#0A58CA" }
                    }
                    MouseArea {
                        id: mouseAreaPerfil
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Card Perfil clicado!")
                            homeScreen.irParaPerfil()
                        }
                    }
                }

                // EXAMES
                Rectangle {
                    id: cardExames
                    width: 100; height: 100
                    radius: 15
                    color: mouseAreaExames.pressed ? "#CCCCCC" : "#E2E2E2"
                    border.width: 2; border.color: "#D0D0D0"
                    Column {
                        anchors.centerIn: parent
                        spacing: 8
                        Row {
                            spacing: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            Rectangle { width: 16; height: 26; color: "transparent"; border.width: 3; border.color: "white"; radius: 2 }
                            Rectangle { width: 16; height: 26; color: "transparent"; border.width: 3; border.color: "white"; radius: 2 }
                        }
                        Text { text: "EXAMES"; font.pixelSize: 11; font.bold: true; color: "#0A58CA" }
                    }
                    MouseArea {
                        id: mouseAreaExames
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Card Exames clicado!")
                            homeScreen.irParaExames()
                        }
                    }
                }

                // AGENDAMENTOS
                Rectangle {
                    id: cardAgendamentos
                    width: 100; height: 100
                    radius: 15
                    color: mouseAreaAgendamentos.pressed ? "#CCCCCC" : "#E2E2E2"
                    border.width: 2; border.color: "#D0D0D0"
                    Column {
                        anchors.centerIn: parent
                        spacing: 8
                        Rectangle {
                            width: 32; height: 30; color: "transparent"; border.width: 3; border.color: "white"; radius: 4
                            anchors.horizontalCenter: parent.horizontalCenter
                            Rectangle { width: 4; height: 6; color: "transparent"; border.width: 3; border.color: "white"; x: 6; y: -3 }
                            Rectangle { width: 4; height: 6; color: "transparent"; border.width: 3; border.color: "white"; x: 22; y: -3 }
                            Rectangle { width: 26; height: 3; color: "white"; x: 3; y: 8 }
                        }
                        Text { text: "AGENDAMENTOS"; font.pixelSize: 10; font.bold: true; color: "#0A58CA" }
                    }
                    MouseArea {
                        id: mouseAreaAgendamentos
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Card Agendamentos clicado!")
                            homeScreen.irParaAgendamentos()
                        }
                    }
                }
            }

            Item { width: 1; height: 10 }

            Text {
                text: "Mural de avisos"
                font.pixelSize: 18
                font.bold: true
                color: "#052C65"
            }

            // Aviso Sangue
            Rectangle {
                width: parent.width
                height: 110 // Aumentado para 110 para caber o texto
                radius: 10
                color: "#DDDEDF"
                clip: true

                Column {
                    anchors.left: parent.left; anchors.top: parent.top
                    anchors.leftMargin: 15; anchors.topMargin: 15
                    spacing: 2
                    Text { text: "Seu resultado está pronto"; font.pixelSize: 12; font.bold: true; color: "#0A58CA" }
                    Text { text: "SANGUE"; font.pixelSize: 18; font.bold: true; color: "#0A58CA" }
                    Text {
                        text: "Clique aqui"
                        font.pixelSize: 11
                        font.bold: true
                        color: mouseAreaCliqueAqui1.pressed ? "#00B4D8" : "#0A58CA"
                        font.underline: true
                        MouseArea {
                            id: mouseAreaCliqueAqui1
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: homeScreen.irParaExames()
                        }
                    }
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 25
                    color: "#0A58CA"
                    radius: 20
                    Rectangle { anchors.top: parent.top; width: parent.width; height: 10; color: "#0A58CA" }
                    Text { text: "01/04"; font.pixelSize: 14; font.bold: true; color: "white"; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter }
                    Text { text: ">"; font.pixelSize: 14; font.bold: true; color: "white"; anchors.right: parent.right; anchors.rightMargin: 15; anchors.verticalCenter: parent.verticalCenter }
                    MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor }
                }
            }

            // Aviso Ultrassom
            Rectangle {
                width: parent.width
                height: 110 // Aumentado para 110 para caber o texto
                radius: 10
                color: "#DDDEDF"
                clip: true

                Column {
                    anchors.left: parent.left; anchors.top: parent.top
                    anchors.leftMargin: 15; anchors.topMargin: 15
                    spacing: 2
                    Text { text: "Para hoje você tem,"; font.pixelSize: 11; font.bold: true; color: "#0A58CA" }
                    Text { text: "ULTRASSOM"; font.pixelSize: 18; font.bold: true; color: "#0A58CA" }
                    Text { text: "Doutor Fernando - Sala 3"; font.pixelSize: 11; font.bold: true; color: "#0A58CA" }
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 25
                    color: "#0A58CA"
                    radius: 10
                    Rectangle { anchors.top: parent.top; width: parent.width; height: 10; color: "#0A58CA" }
                    Text { text: "02/04"; font.pixelSize: 14; font.bold: true; color: "white"; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter }
                    Text { text: ">"; font.pixelSize: 14; font.bold: true; color: "white"; anchors.right: parent.right; anchors.rightMargin: 15; anchors.verticalCenter: parent.verticalCenter }
                    MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor }
                }
                }
            }

            Item { width: 1; height: 10 } // Espaço antes de finalizar o conteúdo

            // Botão Sair / Trocar de conta - Agora rola junto e não fica quebrado
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Sair/Trocar de conta"
                font.pixelSize: 12
                color: "#555"
                font.underline: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: homeScreen.sair()
                }
            }
        } // Fim da Column contentCol
    } // Fim do Flickable
}

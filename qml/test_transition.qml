import QtQuick 6.4
import QtQuick.Controls 6.4

ApplicationWindow {
    visible: true
    width: 200
    height: 200

    property string telaAtual: "home"

    HomeScreen {
        id: home
        anchors.fill: parent
        visible: telaAtual === "home"
        
        onIrParaPerfil: {
            console.log("Sinal recebido em HomeScreen.onIrParaPerfil");
            telaAtual = "perfil";
        }
    }

    PerfilScreen {
        id: perfil
        anchors.fill: parent
        visible: telaAtual === "perfil"
        onVisibleChanged: console.log("PerfilScreen visible mudou para: " + visible)
    }

    Component.onCompleted: {
        console.log("Tela inicial:", telaAtual)
        home.irParaPerfil()
        console.log("Tela final:", telaAtual)
        Qt.quit()
    }
}

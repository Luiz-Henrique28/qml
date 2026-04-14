import QtQuick 6.4
import QtQuick.Controls 6.4

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Test"
    
    PerfilScreen {
        anchors.fill: parent
        onVoltar: console.log("voltar")
    }
}

import QtQuick 6.4
import QtQuick.Controls 6.4

Column {
    id: root
    width: parent ? parent.width : 300
    spacing: 4
    
    property string labelText: ""
    property bool showIcon: true
    
    Text {
        text: root.labelText
        font.pixelSize: 13
        font.bold: true
        color: "#052C65"
    }
    
    Rectangle {
        width: parent.width
        height: 35
        radius: 8
        color: "#F6F7F9"
        border.width: 1
        border.color: "#0A58CA"
        
        TextInput {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: root.showIcon ? 30 : 10
            verticalAlignment: TextInput.AlignVCenter
            font.pixelSize: 14
            color: "#333333"
        }
        
        // Icone de alvo/seta à direita
        Rectangle {
            visible: root.showIcon
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            width: 16; height: 16
            radius: 8
            color: "transparent"
            border.width: 1
            border.color: "#666"
            Text {
                anchors.centerIn: parent
                text: "↓"
                font.pixelSize: 10
                color: "#666"
            }
        }
    }
}

import QtQuick 6.4

Item {
    id: root
    width: 90
    height: 90

    Item {
        x: -4; y: -4
        width: root.width; height: root.height
        Rectangle { width: 26; height: 72; radius: 13; color: "#1ECCD8"; anchors.centerIn: parent }
        Rectangle { width: 72; height: 26; radius: 13; color: "#1ECCD8"; anchors.centerIn: parent }
    }

    Item {
        x: 4; y: 4
        width: root.width; height: root.height
        Rectangle { width: 26; height: 72; radius: 13; color: "#1A3FA3"; anchors.centerIn: parent }
        Rectangle { width: 72; height: 26; radius: 13; color: "#1A3FA3"; anchors.centerIn: parent }
    }
}

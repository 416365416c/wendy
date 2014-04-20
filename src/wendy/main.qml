import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }



    ScrollView {
        id: dialogue1
        x: 0
        y: 0
        width: parent.width
        height: 200

        Column{
            Row{
                Text {
                    text: qsTr("Dialogue item 1")

                }
            }
            Row {
                Text {
                    text: qsTr("Dialogue item 2")

                }
            }
        }
    }

    ScrollView {
        id: dialogue2
        x: 0
        y: 200
        width: parent.width
        height: 200

        Column{
            Row{
                Text {
                    text: qsTr("Dialogue choice 1")

                }
            }
            Row {
                Text {
                    text: qsTr("Dialogue choice 2")

                }
            }
        }
    }

}

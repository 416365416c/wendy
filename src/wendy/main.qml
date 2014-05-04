import QtQuick 2.2
import QtQuick.Controls 1.1
import "dialogue" as StoryContent

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Wendy's big day AND ETERNAL NIGHT!")

    /*
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }
    */

    StoryContent.TestContent{
        id: story
        onCurrentNodeChanged: {
            text1.text = text1.text + "\n" + currentNode.prechoiceText;
            choiceBox.model = currentNode.choices;
        }
    }


    ScrollView {
        id: dialogue1
        x: 0
        y: 0
        width: parent.width
        height: 200

        Text {
            id: text1
            width: parent.width
            wrapMode: Text.WordWrap
            text: "Welcome to Wendy's big day AND ETERNAL NIGHT!"
        }
    }

    ScrollView {
        id: dialogue2
        x: 0
        y: 200
        width: parent.width
        height: 200
        Column {
            id: choiceCol
            width: parent.width
            height: childrenRect.height
            Repeater {
                id: choiceBox
                delegate: Text {
                    text: playerText
                    width: parent.width
                    wrapMode: Text.WordWrap
                    color: choiceMA.containsMouse ? "red" : "blue"

                    MouseArea {
                        id: choiceMA
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: modelData.select()
                    }
                }
            }
        }
        Item {
            width: parent.width
            height: 200
        }
    }

    
}

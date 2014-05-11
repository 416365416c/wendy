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
            if(currentNode.prechoiceText != "")
                historyText.append(currentNode.prechoiceText)
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
            id: historyText
            width: parent.width
            wrapMode: Text.WordWrap
            text: "Welcome to Wendy's big day AND ETERNAL NIGHT!"
            function append(newStuff) {
                historyText.text = historyText.text + '\n' + newStuff
            }
        }
    }

    /*ScrollView {
        id: dialogue2
        x: 0
        y: 200
        width: parent.width
        height: 200 */
        Column {
        property Item otherRefToHT: historyText
        x: 0
        y: 200
        width: parent.width
        height: 200
            id: choiceCol
            //fills the scrollview, and behavior depends on implicit height???
            Repeater {
                id: choiceBox
                delegate: Text {
                    id: delegateContainer
                    text: playerText
                    width: parent ? parent.width : 1337
                    y: delegateContainer.height * index //HACK: Until I learn scrollview, this spaces single line options
                    visible: modelData.enabled
                    wrapMode: Text.WordWrap
                    color: choiceMA.containsMouse ? "red" : "blue"

                    MouseArea {
                        id: choiceMA
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            historyText.append(modelData.playerText);
                            historyText.append(modelData.responseText);
                            modelData.select() //starts cleanup process on this delegate!
                        }
                    }
                }
            }
        }
   // }

    
}

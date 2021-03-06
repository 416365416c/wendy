import QtQuick 2.2
import QtQuick.Controls 1.1
import "dialogue" as StoryContent
import "keyLogic.js" as KeyLogic

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
                //historyText.append(currentNode.prechoiceText)
                // is this always going to be the NPC?
                dialogue.addSpeech(currentNode.prechoiceText, 0)
            choiceBox.model = currentNode.choices;
        }
    }


    ListModel {
        id: dialogueHistory
        /* dialogueHistory item structure:
            speech: dialogue item text
            player: 1 for player, 0 for NPC */
    }

    ListView {
        id: dialogue
        x: 0
        y: 0
        width: parent.width
        height: 300
        orientation: Qt.Vertical
        clip: true

        function addSpeech(speech, player) {
            // speech: text string
            // player: boolean is this the player talking
            dialogueHistory.append({"speech": speech, "player": player})
            //dialogue.positionViewAtEnd()
            positionViewAtIndex(count - 1, ListView.End)
        }

        model: dialogueHistory
        delegate: Component {

            Item {
                width: parent.width - 40
                height: dialogueTextItem.height + 26

                BorderImage {
                    id: dialogueTextBorder
                    //width: dialogueTextItem.width + 40
                    //height: dialogueTextItem.height + 120
                    border { left: 12; top: 10; right: 30; bottom: 30 }
                    horizontalTileMode: BorderImage.Stretch
                    verticalTileMode: BorderImage.Stretch
                    source: "../../graphics/speech2.png"
                    mirror: player ? false : true
                    anchors.right: player? parent.right : undefined
                    anchors.fill: dialogueTextItem
                    anchors { leftMargin: player? -10 : -30 ; topMargin: -10; rightMargin: player? -30 : -10 ; bottomMargin: -10 }
                }

                Text {
                    x: 50; y: 50
                    id: dialogueTextItem
                    text: speech
                    wrapMode: Text.Wrap
                    color: player ? "blue" : "red"
                    anchors.right: player? parent.right : undefined
                    //horizontalAlignment: player ? Text.AlignRight : Text.AlignLeft

                }
            }

        }

    }

    Column {
        property Item otherRefToHT: dialogueHistory
        x: 0
        y: 300
        width: parent.width
        height: 200

        Rectangle {
            height: 3
            width: parent.width
            color: "black"
        }

        id: choiceCol
        //fills the scrollview, and behavior depends on implicit height???
        focus: true
        //Keys.onPressed: console.log("Hello!" + event.key);
        Keys.onReleased: KeyLogic.process(event.key)
        Repeater {
            id: choiceBox
            delegate: Text {
                id: delegateContainer
                text: KeyLogic.inputManage(delegateContainer, index) + "." + playerText
                width: parent ? parent.width : 1337
                y: delegateContainer.height * index //HACK: Until I learn scrollview, this spaces single line options
                visible: modelData.enabled
                wrapMode: Text.WordWrap
                color: choiceMA.containsMouse ? "red" : "blue"
                function chooseThis()
                {
                    KeyLogic.reset()
                    if(modelData.playerText != "")
                        dialogue.addSpeech(modelData.playerText, 1)
                    if(modelData.responseText != "")
                        dialogue.addSpeech(modelData.responseText, 0)
                    modelData.select() //starts cleanup process on this delegate!
                }

                MouseArea {
                    id: choiceMA
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: delegateContainer.chooseThis();
                }
            }
        }
    }
}

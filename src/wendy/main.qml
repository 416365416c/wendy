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
                //historyText.append(currentNode.prechoiceText)
                // is this always going to be the NPC?
                dialogueHistory.append({"speech": currentNode.prechoiceText, "player": 0})
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
        height: 200
        orientation: Qt.Vertical

//        Text {
//            id: historyText
//            width: parent.width - 40
//            x: 20; y: 20
//            wrapMode: Text.WordWrap
//            text: "Welcome to Wendy's big day AND ETERNAL NIGHT!"
//            function append(newStuff) {
//                historyText.text = historyText.text + '\n' + newStuff
//            }
//        }
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
//    BorderImage {
//        id: dialogue1border
//        width: parent.width; height: dialogue1.height
//        x: dialogue1.x; y: dialogue1.y;
//        border { left: 50; top: 50; right: 140; bottom: 120 }
//        horizontalTileMode: BorderImage.Stretch
//        verticalTileMode: BorderImage.Stretch
//        source: "../../graphics/speech-user.png"
//    }

    /*ScrollView {
        id: dialogue2
        x: 0
        y: 200
        width: parent.width
        height: 200 */
        Column {
        property Item otherRefToHT: dialogueHistory
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
                            dialogueHistory.append({"speech": modelData.playerText, "player": 1});
                            dialogueHistory.append({"speech": modelData.responseText, "player": 0});
                            modelData.select() //starts cleanup process on this delegate!
                        }
                    }
                }
            }
        }
   // }

    
}

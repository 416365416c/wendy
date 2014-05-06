import QtQuick 2.1
import "Logic.js" as GameLogic

QtObject {
    id: container
    property string playerText: "So... wanna go get lunch?"
    property string responseText: "Gee, I never thought of it like that."
    property TreeNode nextNode: null
    property bool enabled: true
    function select() { //Called by UI
        container.selected();//emits signal
        if (container.nextNode != null) {
            GameLogic.story.currentNode = container.nextNode
        } else {
            console.warn("Choice nextNode is null")
        }
    }
    signal selected //chance to modify state, before going to nextNode? Might split
}

import QtQuick 2.1
import "Logic.js" as GameLogic

QtObject {
    id: node
    //Same bug as Story
    property list<QtObject> choices
    property var state: null //Set on entry to this node DEFUNCT
    property string prechoiceText: "" //some don't have it
    function select() {
        console.log("TreeNode activated")
/*
        if (node.state.sworeLots == true) {
            console.log("You rude bugger!")
        } else {
            console.log("Welcome to the next line!")
        } */
    }
}

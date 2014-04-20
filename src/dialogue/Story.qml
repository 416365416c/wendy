import QtQml 2.1

QtObject {
    //dang default bug
    //Possible second bug: Using TreeNode makes the window never show....
    property list<QtObject> allNodes
    property QtObject currentNode: null
    //Note that when currentNode changes, the UI will attempt to update to the new value
}

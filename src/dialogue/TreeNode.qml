import QtQuick 2.1

QtObject {
    //Same bug as Story
    property list<QtObject> choices
    property var state: new Object //Set on entry to this node
    property QtObject passThrough: null //if a non-null TreeNode, transitions immediately with no choice available
    property string prechoiceText: "Consider this!"
}

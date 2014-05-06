import QtQuick 2.1

QtObject {
    //Same bug as Story
    property list<QtObject> choices
    property var state: new Object //Set on entry to this node
    property string prechoiceText: "Consider this!"
}

import QtQuick 2.1

QtObject {
    property string playerText: "So... wanna go get lunch?"
    property string responseText: "Gee, I never thought of it like that."
    property TreeNode nextNode: null
    property bool enabled: true
    function select() {}
    signal selected //chance to modify state, before going to nextNode? Might split
}

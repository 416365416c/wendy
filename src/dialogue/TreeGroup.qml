import QtQuick 2.1
import "Logic.js" as GameLogic

TreeNode {
    id: node
    property bool actuallyTreeGroup: true
    //pretends to be a node, but really just a grouping mechanism
    property list<TreeNode> subNodes
}

import QtQuick 2.1
import QtQuick.Window 2.1
import "Logic.js" as GameLogic

//This file has a fuchsia window so that it can be run standalone until it's integrated
Window {
    visible: true
    width: 300
    height: 300
    color: "fuchsia"
    Item {
        anchors.fill: parent
        Story {
            currentNode: menu
            allNodes: [
                TreeNode {
                    id: menu
                    choices: [
                        Choice {
                            playerText: "New Game"
                            responseText: "" //Null, putting it in the other pass-through node
                            nextNode: gameStart
                        }
                        ,
                        Choice {
                            playerText: "Save Game"
                            responseText: "Consider it done!"
                            nextNode: menu
                        }
                        ,
                        Choice {
                            playerText: "Load Game"
                            responseText: "Which game would you like to load?"
                            nextNode: menu //TODO: Load screen
                        }
                        ,
                        Choice {
                            playerText: "Exit Game"
                            responseText: (GameLogic.state.sworeLots ? "Good bye. I love you!" : "Bye...")
                            nextNode: menu //TODO
                        }
                        ,
                        Choice {
                            playerText: "Quick Game"
                            responseText: "I'm not implemented yet" //TODO
                            nextNode: menu
                        }
                        ,
                        Choice {
                            playerText: "Game Options"
                            responseText: "I'm not implemented yet"
                            nextNode: menu
                        }
                        ,
                        Choice {
                            playerText: "Insult Game"
                            responseText: "I'm not implemented yet"
                            nextNode: menu
                        }
                    ]
                }, TreeNode {
                    id: gameStart
                    prechoiceText: "Once upon a time..."
                    passThrough: n1A
                }, TreeNode {
                    id: n1A 
                    prechoiceText: "W) Come on Gordon, we'll be late for the tea party!\nG) Well my legs are tiny, so you'll just have to wait!"
                    choices: [
                        Choice {
                            playerText: "Aw, look at the cute litte girl playing with her cute little doll"
                        }
                        ,
                        Choice {
                            playerText: "Dolls are for girls! Er, little girls. Littler girls?"
                        }
                        ,
                        Choice {
                            playerText: "Where's your tea party going to be Wendy?"
                        }
                        ,
                        Choice {
                            playerText: "Aw, look at the cute litte girl playing with her cute little doll"
                        }
                        ,
                        Choice {
                            playerText: "Buck up Gordon, the lady said speed up so DOUBLE TIME IT!"
                        }
                    ]
                }
            ]
        }
    }
}

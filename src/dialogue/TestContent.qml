import "Logic.js" as GameLogic
//Using only dialogue types
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
                    onSelected: Qt.quit();
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
            choice: [
                Choice {
                    playerText: "<Click to Continue>"
                    nextNode: n1A
                }
            ]
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

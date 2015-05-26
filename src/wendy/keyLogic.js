var keyMap = new Object;

function reset()
{
    keyMap = new Object;
}

function process(keyCode) 
{
    if (keyMap[keyCode] != undefined)
        keyMap[keyCode].chooseThis();
}

function inputManage(choice, idx)
{
    if (idx < 9) {
        keyMap[49 + idx] = choice;
        return idx + 1; //We'll convert to string implicitly later
    } else {
        var cc = 65 + (idx - 9);
        keyMap[cc] = choice;
        return String.fromCharCode(cc);
    }
}

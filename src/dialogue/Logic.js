.pragma library

var state = null
var story = null
var initialised = false

function init(what, state_in) {
    if (!initialised) {
        story = what
        state = state_in
        initialised = true
    }
}

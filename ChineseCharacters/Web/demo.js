function newWriter(character) {
    writer = HanziWriter.create('quiz-target', character, {
                                width: 200,
                                height: 300,
                                padding: 0,
                                showOutline: true,
                                showCharacter: true,
                                showHintAfterMisses: 1,
                                highlightOnComplete: true,
                                });
}


function resetWriter() {
    writer.quiz({
                onComplete: function(summaryData) {
                resetWriter();
                }
                });
}

function newCharacter(character) {
    writer = HanziWriter.create('character-target-div', character, {
    width: 300,
    height: 300,
    showOutline: true,
    showCharacter: true,
    highlightCompleteColor:'#00FF00',
    outlineColor: '#AB8B00',
    drawingColor: '#FFFFFF',
    strokeColor: '#FFFFFF',
    showHintAfterMisses: 1,
    highlightOnComplete: false,
    });
    writer.quiz({
    onComplete: function(){
        onClick();
    }
    });
}


function onClick() {
    window.webkit.messageHandlers.buttonOne.postMessage("Button One Action");
    }

function changeCharacter(newCharacter) {
    writer.setCharacter(newCharacter);
    writer.quiz();
    window.writer = writer;
}




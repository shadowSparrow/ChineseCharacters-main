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
    highlightCompleteColor:'#FFFFFF',
    outlineColor: '#AB8B00',
    drawingColor: '#FFFFFF',
    strokeColor: '#FFFFFF',
    showHintAfterMisses: 1,
    highlightOnComplete: true,
    
    });
    writer.quiz({
    onComplete: function(summaryData) {
    resetWriter();
    }
    });
    //window.writer = writer
}

function changeCharacter(newCharacter) {
    writer.setCharacter(newCharacter);
    writer.quiz();
    window.writer = writer;
}


/*
$(function() {
  newWriter('人');
    writer.quiz({
              onComplete: function(summaryData) {
              resetWriter();
              }
              });
  window.writer = writer;
  });
 
*/



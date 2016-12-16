function init() {
    var anchors = document.getElementsByClassName("anchor");
    for (var i = 0; i < anchors.length; i++) {
        anchors[i].addEventListener('mouseover', show_note, false);
        anchors[i].addEventListener('click', show_note, false);
        anchors[i].addEventListener('mouseout', hide_note, false);
        anchors[i].addEventListener('dblclick', hide_note, false);
        
        anchors[i].addEventListener('touchenter', show_note, false);
        anchors[i].addEventListener('touchleave', hide_note, false);
    }}
    function show_note(){var note= this.nextSibling;
    note.style.display = "inline";   
    }
        function hide_note(){var note= this.nextSibling;
    note.style.display = "none";   
    }
    window.onload = init;
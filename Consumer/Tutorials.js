CURRENT_PAGE = 0;
CURRENT_TUTO = "";

$(document).ready(function () {
    $.each(tutorials, function (index, value) {
        value.pages.sort(function (a, b) {
            return a.page_number - b.page_number;
        })
    });
});

var showTuto = function (id) {
    CURRENT_TUTO = id;
    CURRENT_PAGE = 1;
    var tuto = tutorials[id];
    var html = "<h2 class='tutoTitle'>" + tuto.title + "</h2>";
    html += "<em>Author: " + tuto.author + "</em>";
    html += "<p>Date: " + tuto.date_published + "</p>";
    html += "<div class='videoplayer'><span id='prev_cont'></span>";
    html += "<strong class='page_info'>Page <span id='page_number'>" + tuto.pages[0].page_number + "</span></strong>";
    html += "<span id='next_cont' style='text-align: right'><span id='next'>>> next</span></span>";
    html += "<br>";
    html += "<iframe class='tutovideo' width='560' height='315' src='" + tuto.pages[0].video + "'  allowfullscreen='true'></iframe></div>";
    html += "<div id='tuto_text'>" + tuto.pages[0].text + "</div>";
    html += "</div>";

    $("#tutoPlaceholder").html(html);
    if (typeof tutorials[CURRENT_TUTO].pages[1] != 'undefined') $("#next_cont").html("<span id='next'>>> next</span>");
    else $("#next_cont").html("");
}

var showPage = function (page) {
    CURRENT_PAGE = page;
    $("#page_number").html(page);
    $("#tuto_text").html(tutorials[CURRENT_TUTO].pages[page - 1].text);
    $(".tutovideo")[0].src = tutorials[CURRENT_TUTO].pages[page - 1].video;
    if (page <= 1) $("#prev_cont").html("");
    else $("#prev_cont").html("<span id='prev'><< prev</span>");
    if (typeof tutorials[CURRENT_TUTO].pages[page] != 'undefined') $("#next_cont").html("<span id='next'>>> next</span>");
    else $("#next_cont").html("");
    console.log(tutorials[CURRENT_TUTO].pages[page - 1])
}

$(document).on("click", "#prev", function (e) {
    e.stopPropagation();
    showPage(CURRENT_PAGE - 1);
});
$(document).on("click", "#next", function (e) {
    e.stopPropagation();
    showPage(CURRENT_PAGE + 1);
});
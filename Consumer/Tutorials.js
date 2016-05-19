CURRENT_PAGE = 0;
CURRENT_TUTO = "";

var showTuto = function (id) {
    CURRENT_TUTO = id;
    CURRENT_PAGE = 1;
    var tuto = tutorials[id];
    var html = "<h2 class='tutoTitle'>" + tuto.title + "</h2>";
    html += "<em>Author: " + tuto.author + "</em>";
    html += "<p>Date: " + tuto.date_published + "</p>";
    html += "<span id='prev'><< prev</span>  <span id='next' style='float: right'>>> next</span>";
    html += "<div class='page'>"
    html += "<strong>Page <span id='page_number'>" + tuto.pages[0].page_number + "</span></strong><br>";
    html += "<em>Video: <span id='tuto_video'>" + tuto.pages[0].video + "</span></em>";
    html += "<div id='tuto_text'>" + tuto.pages[0].text + "</div>";
    html += "</div>";

    $("#tutoPlaceholder").html(html);
    $("#prev").hide();
}

var showPage = function (page) {
    CURRENT_PAGE = page;
    $("#page_number").html(page);
    $("#tuto_text").html(tutorials[CURRENT_TUTO].pages[page - 1].text);
    $("#tuto_video").html(tutorials[CURRENT_TUTO].pages[page - 1].video);
    if (page <= 1) $("#prev").hide();
    else $("#prev").show();
}

$(document).on("click", "#prev", function () {
    showPage(CURRENT_PAGE - 1);
});
$(document).on("click", "#next", function () {
    showPage(CURRENT_PAGE + 1);
});
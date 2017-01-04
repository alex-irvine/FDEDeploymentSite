CURRENT_PAGE = 0;
CURRENT_TUTO = "";

$(document).ready(function () {
    $.each(tutorials, function (index, value) {
        value.pages.sort(function (a, b) {
            return a.page_number - b.page_number;
        })
    });
    $('#list_tuto li').first().click();
});

/**
 * Show a tutorial in the main view
 */
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
    html += "<div id='tuto_text' class='tutotext'>" + tuto.pages[0].text + "</div>";
    html += "</div>";

    $("#tutoPlaceholder").html(html);
    if (typeof tutorials[CURRENT_TUTO].pages[1] != 'undefined') $("#next_cont").html("<span id='next'>>> next</span>");
    else $("#next_cont").html("");
}

/**
 * Show a new page of the current tutorial in the main view
 */
var showPage = function (page) {
    CURRENT_PAGE = page;
    $("#page_number").html(page);
    $("#tuto_text").html(tutorials[CURRENT_TUTO].pages[page - 1].text);
    $(".tutovideo")[0].src = tutorials[CURRENT_TUTO].pages[page - 1].video;
    if (page <= 1) $("#prev_cont").html("");
    else $("#prev_cont").html("<span id='prev'><< prev</span>");
    if (typeof tutorials[CURRENT_TUTO].pages[page] != 'undefined') $("#next_cont").html("<span id='next'>>> next</span>");
    else $("#next_cont").html("");
}

/**
 * Listeners: click on prev and next page
 */
$(document).on("click", "#prev", function (e) {
    e.stopPropagation();
    showPage(CURRENT_PAGE - 1);
});
$(document).on("click", "#next", function (e) {
    e.stopPropagation();
    showPage(CURRENT_PAGE + 1);
});

/**
 * Listener: search
 */
$(".tuto_search").on("keyup", function (e) {
    var tutorialsFound = new Array();
    var search = $(".tuto_search").val().toUpperCase();
    $.each(tutorials, function (index, value) {
        var titleUpper = value.title.toUpperCase();
        if (titleUpper.indexOf(search) != -1) {
            var t = value;
            t["id"] = index;
            tutorialsFound.push(t);
        }
    });
    
    if (search != "") {
        updateTutoList(tutorialsFound);
    } else updateTutoList("all");
});

var updateTutoList = function (tutorialsFound) {
    $("#list_tuto").html("");
    if (tutorialsFound == "all") {
        $.each(tutorials, function (index, value) {
            var idstring = "'" + index + "'";
            $("#list_tuto").append("<li class='tutoClick' onclick=\"showTuto(" + idstring + ")\"><a>" + value.title + "</a></li>");
        });
    } else {
        $.each(tutorialsFound, function (index, value) {
            var idstring = "'" + value.id + "'";
            $("#list_tuto").append("<li class='tutoClick' onclick=\"showTuto(" + idstring + ")\"><a>" + value.title + "</a></li>");
        });
    }
}
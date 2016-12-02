//$(".newsHeader").on("click", function () {
//    $(".newsText").hide();
//    $(this).next(".newsText").show();
//});

$(document).ready(function () {
    $(".newsHeader").click(function () {
        $(this).next(".newsText").toggle();
    });
});
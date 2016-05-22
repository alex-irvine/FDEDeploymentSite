$(".newsHeader").on("click", function () {
    $(".newsText").hide();
    $(this).next(".newsText").show();
});
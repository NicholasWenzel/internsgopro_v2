//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require offers

jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});

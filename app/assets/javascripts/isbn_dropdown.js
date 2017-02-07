$(document).ready(function () {

  $("#ddlisbn")
    .select2({
      ajax: {
        url: "/publications/search/",
        dataType: "json",
        type: "POST",
        delay: 250,
        data: function (params) {
          return {
            ISBN: params.term
          };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; },
      minimumInputLength: 1
    });

});

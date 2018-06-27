$("a[data-confirm]").each(function (_, link) {
    var $link = $(link);
    var data = $link.data();
    data = $.extend({}, {
        "confirmFade": true,
        "confirmTitle": "DelProc"
    }, data);
    if ($link.data("method") == "delete") {
        data = $.extend({}, {
            "confirmTitle": "Warning",
            "confirmCancel": "Cancel",
            "confirmCancelClass": "btn-cancel",
            "confirmProceed": "Delete",
            "confirmProceedClass": "btn-danger"
        }, data);

    }
    $link.data(data);
});
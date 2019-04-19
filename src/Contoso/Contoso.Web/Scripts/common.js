function callAjaxPost(location, jsonData, funcSuccess, funcError) {
    //var tabId = sessionStorage.getItem('UniqueTabSession');
    jsonData = jsonData || {};

    $.ajax({
        url: location,
        method: "POST",
        contentType: "application/jsons; charset=utf-8",
        data: JSON.stringify(jsonData),
        success: function (data) {
            if (funcSuccess) funcSuccess(data);
        },
        error: function (data) {
            if (funcError) funcError(data);
        }
    });
}




var showModal = function (type, body, callback) {

    var $msgModal = $('#modal-' + type).modal({
        backdrop: true,
        show: false,
        keyboard: false
    });

    $msgModal
        .find('.modal-body').html(body).end()
        .find('.callback-btn').off('click.callback')
        .on('click.callback', function () {
            if(callback) callback();
            $msgModal.modal('hide');
        }).end()
      .modal('show');
};
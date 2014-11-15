jQuery ->
  $('#accordion a[data-version-id]').click  ->
    url = $(this).data('url')
    versionId = $(this).data('versionId')
    $.get url, version_page: versionId, (data) ->
      $('#panel-body-' + versionId).html(data)
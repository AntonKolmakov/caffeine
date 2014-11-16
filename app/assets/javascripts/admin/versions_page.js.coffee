jQuery ->
  $('#accordion a[data-version-id]').click  ->
    url = $(this).data('url')
    versionId = $(this).data('versionId')
    if $('#panel-body-' + versionId).html().length == 0
      $.get url, version_page: versionId, (data) ->
        $('#panel-body-' + versionId).html(data)
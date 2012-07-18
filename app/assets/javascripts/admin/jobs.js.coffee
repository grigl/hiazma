jQuery -> 
  $('#jobs_list').sortable(
    helper: fixHelper
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );
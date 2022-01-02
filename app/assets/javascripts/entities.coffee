$(document).ready ->
  $('[name=dictionary]').click ->
    id = $(this).data('id')
    role = $(this).data('role')
    checked = $(this).prop('checked')
    data = { entity: { id: id } }
    data['entity'][role] = checked

    $tr = $(this).closest('tr')
    checkboxes = $tr.find('input[type=checkbox]')
    if($(checkboxes[0]).prop('checked') && $(checkboxes[1]).prop('checked'))
      $tr.hide()

    $.ajax
      type: 'POST',
      url: '/entities/learn'
      data: data

  $('[name=article]').click ->
    role = $(this).attr('role')
    $tr = $(this).closest('tr')

    if(role == 'correct')
      $tr.css('background', 'lightgrey')

  $('[name=similar]').click ->
    id = $(this).data('id')
    data = { entity: { id: id } }

    $tr = $(this).closest('tr')
    $tr.hide()

    $counter = $('[role=counter]')

    $.ajax
      type: 'POST',
      url: '/entities/similar'
      data: data
      success: (count) ->
        $counter.text(count)
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
    console.log(role)

    if(role == 'correct')
      $tr.hide()
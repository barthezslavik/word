$(document).ready ->
  $('input[type=checkbox]').click ->
    id = $(this).data('id')
    role = $(this).data('role')
    checked = $(this).prop('checked')
    data = { entity: { id: id } }
    data['entity'][role] = checked

    $.ajax
      type: 'POST',
      url: '/entities/learn'
      data: data

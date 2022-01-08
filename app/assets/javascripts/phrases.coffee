$(document).ready ->
  $('[name=similar_phrase]').click ->
    id = $(this).data('id')
    data = { entity: { id: id } }

    $tr = $(this).closest('tr')
    $tr.hide()

    $counter = $('[role=counter]')

    $.ajax
      type: 'POST',
      url: '/phrases/similar'
      data: data
      success: (count) ->
        $counter.text(count)

  $('[name=unlearn]').click ->
    id = $(this).data('id')
    data = { entity: { id: id } }

    $tr = $(this).closest('tr')
    $tr.hide()

    $counter = $('[role=counter]')

    $.ajax
      type: 'POST',
      url: '/phrases/unlearn'
      data: data
      success: (count) ->
        $counter.text(count)
jQuery ->
  $('#dynamic_menu_element_types_type').on 'change', ->
    $(this).closest('form').submit()
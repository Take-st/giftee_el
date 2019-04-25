# $(document).on 'turbolinks:load', ->
#   $('#task-tags').tagit
#     fieldName:   'category_list'
#     singleField: true
#   $('#task-tags').tagit()
#   category_string = $("#category_hidden").val()
#   try
#     category_list = category_string.split(',')
#     for tag in category_list
#       $('#task-tags').tagit 'createTag', tag
#   catch error
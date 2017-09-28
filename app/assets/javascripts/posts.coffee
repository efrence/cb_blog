# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Default to JSON responses for remote calls
$.ajaxSetup({
  dataType: 'json'
})

$.fn.clear_form_errors = () ->
  this.find('.form-group').removeClass('has-error')	
  $(this.selector).find('span.help-block').each (i,elem)->
    elem.remove()

$.fn.clear_form_fields = () ->
  this.find(':input','#post_form')
      .not(':button, :submit, :reset, :hidden')
      .val('')
      .removeAttr('checked')
      .removeAttr('selected')

$.fn.render_form_errors = (model_name, errors) ->
  form = this
  $.fn.clear_form_errors.call(this)

  $.each(errors, (field, messages) ->
    input = form.find('input, select, textarea').filter(->
      name = $(this).attr('name')
      if name
        name.match(new RegExp(model_name + '\\[' + field + '\\(?'))
    )
    input.closest('.form-group').addClass('has-error')
    input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
  )

form_selector = "#new_post"

listener = ()->
  $(form_selector).on("ajax:success", (e, data, status, xhr) ->
    $(form_selector).html("<div>post is been created successfully</div>")
  ).on("ajax:error", (e, data, status, xhr) ->
    $(form_selector).render_form_errors('post', e.originalEvent.detail[0])
  )

$(document).on "ready", () ->
	listener()



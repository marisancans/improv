$(document).on 'click', '.sign-up-button', (event) ->
  event.preventDefault()
  new SignUp($(@.form))
   
class SignUp
  constructor: (form) ->
    @$form = $(form)
    url = @$form.attr('action')
    @postSignUp(url, @$form)

  postSignUp: (url, form) ->
    user_info = {}
    $('form input, form select, form textarea').each ->
      user_info[@name] = $(this).val()
    console.log(JSON.stringify(user_info))
    $.post
      url: url
      data : user_info
      success: ->
        console.log('S')
      error: ->
        console.log('E')
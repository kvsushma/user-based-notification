# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $new_message_form = $('#new-message')
  $new_message_body = $new_message_form.find('#message-body')
  $new_message_role = $new_message_form.find('#message-role')

  if $messages.length > 0

    window.role_ids.forEach (roleId) ->
      App['role_' + roleId] = App.cable.subscriptions.create {
        channel: 'WebNotificationsChannel',
        role: roleId
      },
      received: (data) ->
        if data['message']
          $new_message_body.val('')
          $messages.append data['message']

      send_message: (message) ->
        @perform 'send_message', message: message

      setWebNotificationRoleId: (id) -> this.webnotificationRoleId = id

    $new_message_form.submit (e) ->
      $this = $(this)
      message_body = $new_message_body.val()
      if $.trim(message_body).length > 0
        App['role_' + $new_message_role.val()].send_message message_body
      e.preventDefault()
      return false

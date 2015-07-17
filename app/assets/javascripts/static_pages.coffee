# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # Deselect radio buttons when custom volume field is selected
  $("#drink_volume_custom").focus ->
    $("input:radio").attr "checked", false
  # Set drink[volume] to 8 or 26 oz if one of the radio buttons is checked
  $("#new_drink").submit (e) ->
    $("#drink_volume_custom").val($('input:checked').val()) if $('input:checked').val()
    
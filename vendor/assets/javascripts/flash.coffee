# Author: Danil Pismenny https://github.com/dapi
#
# Install:
#
# add gem 'rails-assets-noty' with source 'https://rails-assets.org'
#
# Usage:
#
# window.Flash.show('error', 'message')
#
# or
#
# window.Flash.error('message')
#
#= require noty
#

TYPES = ['error', 'success', 'info', 'warning']
TIMEOUT = 5000

window.Flash =
  show: (type, message) -> new Noty(text: message, timeout: TIMEOUT, type: type).show()

for type in TYPES
  window.Flash[type] = (message) -> @show(type, message)

# Хендлеры имеет смысл отдавать в AJAX-запросы следующим образом
#
#  xhr = $.ajax
#    fail: window.ajaxFailHanlder
#    error: window.ajaxErrorHandler response, message
#
window.ajaxErrorHandler = (response) ->

  # readyState Holds the status of the XMLHttpRequest. 
  # 0: request not initialized 
  # 1: server connection established
  # 2: request received 
  # 3: processing request 
  # 4: request finished and response is ready

  return if response.readyState == 0
  message = response.responseText || response.statusText
  console.error? "Ошибка загрузки #{message}"
  Flash.error message

window.ajaxFailHanlder = (response) ->
  return if response.readyState == 0
  console.error? "Fail загрузки #{response}"
  Flash.error response

#= require noty
#
# Usage:
#
# add gem 'rails-assets-noty' with source 'https://rails-assets.org'
#

TIMEOUT = 5000

window.Flash =
  error:   (message) -> new Noty(text: message, timeout: TIMEOUT, type: 'error').show()
  success: (message) -> new Noty(text: message, timeout: TIMEOUT, type: 'success').show()
  info:    (message) -> new Noty(text: message, timeout: TIMEOUT, type: 'information').show()
  warning: (message) -> new Noty(text: message, timeout: TIMEOUT, type: 'warning').show()

window.ajaxErrorHandler = (response) ->

  # readyState Holds the status of the XMLHttpRequest. 
    #0: request not initialized 
    #1: server connection established
    #2: request received 
    #3: processing request 
    #4: request finished and response is ready
  
  return if response.readyState == 0
  message = response.responseText || response.statusText
  console.error? "Ошибка загрузки #{message}"
  Flash.error message

window.ajaxFailHanlder = (response) ->
  return if response.readyState == 0
  console.error? "Fail загрузки #{response}"
  Flash.error response

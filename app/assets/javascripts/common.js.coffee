window.hideSpinner = ->
  $('#spinner').hide()

window.showSpinner = ->
	$('#spinner').show()
	
$(document).ready ->
  $("#javascript_require").hide()
  $("#main").fadeIn()
  $("#messages").effect( "bounce", "slow")

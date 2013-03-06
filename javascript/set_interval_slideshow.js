$(function() {
	$(".image_container img:gt(0)").hide()
	setInterval(function() {
		$(".image_container :first-child")
			.stop(true, true).fadeOut()
			.next().fadeIn().end()
			.appendTo(".image_container")
	}, 4000)
})
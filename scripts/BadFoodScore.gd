extends Label

func _process(delta):
	text = "Total Unhealthy Foods Ate: "+String(Global.badfoods)


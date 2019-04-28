extends Sprite

func _ready():
	# Assign the sprite's texture to the viewport texture
	$Viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	
	# Let two frames pass to make sure the screen was captured
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	texture = $Viewport.get_texture()
  
	set_process(true)
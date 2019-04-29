tool
extends Node2D

class_name Eye


export (Color, RGB) var color = Color("55f") setget set_color
export (float) var radius = 10 setget set_radius
export (float, 0, 1) var pupil_size = 0.2 setget set_pupil_size
export var pupil_position = Vector2(0, 0) setget set_pupil_position
export (float, 0, 1) var lid_upper = 0 setget set_lid_upper
export (float, 0, 1) var lid_lower = 0 setget set_lid_lower

var update_animation_flag = true

func update_animation(s=""):
	update_animation_flag = not s

func set_color(col):
	color = col
	update()

func set_radius(f):
	radius = f
	update()

func set_pupil_size(f):
	pupil_size = f
	update()
	
func set_pupil_position(v):
	if v.length_squared() > 1:
		v = v.normalized() #ensure pupil position is whithin bounds
	if (v - pupil_position).length_squared() > 0.5:
		blink()
	pupil_position = v
	update()

func set_lid_upper(f):
	lid_upper = f
	update_animation()
	update()

func set_lid_lower(f):
	lid_lower = f
	update_animation()
	update()

func _ready():
	pupil_dart()
	$AnimationPlayer.connect("animation_finished", self, "update_animation")

func _draw():
	draw_circle(Vector2(0, 0), radius, Color("#FFF"))
	draw_pupil()
	draw_eyelids()

func draw_pupil():
	var pos = pupil_position * radius * (1 - pupil_size) #centre of pupil is at most one pupil radius from from the edge of the eye (assuming normalised position vector)
	draw_circle(pos, radius * pupil_size, Color("#111"))

func draw_eyelids():
	if lid_lower:
		var points = semicircle(Vector2(radius, radius))
		points += semicircle(Vector2(radius * -1, radius * (1 - lid_lower))) #the -1 is to reverse the points along the x axis so they join up nicely with the previous points
		draw_colored_polygon(PoolVector2Array(points), color)
	if lid_upper:
		var points = semicircle(Vector2(radius, radius * -1))
		points += semicircle(Vector2(radius, radius * (1 - lid_upper)) * -1)
		draw_colored_polygon(PoolVector2Array(points), color)

func semicircle(scale=Vector2(1,1), centre=Vector2(0,0), resolution=16):
	var points = PoolVector2Array()
	for i in range(resolution):
		points.push_back(Vector2(
			cos(PI * i / resolution),
			sin(PI * i / resolution)
		) * scale + centre)
	return points

func pupil_dart():
	while true:
		set_pupil_position(Vector2(randf() * 2 - 1, randf() * 2 - 1))
		yield(get_tree().create_timer(randf() * 4), "timeout")

func blink():
	if update_animation_flag: #animation player is not context sensitive so 
		#$AnimationPlayer.remove_animation("blink")
		#$AnimationPlayer.add_animation("blink", blink_animation())
		blink_animation()
	$AnimationPlayer.play("blink")

func blink_animation():
	var anim = $AnimationPlayer.get_animation("blink")
	anim.track_set_key_value(0, 0, lid_upper)
	anim.track_set_key_value(0, 2, lid_upper)
	anim.track_set_key_value(1, 0, lid_lower)
	anim.track_set_key_value(1, 2, lid_lower)
	

		

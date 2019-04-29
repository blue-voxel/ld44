tool
extends Node2D

class_name Eye


export (float) var radius = 10 setget set_radius
export (float, 0, 1) var pupil_size = 0.2 setget set_pupil_size
export (float, -1, 1) var pupil_position = 0 setget set_pupil_position
export (float, 0, 1) var lid_upper = 0 setget set_lid_upper
export (float, 0, 1) var lid_lower = 0 setget set_lid_lower

func set_radius(f):
	radius = f
	update()

func set_pupil_size(f):
	pupil_size = f
	update()
	
func set_pupil_position(f):
	pupil_position = f
	update()

func set_lid_upper(f):
	lid_upper = f
	update()

func set_lid_lower(f):
	lid_lower = f
	update()
	
func _draw():
	draw_circle(Vector2(0, 0), radius, Color("#FFF"))
	draw_circle(Vector2(pupil_position * radius, 0), radius * pupil_size, Color("#111"))
	draw_eyelids()

func draw_eyelids():
	var angle = 70
	draw_circle_arc_poly(Vector2(0, radius), radius, -angle, angle, Color("#eee"))
	draw_circle_arc_poly(Vector2(0, -radius), radius, 180-angle, 180+angle, Color("#eee"))

# Note: This isn't working properly. I think I'll change it so that we're drawing the
# white of the eye instead, in a 'vesca piscis' (google it) shape. This also resembles an eye
# more.
func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	draw_polygon(points_arc, colors)
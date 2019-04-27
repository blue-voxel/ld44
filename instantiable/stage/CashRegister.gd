tool
extends Node2D

#export (int, 1, 10) var pocket_count setget set_pocket_count
#export (float, 0, 1000) var height setget set_height
#export (float, 0, 1000) var width setget set_width
#export (float, 0, 100) var thickness setget set_thickness
#
#var pocket_scene
#var pockets = []
#
#func set_pocket_count(i):
#	pocket_count = i
#	while len(pockets) > pocket_count:
#		pockets.pop_back()
#
#	while len(pockets) < pocket_count:
#		_ready()
#		var p = pocket_scene.instance()
#		add_child(p)
#		pockets.push_back(p)
#	print(pockets)
#	set_width(width)
#
#func set_height(f):
#	height = f
#	for p in pockets:
#		p.set_height(height)
#
#func set_width(f):
#	width = f
#	var pw = width - thickness * (pocket_count)
#	for p in pockets:
#		p.set_width()
#
#func set_thickness(f):
#	thickness = f
#
#func _ready():
#	print("preloading")
#	pocket_scene = preload("res://instantiable/stage/CashRegisterPocket.tscn")


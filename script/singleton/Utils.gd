extends Node

enum LAYERS{
	STATIC,
	UI,
	DODLAR,
	PRODUCT
}
const MONEY = [1, 3, 5, 12, 28, 64]

var products = []
var currency = []

func get_products():
	if len(products):
		return products
	else:
		return get_scenes("res://instantiable/products/_test")

func get_currency():
	if len(currency):
		return currency
	else:
		return get_scenes("res://instantiable/currency/_test")

func get_scenes(path):
	var scenes = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	
	var file = dir.get_next()
	while file != "":
		if file.ends_with(".tscn"):
			scenes.push_back(load(path + "/" + file))
		file = dir.get_next()
	
	return scenes
	
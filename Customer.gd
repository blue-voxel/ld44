extends "res://script/area2d/_Scan.gd"

export(String, DIR) var path = "res://instantiable/product"

var active_products = []

func _ready():
	spawn_product(0)

func drop_items():
	pass

func spawn_product(i):
	var product = Utils.get_products()[i].instance()
	product.get_node("Value").connect("scanned", self, "on_active_product_scanned", [len(active_products)])
	active_products.push_back(product)
	get_tree().get_root().call_deferred("add_child", product) #ensure that the scene is not busy when we add
	product.position = position

func on_active_product_scanned(index):
	active_products.remove(index)
	if not len(active_products):
		pass
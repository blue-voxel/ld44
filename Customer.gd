extends "res://script/area2d/_Scan.gd"

export(String, DIR) var path = "res://instantiable/product"

var active_products = []
var active_value = 0

func _ready():
	drop_products()

func drop_products():
	spawn_product(1)
	yield(get_tree().create_timer(0.2), "timeout")
	spawn_product(1)
	yield(get_tree().create_timer(0.5), "timeout")
	spawn_product(0)

func spawn_product(i):
	var product = Utils.get_products()[i].instance()
	product.get_node("Value").connect("scanned", self, "on_active_product_scanned", [len(active_products)])
	active_products.push_back(product)
	active_value += _get_content_value(product)
	spawn_item(product)

func spawn_item(item):	
	get_tree().get_root().call_deferred("add_child", item) #ensure that the scene is not busy when we add
	item.position = position + Vector2((randf() -0.5) * 100, (randf() -0.5) * 100)

func on_active_product_scanned(product):
	print(active_products)
	active_products.erase(product)
	if not Utils.any(active_products):
		print("attenmpting progression")
		Game.progress_stage(Game.SCAN + 1)
		drop_currency(active_value)
		active_value = 0
	
func drop_currency(amount):
	for i in range(amount):
		spawn_dodlar(0)
		yield(get_tree().create_timer(randf() * 0.1), "timeout")

func spawn_dodlar(i):
	var dodlar = Utils.get_currency()[i].instance()
	active_value += _get_content_value(dodlar)
	spawn_item(dodlar)
	
	
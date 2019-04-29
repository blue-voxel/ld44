extends "res://script/area2d/_Scan.gd"

export(String, DIR) var path = "res://instantiable/product"

var active_products = []
var active_value = 0

func _ready():
	spawn_product(0)

func drop_products():
	pass

func spawn_product(i):
	var product = Utils.get_products()[i].instance()
	product.get_node("Value").connect("scanned", self, "on_active_product_scanned", [len(active_products)])
	active_products.push_back(product)
	active_value += _get_content_value(product)
	spawn_item(product)

func spawn_item(item):	
	get_tree().get_root().call_deferred("add_child", item) #ensure that the scene is not busy when we add
	item.position = position

func on_active_product_scanned(index):
	active_products.remove(index)
	if not len(active_products):
		drop_currency(active_value)
		active_value = 0
	
func drop_currency(amount):
	for i in range(amount):
		spawn_dodlar(0)
		yield(get_tree().create_timer(randf()+0.2), "timeout")

func spawn_dodlar(i):
	var dodlar = Utils.get_currency()[i].instance()
	active_value += _get_content_value(dodlar)
	spawn_item(dodlar)
	
	
extends Node2D

var sum_value

export (int, 1, 10) var pocket_count

var pockets = []

func _ready():
	if 0 < pocket_count:
		pockets.push_back($Pocket0)
	if 1 < pocket_count:
		pockets.push_back($Pocket1)
	if 2 < pocket_count:
		pockets.push_back($Pocket2)
	if 3 < pocket_count:
		pockets.push_back($Pocket3)
	if 4 < pocket_count:
		pockets.push_back($Pocket4)
	if 5 < pocket_count:
		pockets.push_back($Pocket5)
	if 6 < pocket_count:
		pockets.push_back($Pocket6)
	if 7 < pocket_count:
		pockets.push_back($Pocket7)
	if 8 < pocket_count:
		pockets.push_back($Pocket8)	
	if 9 < pocket_count:
		pockets.push_back($Pocket9)
	if 10 < pocket_count:
		pockets.push_back($Pocket10)
	
	for i in range(len(pockets)):
		pockets[i].accept_only = Utils.MONEY[i]
		pockets[i].connect("update", self, "get_sum_value")

func get_sum_value():
	sum_value = 0
	for p in pockets:
		sum_value += p.sum_value
	emit_signal("update", sum_value)

signal update(value)


tool
extends Node

class_name Value, "res://image/dodlar_sign.svg"

export (int) var amount = 1 setget set_amount
export (int, -1, 5) var fixed_amount = -1 setget set_fixed_amount

func set_amount(i, update_fixed=true):
	amount = i
	if update_fixed:
		for j in range(len(Utils.MONEY)):
			if amount == Utils.MONEY[j] and 0 <= fixed_amount:
				set_fixed_amount(j, false)
				return
		set_fixed_amount(-1, false)
	else:
		property_list_changed_notify() #updates values in the inspector

func set_fixed_amount(i, update_amount=true):
	fixed_amount = i
	if update_amount and 0 <= i:
		set_amount(Utils.MONEY[i], false)
	else:
		property_list_changed_notify()

signal scanned




tool
extends Node

class_name Value, "res://image/dodlar_sign.svg"
export (int) var amount = 1 setget set_amount
export (int, 0, 5) var fixed_amount = null setget set_fixed_amount

func set_amount(i, update_fixed=true):
	amount = i
	if update_fixed:
		for k in Utils.MONEY.keys():
			if amount == Utils.MONEY[k]:
				set_fixed_amount(k, false)
				return
		set_fixed_amount(null, false)
	else:
		property_list_changed_notify()

func set_fixed_amount(i, update_amount=true):
	fixed_amount = i
	if update_amount:
		set_amount(Utils.MONEY[i], false)
		print(amount)
	else:
		property_list_changed_notify()





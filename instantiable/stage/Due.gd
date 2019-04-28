tool
extends Control

export (int) var amount = 0 setget set_amount

func set_amount(i):
	amount = i
	if amount < 0:
		$Label.text = "Change Due:"
	else:
		$Label.text = "Payment Due:"
	$Money.text = "$" + str(abs(amount))



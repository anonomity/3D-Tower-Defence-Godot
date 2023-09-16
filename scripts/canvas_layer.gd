extends CanvasLayer


var money_val = 100
@onready var panel = $Control/Panel
@onready var lose = $Control/lose

@onready var money = $Control/money
@onready var cores = $Control/cores
var cores_val = 4
var selected_podium = null



func _ready():
	EventBus.click_podium.connect(on_click_podium)
	EventBus.core_taken.connect(on_core_taken)
	EventBus.win.connect(on_win)
	lose.hide()

func on_core_taken():
	cores_val -= 1
	cores.text = str("Cores: ", cores_val)

func on_click_podium(podium):
	panel.show()
	selected_podium= podium

func on_win():
	lose.show()

func _on_button_pressed():
	lower_money(100)
	selected_podium.spawn()
	panel.hide()


func lower_money(amount):
	money.text = str(money_val- amount)

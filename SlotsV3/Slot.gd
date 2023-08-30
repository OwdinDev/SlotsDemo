extends Control

onready var row = $Fruits

const MOVE := 10
const TURN := -20
var rolling = false

var time_interval := 0.025
var rng = RandomNumberGenerator.new()
var random_value := 0


func _process(delta):
	
	
	if rolling == true:
		var NewPosY = $Fruits.rect_position.y + MOVE
		if NewPosY >= 120:
			NewPosY = -200
		$Fruits.rect_position.y = NewPosY
	else:
		pass

func Spin_Pressed():
	
	rolling = true
	yield(get_tree().create_timer(4),"timeout")
	rolling = false


func Roll():
	
	var NewPosY = $Fruits.rect_position.y + TURN
	if NewPosY >= 120:
		NewPosY = -200
	$Fruits.rect_position.y = NewPosY

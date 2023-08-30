extends Control

var money = 1000
var jackpot = 1200
var total_bet = 100
var win = 50
var spinning = false
var check_spin = false


func _process(delta):
	
	$Currency/Bet/Label.text = "Jackpot: " + String(jackpot)
	$Currency/TotalBet/Label.text = "Total Bet: " + String(total_bet)
	$Currency/Win/Label.text = "Win: " + String(win)
	
	
	if check_spin == true:
		if spinning == false:
			if total_bet > 0:
				spin()
	else:
		pass


func _on_SpinButton_pressed():
	
	if total_bet > 0:
		if spinning == false:
			$SpinButton/AudioStreamPlayer.playing = true
			spinning = true
			spin()
			yield(get_tree().create_timer(4.5),"timeout")
			spinning = false
		else:
			if spinning == true:
				pass


func _on_AutoSpinButton_pressed():
	$SpinButton/AudioStreamPlayer.playing = true
	if check_spin == false:
		check_spin = true
	elif check_spin == true:
		check_spin = false

func spin():
	
	spinning = true
	$Slot.Spin_Pressed()
	yield(get_tree().create_timer(0.5),"timeout")
	$Slot2.Spin_Pressed()
	yield(get_tree().create_timer(0.5),"timeout")
	$Slot3.Spin_Pressed()
	yield(get_tree().create_timer(0.5),"timeout")
	$Slot4.Spin_Pressed()
	yield(get_tree().create_timer(0.5),"timeout")
	$Slot5.Spin_Pressed()
	yield(get_tree().create_timer(4),"timeout")
	spinning = false
	Win()

func Win():
	
	var winrate = randi() % 10
	
	if winrate == 8:
		win += jackpot
		total_bet = 0
		jackpot = 0
	else:
		win += total_bet * 1.2
		total_bet = 0
		jackpot += win * 5


func _on_MaxBetButton_pressed():
	if win > 30000:
		win -= 30000
		total_bet += 30000
	elif win < 30000:
		total_bet = total_bet + win
		win -= win


func _on_IncreaseBet_pressed():
	if total_bet == 0 and win >= 50:
		total_bet += 50
		win -= 50
	elif total_bet == 50 and win >= 50:
		total_bet = 100
		win -= 50
	elif total_bet == 100 and win >= 100:
		total_bet = 200
		win -= 100
	elif total_bet == 200 and win >= 200:
		total_bet = 400
		win -= 200
	elif total_bet == 400 and win >= 400:
		total_bet = 800
		win -= 400
	elif total_bet == 800 and win >= 200:
		total_bet = 1000
		win -= 200


func _on_DecreaseBet_pressed():
	
	if total_bet == 50:
		total_bet -= 50
		win += 50
	elif total_bet == 100:
		total_bet -= 50
		win += 50
	elif total_bet == 200:
		total_bet -= 100
		win += 100
	elif total_bet == 400:
		total_bet -= 200
		win += 200
	elif total_bet == 800:
		total_bet -= 400
		win += 400
	elif total_bet == 1000:
		total_bet -=200
		win += 200

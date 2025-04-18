extends Control

var coinValue: float = 0
var quantity: String = ""
var subTotal: float = 0
var contador: float = 0
var quantityInt: int = 0

#ACTIVACION DE CHECK BOXES MONEDAS
#region New Code Region

func _on_cb_one_cent_pressed() -> void:
	coinValue = 0.01
	play_sound($UiPop)
func _on_cb_two_cent_pressed() -> void:
	coinValue= 0.02
	play_sound($UiPop)
func _on_cb_five_cent_pressed() -> void:
	coinValue= 0.05
	play_sound($UiPop)
func _on_cb_ten_cent_pressed() -> void:
	coinValue = 0.10
	play_sound($UiPop)	
func _on_cb_twenty_cent_pressed() -> void:
	coinValue = 0.20
	play_sound($UiPop)
func _on_cb_fifty_cent_pressed() -> void:
	coinValue = 0.50
	play_sound($UiPop)
func _on_cb_one_euro_pressed() -> void:
	coinValue = 1.00
	play_sound($UiPop)
func _on_cb_two_euro_pressed() -> void:
	coinValue = 2.00
	play_sound($UiPop)
#endregion
	
#ACTIVACION DE CHECK BOXES BILLETES
#region New Code Region

func _on_cb_five_euro_pressed() -> void:
	coinValue = 5.00
	play_sound($UiPop)
func _on_cb_ten_euro_pressed() -> void:
	coinValue = 10.00
	play_sound($UiPop)
func _on_cb_twenty_euro_pressed() -> void:
	coinValue = 20.00
	play_sound($UiPop)
func _on_cb_fifty_euro_pressed() -> void:
	coinValue = 50.00
	play_sound($UiPop)
func _on_cb_one_hundred_euro_pressed() -> void:
	coinValue = 100.00
	play_sound($UiPop)
func _on_cb_two_hundred_euro_pressed() -> void:
	coinValue = 200.00
	play_sound($UiPop)
#endregion
	
#ACTIVACION DE BOTONES NUMPAD (BOTONES CALCULADORA)
#region New Code Region

func _on_button_pressed() -> void:
	quantity += "1"
	play_sound($TecladoMac1)
func _on_button_2_pressed() -> void:
	quantity += "2"
	play_sound($TecladoMac1)
func _on_button_3_pressed() -> void:
	quantity += "3"
	play_sound($TecladoMac1)
func _on_button_4_pressed() -> void:
	quantity += "4"
	play_sound($TecladoMac1)
func _on_button_5_pressed() -> void:
	quantity += "5"
	play_sound($TecladoMac1)
func _on_button_6_pressed() -> void:
	quantity += "6"
	play_sound($TecladoMac1)
func _on_button_7_pressed() -> void:
	quantity += "7"
	play_sound($TecladoMac1)
func _on_button_8_pressed() -> void:
	quantity += "8"
	play_sound($TecladoMac1)
func _on_button_9_pressed() -> void:
	quantity += "9"
	play_sound($TecladoMac1)
func _on_button_10_pressed() -> void:
	quantity += "0"
	play_sound($TecladoMac1)
#endregion


#BOTON 'SUMA'
func _on_suma_button_pressed() -> void:
	play_sound($ChaChing)
	#DESMARCA CHECKBOXES DE COINS Y BILLS
	desmarcar_checkboxesCoins()
	desmarcar_checkboxesBills()
	desmarcar_numPadButton()
	quantityInt = int(quantity)
	#MULTIPLICA EL VALOR DE COIN/BILL ACTUAL POR LA CANTIDAD
	subTotal = coinValue * quantityInt
	
	#ACUMULA EL IMPORTE PARCIAL A LA ESPERA DE IR AGREGANDO MÁS
	contador = contador + subTotal
	
	
	#INFORMA DEL RESULTADO. TO/DO MOSTRAR ESTO MISMO EN LA APP
	#antes, identifica si se trata de una moneda o billete para adecuar el mensaje que mostrará.
	
	#si se trata de centimos
	if coinValue <=0.50:		
		msg_cent_coins()		
	# Si se trata de monedas de 1 o 2 euros	
	elif coinValue == 1.00 or coinValue == 2.00:
		msg_euro_coins()		
	# Si se trata de billtes 
	else: 
		msg_euro_bills()
		
	reiniciar_variables()
	
#FUNCIONES QUE DESMARCAN LOS CHECKBOXES DE MONEDAS, BILLETES Y NUMPAD AL PICAR EN EL BOTÓN SUMA

func desmarcar_checkboxesCoins():
	for child in $VBoxContainer/CoinsGrid.get_children():
		if child is CheckBox:
			child.set_pressed_no_signal(false) # Desmarcar el CheckBox de coins
			
func desmarcar_checkboxesBills():
	for child in $VBoxContainer/BillGrid.get_children():
		if child is CheckBox:
			child.set_pressed_no_signal(false) # Desmarcar el CheckBox de coins

func desmarcar_numPadButton():
	for child in $VBoxContainer/NumPadGrid.get_children():
		if child is Button:
			child.set_pressed_no_signal(false) 
			
#REINICIA VARIABLES quantityInt y quantity (al picar en 'suma' o 'borrar')
func reiniciar_variables():
	#Reinicia las variables para efectuar otra operación evitando que queden almacenados los numeros anteriores. 
	quantityInt = 0
	quantity = ""
	
# MENSAJES	
func msg_cent_coins():
	#los convierte a entero multiplicando por 100 para que se vea mejor el mensaje
	var centimos = int(coinValue * 100)
	var msg1: String = ("\nHas sumado " + str(quantity) + " monedas de " + str(centimos) + " céntimos")
	var msg2: String = ("Llevas ahorrado " + str(contador) + " Euros " )
	print (msg1)
	print (msg2)
	$VBoxContainer/Msg01.text = msg1
	$VBoxContainer/Msg02.text = msg2
	
func msg_euro_coins():
	var msg1: String = ("\nHas sumado " + str(quantity) + " monedas de " + str(coinValue) + " Euro" )
	var msg2: String = ("Llevas ahorrado " + str(contador) + " Euros " )
	print (msg1)
	print (msg2)
	$VBoxContainer/Msg01.text = msg1
	$VBoxContainer/Msg02.text = msg2
func msg_euro_bills():
	var msg1: String = ("\nHas sumado " + str(quantity) + " billetes de " + str(coinValue) + " Euros" )
	var msg2: String = ("Llevas ahorrado " + str(contador) + " Euros " )
	print (msg1)
	print (msg2)
	$VBoxContainer/Msg01.text = msg1
	$VBoxContainer/Msg02.text = msg2
func play_beep_one():
	$Beep.play()
func play_sound(sound):
	sound.play()

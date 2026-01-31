extends Node2D

#Everything we want to press or hide
@onready var mask_selection_overlay = %MaskSelection
@onready var colombina_button = %ColombinaButton
@onready var gnaga_button = %GnagaButton
@onready var dottore_button = %DottoreButton
@onready var sunmoon_button = %SunandMoonButton

#Gameplay variables
var colombina = Globals.colombina
var dottore = Globals.dottore
var sunmoon = Globals.sunmoon
var gnaga = Globals.gnaga

#Do these when starting the game
func _ready() -> void:
	mask_selection_overlay.visible = true


func _on_colombina_button_button_down():
	Globals.colombina = true
	gnaga = false
	sunmoon = false
	dottore = false
	mask_selection_overlay.visible = false
	Dialogic.start("Day1_Signora_Welcome")
	return # Replace with function body.


func _on_gnaga_button_pressed():
	gnaga = true
	colombina = false
	sunmoon = false
	dottore = false
	mask_selection_overlay.visible = false
	Dialogic.start("Day1_Signora_Welcome")
	return



func _on_sunand_moon_button_pressed():
	gnaga = false
	colombina = false
	sunmoon = true
	dottore = false
	mask_selection_overlay.visible = false
	Dialogic.start("Day1_Signora_Welcome")
	return


func _on_dottore_button_pressed():
	gnaga = false
	colombina = false
	sunmoon = false
	Globals.dottore = true
	mask_selection_overlay.visible = false
	Dialogic.start("Day1_Signora_Welcome")
	return

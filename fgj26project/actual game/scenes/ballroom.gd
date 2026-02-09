extends Node2D

#Everything we want to press or hide
@onready var mask_selection_overlay = %MaskSelection
@onready var harlequin_talk_overlay = %HarlequinTalk
@onready var colombina_button = %ColombinaButton
@onready var gnaga_button = %GnagaButton
@onready var dottore_button = %DottoreButton
@onready var sunmoon_button = %SunandMoonButton
@onready var endoverlay = %TheEndOverlay
@onready var backgroundballroom = %Background_ballroom
@onready var signora = %Signora
@onready var pierrot = %Pierrot
@onready var pantalone = %Pantalone
@onready var tartaglia = %Tartaglia
@onready var enddaybutton = %EndTheDayButton
@onready var died_overlay = %DiedOverlay
@onready var replay_button = %ReplayButton
@onready var replay_button2 = %ReplayButton2

#Placement variables Day 1
var signoraplace1 = Vector2(1600,30)
var signoraplace2 = Vector2(900,400)
var tartagliaplace1 = Vector2(1350,200)
var tartagliaplace2 = Vector2(1350, 30)

#Gameplay variables
var colombina = Globals.colombina
var dottore = Globals.dottore
var sunmoon = Globals.sunmoon
var gnaga = Globals.gnaga

#Do these when starting the game
func _ready():
	mask_selection_overlay.visible = false
	backgroundballroom.visible = false
	signora.visible = false
	pierrot.visible = false
	pantalone.visible = false
	tartaglia.visible = false
	endoverlay.visible = true
	
	
#check every frame
func _process(delta):
	
	if Globals.dialoguefinished == true:
		harlequin_talk_overlay.visible = false
		mask_selection_overlay.visible = true
		Globals.dialoguefinished = false
	if Globals.gameended == true:
		endoverlay.visible = true
	if (Globals.pantalonediscussed == true) and (Globals.pierrotdiscussed == true) and (Globals.tartagliadiscussed == true):
		enddaybutton.visible = true	
	if Globals.pantalonediscussed == true and Globals.pantalonesister == true:
		signora.position = signoraplace2
	elif Globals.tartagliadistraction == true and Globals.pantalonesister == false:
		signora.position = signoraplace1
		tartaglia.position = tartagliaplace2
		tartaglia.scale = Vector2(0.18,0.18)
	else:
		signora.position = signoraplace1
		tartaglia.position = tartagliaplace1

#mask selections
func _on_colombina_button_button_down():
	Globals.colombina = true
	gnaga = false
	sunmoon = false
	dottore = false
	mask_selection_overlay.visible = false
	backgroundballroom.visible = true
	signora.visible = true
	pierrot.visible = true
	pantalone.visible = true
	tartaglia.visible = true
	colombina_button.MOUSE_FILTER_IGNORE
	gnaga_button.MOUSE_FILTER_IGNORE
	sunmoon_button.MOUSE_FILTER_IGNORE
	dottore_button.MOUSE_FILTER_IGNORE
	Dialogic.start("Day1_Signora_Welcome")
	return # Replace with function body.


func _on_gnaga_button_pressed():
	Globals.gnaga = true
	colombina = false
	sunmoon = false
	dottore = false
	mask_selection_overlay.visible = false
	backgroundballroom.visible = true
	signora.visible = true
	pierrot.visible = true
	pantalone.visible = true
	tartaglia.visible = true
	colombina_button.MOUSE_FILTER_IGNORE
	gnaga_button.MOUSE_FILTER_IGNORE
	sunmoon_button.MOUSE_FILTER_IGNORE
	dottore_button.MOUSE_FILTER_IGNORE
	Dialogic.start("Day1_Signora_Welcome")
	return


func endtheday():
	enddaybutton.visible = false
	Globals.pantalonediscussed = false
	backgroundballroom.visible = false
	signora.visible = false
	pierrot.visible = false
	pantalone.visible = false
	tartaglia.visible = false
	Dialogic.start("Day1_Debrief")
	endoverlay.visible = true

func _on_sunand_moon_button_pressed():
	gnaga = false
	colombina = false
	Globals.sunmoon = true
	dottore = false
	mask_selection_overlay.visible = false
	backgroundballroom.visible = true
	signora.visible = true
	pierrot.visible = true
	pantalone.visible = true
	tartaglia.visible = true
	colombina_button.MOUSE_FILTER_IGNORE
	gnaga_button.MOUSE_FILTER_IGNORE
	sunmoon_button.MOUSE_FILTER_IGNORE
	dottore_button.MOUSE_FILTER_IGNORE
	Dialogic.start("Day1_Signora_Welcome")
	return


func _on_dottore_button_pressed():
	gnaga = false
	colombina = false
	sunmoon = false
	Globals.dottore = true
	mask_selection_overlay.visible = false
	backgroundballroom.visible = true
	signora.visible = true
	pierrot.visible = true
	pantalone.visible = true
	tartaglia.visible = true
	colombina_button.MOUSE_FILTER_IGNORE
	gnaga_button.MOUSE_FILTER_IGNORE
	sunmoon_button.MOUSE_FILTER_IGNORE
	dottore_button.MOUSE_FILTER_IGNORE
	Dialogic.start("Day1_Signora_Welcome")
	return

func _on_signora_pressed():
	#Dialogic.start("Day1_Signora_Welcome")
	return # Replace with function body.


func _on_pierrot_pressed():
	#
	Dialogic.start("Day1_Pierrot")

	return # Replace with function body.


func _on_pantalone_pressed():
	Dialogic.start("Day1_Pantalone")
	return # Replace with function body.
	


func _on_tartaglia_pressed():
	Dialogic.start("Day1_Tartaglia")
	return # Replace with function body.


func _on_end_the_day_button_pressed():
	endtheday()
	return # Replace with function body.


func _on_replay_button_2_pressed():
	Dialogic.start("Mission_Brief")
	return # Replace with function body.

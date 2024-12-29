extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var controlUpName = $controlUpName
onready var controlUpName_titleLabel38Name = $controlUpName/titleLabel38Name
onready var controlUpName_commonHSeparator1 = $controlUpName/commonHSeparator1
onready var controlUpName_commonHSeparator2 = $controlUpName/commonHSeparator2
onready var animationPlayerUpName = $animationPlayerUpName
onready var controlTips = $controlTips
onready var controlTips_titleLabel20Tips = $controlTips/titleLabel20Tips
onready var controlTips_commonHSeparator1 = $controlTips/commonHSeparator1
onready var controlTips_commonHSeparator2 = $controlTips/commonHSeparator2
onready var animationPlayerTips = $animationPlayerTips
onready var controlMiddleString = $controlMiddleString
onready var controlMiddleString_CommonLabel31 = $controlMiddleString/CommonLabel31
onready var animationPlayerMiddleString = $animationPlayerMiddleString

func _ready():
	OnAnimationPlayerUpNameEnd()
	HideTips()
	HideMiddleString()

func ShowUpName(nameString: String):
	animationPlayerUpName.stop()
	
	controlUpName.visible = true
	controlUpName_titleLabel38Name.text = nameString
	var stringSize: Vector2 = controlUpName_titleLabel38Name.get_font("font").get_string_size(nameString)
	var stringSize_x_2_: float = -(stringSize.x / 2)
	var controlUpName_commonHSeparator_xOffset: int = 5 # 5
	var controlUpName_commonHSeparator_Height: int = controlUpName_commonHSeparator2.rect_size.y # 4
	controlUpName_titleLabel38Name.rect_position.x = stringSize_x_2_
	controlUpName_commonHSeparator1.rect_position.x = stringSize_x_2_ - controlUpName_commonHSeparator_xOffset
	controlUpName_commonHSeparator2.rect_position.x = stringSize_x_2_ + stringSize.x + controlUpName_commonHSeparator_Height + controlUpName_commonHSeparator_xOffset
	animationPlayerUpName.play("FadeOut")

func OnAnimationPlayerUpNameEnd():
	HQH.Log("UpNamePanel.OnAnimationPlayerUpNameEnd")
	controlUpName.visible = false

func _on_animationPlayerUpName_animation_finished(_anim_name: String):
	OnAnimationPlayerUpNameEnd()

func IsTipsVisible() -> bool:
	return controlTips.visible

func ShowTips(tipsString: String):
	animationPlayerTips.stop()
	
	controlTips.visible = true
	controlTips_titleLabel20Tips.text = tipsString
	var stringSize: Vector2 = controlTips_titleLabel20Tips.get_font("font").get_string_size(tipsString)
	var stringSize_x_2_: float = -(stringSize.x / 2)
	controlTips_titleLabel20Tips.rect_position.x = stringSize_x_2_
	controlTips_commonHSeparator1.rect_size.x = stringSize.x
	controlTips_commonHSeparator1.rect_position.x = stringSize_x_2_
	controlTips_commonHSeparator2.rect_size.x = stringSize.x
	controlTips_commonHSeparator2.rect_position.x = stringSize_x_2_
	animationPlayerTips.play("TimeEndToHide")

func HideTips():
	controlTips.visible = false

func _on_animationPlayerTips_animation_finished(_anim_name: String):
	HideTips()

func ShowMiddleString(middleString: String):
	animationPlayerMiddleString.stop()
	
	controlMiddleString.visible = true
	controlMiddleString_CommonLabel31.text = middleString
	var stringSize: Vector2 = controlMiddleString_CommonLabel31.get_font("font").get_string_size(middleString)
	var stringSize_x_2_: float = -(stringSize.x / 2)
	controlMiddleString_CommonLabel31.rect_position.x = stringSize_x_2_
	animationPlayerMiddleString.play("TimeEndToHide")

func HideMiddleString():
	controlMiddleString.visible = false

func _on_animationPlayerMiddleString_animation_finished(_anim_name: String):
	HideMiddleString()

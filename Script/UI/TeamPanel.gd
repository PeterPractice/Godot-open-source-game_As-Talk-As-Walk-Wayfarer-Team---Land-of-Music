extends "res://Script/UI/CommonUI/CommonPanel.gd"

# HeadPortrait
onready var commonHeadPortrait1 = $controlMajorInformation/controlCurrentAvatarInformation/commonHeadPortrait1

# Item
onready var controlItemButtonList = $controlMajorInformation/controlItemButtonList

func _ready():
	for i in controlItemButtonList.get_child_count():
		var itemButton: CommonButtonItem = controlItemButtonList.get_child(i)
		itemButton.SetUIInputActionEventType("COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT%s" % (i + 1))
	
	SetItem()

func SetCurrentAvatar(avatarTypeID: int):
	var headPortraitResourceName: String = TableManager.GetAvatarHeadPortraitResourceName(avatarTypeID)
	commonHeadPortrait1.SetHeadPortrait(headPortraitResourceName)
	commonHeadPortrait1.SetTypeID(avatarTypeID)

func SetItem():
	var currentItemDataLength: int = UIManager.TeamPanel_GetItemDataLength()
	var itemButtonChildrenCount: int = controlItemButtonList.get_child_count()
	if itemButtonChildrenCount != currentItemDataLength:
		HQH.AssertLog("itemButtonChildrenCount: %s != currentItemDataLength: %s" % [itemButtonChildrenCount, currentItemDataLength])
		
		return
	
	var validItemNumber: int = 0
	for i in itemButtonChildrenCount:
		var itemButton: CommonButtonItem = controlItemButtonList.get_child(i)
		var item1Data: Dictionary = UIManager.TeamPanel_GetItemDataByIndex(i)
		if item1Data.isValidItem:
			validItemNumber += 1
			itemButton.visible = true
			itemButton.SetTextureRectNormalVisible(true)
			itemButton.SetTextureRectNormal(item1Data.itemResourceName)
			if 1 < item1Data.itemNumber:
				itemButton.SetRightText(str(item1Data.itemNumber))
			else:
				itemButton.SetRightText("")
			itemButton.SetCD(item1Data.itemCDStartTimeInMilliseconds, item1Data.itemCDLengthTimeInMilliseconds)
			itemButton.SetLeftText(item1Data.itemInputKeyLetter)
			itemButton.SetTypeID(item1Data.typeID)
		else:
			itemButton.visible = false
			itemButton.SetTextureRectNormalVisible(false)
			itemButton.SetTextureRectNormal("")
			itemButton.SetRightText("")
			itemButton.SetCD(0, 0)
			itemButton.SetLeftText("")
			itemButton.SetTypeID(0)
	
	var itemWidth: float = 50.0
	self.rect_size.x = controlItemButtonList.rect_position.x + (itemWidth * validItemNumber)

func OnControlItemButtonListCommonButtonItemPressed(index):
	var itemButtonChildrenCount: int = controlItemButtonList.get_child_count()
	if (0 <= index) and (itemButtonChildrenCount > index):
		var item1Data: Dictionary = UIManager.TeamPanel_GetItemDataByIndex(index)
		if item1Data.isValidItem:
			var itemButton: CommonButtonItem = controlItemButtonList.get_child(index)
			HQH.Log("OnControlItemButtonListCommonButtonItemPressed, index: %s" % index)
			itemButton.SetPressedTrue()
			itemButton._on_textureButton1_pressed()

extends Node

func AvatarPutOnEquip(avatarTypeID: int, equipTypeID: int):
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	for iv in node2DAvatarChildren:
		if avatarTypeID == iv.GetAvatarTypeID():
			iv.PutOnEquip(equipTypeID)
			
			break

func IsHasEquip(equipTypeID: int) -> bool:
	return (0 < equipTypeID) and TableManager.TableGetValue_EquipTable1_IsHasKey(String(equipTypeID))

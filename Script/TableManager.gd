extends Node

const DICTIONARYTABLE_PLACEHOLDER_BEGIN: String = "{"
const DICTIONARYTABLE_PLACEHOLDER_BEGIN_LENGTH: int = 1
const DICTIONARYTABLE_PLACEHOLDER_END: String = "}"
const DICTIONARYTABLE_PLACEHOLDER_END_LENGTH: int = 1
const DISPLAYED_LINE_BREAK: String = "\\n"
const LINE_BREAK: String = "\n"
const CHARACTER_SPACE: String = " "
const DISPLAY_TASK_NAME: String = "<%s>"
const DISPLAY_BAG_ITEM_NAME: String = "[%s]"
const DISPLAY_SCENE_NAME: String = "| %s |"
const AVATAR_PLAY_CHESS_POINTS_SHOW_NAME: String = "*%s*"
const PLAY_CHESS_COUNT_FLAG_START: String = ">"
const PLAY_CHESS_COUNT_FLAG_SUCCESS: String = "+"
const PLAY_CHESS_COUNT_FLAG_FAILURE: String = "-"

const PRELOAD_RESOURCE_MAP: Dictionary = {
# preloadResourceName: preloadResourceInfo
	# Font
	"Font":															preload("res://Font/Font.tres"),
	
	# UI
	"UI_CommonUI_CommonLabel":										preload("res://UI/CommonUI/CommonLabel.tscn"),
	"UI_StartGamePanel":											preload("res://UI/StartGamePanel.tscn"),
	"UI_LoadingScenePanel": 										preload("res://UI/LoadingScenePanel.tscn"),
	"UI_LanguagePanel":												preload("res://UI/LanguagePanel.tscn"),
	"UI_DebugInfoPanel":											preload("res://UI/DebugInfoPanel.tscn"),
	"UI_DebugMenuPanel":											preload("res://UI/DebugMenuPanel.tscn"),
	"UI_OptionPanel":												preload("res://UI/OptionPanel.tscn"),
	"UI_DownPanel":													preload("res://UI/DownPanel.tscn"),
	"UI_TeamPanel":													preload("res://UI/TeamPanel.tscn"),
	"UI_DayNightPanel":												preload("res://UI/DayNightPanel.tscn"),
	"UI_UpNamePanel":												preload("res://UI/UpNamePanel.tscn"),
	"UI_RightSettingPanel":											preload("res://UI/RightSettingPanel.tscn"),
	"UI_JournalRecordPanel":										preload("res://UI/JournalRecordPanel.tscn"),
#	"UI_ChessPanel4":												preload("res://UI/ChessPanel4.tscn"),
	"UI_ChessPanel1":												preload("res://UI/ChessPanel1.tscn"),
	
	# Avatar and Equip
	"Avatar_Equip_Wig1":											preload("res://Avatar/Equip/Wig1.tscn"),
	"Avatar_Equip_Wig2":											preload("res://Avatar/Equip/Wig2.tscn"),
	"Avatar_Snake1":												preload("res://Avatar/Snake1.tscn"),
	"Avatar_Dog1":													preload("res://Avatar/Dog1.tscn"),
	"Avatar_Player1":												preload("res://Avatar/Player1.tscn"),
	"Avatar_SilverCarp1":											preload("res://Avatar/SilverCarp1.tscn"),
	"Avatar_Tortoise1":												preload("res://Avatar/Tortoise1.tscn"),
	"Avatar_Snake2":												preload("res://Avatar/Snake2.tscn"),
	"Avatar_Snake3":												preload("res://Avatar/Snake3.tscn"),
	"Avatar_Turtle1":												preload("res://Avatar/Turtle1.tscn"),
	"Avatar_Angel1":												preload("res://Avatar/Angel1.tscn"),
	"Avatar_Donkey1":												preload("res://Avatar/Donkey1.tscn"),
	"Avatar_QiuYu1":												preload("res://Avatar/QiuYu1.tscn"),
	"Avatar_Clergy1":												preload("res://Avatar/Clergy1.tscn"),
	"Avatar_Monster1":												preload("res://Avatar/Monster1.tscn"),
	"Avatar_Monster2":												preload("res://Avatar/Monster2.tscn"),
	"Avatar_Monster3":												preload("res://Avatar/Monster3.tscn"),
	"Avatar_Monster4":												preload("res://Avatar/Monster4.tscn"),
	"Avatar_Monster5":												preload("res://Avatar/Monster5.tscn"),
	"Avatar_Monster6":												preload("res://Avatar/Monster6.tscn"),
	"Avatar_Monster7":												preload("res://Avatar/Monster7.tscn"),
	"Avatar_Monster8":												preload("res://Avatar/Monster8.tscn"),
	"Avatar_Monster9":												preload("res://Avatar/Monster9.tscn"),
	"Avatar_Monster10":												preload("res://Avatar/Monster10.tscn"),
	"Avatar_Monster11":												preload("res://Avatar/Monster11.tscn"),
	"Avatar_Monster12":												preload("res://Avatar/Monster12.tscn"),
	"Avatar_King":													preload("res://Avatar/King.tscn"),
	"Avatar_Queen":													preload("res://Avatar/Queen.tscn"),
	"Avatar_Sister":												preload("res://Avatar/Sister.tscn"),
	"Avatar_Housekeeper":											preload("res://Avatar/Housekeeper.tscn"),
	"Avatar_Butler":												preload("res://Avatar/Butler.tscn"),
	"Avatar_AvatarTransparent":										preload("res://Avatar/AvatarTransparent.tscn"),
	
	# Shader
	"Shader_SpriteOutline":											preload("res://Shader/SpriteOutline.shader"),
	
	# Audio
	"Audio_Intro":													preload("res://Audio/Intro.ogg"),
	"Audio_big-impact-7054":										preload("res://Audio/big-impact-7054.mp3"),
	"Audio_projector-button-push-6258_4":							preload("res://Audio/projector-button-push-6258_4.mp3"),
	"Audio_fast-simple-chop-5-6270":								preload("res://Audio/fast-simple-chop-5-6270.mp3"),
	"Audio_HUB":													preload("res://Audio/chonology-of-love-6094.mp3"),
	"Audio_heavy-beam-weapon-7052_2":								preload("res://Audio/heavy-beam-weapon-7052_2.mp3"),
	"Audio_ceramic_mug_cup-31808_2":								preload("res://Audio/ceramic_mug_cup-31808_2.mp3"),
	"Audio_HALLOFMELODY":											preload("res://Audio/cinematic-space-drone-10623.mp3"),
	"Audio_STAVEAVENUE":											preload("res://Audio/ambiant-cinematic-drone-main-10526.mp3"),
	"Audio_whooo-105751":											preload("res://Audio/whooo-105751.mp3"),
	"Audio_grunt-106134":											preload("res://Audio/grunt-106134.mp3"),
	"Audio_turning-pages-in-a-book-96504_2":						preload("res://Audio/turning-pages-in-a-book-96504_2.mp3"),
	"Audio_zipping-pencil-case-37454_2":							preload("res://Audio/zipping-pencil-case-37454_2.mp3"),
	"Audio_4_Home":													preload("res://Audio/midnight-123895.mp3"),
	"Audio_3_HOME":													preload("res://Audio/quiet-room-ambience-with-traffic-outside-120009.mp3"),
	"Audio_3_Home_Courtyard":										preload("res://Audio/birds_singing-6888.mp3"),
	"Audio_CLINKERVALLEY":											preload("res://Audio/hunted-mystery-horror-sounds-8396.mp3"),
	"Audio_CRACKINGVOICERIDGE":										preload("res://Audio/howling-wind-14892_2.mp3"),
	"Audio_CHORDSQUARE":											preload("res://Audio/tension-drones-51031.mp3"),
	"Audio_dice_shake-96201":										preload("res://Audio/dice_shake-96201.mp3"),
	"Audio_1_Home":													preload("res://Audio/couch_rustle_113011-24272.mp3"),
	"Audio_hybrid-monster-growl-90325":								preload("res://Audio/hybrid-monster-growl-90325.mp3"),
	"Audio_stingers-001-6294":										preload("res://Audio/stingers-001-6294.mp3"),
	"Audio_Do":														preload("res://Audio/do-stretched-7162_2.mp3"),
	"Audio_Re":														preload("res://Audio/re-d-47160_2.mp3"),
	"Audio_Mi":														preload("res://Audio/mi-80239_2.mp3"),
	"Audio_Fa":														preload("res://Audio/fa-78409_2.mp3"),
	"Audio_Sol":													preload("res://Audio/sol-101774_2.mp3"),
	"Audio_La":														preload("res://Audio/la-80237_2.mp3"),
	"Audio_Si":														preload("res://Audio/si-80238_2.mp3"),
	"Audio_065594_coach-whistle-88613_2":							preload("res://Audio/065594_coach-whistle-88613_2.mp3"),
	"Audio_woman-calling-dog-120316_2":								preload("res://Audio/woman-calling-dog-120316_2.mp3"),
	"Audio_hmms-various-1-7175_2":									preload("res://Audio/hmms-various-1-7175_2.mp3"),
	"Audio_mmm-hmm-36292_2":										preload("res://Audio/mmm-hmm-36292_2.mp3"),
	"Audio_aum_02_528hz-22432_2":									preload("res://Audio/aum_02_528hz-22432_2.mp3"),
	"Audio_child-says-hi-113116_2":									preload("res://Audio/child-says-hi-113116_2.mp3"),
	"Audio_peekaboo-i-see-you-104504_2":							preload("res://Audio/peekaboo-i-see-you-104504_2.mp3"),
	"Audio_minion-voicewav-14419_2":								preload("res://Audio/minion-voicewav-14419_2.mp3"),
	"Audio_dog-full-suite-22434_2":									preload("res://Audio/dog-full-suite-22434_2.mp3"),
	"Audio_panflute_j008b-77898_2":									preload("res://Audio/panflute_j008b-77898_2.mp3"),
	"Audio_panflute_j008b-77898_3":									preload("res://Audio/panflute_j008b-77898_3.mp3"),
	"Audio_panflute_j008b-77898_4":									preload("res://Audio/panflute_j008b-77898_4.mp3"),
	"Audio_onehmm-questionwav-14911":								preload("res://Audio/onehmm-questionwav-14911.mp3"),
	"Audio_hmm-oh-6957_2":											preload("res://Audio/hmm-oh-6957_2.mp3"),
	"Audio_hmm-oh-6957_3":											preload("res://Audio/hmm-oh-6957_3.mp3"),
	"Audio_hmm-oh-6957_4":											preload("res://Audio/hmm-oh-6957_4.mp3"),
	"Audio_male-sigh-6763":											preload("res://Audio/male-sigh-6763.mp3"),
	"Audio_gasp-7117_2":											preload("res://Audio/gasp-7117_2.mp3"),
	"Audio_male_exclamations-22868_2":								preload("res://Audio/male_exclamations-22868_2.mp3"),
	"Audio_male_exclamations-22868_3":								preload("res://Audio/male_exclamations-22868_3.mp3"),
	"Audio_male_exclamations-22868_4":								preload("res://Audio/male_exclamations-22868_4.mp3"),
	"Audio_male-what-6177":											preload("res://Audio/male-what-6177.mp3"),
	"Audio_steps-in-corridor-104456_2":								preload("res://Audio/steps-in-corridor-104456_2.mp3"),
	"Audio_door-open-close-45475_2":								preload("res://Audio/door-open-close-45475_2.mp3"),
	"Audio_dorm-door-opening-6038":									preload("res://Audio/dorm-door-opening-6038.mp3"),
	"Audio_door-opening-and-closing-18398_2":						preload("res://Audio/door-opening-and-closing-18398_2.mp3"),
	"Audio_endless-beauty-main-11545":								preload("res://Audio/endless-beauty-main-11545.mp3"),
	
	# Head Portrait pictures
	"HeadPortrait_Angel1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Angel1.png"),
	"HeadPortrait_Clergy1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Clergy1.png"),
	"HeadPortrait_Dog1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Dog1.png"),
	"HeadPortrait_Donkey1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Donkey1.png"),
	"HeadPortrait_Monster1":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster1.png"),
	"HeadPortrait_Monster2":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster2.png"),
	"HeadPortrait_Monster3":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster3.png"),
	"HeadPortrait_Monster4":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster4.png"),
	"HeadPortrait_Monster5":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster5.png"),
	"HeadPortrait_Monster6":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster6.png"),
	"HeadPortrait_Monster7":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster7.png"),
	"HeadPortrait_Monster8":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster8.png"),
	"HeadPortrait_Monster9":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster9.png"),
	"HeadPortrait_Monster10":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster10.png"),
	"HeadPortrait_Monster11":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster11.png"),
	"HeadPortrait_Monster12":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster12.png"),
	"HeadPortrait_Player1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Player1.png"),
	"HeadPortrait_QiuYu1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_QiuYu1.png"),
	"HeadPortrait_SilverCarp1":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_SilverCarp1.png"),
	"HeadPortrait_Snake1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Snake1.png"),
	"HeadPortrait_Snake2":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Snake2.png"),
	"HeadPortrait_Snake3":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Snake3.png"),
	"HeadPortrait_Tortoise1":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Tortoise1.png"),
	"HeadPortrait_Turtle1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Turtle1.png"),
	"HeadPortrait_King":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_King3.png"),
	"HeadPortrait_Queen":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Queen_2.png"),
	"HeadPortrait_Sister":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Sister_2.png"),
	"HeadPortrait_Housekeeper":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Housekeeper2.png"),
	"HeadPortrait_Butler":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Butler3.png"),
	
	# Skill, Item and Buff(and Bag) pictures, and HeadIcon
	"Skill_SkillBless":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillBless_S_Holy04.png"),
	"Skill_SkillBombArrow":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillBombArrow_S_Bow06.png"),
	"Skill_SkillConventionalFlatAttack":							preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillConventionalFlatAttack_5.png"),
	"Skill_SkillConventionalLongRangeAttack":						preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillConventionalLongRangeAttack_4.png"),
	"Skill_SkillCure":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillCure_S_Holy03.png"),
	"Skill_SkillElectricity":										preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillElectricity_2.png"),
	"Skill_SkillFire":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillFire_S_Fire03.png"),
	"Skill_SkillFireArrow":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillFireArrow_S_Bow01.png"),
	"Skill_SkillFoot":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillFoot_A_Shoes01.png"),
	"Skill_SkillLucky":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillLucky_I_Clover.png"),
	"Skill_SkillMagicMissile":										preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillMagicMissile_S_Axe04.png"),
	"Skill_SkillMagicShield":										preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillMagicShield_S_Holy09.png"),
	"Skill_SkillRain":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillRain_S_Water01.png"),
	"Skill_SkillShield":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillShield_E_Wood03.png"),
	"Skill_SkillSlash":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillSlash_W_Sword001.png"),
	"Skill_SkillSlow":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillSlow_I_SnailShell.png"),
	"Skill_SkillThunder":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillThunder_S_Thunder01.png"),
	"Skill_SkillWater":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillWater_S_Water03.png"),
	"Skill_SkillWind":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillWind_S_Wind05.png"),
	"Item_ItemEP05":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP05_P_Orange04.png"),
	"Item_ItemEP1":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP1_P_Orange02.png"),
	"Item_ItemEP2":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP2_P_Orange03.png"),
	"Item_ItemEP3":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP3_P_Orange01.png"),
	"Item_ItemEP4":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP4_P_Orange06.png"),
	"Item_ItemHP05":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP05_P_Red04.png"),
	"Item_ItemHP1":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP1_P_Red02.png"),
	"Item_ItemHP2":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP2_P_Red03.png"),
	"Item_ItemHP3":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP3_P_Red01.png"),
	"Item_ItemHP4":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP4_P_Red07.png"),
	"Item_ItemMP05":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP05_P_Blue04.png"),
	"Item_ItemMP1":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP1_P_Blue02.png"),
	"Item_ItemMP2":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP2_P_Blue03.png"),
	"Item_ItemMP3":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP3_P_Blue01.png"),
	"Item_ItemMP4":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP4_P_Blue05.png"),
	"Item_Telescope3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemTelescope3.png"),
	"Item_Wig2_BLACK3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_BLACK3.png"),
	"Item_Wig2_RED3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_RED3.png"),
	"Item_Wig2_WHITE3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_WHITE3.png"),
	"Item_Wig2_YELLOW3":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_YELLOW3.png"),
#	"Item_Wig2_BLACK3Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_BLACK3Long.png"),
#	"Item_Wig2_RED3Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_RED3Long.png"),
#	"Item_Wig2_WHITE3Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_WHITE3Long.png"),
#	"Item_Wig2_YELLOW3Long":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_YELLOW3Long.png"),
	"Item_Wig_GRAYISH_BLUE":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE.png"),
	"Item_Wig_GRAYISH_BLUE2":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE2.png"),
	"Item_Wig_GRAYISH_BLUE3":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE3.png"),
	"Item_Wig_GRAYISH_BLUE4":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE4.png"),
	"Item_Wig_GRAYISH_BLUE5":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE5.png"),
	"Item_Wig_GRAYISH_BLUE6":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE6.png"),
	"Item_Wig_GRAYISH_BLUE7":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE7.png"),
	"Item_Wig_PALE_YELLOW":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_PALE_YELLOW.png"),
	"Item_Wig_RED2Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_RED2Long.png"),
	"Item_Wig_BLUE2Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_BLUE2Long.png"),
	"Item_Wig_YELLOW2Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_YELLOW2Long.png"),
	"Item_Wig_CHANGING_COLOR":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_CHANGING_COLOR.png"),
	
	"HeadIcon_Angel1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Angel1.png"),
	"HeadIcon_Clergy1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Clergy1.png"),
	"HeadIcon_Dog1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Dog1.png"),
	"HeadIcon_Donkey1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Donkey1.png"),
	"HeadIcon_Monster1":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster1.png"),
	"HeadIcon_Monster2":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster2.png"),
	"HeadIcon_Monster3":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster3.png"),
	"HeadIcon_Monster4":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster4.png"),
	"HeadIcon_Monster5":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster5.png"),
	"HeadIcon_Monster6":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster6.png"),
	"HeadIcon_Monster7":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster7.png"),
	"HeadIcon_Monster8":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster8.png"),
	"HeadIcon_Monster9":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster9.png"),
	"HeadIcon_Monster10":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster10.png"),
	"HeadIcon_Monster11":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster11.png"),
	"HeadIcon_Monster12":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster12.png"),
	"HeadIcon_Player1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Player1.png"),
	"HeadIcon_QiuYu1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_QiuYu1.png"),
	"HeadIcon_SilverCarp1":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_SilverCarp1.png"),
	"HeadIcon_Snake1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Snake1.png"),
	"HeadIcon_Snake2":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Snake2.png"),
	"HeadIcon_Snake3":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Snake3.png"),
	"HeadIcon_Tortoise1":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Tortoise1.png"),
	"HeadIcon_Turtle1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Turtle1.png"),
	"HeadIcon_King":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_King3.png"),
	"HeadIcon_Queen":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Queen_2.png"),
	"HeadIcon_Sister":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Sister_2.png"),
	"HeadIcon_Housekeeper":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Housekeeper2.png"),
	"HeadIcon_Butler":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Butler3.png"),
	"OdeToJoy5_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy5_s.png"),
	"OdeToJoy6_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy6_s.png"),
	"OdeToJoy7_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy7_s.png"),
	"OdeToJoy8_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy8_s.png"),
	"DoorKey1_2":													preload("res://Picture/Scene/Door/DoorKey1_2.png"),
	"DoorKey2_2":													preload("res://Picture/Scene/Door/DoorKey2_2.png"),
	"QueenKey2":													preload("res://Picture/Scene/Door/QueenKey2.png"),
	
	# CommonPicture
	"CommonPicture_White64x64":										preload("res://Picture/CommonPicture/White64x64.png"),
	
	# Scene
	"Scene_Bag":													preload("res://Picture/Scene/SceneItemIcon/Bag44.png"),
	"Scene_JournalRecordBook":										preload("res://Picture/Scene/SceneItemIcon/JournalRecordBookIcon44.png"),
	"Scene_Door1":													preload("res://Picture/Scene/Door/Door4_4.png"),
	"Scene_Door2":													preload("res://Picture/Scene/Door/Door4_4_2.png"),
	"Scene_Door3":													preload("res://Picture/Scene/Door/Door4_4_3.png"),
	"Scene_Letter3":												preload("res://Picture/Scene/SceneItemIcon/Letter3.png"),
	"Scene_ThreeHeadsDragon3":										preload("res://Picture/Scene/SceneItemIcon/ThreeHeadsDragon3.png"),
	"Scene_Door6":													preload("res://Picture/Scene/Door/Door6.png"),
	"Scene_Door7":													preload("res://Picture/Scene/Door/Door7.png"),
	"Castle_Door3":													preload("res://Picture/Scene/Castle/Castle_Door3.png"),
	"Door2":														preload("res://Picture/Scene/Door/Door2.png"),
	"Door2_2":														preload("res://Picture/Scene/Door/Door2_2.png"),
	"Door2_3":														preload("res://Picture/Scene/Door/Door2_3.png"),
	"PathBG_64x64":													preload("res://Picture/CommonPicture/PathBG_64x64.png"),
}

const AUDIO_INFO_LIST: Dictionary = {
# audioName: audioInfo
	"Audio_Intro":												{"isBGMusic": true},
	"Audio_HUB":												{"isBGMusic": true},
	"Audio_HALLOFMELODY":										{"isBGMusic": true},
	"Audio_STAVEAVENUE":										{"isBGMusic": true},
	"Audio_4_Home":												{"isBGMusic": true},
	"Audio_3_HOME":												{"isBGMusic": true},
	"Audio_3_Home_Courtyard":									{"isBGMusic": true},
	"Audio_CLINKERVALLEY":										{"isBGMusic": true},
	"Audio_CRACKINGVOICERIDGE":									{"isBGMusic": true},
	"Audio_CHORDSQUARE":										{"isBGMusic": true},
	"Audio_1_Home":												{"isBGMusic": true},
	"Audio_endless-beauty-main-11545":							{"isBGMusic": true},
	"Audio_big-impact-7054":									{"isPlay1Hit": true},		# 继续游戏
	"Audio_heavy-beam-weapon-7052_2":							{"isPlay1Hit": true},		# 开始新游戏
	"Audio_projector-button-push-6258_4":						{"isSoundEffect": true},	# 点击按钮
	"Audio_fast-simple-chop-5-6270":							{"isSoundEffect": true},	# 划过按钮
	"Audio_ceramic_mug_cup-31808_2":							{"isSoundEffect": true},	# 对弈
	"Audio_whooo-105751":										{"isSoundEffect": true},	# CommonButtonItem点击按钮
	"Audio_grunt-106134":										{"isSoundEffect": true},	# 交互/对话
	"Audio_turning-pages-in-a-book-96504_2":					{"isSoundEffect": true},	# 冒险日记
	"Audio_zipping-pencil-case-37454_2":						{"isSoundEffect": true},	# 背包
	"Audio_dice_shake-96201":									{"isSoundEffect": true},	# 对弈骰子晃动
	"Audio_hybrid-monster-growl-90325":							{"isSoundEffect": true},	# 对弈成功
	"Audio_stingers-001-6294":									{"isSoundEffect": true},	# 对弈失败
	"Audio_Do":													{"isSoundEffect": true},
	"Audio_Re":													{"isSoundEffect": true},
	"Audio_Mi":													{"isSoundEffect": true},
	"Audio_Fa":													{"isSoundEffect": true},
	"Audio_Sol":												{"isSoundEffect": true},
	"Audio_La":													{"isSoundEffect": true},
	"Audio_Si":													{"isSoundEffect": true},
	"Audio_065594_coach-whistle-88613_2":						{"isSoundEffect": true},
	"Audio_woman-calling-dog-120316_2":							{"isSoundEffect": true},
	"Audio_hmms-various-1-7175_2":								{"isSoundEffect": true},
	"Audio_mmm-hmm-36292_2":									{"isSoundEffect": true},
	"Audio_aum_02_528hz-22432_2":								{"isSoundEffect": true},
	"Audio_child-says-hi-113116_2":								{"isSoundEffect": true},
	"Audio_peekaboo-i-see-you-104504_2":						{"isSoundEffect": true},
	"Audio_minion-voicewav-14419_2":							{"isSoundEffect": true},
	"Audio_dog-full-suite-22434_2":								{"isSoundEffect": true},
	"Audio_panflute_j008b-77898_2":								{"isSoundEffect": true},
	"Audio_panflute_j008b-77898_3":								{"isSoundEffect": true},
	"Audio_panflute_j008b-77898_4":								{"isSoundEffect": true},
	"Audio_onehmm-questionwav-14911":							{"isSoundEffect": true},
	"Audio_hmm-oh-6957_2":										{"isSoundEffect": true},
	"Audio_hmm-oh-6957_3":										{"isSoundEffect": true},
	"Audio_hmm-oh-6957_4":										{"isSoundEffect": true},
	"Audio_male-sigh-6763":										{"isSoundEffect": true},
	"Audio_gasp-7117_2":										{"isSoundEffect": true},
	"Audio_male_exclamations-22868_2":							{"isSoundEffect": true},
	"Audio_male_exclamations-22868_3":							{"isSoundEffect": true},
	"Audio_male_exclamations-22868_4":							{"isSoundEffect": true},
	"Audio_male-what-6177":										{"isSoundEffect": true},
	"Audio_steps-in-corridor-104456_2":							{"isSoundEffect": true},
	"Audio_door-open-close-45475_2":							{"isSoundEffect": true},
	"Audio_dorm-door-opening-6038":								{"isSoundEffect": true},
	"Audio_door-opening-and-closing-18398_2":					{"isSoundEffect": true},
}

const LANGUAGE_NAME_ENGLISH: String = HQH.LANGUAGE_NAME_DEFAULT
var m_EnglishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_ENGLISH: Array = [
	"EnglishTable",
]

const LANGUAGE_NAME_CHINESE: String = "Simplified Chinese"
var m_ChineseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_CHINESE: Array = [
	"ChineseTable",
]

const LANGUAGE_NAME_TRADITIONALCHINESE: String = "Traditional Chinese"
var m_TraditionalChineseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_TRADITIONALCHINESE: Array = [
	"TraditionalChineseTable",
]

const LANGUAGE_NAME_FRENCH: String = "French"
var m_FrenchTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_FRENCH: Array = [
	"FrenchTable",
]

const LANGUAGE_NAME_SPANISH: String = "Spanish"
var m_SpanishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_SPANISH: Array = [
	"SpanishTable",
]

const LANGUAGE_NAME_ARABIC: String = "Arabic"
var m_ArabicTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_ARABIC: Array = [
	"ArabicTable",
]

const LANGUAGE_NAME_RUSSIAN: String = "Russian"
var m_RussianTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_RUSSIAN: Array = [
	"RussianTable",
]

const LANGUAGE_NAME_JAPANESE: String = "Japanese"
var m_JapaneseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_JAPANESE: Array = [
	"JapaneseTable",
]

const LANGUAGE_NAME_KOREAN: String = "Korean"
var m_KoreanTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_KOREAN: Array = [
	"KoreanTable",
]

const LANGUAGE_NAME_GERMAN: String = "German"
var m_GermanTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_GERMAN: Array = [
	"GermanTable",
]

const LANGUAGE_NAME_PORTUGUESE: String = "Portuguese"
var m_PortugueseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_PORTUGUESE: Array = [
	"PortugueseTable",
]

const LANGUAGE_NAME_POLISH: String = "Polish"
var m_PolishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_POLISH: Array = [
	"PolishTable",
]

const LANGUAGE_NAME_BAHASAINDONESIA: String = "Bahasa Indonesia"
var m_BahasaIndonesiaTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_BAHASAINDONESIA: Array = [
	"BahasaIndonesiaTable",
]

const LANGUAGE_NAME_MALAY: String = "Malay"
var m_MalayTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_MALAY: Array = [
	"MalayTable",
]

const LANGUAGE_NAME_THAI: String = "Thai"
var m_ThaiTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_THAI: Array = [
	"ThaiTable",
]

const LANGUAGE_NAME_VIETNAMESE: String = "Vietnamese"
var m_VietnameseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_VIETNAMESE: Array = [
	"VietnameseTable",
]

const LANGUAGE_NAME_TURKISH: String = "Turkish"
var m_TurkishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_TURKISH: Array = [
	"TurkishTable",
]

# reference: https://docs.godotengine.org/en/stable/tutorials/i18n/locales.html
# And: \Document\Language\LocaleLanguageAndVariant.txt
const LOCALE_LANGUAGE_MAP: Dictionary = {
# localeLanguageName: localeLanguageInfo
	"cmn_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"hak_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"lzh_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"nan_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"yue_HK":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"zh":			LANGUAGE_NAME_CHINESE,
	"zh_CN":		LANGUAGE_NAME_CHINESE,
	"zh_HK":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"zh_SG":		LANGUAGE_NAME_CHINESE,
	"zh_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"en":			LANGUAGE_NAME_ENGLISH,
	"en_AG":		LANGUAGE_NAME_ENGLISH,
	"en_AU":		LANGUAGE_NAME_ENGLISH,
	"en_BW":		LANGUAGE_NAME_ENGLISH,
	"en_CA":		LANGUAGE_NAME_ENGLISH,
	"en_DK":		LANGUAGE_NAME_ENGLISH,
	"en_GB":		LANGUAGE_NAME_ENGLISH,
	"en_HK":		LANGUAGE_NAME_ENGLISH,
	"en_IE":		LANGUAGE_NAME_ENGLISH,
	"en_IL":		LANGUAGE_NAME_ENGLISH,
	"en_IN":		LANGUAGE_NAME_ENGLISH,
	"en_NG":		LANGUAGE_NAME_ENGLISH,
	"en_NZ":		LANGUAGE_NAME_ENGLISH,
	"en_PH":		LANGUAGE_NAME_ENGLISH,
	"en_SG":		LANGUAGE_NAME_ENGLISH,
	"en_US":		LANGUAGE_NAME_ENGLISH,
	"en_ZA":		LANGUAGE_NAME_ENGLISH,
	"en_ZM":		LANGUAGE_NAME_ENGLISH,
	"en_ZW":		LANGUAGE_NAME_ENGLISH,
	"fr":			LANGUAGE_NAME_FRENCH,
	"fr_BE":		LANGUAGE_NAME_FRENCH,
	"fr_CA":		LANGUAGE_NAME_FRENCH,
	"fr_CH":		LANGUAGE_NAME_FRENCH,
	"fr_FR":		LANGUAGE_NAME_FRENCH,
	"fr_LU":		LANGUAGE_NAME_FRENCH,
	"es":			LANGUAGE_NAME_SPANISH,
	"es_AR":		LANGUAGE_NAME_SPANISH,
	"es_BO":		LANGUAGE_NAME_SPANISH,
	"es_CL":		LANGUAGE_NAME_SPANISH,
	"es_CO":		LANGUAGE_NAME_SPANISH,
	"es_CR":		LANGUAGE_NAME_SPANISH,
	"es_CU":		LANGUAGE_NAME_SPANISH,
	"es_DO":		LANGUAGE_NAME_SPANISH,
	"es_EC":		LANGUAGE_NAME_SPANISH,
	"es_ES":		LANGUAGE_NAME_SPANISH,
	"es_GT":		LANGUAGE_NAME_SPANISH,
	"es_HN":		LANGUAGE_NAME_SPANISH,
	"es_MX":		LANGUAGE_NAME_SPANISH,
	"es_NI":		LANGUAGE_NAME_SPANISH,
	"es_PA":		LANGUAGE_NAME_SPANISH,
	"es_PE":		LANGUAGE_NAME_SPANISH,
	"es_PR":		LANGUAGE_NAME_SPANISH,
	"es_PY":		LANGUAGE_NAME_SPANISH,
	"es_SV":		LANGUAGE_NAME_SPANISH,
	"es_US":		LANGUAGE_NAME_SPANISH,
	"es_UY":		LANGUAGE_NAME_SPANISH,
	"es_VE":		LANGUAGE_NAME_SPANISH,
	"ar":			LANGUAGE_NAME_ARABIC,
	"ar_AE":		LANGUAGE_NAME_ARABIC,
	"ar_BH":		LANGUAGE_NAME_ARABIC,
	"ar_DZ":		LANGUAGE_NAME_ARABIC,
	"ar_EG":		LANGUAGE_NAME_ARABIC,
	"ar_IQ":		LANGUAGE_NAME_ARABIC,
	"ar_JO":		LANGUAGE_NAME_ARABIC,
	"ar_KW":		LANGUAGE_NAME_ARABIC,
	"ar_LB":		LANGUAGE_NAME_ARABIC,
	"ar_LY":		LANGUAGE_NAME_ARABIC,
	"ar_MA":		LANGUAGE_NAME_ARABIC,
	"ar_OM":		LANGUAGE_NAME_ARABIC,
	"ar_QA":		LANGUAGE_NAME_ARABIC,
	"ar_SA":		LANGUAGE_NAME_ARABIC,
	"ar_SD":		LANGUAGE_NAME_ARABIC,
	"ar_SS":		LANGUAGE_NAME_ARABIC,
	"ar_SY":		LANGUAGE_NAME_ARABIC,
	"ar_TN":		LANGUAGE_NAME_ARABIC,
	"ar_YE":		LANGUAGE_NAME_ARABIC,
	"ru":			LANGUAGE_NAME_RUSSIAN,
	"ru_RU":		LANGUAGE_NAME_RUSSIAN,
	"ru_UA":		LANGUAGE_NAME_RUSSIAN,
	"ja":			LANGUAGE_NAME_JAPANESE,
	"ja_JP":		LANGUAGE_NAME_JAPANESE,
	"ko":			LANGUAGE_NAME_KOREAN,
	"ko_KR":		LANGUAGE_NAME_KOREAN,
	"de":			LANGUAGE_NAME_GERMAN,
	"de_AT":		LANGUAGE_NAME_GERMAN,
	"de_BE":		LANGUAGE_NAME_GERMAN,
	"de_CH":		LANGUAGE_NAME_GERMAN,
	"de_DE":		LANGUAGE_NAME_GERMAN,
	"de_IT":		LANGUAGE_NAME_GERMAN,
	"de_LU":		LANGUAGE_NAME_GERMAN,
	"fy_DE":		LANGUAGE_NAME_GERMAN,
	"hsb_DE":		LANGUAGE_NAME_GERMAN,
	"nds_DE":		LANGUAGE_NAME_GERMAN,
	"nds_NL":		LANGUAGE_NAME_GERMAN,
	"pt":			LANGUAGE_NAME_PORTUGUESE,
	"pt_BR":		LANGUAGE_NAME_PORTUGUESE,
	"pt_PT":		LANGUAGE_NAME_PORTUGUESE,
	"pl":			LANGUAGE_NAME_POLISH,
	"pl_PL":		LANGUAGE_NAME_POLISH,
	"id":			LANGUAGE_NAME_BAHASAINDONESIA,
	"id_ID":		LANGUAGE_NAME_BAHASAINDONESIA,
	"ms":			LANGUAGE_NAME_MALAY,
	"ms_MY":		LANGUAGE_NAME_MALAY,
	"th":			LANGUAGE_NAME_THAI,
	"th_TH":		LANGUAGE_NAME_THAI,
	"vi":			LANGUAGE_NAME_VIETNAMESE,
	"vi_VN": 		LANGUAGE_NAME_VIETNAMESE,
	"tr":			LANGUAGE_NAME_TURKISH,
	"tr_CY":		LANGUAGE_NAME_TURKISH,
	"tr_TR":		LANGUAGE_NAME_TURKISH,
}
var m_LanguageTableMap: Dictionary = {
# languageName: languageInfo
	LANGUAGE_NAME_ENGLISH:					{"showName": "English",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_ENGLISH,					"languageTableData": m_EnglishTableData},
	LANGUAGE_NAME_CHINESE:					{"showName": "简体中文",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_CHINESE,					"languageTableData": m_ChineseTableData},
	LANGUAGE_NAME_TRADITIONALCHINESE:		{"showName": "繁體中文",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_TRADITIONALCHINESE,		"languageTableData": m_TraditionalChineseTableData},
	LANGUAGE_NAME_FRENCH:					{"showName": "Français",				"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_FRENCH,					"languageTableData": m_FrenchTableData},
	LANGUAGE_NAME_SPANISH:					{"showName": "Español",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_SPANISH,					"languageTableData": m_SpanishTableData},
	LANGUAGE_NAME_ARABIC:					{"showName": "العربية",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_ARABIC,					"languageTableData": m_ArabicTableData},
	LANGUAGE_NAME_RUSSIAN:					{"showName": "Pусский язык",			"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_RUSSIAN,					"languageTableData": m_RussianTableData},
	LANGUAGE_NAME_JAPANESE:					{"showName": "しろうと",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_JAPANESE,					"languageTableData": m_JapaneseTableData},
	LANGUAGE_NAME_KOREAN:					{"showName": "한국어",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_KOREAN,					"languageTableData": m_KoreanTableData},
	LANGUAGE_NAME_GERMAN:					{"showName": "Deutsch",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_GERMAN,					"languageTableData": m_GermanTableData},
	LANGUAGE_NAME_PORTUGUESE:				{"showName": "Língua portuguesa",		"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_PORTUGUESE,				"languageTableData": m_PortugueseTableData},
	LANGUAGE_NAME_POLISH:					{"showName": "Polski",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_POLISH,					"languageTableData": m_PolishTableData},
	LANGUAGE_NAME_BAHASAINDONESIA:			{"showName": "Bahasa indonesia",		"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_BAHASAINDONESIA,			"languageTableData": m_BahasaIndonesiaTableData},
	LANGUAGE_NAME_MALAY:					{"showName": "Bahasa Melayu",			"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_MALAY,					"languageTableData": m_MalayTableData},
	LANGUAGE_NAME_THAI:						{"showName": "ภาษาไทย",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_THAI,						"languageTableData": m_ThaiTableData},
	LANGUAGE_NAME_VIETNAMESE:				{"showName": "Việt nam",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_VIETNAMESE,				"languageTableData": m_VietnameseTableData},
	LANGUAGE_NAME_TURKISH:					{"showName": "Türkçe",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_TURKISH,					"languageTableData": m_TurkishTableData},
}
var m_CurrentLanguageName: String = ""

const EQUIPTABLE1_DATA_KEYINDEX: int = 0
const EQUIPTABLE1_DATA_INDEX_EQUIPID: int = 0
const EQUIPTABLE1_DATA_INDEX_FILENAME: int = 1
const EQUIPTABLE1_DATA_INDEX_COLOR: int = 2
const EQUIPTABLE1_DATA_INFO: Dictionary = {
	"equipTypeID": 0,
	"fileName": "",
	"color": "",
}
var m_EquipTable1_Data: Dictionary = {} # EQUIPTABLE1_DATA_INFO Dictionary

enum TABLEGETVALUE_HANDLE_TYPE {
	NONE,
	HANDLE_LANGUAGE_STRING,
	HANDLE_COLORPALETTE_EQUIP,
	HANDLE_FILEPATH,
}

const SCENELAYER_TILEMAPGROUND_NAME: String = "tileMapGround"
const SCENELAYER_TILEMAPGROUNDSUPERSTRATUM_NAME: String = "tileMapGroundSuperstratum"
const SCENELAYER_NODE2DCHANGESCENETRIGGER_NAME: String = "node2DChangeSceneTrigger"
const SCENELAYER_NODE2DNPCARTICLETRIGGER_NAME: String = "node2DNPCArticleTrigger"
const SCENELAYER_NODE2DNPCTRIGGER_NAME: String = "node2DNPCTrigger"
const SCENELAYER_NODE2DNPC_NAME: String = "node2DNPC"
const SCENELAYER_NODE2DAVATAR_NAME: String = "node2DAvatar"
const SCENELAYER_NODE2DNPCARTICLETRIGGERSUPERSTRATUM_NAME: String = "node2DNPCArticleTriggerSuperstratum"
const SCENELAYER_TILEMAPCONSTRUCTION_NAME: String = "tileMapConstruction"
const SCENELAYER_TILEMAPCOLLISION_NAME: String = "tileMapCollision"
const SCENELAYER_TILEMAPSUPERSTRATUM_NAME: String = "tileMapSuperstratum"
const SCENELAYER_TILEMAPWARFOG_NAME: String = "tileMapWarFog"
const SCENELAYER_TILEMAPNAVIGATION_NAME: String = "tileMapNavigation"
const SCENETYPEID_DEBUG1: int = 1
const SCENETYPEID_CHORDSQUARE: int = 2
const SCENETYPEID_STAVEAVENUE: int = 3
const SCENETYPEID_HALLOFMELODY: int = 4
const SCENETYPEID_CLINKERVALLEY: int = 5
const SCENETYPEID_CRACKINGVOICERIDGE: int = 6
const SCENETYPEID_HUB: int = 7
const SCENETYPEID_DEBUG2: int = 8
const SCENETYPEID_1_HOME: int = 9
const SCENETYPEID_3_HOME: int = 10
const SCENETYPEID_3_HOME_COURTYARD: int = 11
const SCENETYPEID_4_HOME: int = 12
const SCENETYPEID_PLAYCHESS: int = 13
const SCENE_INFO_MAP: Dictionary = {
# sceneTypeID: sceneInfo
SCENETYPEID_DEBUG1:					{"sceneName": "DebugScene1",				"node2DAvatarName": "node2DWalkScene/node2DAvatar",		"node2DNPCName": "node2DWalkScene/node2DNPC",	"BGMusicName": "Audio_Intro", 					"showNameKey": "",									"showContentKey": ""},
SCENETYPEID_CHORDSQUARE:			{"sceneName": "SceneChordSquare",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_CHORDSQUARE",				"showNameKey": "SCENE_NAME_CHORD_SQUARE",			"showContentKey": "SCENE_CONTENT_CHORD_SQUARE"},
SCENETYPEID_STAVEAVENUE:			{"sceneName": "SceneStaveAvenue",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_STAVEAVENUE",				"showNameKey": "SCENE_NAME_STAVE_AVENUE",			"showContentKey": "SCENE_CONTENT_STAVE_AVENUE"},
SCENETYPEID_HALLOFMELODY:			{"sceneName": "SceneHallOfMelody",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_HALLOFMELODY",			"showNameKey": "SCENE_NAME_HALL_OF_MELODY",			"showContentKey": "SCENE_CONTENT_HALL_OF_MELODY"},
SCENETYPEID_CLINKERVALLEY:			{"sceneName": "SceneClinkerValley",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_CLINKERVALLEY",			"showNameKey": "SCENE_NAME_CLINKER_VALLEY",			"showContentKey": "SCENE_CONTENT_CLINKER_VALLEY"},
SCENETYPEID_CRACKINGVOICERIDGE:		{"sceneName": "SceneCrackingVoiceRidge",	"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_CRACKINGVOICERIDGE", 		"showNameKey": "SCENE_NAME_CRACKING_VOICE_RIDGE",	"showContentKey": "SCENE_CONTENT_CRACKING_VOICE_RIDGE"},
SCENETYPEID_HUB:					{"sceneName": "HubScene",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_HUB",						"showNameKey": "",									"showContentKey": ""},
SCENETYPEID_DEBUG2:					{"sceneName": "DebugScene2",				"node2DAvatarName": "node2DWalkScene/node2DAvatar",		"node2DNPCName": "node2DWalkScene/node2DNPC",	"BGMusicName": "Audio_Intro",					"showNameKey": "",									"showContentKey": ""},
SCENETYPEID_1_HOME:					{"sceneName": "Scene1Home",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_1_Home",					"showNameKey": "SCENE_NAME_1_HOME",					"showContentKey": "SCENE_CONTENT_1_HOME"},
SCENETYPEID_3_HOME:					{"sceneName": "Scene3Home",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_3_HOME",					"showNameKey": "SCENE_NAME_3_HOME",					"showContentKey": "SCENE_CONTENT_3_HOME"},
SCENETYPEID_3_HOME_COURTYARD:		{"sceneName": "Scene3HomeCourtyard",		"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_3_Home_Courtyard",		"showNameKey": "SCENE_NAME_3_HOME_COURTYARD",		"showContentKey": "SCENE_CONTENT_3_HOME_COURTYARD"},
SCENETYPEID_4_HOME:					{"sceneName": "Scene4Home",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_4_Home",					"showNameKey": "SCENE_NAME_4_HOME",					"showContentKey": "SCENE_CONTENT_4_HOME"},
SCENETYPEID_PLAYCHESS:				{"sceneName": "ScenePlayChess",				"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"node2DNPCName": SCENELAYER_NODE2DNPC_NAME,		"BGMusicName": "Audio_Intro",					"showNameKey": "SCENE_NAME_PLAY_CHESS",				"showContentKey": "SCENE_CONTENT_PLAY_CHESS"},
}
const SCENE_GAMEPLAY_SCENETYPEID_LIST: Array = [
	SCENETYPEID_CHORDSQUARE,
	SCENETYPEID_STAVEAVENUE,
	SCENETYPEID_HALLOFMELODY,
	SCENETYPEID_CLINKERVALLEY,
	SCENETYPEID_CRACKINGVOICERIDGE,
	SCENETYPEID_1_HOME,
	SCENETYPEID_3_HOME,
	SCENETYPEID_3_HOME_COURTYARD,
	SCENETYPEID_4_HOME,
]
const SCENE_HOME_SCENETYPEID_LIST: Array = [
	SCENETYPEID_1_HOME,
	SCENETYPEID_3_HOME,
	SCENETYPEID_4_HOME,
]

const POWER_MIN: int = 1
const POWER_MAX: int = 11500

const AVATARTYPEID_SNAKE1: int = 1
const AVATARTYPEID_DOG1: int = 2
const AVATARTYPEID_PLAYER1: int = 3
const AVATARTYPEID_SILVERCARP1: int = 4
const AVATARTYPEID_TORTOISE1: int = 5
const AVATARTYPEID_SNAKE2: int = 6
const AVATARTYPEID_SNAKE3: int = 7
const AVATARTYPEID_TURTLE1: int = 8
const AVATARTYPEID_ANGEL1: int = 9
const AVATARTYPEID_DONKEY1: int = 10
const AVATARTYPEID_QIUYU1: int = 11
const AVATARTYPEID_CLERGY1: int = 12
const AVATARTYPEID_MONSTER1: int = 13
const AVATARTYPEID_MONSTER2: int = 14
const AVATARTYPEID_MONSTER3: int = 15
const AVATARTYPEID_MONSTER4: int = 16
const AVATARTYPEID_MONSTER5: int = 17
const AVATARTYPEID_MONSTER6: int = 18
const AVATARTYPEID_MONSTER7: int = 19
const AVATARTYPEID_MONSTER8: int = 20
const AVATARTYPEID_MONSTER9: int = 21
const AVATARTYPEID_MONSTER10: int = 22
const AVATARTYPEID_MONSTER11: int = 23
const AVATARTYPEID_MONSTER12: int = 24
const AVATARTYPEID_KING: int = 25
const AVATARTYPEID_QUEEN: int = 26
const AVATARTYPEID_SISTER: int = 27
const AVATARTYPEID_HOUSEKEEPER: int = 28
const AVATARTYPEID_BUTLER: int = 29
const AVATARTYPEID_AVATARTRANSPARENT: int = 30
const WRANGLEDIALOGTYPEID_SWALLOW_BEGIN: int = 204
const WRANGLEDIALOGTYPEID_SWALLOW_SNAKE1: int = WRANGLEDIALOGTYPEID_SWALLOW_BEGIN
const WRANGLEDIALOGTYPEID_SWALLOW_DOG1: int = 205
const WRANGLEDIALOGTYPEID_SWALLOW_PLAYER1: int = 206
const WRANGLEDIALOGTYPEID_SWALLOW_SILVERCARP1: int = 207
const WRANGLEDIALOGTYPEID_SWALLOW_SNAKE2: int = 208
const WRANGLEDIALOGTYPEID_SWALLOW_SNAKE3: int = 209
const WRANGLEDIALOGTYPEID_SWALLOW_TURTLE1: int = 210
const WRANGLEDIALOGTYPEID_SWALLOW_DONKEY1: int = 211
const WRANGLEDIALOGTYPEID_SWALLOW_MONSTER11: int = 212
const WRANGLEDIALOGTYPEID_SWALLOW_MONSTER12: int = 213
const WRANGLEDIALOGTYPEID_SWALLOW_QIUYU1: int = 214
const WRANGLEDIALOGTYPEID_SWALLOW_END: int = WRANGLEDIALOGTYPEID_SWALLOW_QIUYU1
const WRANGLEDIALOGTYPEID_SWALLOW_INVALID: int = 215
const AVATAR_TYPE_MAP: Dictionary = {
# avatarTypeID: avatarInfo
AVATARTYPEID_SNAKE1:				{"resourceName": "Snake1",				"preloadResource": "Avatar_Snake1",				"headPortraitResource": "HeadPortrait_Snake1",			"headIconResource": "HeadIcon_Snake1",			"showNameKey": "NAME_AVATAR_1",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SNAKE1,			"avatarDescription": "AVATAR_DESCRIPTION_1",	"clickAudioResource": "Audio_panflute_j008b-77898_2",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_1_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_1",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_1",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_SNAKE1,		},
AVATARTYPEID_DOG1:					{"resourceName": "Dog1",				"preloadResource": "Avatar_Dog1",				"headPortraitResource": "HeadPortrait_Dog1",			"headIconResource": "HeadIcon_Dog1",			"showNameKey": "NAME_AVATAR_2",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_DOG1,			"avatarDescription": "AVATAR_DESCRIPTION_2",	"clickAudioResource": "Audio_dog-full-suite-22434_2",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_2",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_2_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_2",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_2",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_DOG1,		},
AVATARTYPEID_PLAYER1:				{"resourceName": "Player1",				"preloadResource": "Avatar_Player1",			"headPortraitResource": "HeadPortrait_Player1",			"headIconResource": "HeadIcon_Player1",			"showNameKey": "NAME_AVATAR_3",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLAYER1,			"avatarDescription": "AVATAR_DESCRIPTION_3",	"clickAudioResource": "Audio_child-says-hi-113116_2",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_3",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_3",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_PLAYER1,		},
AVATARTYPEID_SILVERCARP1:			{"resourceName": "SilverCarp1",			"preloadResource": "Avatar_SilverCarp1",		"headPortraitResource": "HeadPortrait_SilverCarp1",		"headIconResource": "HeadIcon_SilverCarp1",		"showNameKey": "NAME_AVATAR_4",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SILVERCARP1,		"avatarDescription": "AVATAR_DESCRIPTION_4",	"clickAudioResource": "Audio_whooo-105751",						"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_4_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_4",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_4",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_SILVERCARP1,	},
AVATARTYPEID_TORTOISE1:				{"resourceName": "Tortoise1",			"preloadResource": "Avatar_Tortoise1",			"headPortraitResource": "HeadPortrait_Tortoise1",		"headIconResource": "HeadIcon_Tortoise1",		"showNameKey": "NAME_AVATAR_5",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_TORTOISE1,		"avatarDescription": "AVATAR_DESCRIPTION_5",	"clickAudioResource": "Audio_aum_02_528hz-22432_2",				"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_5_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_5",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_5",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_SNAKE2:				{"resourceName": "Snake2",				"preloadResource": "Avatar_Snake2",				"headPortraitResource": "HeadPortrait_Snake2",			"headIconResource": "HeadIcon_Snake2",			"showNameKey": "NAME_AVATAR_6",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SNAKE2,			"avatarDescription": "AVATAR_DESCRIPTION_6",	"clickAudioResource": "Audio_panflute_j008b-77898_3",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_6_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_6",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_6",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_SNAKE2,		},
AVATARTYPEID_SNAKE3:				{"resourceName": "Snake3",				"preloadResource": "Avatar_Snake3",				"headPortraitResource": "HeadPortrait_Snake3",			"headIconResource": "HeadIcon_Snake3",			"showNameKey": "NAME_AVATAR_7",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SNAKE3,			"avatarDescription": "AVATAR_DESCRIPTION_7",	"clickAudioResource": "Audio_panflute_j008b-77898_4",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_7_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_7",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_7",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_SNAKE3,		},
AVATARTYPEID_TURTLE1:				{"resourceName": "Turtle1",				"preloadResource": "Avatar_Turtle1",			"headPortraitResource": "HeadPortrait_Turtle1",			"headIconResource": "HeadIcon_Turtle1",			"showNameKey": "NAME_AVATAR_8",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_TURTLE1,			"avatarDescription": "AVATAR_DESCRIPTION_8",	"clickAudioResource": "Audio_minion-voicewav-14419_2",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_8",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_8_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_8",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_8",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_TURTLE1,		},
AVATARTYPEID_ANGEL1:				{"resourceName": "Angel1",				"preloadResource": "Avatar_Angel1",				"headPortraitResource": "HeadPortrait_Angel1",			"headIconResource": "HeadIcon_Angel1",			"showNameKey": "NAME_AVATAR_9",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_ANGEL1,			"avatarDescription": "AVATAR_DESCRIPTION_9",	"clickAudioResource": "Audio_woman-calling-dog-120316_2",		"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_9_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_9",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_9",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_DONKEY1:				{"resourceName": "Donkey1",				"preloadResource": "Avatar_Donkey1",			"headPortraitResource": "HeadPortrait_Donkey1",			"headIconResource": "HeadIcon_Donkey1",			"showNameKey": "NAME_AVATAR_18",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_DONKEY1,			"avatarDescription": "AVATAR_DESCRIPTION_18",	"clickAudioResource": "Audio_Si",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_10",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_10_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_10",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_10",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_DONKEY1,		},
AVATARTYPEID_QIUYU1:				{"resourceName": "QiuYu1",				"preloadResource": "Avatar_QiuYu1",				"headPortraitResource": "HeadPortrait_QiuYu1",			"headIconResource": "HeadIcon_QiuYu1",			"showNameKey": "NAME_AVATAR_19",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_QIUYU1,			"avatarDescription": "AVATAR_DESCRIPTION_19",	"clickAudioResource": "Audio_Fa",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_11",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_11",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_QIUYU1,		},
AVATARTYPEID_CLERGY1:				{"resourceName": "Clergy1",				"preloadResource": "Avatar_Clergy1",			"headPortraitResource": "HeadPortrait_Clergy1",			"headIconResource": "HeadIcon_Clergy1",			"showNameKey": "NAME_AVATAR_20",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_CLERGY1,			"avatarDescription": "AVATAR_DESCRIPTION_20",	"clickAudioResource": "Audio_peekaboo-i-see-you-104504_2",		"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_12_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_12",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_12",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER1:				{"resourceName": "Monster1",			"preloadResource": "Avatar_Monster1",			"headPortraitResource": "HeadPortrait_Monster1",		"headIconResource": "HeadIcon_Monster1",		"showNameKey": "NAME_AVATAR_10",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER1,		"avatarDescription": "AVATAR_DESCRIPTION_10",	"clickAudioResource": "Audio_onehmm-questionwav-14911",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_13_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_13",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_13",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER2:				{"resourceName": "Monster2",			"preloadResource": "Avatar_Monster2",			"headPortraitResource": "HeadPortrait_Monster2",		"headIconResource": "HeadIcon_Monster2",		"showNameKey": "NAME_AVATAR_11",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER2,		"avatarDescription": "AVATAR_DESCRIPTION_11",	"clickAudioResource": "Audio_hmm-oh-6957_2",					"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_14_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_14",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_14",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER3:				{"resourceName": "Monster3",			"preloadResource": "Avatar_Monster3",			"headPortraitResource": "HeadPortrait_Monster3",		"headIconResource": "HeadIcon_Monster3",		"showNameKey": "NAME_AVATAR_12",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER3,		"avatarDescription": "AVATAR_DESCRIPTION_12",	"clickAudioResource": "Audio_hmm-oh-6957_3",					"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_15_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_15",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_15",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER4:				{"resourceName": "Monster4",			"preloadResource": "Avatar_Monster4",			"headPortraitResource": "HeadPortrait_Monster4",		"headIconResource": "HeadIcon_Monster4",		"showNameKey": "NAME_AVATAR_13",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER4,		"avatarDescription": "AVATAR_DESCRIPTION_13",	"clickAudioResource": "Audio_hmm-oh-6957_4",					"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_16_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_16",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_16",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER5:				{"resourceName": "Monster5",			"preloadResource": "Avatar_Monster5",			"headPortraitResource": "HeadPortrait_Monster5",		"headIconResource": "HeadIcon_Monster5",		"showNameKey": "NAME_AVATAR_14",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER5,		"avatarDescription": "AVATAR_DESCRIPTION_14",	"clickAudioResource": "Audio_male-sigh-6763",					"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_17_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_17",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_17",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER6:				{"resourceName": "Monster6",			"preloadResource": "Avatar_Monster6",			"headPortraitResource": "HeadPortrait_Monster6",		"headIconResource": "HeadIcon_Monster6",		"showNameKey": "NAME_AVATAR_15",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER6,		"avatarDescription": "AVATAR_DESCRIPTION_15",	"clickAudioResource": "Audio_gasp-7117_2",						"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_18_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_18",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_18",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER7:				{"resourceName": "Monster7",			"preloadResource": "Avatar_Monster7",			"headPortraitResource": "HeadPortrait_Monster7",		"headIconResource": "HeadIcon_Monster7",		"showNameKey": "NAME_AVATAR_16",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER7,		"avatarDescription": "AVATAR_DESCRIPTION_16",	"clickAudioResource": "Audio_male_exclamations-22868_2",		"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_19_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_19",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_19",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER8:				{"resourceName": "Monster8",			"preloadResource": "Avatar_Monster8",			"headPortraitResource": "HeadPortrait_Monster8",		"headIconResource": "HeadIcon_Monster8",		"showNameKey": "NAME_AVATAR_17",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER8,		"avatarDescription": "AVATAR_DESCRIPTION_17",	"clickAudioResource": "Audio_male_exclamations-22868_3",		"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_20_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_20",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_20",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER9:				{"resourceName": "Monster9",			"preloadResource": "Avatar_Monster9",			"headPortraitResource": "HeadPortrait_Monster9",		"headIconResource": "HeadIcon_Monster9",		"showNameKey": "NAME_AVATAR_21",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER9,		"avatarDescription": "AVATAR_DESCRIPTION_21",	"clickAudioResource": "Audio_male_exclamations-22868_4",		"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_21_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_21",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_21",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER10:				{"resourceName": "Monster10",			"preloadResource": "Avatar_Monster10",			"headPortraitResource": "HeadPortrait_Monster10",		"headIconResource": "HeadIcon_Monster10",		"showNameKey": "NAME_AVATAR_22",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER10,		"avatarDescription": "AVATAR_DESCRIPTION_22",	"clickAudioResource": "Audio_male-what-6177",					"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_22_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_22",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_22",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_MONSTER11:				{"resourceName": "Monster11",			"preloadResource": "Avatar_Monster11",			"headPortraitResource": "HeadPortrait_Monster11",		"headIconResource": "HeadIcon_Monster11",		"showNameKey": "NAME_AVATAR_23",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER11,		"avatarDescription": "AVATAR_DESCRIPTION_23",	"clickAudioResource": "Audio_hmms-various-1-7175_2",			"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_23",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_23_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_23",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_23",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_MONSTER11,	},
AVATARTYPEID_MONSTER12:				{"resourceName": "Monster12",			"preloadResource": "Avatar_Monster12",			"headPortraitResource": "HeadPortrait_Monster12",		"headIconResource": "HeadIcon_Monster12",		"showNameKey": "NAME_AVATAR_24",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER12,		"avatarDescription": "AVATAR_DESCRIPTION_24",	"clickAudioResource": "Audio_mmm-hmm-36292_2",					"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_24",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_24_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_24",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_24",	"wrangleDialogTypeID_Swallow": WRANGLEDIALOGTYPEID_SWALLOW_MONSTER12,	},
AVATARTYPEID_KING:					{"resourceName": "King",				"preloadResource": "Avatar_King",				"headPortraitResource": "HeadPortrait_King",			"headIconResource": "HeadIcon_King",			"showNameKey": "NAME_AVATAR_25",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_KING,			"avatarDescription": "AVATAR_DESCRIPTION_25",	"clickAudioResource": "Audio_Do",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_25_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_25",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_25",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_QUEEN:					{"resourceName": "Queen",				"preloadResource": "Avatar_Queen",				"headPortraitResource": "HeadPortrait_Queen",			"headIconResource": "HeadIcon_Queen",			"showNameKey": "NAME_AVATAR_26",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_QUEEN,			"avatarDescription": "AVATAR_DESCRIPTION_26",	"clickAudioResource": "Audio_Re",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_26",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_26_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_26",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_26",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_SISTER:				{"resourceName": "Sister",				"preloadResource": "Avatar_Sister",				"headPortraitResource": "HeadPortrait_Sister",			"headIconResource": "HeadIcon_Sister",			"showNameKey": "NAME_AVATAR_27",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SISTER,			"avatarDescription": "AVATAR_DESCRIPTION_27",	"clickAudioResource": "Audio_Mi",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_27_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_27",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_27",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_HOUSEKEEPER:			{"resourceName": "Housekeeper",			"preloadResource": "Avatar_Housekeeper",		"headPortraitResource": "HeadPortrait_Housekeeper",		"headIconResource": "HeadIcon_Housekeeper",		"showNameKey": "NAME_AVATAR_28",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_HOUSEKEEPER,		"avatarDescription": "AVATAR_DESCRIPTION_28",	"clickAudioResource": "Audio_La",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_28",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_28",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_28",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_BUTLER:				{"resourceName": "Butler",				"preloadResource": "Avatar_Butler",				"headPortraitResource": "HeadPortrait_Butler",			"headIconResource": "HeadIcon_Butler",			"showNameKey": "NAME_AVATAR_29",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_BUTLER,			"avatarDescription": "AVATAR_DESCRIPTION_29",	"clickAudioResource": "Audio_Sol",								"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_Avatar_29",	"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_29_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_29",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_29",	"wrangleDialogTypeID_Swallow": 0,										},
AVATARTYPEID_AVATARTRANSPARENT:		{"resourceName": "AvatarTransparent",	"preloadResource": "Avatar_AvatarTransparent",	"headPortraitResource": "",								"headIconResource": "",							"showNameKey": "",					"flagColor": HQH.COLORPALETTE_UI.COLOR_TRANSPARENT,			"avatarDescription": "",						"clickAudioResource": "",										"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",									"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"isSameAsAvatarPower": false,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_AVATAR_30_",	"playChessSuccessFunction": "PlayChessSuccessFunction_Avatar_30",	"playChessFailureFunction": "PlayChessFailureFunction_Avatar_30",	"wrangleDialogTypeID_Swallow": 0,										},
}
const SWALLOW_POP_LAST_AVATARTYPEID: int = AVATARTYPEID_QIUYU1

const NOTE_DO: int = 1		# 哆（1） 
const NOTE_RE: int = 2		# 来（2）
const NOTE_MI: int = 3		# 咪（3）
const NOTE_FA: int = 4		# 发（4）
const NOTE_SOL: int = 5		# 唆（5）
const NOTE_LA: int = 6		# 啦（6）
const NOTE_SI: int = 7		# 西（7）
const NOTE_INFO_MAP: Dictionary = {
# noteTypeID: noteInfo
	NOTE_DO:	 {"showName": "NOTE_DO"},
	NOTE_RE:	 {"showName": "NOTE_RE"},
	NOTE_MI:	 {"showName": "NOTE_MI"},
	NOTE_FA:	 {"showName": "NOTE_FA"},
	NOTE_SOL:	 {"showName": "NOTE_SOL"},
	NOTE_LA:	 {"showName": "NOTE_LA"},
	NOTE_SI:	 {"showName": "NOTE_SI"},
}
func IsHasNoteInfo(noteTypeID: int) -> bool:
	return NOTE_INFO_MAP.has(noteTypeID)

func GetNoteInfo(noteTypeID: int) -> Dictionary:
	var noteInfo: Dictionary = {}
	if IsHasNoteInfo(noteTypeID):
		noteInfo = NOTE_INFO_MAP.get(noteTypeID)
	else:
		HQH.AssertLog("GetNoteInfo, Invalid noteTypeID: %s" % noteTypeID)
	
	return noteInfo

func GetNoteInfoShowName(noteTypeID: int) -> String:
	return GetNoteInfo(noteTypeID).showName

const WRANGLEDIALOGTYPEID_DOOR: int = 3
const WRANGLEDIALOGTYPEID_SNAKE1_INIT: int = 9
const WRANGLEDIALOGTYPEID_SNAKE1_SUCCESS: int = 19
const WRANGLEDIALOGTYPEID_PLAYER1_INIT: int = 20
const WRANGLEDIALOGTYPEID_PLAYER1_SUCCESS: int = 21
const WRANGLEDIALOGTYPEID_SILVERCARP1_INIT: int = 22
const WRANGLEDIALOGTYPEID_SILVERCARP1_SUCCESS: int = 23
const WRANGLEDIALOGTYPEID_DOG1_INIT: int = 24
const WRANGLEDIALOGTYPEID_DOG1_SUCCESS: int = 25
const WRANGLEDIALOGTYPEID_FOOT_INIT: int = 52
const WRANGLEDIALOGTYPEID_FOOT_SUCCESS: int = 53
const WRANGLEDIALOGTYPEID_SNAKE2_INIT: int = 54
const WRANGLEDIALOGTYPEID_SNAKE2_SUCCESS: int = 55
const WRANGLEDIALOGTYPEID_SNAKE3_INIT: int = 56
const WRANGLEDIALOGTYPEID_SNAKE3_SUCCESS: int = 57
const WRANGLEDIALOGTYPEID_DONKEY1_INIT: int = 83
const WRANGLEDIALOGTYPEID_DONKEY1_SUCCESS: int = 84
const WRANGLEDIALOGTYPEID_TURTLE1_INIT: int = 93
const WRANGLEDIALOGTYPEID_TURTLE1_SUCCESS: int = 94
const WRANGLEDIALOGTYPEID_ANGEL1_INIT: int = 103
const WRANGLEDIALOGTYPEID_LETTER3_INIT: int = 104
const WRANGLEDIALOGTYPEID_LETTER3_SUCCESS: int = 105
const WRANGLEDIALOGTYPEID_KING_INIT: int = 122
const WRANGLEDIALOGTYPEID_HOUSEKEEPER_INIT: int = 139
const WRANGLEDIALOGTYPEID_BUTLER_INIT: int = 140
const WRANGLEDIALOGTYPEID_QUEEN_INIT: int = 151
const WRANGLEDIALOGTYPEID_SISTER_1_INIT: int = 160
const WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS: int = 164
const WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS: int = 166
const WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT: int = 167
const WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS: int = 168
const WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT: int = 175
const WRANGLEDIALOGTYPEID_MONSTER_INIT_BEGIN: int = 179
const WRANGLEDIALOGTYPEID_MONSTER1_INIT: int = WRANGLEDIALOGTYPEID_MONSTER_INIT_BEGIN
const WRANGLEDIALOGTYPEID_MONSTER2_INIT: int = 180
const WRANGLEDIALOGTYPEID_MONSTER3_INIT: int = 181
const WRANGLEDIALOGTYPEID_MONSTER4_INIT: int = 182
const WRANGLEDIALOGTYPEID_MONSTER5_INIT: int = 183
const WRANGLEDIALOGTYPEID_MONSTER6_INIT: int = 184
const WRANGLEDIALOGTYPEID_MONSTER7_INIT: int = 185
const WRANGLEDIALOGTYPEID_MONSTER8_INIT: int = 186
const WRANGLEDIALOGTYPEID_MONSTER9_INIT: int = 187
const WRANGLEDIALOGTYPEID_MONSTER10_INIT: int = 188
const WRANGLEDIALOGTYPEID_MONSTER11_INIT: int = 189
const WRANGLEDIALOGTYPEID_MONSTER12_INIT: int = 190
const WRANGLEDIALOGTYPEID_MONSTER_INIT_END: int = WRANGLEDIALOGTYPEID_MONSTER12_INIT
const WRANGLEDIALOGTYPEID_MONSTER_SUCCESS_BEGIN: int = 192
const WRANGLEDIALOGTYPEID_MONSTER1_SUCCESS: int = WRANGLEDIALOGTYPEID_MONSTER_SUCCESS_BEGIN
const WRANGLEDIALOGTYPEID_MONSTER2_SUCCESS: int = 193
const WRANGLEDIALOGTYPEID_MONSTER3_SUCCESS: int = 194
const WRANGLEDIALOGTYPEID_MONSTER4_SUCCESS: int = 195
const WRANGLEDIALOGTYPEID_MONSTER5_SUCCESS: int = 196
const WRANGLEDIALOGTYPEID_MONSTER6_SUCCESS: int = 197
const WRANGLEDIALOGTYPEID_MONSTER7_SUCCESS: int = 198
const WRANGLEDIALOGTYPEID_MONSTER8_SUCCESS: int = 199
const WRANGLEDIALOGTYPEID_MONSTER9_SUCCESS: int = 200
const WRANGLEDIALOGTYPEID_MONSTER10_SUCCESS: int = 201
const WRANGLEDIALOGTYPEID_MONSTER11_SUCCESS: int = 202
const WRANGLEDIALOGTYPEID_MONSTER12_SUCCESS: int = 203
const WRANGLEDIALOGTYPEID_MONSTER_SUCCESS_END: int = WRANGLEDIALOGTYPEID_MONSTER12_SUCCESS
const WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START: int = 216
const WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START_NO: int = 217
const WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH: int = 218
const WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH_NO: int = 219
const WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS: int = 220
const WRANGLEDIALOGTYPEID_SISTER_4_INIT: int = 221
const WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS: int = 225
const WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS: int = 228
const WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS: int = 229
const WRANGLEDIALOGTYPEID_SISTER_FOUND: int = 230

enum NPC_TRIGGER_TYPE {
	NONE,
	NPC_AVATAR,
	NPC_ARTICLE,
}
const NPCTRIGGERTYPEID_SNAKE1: int = 1
const NPCTRIGGERTYPEID_SNAKE2: int = 7
const NPCTRIGGERTYPEID_SNAKE3: int = 8
const NPCTRIGGERTYPEID_CLERGY1: int = 17
const NPCTRIGGERTYPEID_MONSTER_BEGIN: int = 18
const NPCTRIGGERTYPEID_MONSTER_END: int = 29
const NPCTRIGGER_MAP: Dictionary = {
# nPCTriggerTypeID: nPCTriggerInfo
NPCTRIGGERTYPEID_SNAKE1:		{"avatarTypeID": AVATARTYPEID_SNAKE1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SNAKE1_INIT},
	2:							{"avatarTypeID": AVATARTYPEID_PLAYER1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_PLAYER1_INIT},
	3:							{"avatarTypeID": AVATARTYPEID_SILVERCARP1,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SILVERCARP1_INIT},
	4:							{"avatarTypeID": AVATARTYPEID_DOG1,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_DOG1_INIT},
	5:							{"avatarTypeID": AVATARTYPEID_SISTER,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT},
	6:							{"avatarTypeID": AVATARTYPEID_DONKEY1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_DONKEY1_INIT},
NPCTRIGGERTYPEID_SNAKE2:		{"avatarTypeID": AVATARTYPEID_SNAKE2,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 0.7,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SNAKE2_INIT},
NPCTRIGGERTYPEID_SNAKE3:		{"avatarTypeID": AVATARTYPEID_SNAKE3,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 0.4,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SNAKE3_INIT},
	9:							{"avatarTypeID": AVATARTYPEID_TORTOISE1,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 2.0,	"wrangleDialogTypeID": 76},
	10:							{"avatarTypeID": AVATARTYPEID_TURTLE1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_TURTLE1_INIT},
	11:							{"avatarTypeID": AVATARTYPEID_ANGEL1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_ANGEL1_INIT},
	12:							{"avatarTypeID": AVATARTYPEID_KING,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_KING_INIT},
	13:							{"avatarTypeID": AVATARTYPEID_HOUSEKEEPER,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_HOUSEKEEPER_INIT},
	14:							{"avatarTypeID": AVATARTYPEID_BUTLER,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_BUTLER_INIT},
	15:							{"avatarTypeID": AVATARTYPEID_QUEEN,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_QUEEN_INIT},
	16:							{"avatarTypeID": AVATARTYPEID_SISTER,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SISTER_1_INIT},
NPCTRIGGERTYPEID_CLERGY1:		{"avatarTypeID": AVATARTYPEID_CLERGY1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 173},
NPCTRIGGERTYPEID_MONSTER_BEGIN:	{"avatarTypeID": AVATARTYPEID_MONSTER1,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	19:							{"avatarTypeID": AVATARTYPEID_MONSTER2,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	20:							{"avatarTypeID": AVATARTYPEID_MONSTER3,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	21:							{"avatarTypeID": AVATARTYPEID_MONSTER4,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	22:							{"avatarTypeID": AVATARTYPEID_MONSTER5,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	23:							{"avatarTypeID": AVATARTYPEID_MONSTER6,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	24:							{"avatarTypeID": AVATARTYPEID_MONSTER7,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	25:							{"avatarTypeID": AVATARTYPEID_MONSTER8,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	26:							{"avatarTypeID": AVATARTYPEID_MONSTER9,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	27:							{"avatarTypeID": AVATARTYPEID_MONSTER10,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 191},
	28:							{"avatarTypeID": AVATARTYPEID_MONSTER11,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_MONSTER11_INIT},
NPCTRIGGERTYPEID_MONSTER_END:	{"avatarTypeID": AVATARTYPEID_MONSTER12,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_MONSTER12_INIT},
	30:							{"avatarTypeID": SWALLOW_POP_LAST_AVATARTYPEID,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 227},
	31:							{"avatarTypeID": AVATARTYPEID_KING,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SISTER_FOUND},
	32:							{"avatarTypeID": AVATARTYPEID_QUEEN,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SISTER_FOUND},
	33:							{"avatarTypeID": AVATARTYPEID_HOUSEKEEPER,	"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SISTER_FOUND},
	34:							{"avatarTypeID": AVATARTYPEID_BUTLER,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SISTER_FOUND},
}
const NPCARTICLETRIGGERTYPEID_FOOT: int = 9
const NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN: int = 11
const NPCARTICLETRIGGERTYPEID_ODETOJOY_END: int = 25
const NPCARTICLETRIGGERTYPEID_DOOR6: int = 26
const NPCARTICLETRIGGERTYPEID_DOOR7: int = 27
const NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN: int = 28
const NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MAX: int = 64
const NPCARTICLETRIGGER_MAP: Dictionary = {
# nPCArticleTriggerTypeID: nPCArticleTriggerInfo
	1:												{"preloadResource": "Scene_Bag",					"showNameKey": "NAME_AVATAR_30",				"wrangleDialogTypeID": 4,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_1_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_1",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_1"},
	2:												{"preloadResource": "Scene_JournalRecordBook",		"showNameKey": "NAME_AVATAR_31",				"wrangleDialogTypeID": 5,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_2_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_2",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_2"},
	3:												{"preloadResource": "Scene_Door1",					"showNameKey": "NPCARTICLETRIGGER_NAME_1",		"wrangleDialogTypeID": 6,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_3",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_3"},
	4:												{"preloadResource": "Scene_Door2",					"showNameKey": "NPCARTICLETRIGGER_NAME_2",		"wrangleDialogTypeID": 6,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_3",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_3"},
	5:												{"preloadResource": "Scene_Door3",					"showNameKey": "NPCARTICLETRIGGER_NAME_3",		"wrangleDialogTypeID": 6,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_3",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_3"},
	6:												{"preloadResource": "Scene_Door2",					"showNameKey": "NPCARTICLETRIGGER_NAME_2",		"wrangleDialogTypeID": 6,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_3",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_3"},
	7:												{"preloadResource": "Scene_Door1",					"showNameKey": "NPCARTICLETRIGGER_NAME_1",		"wrangleDialogTypeID": 6,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_3",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_3"},
	8:												{"preloadResource": "Scene_Door3",					"showNameKey": "NPCARTICLETRIGGER_NAME_3",		"wrangleDialogTypeID": 6,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_3_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_3",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_3"},
NPCARTICLETRIGGERTYPEID_FOOT:						{"preloadResource": "Skill_SkillFoot",				"showNameKey": "GOODS_NAME_1",					"wrangleDialogTypeID": 52,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_9",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_9_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_9",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_9"},
	10:												{"preloadResource": "Scene_Letter3",				"showNameKey": "NAME_AVATAR_32",				"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_LETTER3_INIT,				"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_10",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_10_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_10",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_10"},
NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN:				{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 107,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_11",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_11",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_11",		"noteType": NOTE_MI},
	12:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 108,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_12",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_12",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_12",		"noteType": NOTE_MI},
	13:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_FA",				"wrangleDialogTypeID": 109,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_13",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_13",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_13",		"noteType": NOTE_FA},
	14:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_SOL",				"wrangleDialogTypeID": 110,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_14",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_14",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_14",		"noteType": NOTE_SOL},
	15:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_SOL",				"wrangleDialogTypeID": 111,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_15",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_15",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_15",		"noteType": NOTE_SOL},
	16:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_FA",				"wrangleDialogTypeID": 112,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_16",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_16",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_16",		"noteType": NOTE_FA},
	17:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 113,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_17",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_17",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_17",		"noteType": NOTE_MI},
	18:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 114,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_18",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_18",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_18",		"noteType": NOTE_RE},
	19:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_DO",				"wrangleDialogTypeID": 115,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_19",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_19",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_19",		"noteType": NOTE_DO},
	20:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_DO",				"wrangleDialogTypeID": 116,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_20",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_20",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_20",		"noteType": NOTE_DO},
	21:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 117,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_21",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_21",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_21",		"noteType": NOTE_RE},
	22:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 118,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_22",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_22",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_22",		"noteType": NOTE_MI},
	23:												{"preloadResource": "OdeToJoy6_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 119,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_23",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_23",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_23",		"noteType": NOTE_MI},
	24:												{"preloadResource": "OdeToJoy7_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 120,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_24",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_24",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_24",		"noteType": NOTE_RE},
NPCARTICLETRIGGERTYPEID_ODETOJOY_END:				{"preloadResource": "OdeToJoy8_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 121,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_25",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_11_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_25",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_25",		"noteType": NOTE_RE},
NPCARTICLETRIGGERTYPEID_DOOR6:						{"preloadResource": "Scene_Door6",					"showNameKey": "DOOR_1",						"wrangleDialogTypeID": 137,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_26",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_26_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_26",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_26"},
NPCARTICLETRIGGERTYPEID_DOOR7:						{"preloadResource": "Scene_Door7",					"showNameKey": "DOOR_2",						"wrangleDialogTypeID": 138,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_27",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_26_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_27",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_27"},
NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN:	{"preloadResource": "Castle_Door3",					"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	29:												{"preloadResource": "Door2",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	30:												{"preloadResource": "Door2_2",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	31:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	32:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	33:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	34:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	35:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	36:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	37:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	38:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	39:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	40:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	41:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	42:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	43:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	44:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	45:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	46:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	47:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	48:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	49:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	50:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	51:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	52:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	53:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	54:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	55:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	56:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	57:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	58:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	59:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	60:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	61:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	62:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	63:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MAX:	{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 159,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_28",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_28_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_28",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_28"},
	65:												{"preloadResource": "Scene_ThreeHeadsDragon3",		"showNameKey": "NAME_AVATAR_34",				"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT,		"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "CheckConditionFunction_NPCArticle_65",		"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_65_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_65",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_65"},
	66:												{"preloadResource": "PathBG_64x64",					"showNameKey": "NAME_AVATAR_36",				"wrangleDialogTypeID": 174,												"powerMin": 1,		"powerMax": 2,		"checkConditionFunction": "",											"conditionFalsePowerMin": 0,	"conditionFalsePowerMax": 0,	"playChessStartWordsKey": "PLAYCHESSSTARTWORDSKEY_NPCARTICLE_66_",	"playChessSuccessFunction": "PlayChessSuccessFunction_NPCArticle_66",	"playChessFailureFunction": "PlayChessFailureFunction_NPCArticle_66"},
}
const WRANGLEDIALOG_MAP: Dictionary = {
# wrangleDialogTypeID: wrangleDialogInfo
# button max number is WRANGLEDIALOG_NUMBER_MAX
	1:												{"content": "WRANGLEDIALOG_1_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_1_BUTTON_1", "buttonFunction1": "WrangleDialog_1_Function_1",			"button2": "WRANGLEDIALOG_1_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
	2:												{"content": "WRANGLEDIALOG_2_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_2_BUTTON_1", "buttonFunction1": "WrangleDialog_2_Function_1",			"button2": "WRANGLEDIALOG_2_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_DOOR:							{"content": "WRANGLEDIALOG_3_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_3_BUTTON_1", "buttonFunction1": "WrangleDialog_3_Function_1",			"button2": "WRANGLEDIALOG_3_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
	4:												{"content": "WRANGLEDIALOG_4_CONTENT",			"choiceList": [1],				"isSaveChoice": true},
	5:												{"content": "WRANGLEDIALOG_5_CONTENT",			"choiceList": [2],				"isSaveChoice": true},
	6:												{"content": "WRANGLEDIALOG_6_CONTENT",			"choiceList": [7],				"button1": "WRANGLEDIALOG_6_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	7:												{"content": "WRANGLEDIALOG_7_CONTENT",			"choiceList": [8],				"button1": "WRANGLEDIALOG_7_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	8:												{"content": "WRANGLEDIALOG_8_CONTENT",			"choiceList": [13],				"button1": "WRANGLEDIALOG_8_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_SNAKE1_INIT:					{"content": "WRANGLEDIALOG_9_CONTENT",			"choiceList": [10],				"button1": "WRANGLEDIALOG_9_BUTTON_2", "buttonFunction1": "WrangleDialog_Pass"},
	10:												{"content": "WRANGLEDIALOG_10_CONTENT",			"choiceList": [11],				"button1": "WRANGLEDIALOG_10_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	11:												{"content": "WRANGLEDIALOG_11_CONTENT",			"choiceList": [14],				"button1": "WRANGLEDIALOG_11_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	12:												{"content": "WRANGLEDIALOG_12_CONTENT",			"choiceList": [17],				"button1": "WRANGLEDIALOG_12_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass",},
	13:												{"content": "WRANGLEDIALOG_13_CONTENT",			"choiceList": [41]},
	14:												{"content": "WRANGLEDIALOG_14_CONTENT",			"choiceList": [15],				"button1": "WRANGLEDIALOG_9_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	15:												{"content": "WRANGLEDIALOG_15_CONTENT",			"choiceList": [16],				"button1": "WRANGLEDIALOG_10_BUTTON_2", "buttonFunction1": "WrangleDialog_Pass"},
	16:												{"content": "WRANGLEDIALOG_16_CONTENT",			"choiceList": [12],				"button1": "WRANGLEDIALOG_11_BUTTON_2", "buttonFunction1": "WrangleDialog_Pass"},
	17:												{"content": "WRANGLEDIALOG_17_CONTENT",			"choiceList": [18],				"button1": "WRANGLEDIALOG_12_BUTTON_2", "buttonFunction1": "WrangleDialog_Pass"},
	18:												{"content": "WRANGLEDIALOG_18_CONTENT",			"choiceList": [19],				"button1": "WRANGLEDIALOG_18_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_SNAKE1_SUCCESS:					{"content": "WRANGLEDIALOG_19_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_19_BUTTON_1", "buttonFunction1": "WrangleDialog_19_Function_1"},
WRANGLEDIALOGTYPEID_PLAYER1_INIT:					{"content": "WRANGLEDIALOG_20_CONTENT",			"choiceList": [26],				"button1": "WRANGLEDIALOG_20_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_PLAYER1_SUCCESS:				{"content": "WRANGLEDIALOG_21_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_21_BUTTON_1", "buttonFunction1": "WrangleDialog_21_Function_1"},
WRANGLEDIALOGTYPEID_SILVERCARP1_INIT:				{"content": "WRANGLEDIALOG_22_CONTENT",			"choiceList": [42],				"button1": "WRANGLEDIALOG_22_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_SILVERCARP1_SUCCESS:			{"content": "WRANGLEDIALOG_23_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_23_BUTTON_1", "buttonFunction1": "WrangleDialog_23_Function_1"},
WRANGLEDIALOGTYPEID_DOG1_INIT:						{"content": "WRANGLEDIALOG_24_CONTENT",			"choiceList": [35],				"button1": "WRANGLEDIALOG_24_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_DOG1_SUCCESS:					{"content": "WRANGLEDIALOG_25_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_25_BUTTON_1", "buttonFunction1": "WrangleDialog_25_Function_1"},
	26:												{"content": "WRANGLEDIALOG_20_1_CONTENT",		"choiceList": [27]},
	27:												{"content": "WRANGLEDIALOG_20_2_CONTENT",		"choiceList": [28]},
	28:												{"content": "WRANGLEDIALOG_20_3_CONTENT",		"choiceList": [29],				"button1": "WRANGLEDIALOG_20_3_BUTTON", "buttonFunction1": "WrangleDialog_Pass"},
	29:												{"content": "WRANGLEDIALOG_20_4_CONTENT",		"choiceList": [30]},
	30:												{"content": "WRANGLEDIALOG_20_5_CONTENT",		"choiceList": [31]},
	31:												{"content": "WRANGLEDIALOG_20_6_CONTENT",		"choiceList": [32],				"button1": "WRANGLEDIALOG_20_6_BUTTON", "buttonFunction1": "WrangleDialog_Pass"},
	32:												{"content": "WRANGLEDIALOG_20_7_CONTENT",		"choiceList": [33]},
	33:												{"content": "WRANGLEDIALOG_20_8_CONTENT",		"choiceList": [34],				"button1": "WRANGLEDIALOG_20_8_BUTTON", "buttonFunction1": "WrangleDialog_Pass"},
	34:												{"content": "WRANGLEDIALOG_20_9_CONTENT",		"choiceList": [21],				"button1": "WRANGLEDIALOG_20_9_BUTTON", "buttonFunction1": "WrangleDialog_Pass"},
	35:												{"content": "WRANGLEDIALOG_24_1_CONTENT",		"choiceList": [36],				"button1": "WRANGLEDIALOG_24_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	36:												{"content": "WRANGLEDIALOG_24_2_CONTENT",		"choiceList": [37],				"button1": "WRANGLEDIALOG_24_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	37:												{"content": "WRANGLEDIALOG_24_3_CONTENT",		"choiceList": [38],				"button1": "WRANGLEDIALOG_24_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	38:												{"content": "WRANGLEDIALOG_24_4_CONTENT",		"choiceList": [39]},
	39:												{"content": "WRANGLEDIALOG_24_5_CONTENT",		"choiceList": [40]},
	40:												{"content": "WRANGLEDIALOG_24_6_CONTENT",		"choiceList": [25]},
	41:												{"content": "WRANGLEDIALOG_13_1_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_13_BUTTON_1", "buttonFunction1": "WrangleDialog_13_Function_1"},
	42:												{"content": "WRANGLEDIALOG_22_1_CONTENT",		"choiceList": [43],				"button1": "WRANGLEDIALOG_22_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	43:												{"content": "WRANGLEDIALOG_22_2_CONTENT",		"choiceList": [44],				"button1": "WRANGLEDIALOG_22_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	44:												{"content": "WRANGLEDIALOG_22_3_CONTENT",		"choiceList": [45],				"button1": "WRANGLEDIALOG_22_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	45:												{"content": "WRANGLEDIALOG_22_4_CONTENT",		"choiceList": [46],				"button1": "WRANGLEDIALOG_22_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	46:												{"content": "WRANGLEDIALOG_22_5_CONTENT",		"choiceList": [47],				"button1": "WRANGLEDIALOG_22_5_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	47:												{"content": "WRANGLEDIALOG_22_6_CONTENT",		"choiceList": [48],				"button1": "WRANGLEDIALOG_22_6_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	48:												{"content": "WRANGLEDIALOG_22_7_CONTENT",		"choiceList": [49],				"button1": "WRANGLEDIALOG_22_7_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	49:												{"content": "WRANGLEDIALOG_22_8_CONTENT",		"choiceList": [50]},
	50:												{"content": "WRANGLEDIALOG_22_9_CONTENT",		"choiceList": [51]},
	51:												{"content": "WRANGLEDIALOG_22_10_CONTENT",		"choiceList": [23],				"button1": "WRANGLEDIALOG_22_10_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_FOOT_INIT:						{"content": "WRANGLEDIALOG_1_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_1_BUTTON_1", "buttonFunction1": "WrangleDialog_52_Function_1",			"button2": "WRANGLEDIALOG_1_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_FOOT_SUCCESS:					{},
WRANGLEDIALOGTYPEID_SNAKE2_INIT:					{"content": "WRANGLEDIALOG_54_CONTENT",			"choiceList": [58],				"button1": "WRANGLEDIALOG_54_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_SNAKE2_SUCCESS:					{"content": "WRANGLEDIALOG_55_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_55_BUTTON_1", "buttonFunction1": "WrangleDialog_55_Function_1"},
WRANGLEDIALOGTYPEID_SNAKE3_INIT:					{"content": "WRANGLEDIALOG_56_CONTENT",			"choiceList": [66],				"button1": "WRANGLEDIALOG_56_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_SNAKE3_SUCCESS:					{"content": "WRANGLEDIALOG_57_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_57_BUTTON_1", "buttonFunction1": "WrangleDialog_57_Function_1"},
	58:												{"content": "WRANGLEDIALOG_54_1_CONTENT",		"choiceList": [59],				"button1": "WRANGLEDIALOG_54_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	59:												{"content": "WRANGLEDIALOG_54_2_CONTENT",		"choiceList": [60]},
	60:												{"content": "WRANGLEDIALOG_54_3_CONTENT",		"choiceList": [61],				"button1": "WRANGLEDIALOG_54_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	61:												{"content": "WRANGLEDIALOG_54_4_CONTENT",		"choiceList": [62],				"button1": "WRANGLEDIALOG_54_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	62:												{"content": "WRANGLEDIALOG_54_5_CONTENT",		"choiceList": [63],				"button1": "WRANGLEDIALOG_54_5_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	63:												{"content": "WRANGLEDIALOG_54_6_CONTENT",		"choiceList": [64],				"button1": "WRANGLEDIALOG_54_6_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	64:												{"content": "WRANGLEDIALOG_54_7_CONTENT",		"choiceList": [65]},
	65:												{"content": "WRANGLEDIALOG_54_8_CONTENT",		"choiceList": [55],				"button1": "WRANGLEDIALOG_54_8_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	66:												{"content": "WRANGLEDIALOG_56_1_CONTENT",		"choiceList": [67],				"button1": "WRANGLEDIALOG_56_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	67:												{"content": "WRANGLEDIALOG_56_2_CONTENT",		"choiceList": [68]},
	68:												{"content": "WRANGLEDIALOG_56_3_CONTENT",		"choiceList": [69],				"button1": "WRANGLEDIALOG_56_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	69:												{"content": "WRANGLEDIALOG_56_4_CONTENT",		"choiceList": [70],				"button1": "WRANGLEDIALOG_56_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	70:												{"content": "WRANGLEDIALOG_56_5_CONTENT",		"choiceList": [71],				"button1": "WRANGLEDIALOG_56_5_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	71:												{"content": "WRANGLEDIALOG_56_6_CONTENT",		"choiceList": [72]},
	72:												{"content": "WRANGLEDIALOG_56_7_CONTENT",		"choiceList": [73],				"button1": "WRANGLEDIALOG_56_7_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	73:												{"content": "WRANGLEDIALOG_56_8_CONTENT",		"choiceList": [74],				"button1": "WRANGLEDIALOG_56_8_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	74:												{"content": "WRANGLEDIALOG_56_9_CONTENT",		"choiceList": [75],				"button1": "WRANGLEDIALOG_56_9_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	75:												{"content": "WRANGLEDIALOG_56_10_CONTENT",		"choiceList": [57]},
	76:												{"content": "WRANGLEDIALOG_76_1_CONTENT",		"choiceList": [77]},
	77:												{"content": "WRANGLEDIALOG_76_2_CONTENT",		"choiceList": [78]},
	78:												{"content": "WRANGLEDIALOG_76_3_CONTENT",		"choiceList": [79]},
	79:												{"content": "WRANGLEDIALOG_76_4_CONTENT",		"choiceList": [80]},
	80:												{"content": "WRANGLEDIALOG_76_5_CONTENT",		"choiceList": [81]},
	81:												{"content": "WRANGLEDIALOG_76_6_CONTENT",		"choiceList": [82]},
	82:												{"content": "WRANGLEDIALOG_76_7_CONTENT",		"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_76_7_BUTTON_1", "buttonFunction1": "WrangleDialog_76_7_Function_1",				"button2": "WRANGLEDIALOG_76_7_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_DONKEY1_INIT:					{"content": "WRANGLEDIALOG_83_CONTENT",			"choiceList": [85],				"button1": "WRANGLEDIALOG_83_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_DONKEY1_SUCCESS:				{"content": "WRANGLEDIALOG_84_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_84_BUTTON_1", "buttonFunction1": "WrangleDialog_84_Function_1"},
	85:												{"content": "WRANGLEDIALOG_83_1_CONTENT",		"choiceList": [86],				"button1": "WRANGLEDIALOG_83_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	86:												{"content": "WRANGLEDIALOG_83_2_CONTENT",		"choiceList": [87],				"button1": "WRANGLEDIALOG_83_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	87:												{"content": "WRANGLEDIALOG_83_3_CONTENT",		"choiceList": [88],				"button1": "WRANGLEDIALOG_83_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	88:												{"content": "WRANGLEDIALOG_83_4_CONTENT",		"choiceList": [89],				"button1": "WRANGLEDIALOG_83_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	89:												{"content": "WRANGLEDIALOG_83_5_CONTENT",		"choiceList": [90],				"button1": "WRANGLEDIALOG_83_5_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	90:												{"content": "WRANGLEDIALOG_83_6_CONTENT",		"choiceList": [91],				"button1": "WRANGLEDIALOG_83_6_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	91:												{"content": "WRANGLEDIALOG_83_7_CONTENT",		"choiceList": [92]},
	92:												{"content": "WRANGLEDIALOG_83_8_CONTENT",		"choiceList": [84]},
WRANGLEDIALOGTYPEID_TURTLE1_INIT:					{"content": "WRANGLEDIALOG_93_CONTENT",			"choiceList": [95],				"button1": "WRANGLEDIALOG_93_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_TURTLE1_SUCCESS:				{"content": "WRANGLEDIALOG_94_CONTENT",			"choiceList": [0],				"button1": "WRANGLEDIALOG_94_BUTTON_1", "buttonFunction1": "WrangleDialog_94_Function_1"},
	95:												{"content": "WRANGLEDIALOG_93_1_CONTENT",		"choiceList": [96],				"button1": "WRANGLEDIALOG_93_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	96:												{"content": "WRANGLEDIALOG_93_2_CONTENT",		"choiceList": [97],				"button1": "WRANGLEDIALOG_93_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	97:												{"content": "WRANGLEDIALOG_93_3_CONTENT",		"choiceList": [98],				"button1": "WRANGLEDIALOG_93_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	98:												{"content": "WRANGLEDIALOG_93_4_CONTENT",		"choiceList": [99],				"button1": "WRANGLEDIALOG_93_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	99:												{"content": "WRANGLEDIALOG_93_5_CONTENT",		"choiceList": [100],			"button1": "WRANGLEDIALOG_93_5_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	100:											{"content": "WRANGLEDIALOG_93_6_CONTENT",		"choiceList": [101],			"button1": "WRANGLEDIALOG_93_6_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	101:											{"content": "WRANGLEDIALOG_93_7_CONTENT",		"choiceList": [102],			"button1": "WRANGLEDIALOG_93_7_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	102:											{"content": "WRANGLEDIALOG_93_8_CONTENT",		"choiceList": [94],				"button1": "WRANGLEDIALOG_93_8_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_ANGEL1_INIT:					{"content": "WRANGLEDIALOG_103_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_103_BUTTON_1", "buttonFunction1": "WrangleDialog_103_Function_1"},
WRANGLEDIALOGTYPEID_LETTER3_INIT:					{"content": "WRANGLEDIALOG_104_CONTENT",		"choiceList": [106]},
WRANGLEDIALOGTYPEID_LETTER3_SUCCESS:				{},
	106:											{"content": "WRANGLEDIALOG_106_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_106_BUTTON_1", "buttonFunction1": "WrangleDialog_106_Function_1"},
	107:											{"content": "WRANGLEDIALOG_107_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_107_BUTTON_1", "buttonFunction1": "WrangleDialog_107_Function_1"},
	108:											{"content": "WRANGLEDIALOG_108_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_108_BUTTON_1", "buttonFunction1": "WrangleDialog_108_Function_1"},
	109:											{"content": "WRANGLEDIALOG_109_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_109_BUTTON_1", "buttonFunction1": "WrangleDialog_109_Function_1"},
	110:											{"content": "WRANGLEDIALOG_110_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_110_BUTTON_1", "buttonFunction1": "WrangleDialog_110_Function_1"},
	111:											{"content": "WRANGLEDIALOG_111_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_111_BUTTON_1", "buttonFunction1": "WrangleDialog_111_Function_1"},
	112:											{"content": "WRANGLEDIALOG_112_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_112_BUTTON_1", "buttonFunction1": "WrangleDialog_112_Function_1"},
	113:											{"content": "WRANGLEDIALOG_113_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_113_BUTTON_1", "buttonFunction1": "WrangleDialog_113_Function_1"},
	114:											{"content": "WRANGLEDIALOG_114_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_114_BUTTON_1", "buttonFunction1": "WrangleDialog_114_Function_1"},
	115:											{"content": "WRANGLEDIALOG_115_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_115_BUTTON_1", "buttonFunction1": "WrangleDialog_115_Function_1"},
	116:											{"content": "WRANGLEDIALOG_116_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_116_BUTTON_1", "buttonFunction1": "WrangleDialog_116_Function_1"},
	117:											{"content": "WRANGLEDIALOG_117_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_117_BUTTON_1", "buttonFunction1": "WrangleDialog_117_Function_1"},
	118:											{"content": "WRANGLEDIALOG_118_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_118_BUTTON_1", "buttonFunction1": "WrangleDialog_118_Function_1"},
	119:											{"content": "WRANGLEDIALOG_119_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_119_BUTTON_1", "buttonFunction1": "WrangleDialog_119_Function_1"},
	120:											{"content": "WRANGLEDIALOG_120_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_120_BUTTON_1", "buttonFunction1": "WrangleDialog_120_Function_1"},
	121:											{"content": "WRANGLEDIALOG_121_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_121_BUTTON_1", "buttonFunction1": "WrangleDialog_121_Function_1"},
WRANGLEDIALOGTYPEID_KING_INIT:						{"content": "WRANGLEDIALOG_122_CONTENT",		"choiceList": [123],			"button1": "WRANGLEDIALOG_122_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	123:											{"content": "WRANGLEDIALOG_123_CONTENT",		"choiceList": [124],			"button1": "WRANGLEDIALOG_123_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	124:											{"content": "WRANGLEDIALOG_124_CONTENT",		"choiceList": [125]},
	125:											{"content": "WRANGLEDIALOG_125_CONTENT",		"choiceList": [126],			"button1": "WRANGLEDIALOG_125_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	126:											{"content": "WRANGLEDIALOG_126_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_126_BUTTON_1", "buttonFunction1": "WrangleDialog_126_Function_1"},
	127:											{"content": "WRANGLEDIALOG_127_CONTENT",		"choiceList": [128],			"button1": "WRANGLEDIALOG_127_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	128:											{"content": "WRANGLEDIALOG_128_CONTENT",		"choiceList": [129],			"button1": "WRANGLEDIALOG_128_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	129:											{"content": "WRANGLEDIALOG_129_CONTENT",		"choiceList": [130],			"button1": "WRANGLEDIALOG_129_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	130:											{"content": "WRANGLEDIALOG_130_CONTENT",		"choiceList": [131],			"button1": "WRANGLEDIALOG_130_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	131:											{"content": "WRANGLEDIALOG_131_CONTENT",		"choiceList": [132],			"button1": "WRANGLEDIALOG_131_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	132:											{"content": "WRANGLEDIALOG_132_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_132_BUTTON_1", "buttonFunction1": "WrangleDialog_132_Function_1"},
	133:											{"content": "WRANGLEDIALOG_133_CONTENT",		"choiceList": [134, 136, 165],	"button1": "WRANGLEDIALOG_133_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass",				"button2": "WRANGLEDIALOG_133_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass",			"button3": "WRANGLEDIALOG_133_BUTTON_3", "buttonFunction3": "WrangleDialog_Pass"},
	134:											{"content": "WRANGLEDIALOG_134_CONTENT",		"choiceList": [135],			"button1": "WRANGLEDIALOG_134_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	135:											{"content": "WRANGLEDIALOG_135_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_135_BUTTON_1", "buttonFunction1": "WrangleDialog_135_Function_1"},
	136:											{"content": "WRANGLEDIALOG_136_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_136_BUTTON_1", "buttonFunction1": "WrangleDialog_136_Function_1"},
	137:											{"content": "WRANGLEDIALOG_3_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_3_BUTTON_1", "buttonFunction1": "WrangleDialog_137_Function_1",			"button2": "WRANGLEDIALOG_3_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
	138:											{"content": "WRANGLEDIALOG_3_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_3_BUTTON_1", "buttonFunction1": "WrangleDialog_138_Function_1",			"button2": "WRANGLEDIALOG_3_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_HOUSEKEEPER_INIT:				{"content": "WRANGLEDIALOG_139_CONTENT",		"choiceList": [141, 144],		"button1": "WRANGLEDIALOG_139_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass",					"button2": "WRANGLEDIALOG_139_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_BUTLER_INIT:					{"content": "WRANGLEDIALOG_140_CONTENT",		"choiceList": [146, 149],		"button1": "WRANGLEDIALOG_140_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass",					"button2": "WRANGLEDIALOG_140_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
	141:											{"content": "WRANGLEDIALOG_139_1_CONTENT",		"choiceList": [142]},
	142:											{"content": "WRANGLEDIALOG_139_2_CONTENT",		"choiceList": [143],			"button1": "WRANGLEDIALOG_139_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	143:											{"content": "WRANGLEDIALOG_139_3_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_139_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	144:											{"content": "WRANGLEDIALOG_139_4_CONTENT",		"choiceList": [145],			"button1": "WRANGLEDIALOG_139_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	145:											{"content": "WRANGLEDIALOG_139_5_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_139_5_BUTTON_1", "buttonFunction1": "WrangleDialog_145_Function_1"},
	146:											{"content": "WRANGLEDIALOG_140_1_CONTENT",		"choiceList": [147],			"button1": "WRANGLEDIALOG_147_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	147:											{"content": "WRANGLEDIALOG_140_2_CONTENT",		"choiceList": [148],			"button1": "WRANGLEDIALOG_140_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	148:											{"content": "WRANGLEDIALOG_140_3_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_140_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	149:											{"content": "WRANGLEDIALOG_140_4_CONTENT",		"choiceList": [150],			"button1": "WRANGLEDIALOG_140_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	150:											{"content": "WRANGLEDIALOG_140_5_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_140_5_BUTTON_1", "buttonFunction1": "WrangleDialog_150_Function_1"},
WRANGLEDIALOGTYPEID_QUEEN_INIT:						{"content": "WRANGLEDIALOG_151_CONTENT",		"choiceList": [152, 155],		"button1": "WRANGLEDIALOG_151_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass",					"button2": "WRANGLEDIALOG_151_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
	152:											{"content": "WRANGLEDIALOG_151_1_CONTENT",		"choiceList": [153, 154],		"button1": "WRANGLEDIALOG_151_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass",					"button2": "WRANGLEDIALOG_151_1_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
	153:											{"content": "WRANGLEDIALOG_151_2_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_151_2_BUTTON_1", "buttonFunction1": "WrangleDialog_153_Function_1"},
	154:											{"content": "WRANGLEDIALOG_151_3_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_151_3_BUTTON_1", "buttonFunction1": "WrangleDialog_154_Function_1"},
	155:											{"content": "WRANGLEDIALOG_151_4_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_151_4_BUTTON_1", "buttonFunction1": "WrangleDialog_155_Function_1"},
	156:											{},
	157:											{},
	158:											{},
	159:											{"content": "WRANGLEDIALOG_3_CONTENT",			"choiceList": [0, 0],			"button1": "WRANGLEDIALOG_3_BUTTON_1", "buttonFunction1": "WrangleDialog_159_Function_1",			"button2": "WRANGLEDIALOG_3_BUTTON_2", "buttonFunction2": "WrangleDialog_159_Function_2"},
WRANGLEDIALOGTYPEID_SISTER_1_INIT:					{"content": "WRANGLEDIALOG_160_CONTENT",		"choiceList": [161],			"button1": "WRANGLEDIALOG_160_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	161:											{"content": "WRANGLEDIALOG_160_1_CONTENT",		"choiceList": [162],			"button1": "WRANGLEDIALOG_160_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	162:											{"content": "WRANGLEDIALOG_160_2_CONTENT",		"choiceList": [163],			"button1": "WRANGLEDIALOG_160_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	163:											{"content": "WRANGLEDIALOG_160_3_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_160_3_BUTTON_1", "buttonFunction1": "WrangleDialog_163_Function_1"},
WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS:				{},
	165:											{"content": "WRANGLEDIALOG_165_CONTENT",		"choiceList": [0],				"button1": "WRANGLEDIALOG_165_BUTTON_1", "buttonFunction1": "WrangleDialog_165_Function_1"},
WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS:				{},
WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT:			{"content": "WRANGLEDIALOG_167_CONTENT",		"choiceList": [169]},
WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS:		{},
	169:											{"content": "WRANGLEDIALOG_167_1_CONTENT",		"choiceList": [170],				"button1": "WRANGLEDIALOG_167_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	170:											{"content": "WRANGLEDIALOG_167_2_CONTENT",		"choiceList": [171],				"button1": "WRANGLEDIALOG_167_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	171:											{"content": "WRANGLEDIALOG_167_3_CONTENT",		"choiceList": [172],				"button1": "WRANGLEDIALOG_167_3_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	172:											{"content": "WRANGLEDIALOG_167_4_CONTENT",		"choiceList": [0],					"button1": "WRANGLEDIALOG_167_4_BUTTON_1", "buttonFunction1": "WrangleDialog_169_4_Function_1"},
	173:											{"content": "WRANGLEDIALOG_173_CONTENT",		"choiceList": [0],					"button1": "WRANGLEDIALOG_173_BUTTON_1", "buttonFunction1": "WrangleDialog_173_Function_1"},
	174:											{"content": "WRANGLEDIALOG_174_CONTENT",		"choiceList": [0, 0],				"button1": "WRANGLEDIALOG_174_BUTTON_1", "buttonFunction1": "WrangleDialog_174_Function_1",			"button2": "WRANGLEDIALOG_174_BUTTON_2", "buttonFunction2": "WrangleDialog_Pass"},
WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT:		{"content": "WRANGLEDIALOG_175_CONTENT",		"choiceList": [176],				"button1": "WRANGLEDIALOG_175_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	176:											{"content": "WRANGLEDIALOG_175_1_CONTENT",		"choiceList": [177],				"button1": "WRANGLEDIALOG_175_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	177:											{"content": "WRANGLEDIALOG_175_2_CONTENT",		"choiceList": [178],				"button1": "WRANGLEDIALOG_175_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	178:											{"content": "WRANGLEDIALOG_175_3_CONTENT",		"choiceList": [0],					"button1": "WRANGLEDIALOG_175_3_BUTTON_1", "buttonFunction1": "WrangleDialog_178_Function_1"},
WRANGLEDIALOGTYPEID_MONSTER1_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER2_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER3_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER4_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER5_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER6_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER7_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER8_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER9_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER10_INIT:					{},
WRANGLEDIALOGTYPEID_MONSTER11_INIT:					{"content": "WRANGLEDIALOG_192_CONTENT",		"choiceList": [0],					"button1": "WRANGLEDIALOG_192_BUTTON_1", "buttonFunction1": "WrangleDialog_192_Function_1"},
WRANGLEDIALOGTYPEID_MONSTER12_INIT:					{"content": "WRANGLEDIALOG_194_CONTENT",		"choiceList": [0],					"button1": "WRANGLEDIALOG_194_BUTTON_1", "buttonFunction1": "WrangleDialog_194_Function_1"},
	191:											{"content": "WRANGLEDIALOG_191_CONTENT",		"choiceList": [0],					"button1": "WRANGLEDIALOG_191_BUTTON_1", "buttonFunction1": "WrangleDialog_191_Function_1"},
WRANGLEDIALOGTYPEID_MONSTER1_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER2_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER3_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER4_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER5_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER6_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER7_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER8_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER9_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER10_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER11_SUCCESS:				{},
WRANGLEDIALOGTYPEID_MONSTER12_SUCCESS:				{},
WRANGLEDIALOGTYPEID_SWALLOW_SNAKE1:					{},
WRANGLEDIALOGTYPEID_SWALLOW_DOG1:					{},
WRANGLEDIALOGTYPEID_SWALLOW_PLAYER1:				{},
WRANGLEDIALOGTYPEID_SWALLOW_SILVERCARP1:			{},
WRANGLEDIALOGTYPEID_SWALLOW_SNAKE2:					{},
WRANGLEDIALOGTYPEID_SWALLOW_SNAKE3:					{},
WRANGLEDIALOGTYPEID_SWALLOW_TURTLE1:				{},
WRANGLEDIALOGTYPEID_SWALLOW_DONKEY1:				{},
WRANGLEDIALOGTYPEID_SWALLOW_MONSTER11:				{},
WRANGLEDIALOGTYPEID_SWALLOW_MONSTER12:				{},
WRANGLEDIALOGTYPEID_SWALLOW_QIUYU1:					{},
WRANGLEDIALOGTYPEID_SWALLOW_INVALID:				{},
WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START:		{},
WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START_NO:		{},
WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH:		{},
WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH_NO:	{},
WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS:				{},
WRANGLEDIALOGTYPEID_SISTER_4_INIT:					{"content": "WRANGLEDIALOG_221_CONTENT", 		"choiceList": [222],		"button1": "WRANGLEDIALOG_221_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	222:											{"content": "WRANGLEDIALOG_221_1_CONTENT", 		"choiceList": [226],		"button1": "WRANGLEDIALOG_221_1_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	223:											{"content": "WRANGLEDIALOG_221_2_CONTENT", 		"choiceList": [224],		"button1": "WRANGLEDIALOG_221_2_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	224:											{"content": "WRANGLEDIALOG_221_3_CONTENT", 		"choiceList": [0],			"button1": "WRANGLEDIALOG_221_3_BUTTON_1", "buttonFunction1": "WrangleDialog_224_Function_1"},
	WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS:			{"content": "WRANGLEDIALOG_225_CONTENT", 		"choiceList": [0],			"button1": "WRANGLEDIALOG_225_BUTTON_1", "buttonFunction1": "WrangleDialog_225_Function_1"},
	226:											{"content": "WRANGLEDIALOG_221_4_CONTENT", 		"choiceList": [223],		"button1": "WRANGLEDIALOG_221_4_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
	227:											{"content": "WRANGLEDIALOG_227_CONTENT", 		"choiceList": [0],			"button1": "WRANGLEDIALOG_227_BUTTON_1", "buttonFunction1": "WrangleDialog_227_Function_1"},
WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS:				{"content": "WRANGLEDIALOG_228_CONTENT", 		"choiceList": [0],			"button1": "WRANGLEDIALOG_228_BUTTON_1", "buttonFunction1": "WrangleDialog_228_Function_1"},
WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS:				{},
WRANGLEDIALOGTYPEID_SISTER_FOUND:					{"content": "WRANGLEDIALOG_230_CONTENT",		"choiceList": [0],			"button1": "WRANGLEDIALOG_230_BUTTON_1", "buttonFunction1": "WrangleDialog_Pass"},
}

const INPUT_KEY_LETTER_MAP: Dictionary = {
	"KEY_1": "1",
	"KEY_2": "2",
	"KEY_3": "3",
	"KEY_4": "4",
	"KEY_5": "5",
	"KEY_6": "6",
	"KEY_7": "7",
	"KEY_8": "8",
	"KEY_9": "9",
	"KEY_0": "0",
	"KEY_B": "B",
	"KEY_J": "J",
	"KEY_O": "O",
	"KEY_E": "E",
	"KEY_P": "P",
}

const GOODSTYPEID_FOOT: int = 1
const GOODSTYPEID_TELESCOPE: int = 2
const GOODSTYPEID_WIG_BEGIN: int = 3
const GOODSTYPEID_WIG_1: int = GOODSTYPEID_WIG_BEGIN
const GOODSTYPEID_WIG_2: int = 4
const GOODSTYPEID_WIG_3: int = 5
const GOODSTYPEID_WIG_4: int = 6
const GOODSTYPEID_WIG_5: int = 7
const GOODSTYPEID_WIG_6: int = 8
const GOODSTYPEID_WIG_7: int = 9
const GOODSTYPEID_WIG_8: int = 10
const GOODSTYPEID_WIG_9: int = 11
const GOODSTYPEID_WIG_10: int = 12
const GOODSTYPEID_WIG_11: int = 13
const GOODSTYPEID_WIG_12: int = 14
const GOODSTYPEID_WIG_13: int = 15
const GOODSTYPEID_WIG_14: int = 16
const GOODSTYPEID_WIG_15: int = 17
const GOODSTYPEID_WIG_END: int = GOODSTYPEID_WIG_15
const GOODSTYPEID_BAG: int = 18
const GOODSTYPEID_JOURNALRECORDBOOK: int = 19
const GOODSTYPEID_LETTER3: int = 20
const GOODSTYPEID_HOUSEKEEPERKEY: int = 21
const GOODSTYPEID_BUTLERKEY: int = 22
const GOODSTYPEID_QUEENKEY: int = 23
const GOODSTYPEID_THREEHEADSDRAGON3: int = 24
const GOODSTYPEID_WIG_CHANGING_COLOR: int = 25
const GOODS_MAP: Dictionary = {
# goodsTypeID: goodsInfo
# goodsUseMaxNumber: 0 is no use number limite
GOODSTYPEID_FOOT:					{"goodsName": "GOODS_NAME_1",					"goodsDescription": "GOODS_DESCRIPTION_1",					"goodsIcon": "Skill_SkillFoot",				"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_Foot",				"goodsAddFunction": "GoodsAddFunction_Foot",		"goodsRemoveFunction": "GoodsRemoveFunction_Foot"},
GOODSTYPEID_TELESCOPE:				{"goodsName": "GOODS_NAME_2",					"goodsDescription": "GOODS_DESCRIPTION_2",					"goodsIcon": "Item_Telescope3",				"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_Telescope",			"goodsAddFunction": "GoodsAddFunction_Telescope",	"goodsRemoveFunction": "GoodsRemoveFunction_Telescope"},
GOODSTYPEID_WIG_1:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig2_BLACK3",			"goodsUseMaxNumber": 0,		"equipTypeID": 1,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_2:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig2_RED3",				"goodsUseMaxNumber": 0,		"equipTypeID": 2,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_3:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig2_WHITE3",			"goodsUseMaxNumber": 0,		"equipTypeID": 3,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_4:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig2_YELLOW3",			"goodsUseMaxNumber": 0,		"equipTypeID": 4,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_5:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE",		"goodsUseMaxNumber": 0,		"equipTypeID": 5,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_6:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE2",		"goodsUseMaxNumber": 0,		"equipTypeID": 6,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_7:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE3",		"goodsUseMaxNumber": 0,		"equipTypeID": 7,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_8:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE4",		"goodsUseMaxNumber": 0,		"equipTypeID": 8,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_9:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE5",		"goodsUseMaxNumber": 0,		"equipTypeID": 9,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_10:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE6",		"goodsUseMaxNumber": 0,		"equipTypeID": 10,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_11:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE7",		"goodsUseMaxNumber": 0,		"equipTypeID": 11,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_12:					{"goodsName": "GOODS_NAME_3",					"goodsDescription": "GOODS_DESCRIPTION_3",					"goodsIcon": "Item_Wig_PALE_YELLOW",		"goodsUseMaxNumber": 0,		"equipTypeID": 12,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_13:					{"goodsName": "GOODS_NAME_7",					"goodsDescription": "GOODS_DESCRIPTION_7",					"goodsIcon": "Item_Wig_RED2Long",			"goodsUseMaxNumber": 0,		"equipTypeID": 13,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_14:					{"goodsName": "GOODS_NAME_7",					"goodsDescription": "GOODS_DESCRIPTION_7",					"goodsIcon": "Item_Wig_BLUE2Long",			"goodsUseMaxNumber": 0,		"equipTypeID": 14,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_15:					{"goodsName": "GOODS_NAME_7",					"goodsDescription": "GOODS_DESCRIPTION_7",					"goodsIcon": "Item_Wig_YELLOW2Long",			"goodsUseMaxNumber": 0,		"equipTypeID": 15,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_BAG:					{"goodsName": "NAME_AVATAR_30",					"goodsDescription": "GOODS_DESCRIPTION_11",					"goodsIcon": "Scene_Bag",					"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "",										"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_JOURNALRECORDBOOK:		{"goodsName": "NAME_AVATAR_31",					"goodsDescription": "GOODS_DESCRIPTION_12",					"goodsIcon": "Scene_JournalRecordBook",		"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "",										"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_LETTER3:				{"goodsName": "NAME_AVATAR_32",					"goodsDescription": "GOODS_DESCRIPTION_13",					"goodsIcon": "Scene_Letter3",				"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_Letter3",				"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_HOUSEKEEPERKEY:			{"goodsName": "GOODS_NAME_HOUSEKEEPERKEY",		"goodsDescription": "GOODS_DESCRIPTION_HOUSEKEEPERKEY",		"goodsIcon": "DoorKey1_2",					"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_HousekeeperKey",		"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_BUTLERKEY:				{"goodsName": "GOODS_NAME_BUTLERKEY",			"goodsDescription": "GOODS_DESCRIPTION_BUTLERKEY",			"goodsIcon": "DoorKey2_2",					"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_ButlerKey",			"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_QUEENKEY:				{"goodsName": "GOODS_NAME_QUEENKEY",			"goodsDescription": "GOODS_DESCRIPTION_QUEENKEY",			"goodsIcon": "QueenKey2",					"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_QueenKey",			"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_THREEHEADSDRAGON3:		{"goodsName": "NAME_AVATAR_34",					"goodsDescription": "GOODS_DESCRIPTION_17",					"goodsIcon": "Scene_ThreeHeadsDragon3",		"goodsUseMaxNumber": 0,		"equipTypeID": 0,	"goodsUseFunction": "GoodsUseFunction_ThreeHeadsDragon3",	"goodsAddFunction": "",								"goodsRemoveFunction": ""},
GOODSTYPEID_WIG_CHANGING_COLOR:		{"goodsName": "GOODS_NAME_11",					"goodsDescription": "GOODS_DESCRIPTION_18",					"goodsIcon": "Item_Wig_CHANGING_COLOR",		"goodsUseMaxNumber": 0,		"equipTypeID": 16,	"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",			"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
}

func _ready():
	var languageName: String = LANGUAGE_NAME_ENGLISH
	var saveLanguageName: String = SaveGameManager.GetSaveData_option_languageName()
	var isFirstTimeSaveGameData: bool = SaveGameManager.GetIsFirstTimeSaveGameData()
	if isFirstTimeSaveGameData:
		saveLanguageName = GetLanguageNameByLocale()
	
	if IsHasLanguage(saveLanguageName):
		languageName = saveLanguageName
	else:
		HQH.AssertLog("Not has saveLanguageName: %s" % saveLanguageName)
	
	SetLanguage(languageName, true)
	
	LoadTable("EquipTable1", EQUIPTABLE1_DATA_INFO, m_EquipTable1_Data, EQUIPTABLE1_DATA_KEYINDEX)
	
	HQH.SetWindowTitle()
	
	CheckWrangleDialogMap()

func PrintTable(tableData: Dictionary):
	var tableData_size: int = tableData.size()
	HQH.Log("tableData_size: %s" % tableData_size)
	for k in tableData:
		HQH.Log("%s: %s" % [k, tableData[k]])

func TableGetLineValue(tableData: Dictionary, keyString: String) -> Dictionary:
	var lineValue = {}
	if tableData.has(keyString):
		lineValue = tableData.get(keyString)
	
	return lineValue

func TableGetValue(tableData: Dictionary, keyString: String, columnName: String) -> String:
	var valueString = ""
	var lineValue: Dictionary = TableGetLineValue(tableData, keyString)
	if lineValue:
		if lineValue.has(columnName):
			valueString = lineValue.get(columnName)
	
	return valueString

func LoadTable(fileName: String, tableDataInfo: Dictionary, tableData: Dictionary, keyIndex: int):
	var filePath: String = "res://Table/%s.csv" % fileName
	var fileHandle = File.new()
	if not fileHandle.file_exists(filePath):
		HQH.AssertLog("LoadTable, NOT EXIST FILE: %s " % filePath)
		
		return
	
	var openFileResult = fileHandle.open(filePath, File.READ)
	if OK != openFileResult:
		HQH.AssertLog("LoadTable, FAILED OPEN FILE: %s " % filePath)
		
		fileHandle.close()
		
		return
	
	# 跳过第一行
	fileHandle.get_csv_line()
	
	while not fileHandle.eof_reached():
		var fileline: PoolStringArray = fileHandle.get_csv_line()
#		HQH.Log("filePath: %s, fileline.size(): %d, fileline: %s" % [filePath, fileline.size(), fileline])
		if 1 < fileline.size():
			var dataTemp: Dictionary = {}
			var index: int = 0
			for k in tableDataInfo:
				dataTemp[k] = fileline[index]
				index = index + 1
			
			if HQH.IS_DEBUG:
				if tableData.has(fileline[keyIndex]):
					HQH.AssertLog("Has same key, file name: %s, string key: %s" % [fileName, fileline[keyIndex]])
			
			tableData[fileline[keyIndex]] = dataTemp
	
	fileHandle.close()

func PrintDictionaryTable_EquipTable1():
	HQH.Log("EquipTable1:")
	PrintTable(m_EquipTable1_Data)

func TableGetValue_EquipTable1_Base(keyString: String, keyIndex: int) -> String:
	var columnName: String = EQUIPTABLE1_DATA_INFO.keys()[keyIndex]
	var valueString = TableGetValue(m_EquipTable1_Data, keyString, columnName)
	
	return valueString

func TableGetValue_EquipTable1(keyString: String, keyIndex: int, handleType: int) -> String:
	var valueString = TableGetValue_EquipTable1_Base(keyString, keyIndex)
	match handleType:
		TABLEGETVALUE_HANDLE_TYPE.NONE:
			pass
		
		TABLEGETVALUE_HANDLE_TYPE.HANDLE_LANGUAGE_STRING:
			var subStringMap: Dictionary = GetSubStringMapFromDictionaryTablePlaceHolderString(valueString)
			valueString = subStringMap.values()[0]
		
		TABLEGETVALUE_HANDLE_TYPE.HANDLE_COLORPALETTE_EQUIP:
			var color: Color = HQH.COLORPALETTE_EQUIP.get(valueString)
			valueString = color.to_html()
		
		TABLEGETVALUE_HANDLE_TYPE.HANDLE_FILEPATH:
			pass
	
	return valueString

func TableGetValue_EquipTable1_ColorString(keyString: String) -> String:
	var colorString: String = TableManager.TableGetValue_EquipTable1(keyString, TableManager.EQUIPTABLE1_DATA_INDEX_COLOR, TableManager.TABLEGETVALUE_HANDLE_TYPE.HANDLE_COLORPALETTE_EQUIP)
	
	return colorString

func TableGetValue_EquipTable1_PreloadResourcePath(keyString: String) -> String:
	var preloadResourcePath: String = TableManager.TableGetValue_EquipTable1(keyString, TableManager.EQUIPTABLE1_DATA_INDEX_FILENAME, TableManager.TABLEGETVALUE_HANDLE_TYPE.HANDLE_FILEPATH)
	
	return preloadResourcePath

func TableGetValue_EquipTable1_IsHasKey(keyString: String) -> bool:
	return m_EquipTable1_Data.has(keyString)

func PrintDictionaryTable(tableData: Dictionary):
	for k in tableData:
		HQH.Log("%s: %s" % [k, tableData[k]])

func DictionaryTableGetValue(tableData: Dictionary, keyString: String) -> String:
	var valueString = tableData.get(keyString)
	if not valueString:
		valueString = ""
	
	return valueString

func LoadDictionaryTable(fileName: String, tableData: Dictionary):
	var filePath: String = "res://Table/%s.csv" % fileName
	var fileHandle = File.new()
	if not fileHandle.file_exists(filePath):
		HQH.AssertLog("LoadDictionaryTable, NOT EXIST FILE: %s " % filePath)
		
		return
	
	var openFileResult = fileHandle.open(filePath, File.READ)
	if OK != openFileResult:
		HQH.AssertLog("LoadDictionaryTable, FAILED OPEN FILE: %s " % filePath)
		
		fileHandle.close()
		
		return
	
	# 跳过第一行
	fileHandle.get_csv_line()
	
	var placeHolderMap: Dictionary = {}
	
#	var fileLineNumber: int = 1
	while not fileHandle.eof_reached():
		var fileline: PoolStringArray = fileHandle.get_csv_line()
#		HQH.Log("filePath: %s[%d], fileline.size(): %d, fileline: %s" % [filePath, fileLineNumber, fileline.size(), fileline])
		if 2 != fileline.size():
#			HQH.Log("JUMP ONE FILE LINE, filePath: %s[%d], fileline.size(): %d, fileline: %s" % [filePath, fileLineNumber, fileline.size(), fileline])
			
			break
		
		if HQH.IS_DEBUG:
			if CHARACTER_SPACE in fileline[0]:
				HQH.AssertLog("Key Has CHARACTER_SPACE, file name: %s, string key: %s" % [fileName, fileline[0]])
			
			if tableData.has(fileline[0]):
				HQH.AssertLog("Has same key, file name: %s, string key: %s" % [fileName, fileline[0]])
		
		if DISPLAYED_LINE_BREAK in fileline[1]:
			# Deal \n
			tableData[fileline[0]] = fileline[1].replace(DISPLAYED_LINE_BREAK, LINE_BREAK)
		else:
			tableData[fileline[0]] = fileline[1]
		
#		fileLineNumber = fileLineNumber + 1
		
		if IsHas_DICTIONARYTABLE_PLACEHOLDER(fileline[1]):
			placeHolderMap[fileline[0]] = tableData[fileline[0]]
	
	fileHandle.close()
	
	# Deal placeHolderMap
	for k in placeHolderMap:
#		HQH.Log("placeHolderMap, k: %s, placeHolderMap[k]: %s" % [k, placeHolderMap[k]])
		var subStringMap: Dictionary = GetSubStringMapFromDictionaryTablePlaceHolderString(placeHolderMap[k])
		var layDownString: String = GetLanguageString(k).format(subStringMap)
#		HQH.Log("layDownString: %s" % [layDownString])
		tableData[k] = layDownString
 
func IsHas_LOCALE_LANGUAGE_MAP(localeName: String) -> bool:
	return LOCALE_LANGUAGE_MAP.has(localeName)

func GetLanguageName_From_LOCALE_LANGUAGE_MAP(localeName: String) -> String:
	var languageName: String = LANGUAGE_NAME_ENGLISH
	if IsHas_LOCALE_LANGUAGE_MAP(localeName):
		languageName = LOCALE_LANGUAGE_MAP.get(localeName)
	else:
		HQH.AssertLog("GetLanguageName_From_LOCALE_LANGUAGE_MAP, Invalid localeName: %s" % localeName)
	
	return languageName

func GetLanguageNameByLocale() -> String:
	return GetLanguageName_From_LOCALE_LANGUAGE_MAP(OS.get_locale())

func SetLanguage(languageName: String, isNeeSaveGame: bool):
	if IsHasLanguage(languageName) and (languageName != m_CurrentLanguageName):
		ClearCurrentLanguageTableData()
		
		m_CurrentLanguageName = languageName
		HQH.Log("Set Current Language: %s" % m_CurrentLanguageName)
		
		LoadCurrentLanguageTable()
		
		if isNeeSaveGame:
			SaveGameManager.SetSaveData_option_languageName(m_CurrentLanguageName)

func ClearCurrentLanguageTableData():
	if not IsHasLanguage(m_CurrentLanguageName):
		return
	
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	languageDataInfo.languageTableData.clear()

func IsHasLanguage(languageName: String) -> bool:
	return m_LanguageTableMap.has(languageName)

func GetLanguageDataInfo(languageName: String) -> Dictionary:
	var languageDataInfo: Dictionary = {}
	if IsHasLanguage(languageName):
		languageDataInfo = m_LanguageTableMap.get(languageName)
	else:
		HQH.AssertLog("GetLanguageDataInfo, Invalid languageName: %s" % languageName)
	
	return languageDataInfo

func GetAllLanguageName() -> Array:
	return m_LanguageTableMap.keys()

func LoadCurrentLanguageTable():
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	for iv in languageDataInfo.languageTableNameList:
		LoadDictionaryTable(iv, languageDataInfo.languageTableData)

func PrintCurrentLanguageTable():
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	PrintDictionaryTable(languageDataInfo.languageTableData)

func GetCurrentLanguageName() -> String:
	return m_CurrentLanguageName

func IsHasLanguageString(stringKey: String) -> bool:
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	var isHas = languageDataInfo.languageTableData.has(stringKey)
	
	return isHas

func GetLanguageString(stringKey: String) -> String:
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	var stringValue: String = DictionaryTableGetValue(languageDataInfo.languageTableData, stringKey)
	
	return stringValue

func IsHas_DICTIONARYTABLE_PLACEHOLDER(filelineString: String) -> bool:
	return DICTIONARYTABLE_PLACEHOLDER_BEGIN in filelineString

func GetSubStringMapFromDictionaryTablePlaceHolderString(placeHolderString: String) -> Dictionary:
	var subStringFrom: int = 0
	var placeHolderLength: int = placeHolderString.length()
	var subStringMap: Dictionary = {}
	while true:
		var subStringBegin: int = placeHolderString.find(DICTIONARYTABLE_PLACEHOLDER_BEGIN, subStringFrom)
		if 0 > subStringBegin:
			break
		
		var subStringEnd: int = placeHolderString.find(DICTIONARYTABLE_PLACEHOLDER_END, subStringFrom)
		if 0 > subStringEnd:
			break
		
		var subStringBeginLengthIndex: int = subStringBegin + DICTIONARYTABLE_PLACEHOLDER_BEGIN_LENGTH
		var subString: String = placeHolderString.substr(subStringBeginLengthIndex, subStringEnd - subStringBeginLengthIndex)
#		HQH.Log("subString: %s" % [subString])
		subStringMap[subString] = GetLanguageString(subString)
		
		subStringFrom = subStringEnd + DICTIONARYTABLE_PLACEHOLDER_END_LENGTH
		if placeHolderLength <= (subStringFrom + (DICTIONARYTABLE_PLACEHOLDER_BEGIN_LENGTH + DICTIONARYTABLE_PLACEHOLDER_END_LENGTH)):
			break
	
	return subStringMap

func IsHas_PRELOAD_RESOURCE_MAP(keyString:String) -> bool:
	return PRELOAD_RESOURCE_MAP.has(keyString)

func Get_PRELOAD_RESOURCE_MAP(keyString:String) -> Resource:
	var preloadResource: Resource = null
	if IsHas_PRELOAD_RESOURCE_MAP(keyString):
		preloadResource = PRELOAD_RESOURCE_MAP.get(keyString)
	else:
		HQH.AssertLog("Get_PRELOAD_RESOURCE_MAP, Invalid keyString: %s" % keyString)
	
	return preloadResource

func GetKeysSize_AUDIO_INFO_LIST_keys() -> int:
	return AUDIO_INFO_LIST.keys().size()

func GetNameByIndex_AUDIO_INFO_LIST_keys(index: int) -> String:
	var keysSize: int = GetKeysSize_AUDIO_INFO_LIST_keys()
	if (0 <= index) and (keysSize > index):
		return AUDIO_INFO_LIST.keys()[index]
	
	HQH.AssertLog("index: %s is out of range AUDIO_INFO_LIST.keys().size(): %s" % [index, keysSize])
	
	return ""

func IsHas_AUDIO_INFO_LIST(audioName: String) -> bool:
	return AUDIO_INFO_LIST.has(audioName)

func GetInfoByName_AUDIO_INFO_LIST(audioName: String) -> Dictionary:
	var audioInfo: Dictionary = {}
	if IsHas_AUDIO_INFO_LIST(audioName):
		audioInfo = AUDIO_INFO_LIST.get(audioName)
	else:
		HQH.AssertLog("GetInfoByName_AUDIO_INFO_LIST, Invalid audioName: %s" % audioName)
	
	return audioInfo

func IsHasSceneInfo(sceneTypeID: int) -> bool:
	return SCENE_INFO_MAP.has(sceneTypeID)

func GetSceneInfo(sceneTypeID: int) -> Dictionary:
	var sceneInfo: Dictionary = {}
	if IsHasSceneInfo(sceneTypeID):
		sceneInfo = SCENE_INFO_MAP.get(sceneTypeID)
	else:
		HQH.AssertLog("GetSceneInfo, Invalid sceneTypeID: %s" % sceneTypeID)
	
	return sceneInfo

func GetSceneName(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).sceneName

func GetSceneTypeID(sceneName: String) -> int:
	var sceneTypeID: int = 0
	for k in SCENE_INFO_MAP:
		if sceneName == SCENE_INFO_MAP[k].sceneName:
			sceneTypeID = k
			
			break
	
	return sceneTypeID

func GetNode2DAvatarName(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).node2DAvatarName

func GetNode2DNPCName(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).node2DNPCName

func GetBGMusicName(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).BGMusicName

func GetSceneShowNameKey(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).showNameKey

func IsHasAvatarType(avatarTypeID: int) -> bool:
	return AVATAR_TYPE_MAP.has(avatarTypeID)

func GetAvatarTypeInfo(avatarTypeID: int) -> Dictionary:
	var avatarTypeInfo: Dictionary = {}
	if IsHasAvatarType(avatarTypeID):
		avatarTypeInfo = AVATAR_TYPE_MAP.get(avatarTypeID)
	else:
		HQH.AssertLog("GetAvatarTypeInfo, Invalid avatarTypeID: %s" % avatarTypeID)
	
	return avatarTypeInfo

func GetAvatarTypeMapSize() -> int:
	return AVATAR_TYPE_MAP.size()

func GetAvatarTypeMap() -> Dictionary:
	return AVATAR_TYPE_MAP

func IsHasNPCTrigger(nPCTriggerTypeID: int) -> bool:
	return NPCTRIGGER_MAP.has(nPCTriggerTypeID)

func GetNPCTriggerInfo(nPCTriggerTypeID: int) -> Dictionary:
	var nPCTriggerInfo: Dictionary = {}
	if IsHasNPCTrigger(nPCTriggerTypeID):
		nPCTriggerInfo = NPCTRIGGER_MAP.get(nPCTriggerTypeID)
	else:
		HQH.AssertLog("GetNPCTriggerInfo, Invalid nPCTriggerTypeID: %s" % nPCTriggerTypeID)
	
	return nPCTriggerInfo

func GetNPCTriggerInfoByWrangleDialogTypeID(wrangleDialogTypeID: int) -> Dictionary:
	var nPCTriggerInfo: Dictionary = {}
	for k in NPCTRIGGER_MAP:
		if wrangleDialogTypeID == NPCTRIGGER_MAP[k].wrangleDialogTypeID:
			nPCTriggerInfo = NPCTRIGGER_MAP[k]
			
			break
	
	return nPCTriggerInfo

func GetNPCTriggerTypeIDByAvatarTypeID(avatarTypeID: int) -> int:
	var nPCTriggerTypeID: int = 0
	for k in NPCTRIGGER_MAP:
		if avatarTypeID == NPCTRIGGER_MAP[k].avatarTypeID:
			nPCTriggerTypeID = k
			
			break
	
	return nPCTriggerTypeID

func IsHasNPCArticleTrigger(nPCArticleTriggerTypeID: int) -> bool:
	return NPCARTICLETRIGGER_MAP.has(nPCArticleTriggerTypeID)

func GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID: int) -> Dictionary:
	var nPCArticleTriggerInfo: Dictionary = {}
	if IsHasNPCArticleTrigger(nPCArticleTriggerTypeID):
		nPCArticleTriggerInfo = NPCARTICLETRIGGER_MAP.get(nPCArticleTriggerTypeID)
	else:
		HQH.AssertLog("GetNPCArticleTriggerInfo, Invalid nPCArticleTriggerTypeID: %s" % nPCArticleTriggerTypeID)
	
	return nPCArticleTriggerInfo

func GetNPCArticleTriggerInfoShowNameKey(nPCArticleTriggerTypeID: int) -> String:
	return GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID).showNameKey

func GetNPCArticleTriggerInfoNoteType(nPCArticleTriggerTypeID: int) -> int:
	return GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID).noteType

func GetNPCArticleTriggerInfoByWrangleDialogTypeID(wrangleDialogTypeID: int) -> Dictionary:
	var nPCArticleTriggerInfo: Dictionary = {}
	for k in NPCARTICLETRIGGER_MAP:
		if wrangleDialogTypeID == NPCARTICLETRIGGER_MAP[k].wrangleDialogTypeID:
			nPCArticleTriggerInfo = NPCARTICLETRIGGER_MAP[k]
			
			break
	
	return nPCArticleTriggerInfo

func IsHasWrangleDialog(wrangleDialogTypeID: int) -> bool:
	return WRANGLEDIALOG_MAP.has(wrangleDialogTypeID)

func GetWrangleDialogInfo(wrangleDialogTypeID: int) -> Dictionary:
	var wrangleDialogInfo: Dictionary = {}
	if IsHasWrangleDialog(wrangleDialogTypeID):
		wrangleDialogInfo = WRANGLEDIALOG_MAP.get(wrangleDialogTypeID)
	else:
		HQH.AssertLog("GetWrangleDialogInfo, Invalid wrangleDialogTypeID: %s" % wrangleDialogTypeID)
	
	return wrangleDialogInfo

func CheckWrangleDialogMap():
	if HQH.IS_DEBUG:
		for k in WRANGLEDIALOG_MAP:
			var buttonNumber: int = 0
			var buttonFunctionNumber: int = 0
			var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(k)
			if not wrangleDialogInfo.empty():
				var choiceListNumber: int = wrangleDialogInfo.choiceList.size()
				for i in UIManager.WRANGLEDIALOG_NUMBER_MAX:
					var button: String = "button%s" % (i + 1)
					if wrangleDialogInfo.has(button):
						buttonNumber += 1
				
				for i in UIManager.WRANGLEDIALOG_NUMBER_MAX:
					var buttonFunction: String = "buttonFunction%s" % (i + 1)
					if wrangleDialogInfo.has(buttonFunction):
						buttonFunctionNumber += 1
				
				if buttonNumber != buttonFunctionNumber:
					HQH.AssertLog("CheckWrangleDialogMap, wrangleDialogTypeID: %s, buttonNumber: %s != buttonFunctionNumber: %s" % [k, buttonNumber, buttonFunctionNumber])
				
				if 0 == buttonNumber:
					if 1 < choiceListNumber:
						HQH.AssertLog("CheckWrangleDialogMap, wrangleDialogTypeID: %s, 0 == buttonNumber, 1 < choiceListNumber: %s" % [k, choiceListNumber])
				else:
					if buttonNumber != choiceListNumber:
						HQH.AssertLog("CheckWrangleDialogMap, wrangleDialogTypeID: %s, buttonNumber: %s != choiceListNumber: %s" % [k, buttonNumber, choiceListNumber])

func GetWrangleDialogInfoButton(wrangleDialogTypeID: int, index: int) -> String:
	var wrangleDialogInfo_button: String = ""
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if (0 <= index) and (UIManager.WRANGLEDIALOG_NUMBER_MAX > index):
		var button: String = "button%s" % (index + 1)
		if wrangleDialogInfo.has(button):
			wrangleDialogInfo_button = wrangleDialogInfo[button]
	
	return wrangleDialogInfo_button

func GetWrangleDialogInfoButtonString(wrangleDialogTypeID: int, index: int) -> String:
	var wrangleDialogInfo_buttonString: String = ""
	var wrangleDialogInfo_button: String = GetWrangleDialogInfoButton(wrangleDialogTypeID, index)
	if not wrangleDialogInfo_button.empty():
		wrangleDialogInfo_buttonString = GetLanguageString(wrangleDialogInfo_button)
	
	return wrangleDialogInfo_buttonString

func GetWrangleDialogInfoButtonFunction(wrangleDialogTypeID: int, index: int) -> String:
	var wrangleDialogInfo_buttonFunction: String = ""
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if (0 <= index) and (UIManager.WRANGLEDIALOG_NUMBER_MAX > index):
		var buttonFunction: String = "buttonFunction%s" % (index + 1)
		if wrangleDialogInfo.has(buttonFunction):
			wrangleDialogInfo_buttonFunction = wrangleDialogInfo[buttonFunction]
	
	return wrangleDialogInfo_buttonFunction

func GetWrangleDialogInfoChoiceWrangleDialogTypeID(wrangleDialogTypeID: int, index: int) -> int:
	var choiceWrangleDialogTypeID: int = 0
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if (0 <= index) and (UIManager.WRANGLEDIALOG_NUMBER_MAX > index) and (wrangleDialogInfo.choiceList.size() > index):
		choiceWrangleDialogTypeID = wrangleDialogInfo.choiceList[index]
	
	return choiceWrangleDialogTypeID

func GetWrangleDialogInfoIsSaveChoice(wrangleDialogTypeID: int) -> bool:
	var isSaveChoice: bool = false
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if wrangleDialogInfo.has("isSaveChoice"):
		isSaveChoice = wrangleDialogInfo.isSaveChoice
	
	return isSaveChoice

func GetAvatarHeadPortraitResourceName(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).headPortraitResource

func GetAvatarHeadIconResourceName(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).headIconResource

func GetAvatarShowName(avatarTypeID: int) -> String:
	return GetLanguageString(GetAvatarShowNameKey(avatarTypeID))

func GetAvatarShowNameKey(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).showNameKey

func GetAvatarFlagColor(avatarTypeID: int) -> Color:
	return GetAvatarTypeInfo(avatarTypeID).flagColor

func GetAvatarDescription(avatarTypeID: int) -> String:
	return GetLanguageString(GetAvatarTypeInfo(avatarTypeID).avatarDescription)

func GetAvatarClickAudioResource(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).clickAudioResource

func GetAvatarPowerMin(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).powerMin

func GetAvatarPowerMax(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).powerMax

func GetAvatarCheckConditionFunction(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).checkConditionFunction

func GetAvatarConditionFalsePowerMin(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).conditionFalsePowerMin

func GetAvatarConditionFalsePowerMax(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).conditionFalsePowerMax
	
func GetAvatarIsSameAsAvatarPower(avatarTypeID: int) -> bool:
	return GetAvatarTypeInfo(avatarTypeID).isSameAsAvatarPower

func GetAvatarPlayChessStartWordsKey(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).playChessStartWordsKey

func GetAvatarPlayChessSuccessFunction(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).playChessSuccessFunction

func GetAvatarPlayChessFailureFunction(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).playChessFailureFunction

func GetAvatarWrangleDialogTypeID_Swallow(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).wrangleDialogTypeID_Swallow

func IsHasGoods(goodsTypeID: int) -> bool:
	return GOODS_MAP.has(goodsTypeID)

func GetGoodsInfo(goodsTypeID: int) -> Dictionary:
	var goodsInfo = {}
	if IsHasGoods(goodsTypeID):
		goodsInfo = GOODS_MAP.get(goodsTypeID)
	else:
		HQH.AssertLog("GetGoodsInfo, Invalid goodsTypeID: %s" % goodsTypeID)
	
	return goodsInfo

func GetGoodsInfoGoodsName(goodsTypeID: int) -> String:
	return GetGoodsInfo(goodsTypeID).goodsName

func GetGoodsInfoByEquipTypeID(equipTypeID: int) -> Dictionary:
	var goodsInfo = {}
	for k in GOODS_MAP:
		if equipTypeID == GOODS_MAP.get(k).equipTypeID:
			goodsInfo = GOODS_MAP.get(k)
			
			break
	
	return goodsInfo

# AffixKey number range [AFFIXKEYCOUNT_MIN, AFFIXKEYCOUNT_MAX)
const AFFIXKEYCOUNT_MIN: int = 1
const AFFIXKEYCOUNT_MAX: int = 100
func GetAffixKeyCount(affixKey: String) -> int:
	var affixKeyCount: int = 0
	for i in range(AFFIXKEYCOUNT_MIN, AFFIXKEYCOUNT_MAX):
		var stringKey: String = "%s%s" % [affixKey, i]
		var isHas: bool = IsHasLanguageString(stringKey)
		if isHas:
			affixKeyCount += 1
		else:
			# AffixKey must continuous
			break
	
	if HQH.IS_DEBUG:
		if 0 == affixKeyCount:
			HQH.AssertLog("GetAffixKeyCount, 0 == affixKeyCount, affixKey: %s" % affixKey)
	
	return affixKeyCount

func GetAffixKeyRandom(affixKey: String) -> String:
	var affixKeyCount: int = GetAffixKeyCount(affixKey)
	var affixKeyNumber: int = HQH.RandomModRange(1, affixKeyCount)
	
	return "%s%s" % [affixKey, affixKeyNumber]

func GetAffixKeyRandomString(affixKey: String) -> String:
	var affixKeyRandom: String = GetAffixKeyRandom(affixKey)
	
	return GetLanguageString(affixKeyRandom)

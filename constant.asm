; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; Equates section - Names for variables.
; ---------------------------------------------------------------------------
; size variables - you'll get an informational error if you need to change these...
; they are all in units of bytes
Size_of_DAC_samples =		$2F00
Size_of_SEGA_sound =		$6174
Size_of_Snd_driver_guess =	$F64 ; approximate post-compressed size of the Z80 sound driver
 
; ---------------------------------------------------------------------------
; Object Status Table offsets (for everything between Object_RAM and Primary_Collision)
; ---------------------------------------------------------------------------
render_flags =		  1 ; bitfield ; bit 7 = onscreen flag, bit 0 = x mirror, bit 1 = y mirror, bit 2 = coordinate system
art_tile =		  2 ; and 3 ; start of sprite's art
mappings =		  4 ; and 5 and 6 and 7
x_pos =			  8 ; and 9 ... some objects use $A and $B as well when extra precision is r=ired (see ObjectMove) ... for screen-space objects this is called x_pixel instead
y_pos =			 $C ; and $D ... some objects use $E and $F as well when extra precision is r=ired ... screen-space objects use y_pixel instead
priority =		$18 ; 0 = front
width_pixels =		$19
mapping_frame =		$1A
height_pixels =		$1F ; byte
; ---------------------------------------------------------------------------
; conventions followed by most objects:
x_vel  = 			$10 ; and $11 ; horizontal velocity
y_vel  = 			$12 ; and $13 ; vertical velocity
y_radius  = 		$16 ; collision width / 2
x_radius  = 		$17 ; collision height / 2
anim_frame  = 		$1B
anim  = 			$1C
next_anim  = 		$1D
anim_frame_duration  = 	$1E
status  = 		$22 ; note: exact meaning depends on the object... for sonic/tails: bit 0: leftfacing. bit 1: inair. bit 2: spinning. bit 3: onobject. bit 4: rolljumping. bit 5: pushing. bit 6: underwater.
routine  = 		$24
routine_secondary  = 	$25
angle  = 			$26 ; angle about the z = 0 axis (360 degrees  =  256)
; ---------------------------------------------------------------------------
; conventions followed by many objects but NOT sonic/tails:
collision_flags  = 	$20
collision_property  = 	$21
respawn_index  = 		$23
subtype  = 		$28
; ---------------------------------------------------------------------------
; conventions specific to sonic/tails (Obj01, Obj02, and ObjDB):
; note: $1F, $20, and $21 are unused and available
inertia  = 		$14 ; and $15 ; directionless representation of speed... not updated in the air
flip_angle  = 		$27 ; angle about the x = 0 axis (360 degrees  =  256) (twist/tumble)
air_left  = 		$28
flip_turned  = 		$29 ; 0 for normal, 1 to invert flipping (it's a 180 degree rotation about the axis of Sonic's spine, so he stays in the same position but looks turned around)
obj_control  = 		$2A ; 0 for normal, 1 for hanging or for resting on a flipper, $81 for going through CNZ/OOZ/MTZ tubes or stopped in CNZ cages or stoppers or flying if Tails
status_secondary  = 	$2B
flips_remaining  = 	$2C ; number of flip revolutions remaining
flip_speed  = 		$2D ; number of flip revolutions per frame / 256
move_lock  = 		$2E ; and $2F ; horizontal control lock, counts down to 0
invulnerable_time  = 	$30 ; and $31 ; time remaining until you stop blinking
invincibility_time  = 	$32 ; and $33 ; remaining
speedshoes_time  = 	$34 ; and $35 ; remaining
next_tilt  = 		$36 ; angle on ground in front of sprite
tilt  = 			$37 ; angle on ground
stick_to_convex  = 	$38 ; 0 for normal, 1 to make Sonic stick to convex surfaces like the rotating discs in Sonic 1 and 3 (unused in Sonic 2 but fully functional)
spindash_flag  = 		$39 ; 0 for normal, 1 for charging a spindash or forced rolling
spindash_counter  = 	$3A ; and $3B
jumping  = 		$3C
interact  = 		$3D ; RAM address of the last object Sonic stood on, minus $FFFFB000 and divided by $40
layer  = 			$3E ; collision plane, track switching...
layer_plus  = 		$3F ; always same as layer+1 ?? used for collision somehow

; ---------------------------------------------------------------------------
; conventions followed by several objects but NOT sonic/tails:
y_pixel  = 		2+x_pos ; and 3+x_pos ; y coordinate for objects using screen-space coordinate system
x_pixel  = 		x_pos ; and 1+x_pos ; x coordinate for objects using screen-space coordinate system
parent  = 		$3E ; and $3F ; address of object that owns or spawned this one, if applicable
; ---------------------------------------------------------------------------
; unknown or inconsistently used offsets that are not applicable to sonic/tails:
; (provided because rearrangement of the above values sometimes r = ires making space in here too)
objoff_A  = 		2+x_pos ; note: x_pos can be 4 bytes, but sometimes the last 2 bytes of x_pos are used for other unrelated things
objoff_B  = 		3+x_pos
objoff_E  = 		2+y_pos
objoff_F  = 		3+y_pos
objoff_14  = 		$14
objoff_15  = 		$15
objoff_1F  = 		$1F
objoff_27  = 		$27
objoff_28  = 		$28 ; overlaps subtype, but a few objects use it for other things anyway
objoff_29  =  $29
objoff_2A  =  $2A
objoff_2B = $2B
objoff_2C = $2C
objoff_2D = $2D
objoff_2E = $2E
objoff_2F = $2F
objoff_30 = $30
objoff_31 = $31
objoff_32 = $32
objoff_33 = $33
objoff_34 = $34
objoff_35 = $35
objoff_36 = $36
objoff_37 = $37
objoff_38 = $38
objoff_39 = $39
objoff_3A = $3A
objoff_3B = $3B
objoff_3C = $3C
objoff_3D = $3D
objoff_3E = $3E
objoff_3F = $3F

; ---------------------------------------------------------------------------
; property of all objects:
next_object  = 		$40 ; the size of an object

; ---------------------------------------------------------------------------

; ---------------------------------------------------------------------------
; RAM variables
RAM_Start  = 			$FFFF0000
Metablock_Table  = 		$FFFF0000
Block_Table  = 			$FFFF9000
Decomp_Buffer  = 			$FFFFAA00
Sprite_Table_Input  =  		$FFFFAC00 ; in custom format before being converted and stored in Sprite_Table/Sprite_Table_2
Object_RAM  = 			$FFFFB000 ; through $FFFFD5FF
MainCharacter  = 			$FFFFB000 ; first object (usually Sonic except in a Tails Alone game)
Sidekick  = 			$FFFFB040 ; second object (Tails in a Sonic and Tails game)
Tails_Tails  = 			$FFFFD000 ; address of the Tail's Tails object
Sonic_Dust  = 			$FFFFD100
Tails_Dust  = 			$FFFFD140

PNT_Buffer  = 			$FFFFD000 ; in special stage
Primary_Collision  = 		$FFFFD600
Horiz_Scroll_Buf_2  = 		$FFFFD700 ; in special stage
Secondary_Collision  = 		$FFFFD900
VDP_Command_Buffer  = 		$FFFFDC00 ; stores VDP commands to issue the next time ProcessDMAQueue is called
VDP_Reg0_Val        =       $FFFFF60C ; 
VDP_Command_Buffer_Slot  = 	$FFFFDCFC ; stores the address of the next open slot for a queued VDP command
Sprite_Table_2  = 		$FFFFDD00 ; Sprite attribute table buffer for the bottom split screen in 2-player mode
Horiz_Scroll_Buf  = 		$FFFFE000
Sonic_Stat_Record_Buf  = 		$FFFFE400
Sonic_Pos_Record_Buf  = 		$FFFFE500
Tails_Pos_Record_Buf  = 		$FFFFE600
Ring_Positions  = 		$FFFFE800
Camera_RAM  = 			$FFFFEE00
Camera_X_pos  = 			$FFFFEE00
Camera_Y_pos  = 			$FFFFEE04
Camera_target_min_X_pos =	 $FFFFEE0C
Camera_target_max_X_pos =	 $FFFFEE0E
Camera_target_min_Y_pos =	 $FFFFEE10
Camera_target_max_Y_pos =	 $FFFFEE12
Camera_X_pos_copy =			$FFFFEE14
Camera_Y_pos_copy =			$FFFFEE18
Camera_X_pos_BG_copy =		$FFFFEEB0
Camera_Y_pos_BG_copy =		$FFFFEEB2
Camera_Max_Y_pos  = 		$FFFFEEC6
Camera_Min_X_pos  = 		$FFFFEEC8
Camera_Max_X_pos  = 		$FFFFEECA
Camera_Min_Y_pos  = 		$FFFFEECC
Camera_Max_Y_pos_now  = 		$FFFFEECE ; was "Camera_max_scroll_spd"...
Sonic_Pos_Record_Index  = 	$FFFFEED2 ; into Sonic_Pos_Record_Buf and Sonic_Stat_Record_Buf
Tails_Pos_Record_Index  = 	$FFFFEED6 ; into Tails_Pos_Record_Buf
Camera_Y_pos_bias  = 		$FFFFEED8 ; added to y position for lookup/lookdown, $60 is center
Camera_Y_pos_bias_2P  = 		$FFFFEEDA ; for Tails
Dynamic_Resize_Routine  = 	$FFFFEEDF
Tails_Min_X_pos  = 		$FFFFEEF8
Tails_Max_X_pos  = 		$FFFFEEFA
Tails_Max_Y_pos  = 		$FFFFEEFE

Underwater_palette_2  =  		$FFFFF000 ; not sure what it's used for but it's only used when there's water
Underwater_palette  =  		$FFFFF080 ; main palette for underwater parts of the screen
Underwater_palette_line4  =  	$FFFFF0E0

Game_Mode  = 			$FFFFF600 ; 1 byte ; see GameModesArray (master level trigger, Mstr_Lvl_Trigger)
Ctrl_1_Logical  = 		$FFFFF602 ; 2 bytes
Ctrl_1_Held_Logical  = 		$FFFFF602 ; 1 byte
Ctrl_1_Press_Logical  = 		$FFFFF603 ; 1 byte
Ctrl_1  = 			$FFFFF604 ; 2 bytes
Ctrl_1_Held  = 			$FFFFF604 ; 1 byte ; (pressed and held were switched around before)
Ctrl_1_Press  = 			$FFFFF605 ; 1 byte
Ctrl_2  = 			$FFFFF606 ; 2 bytes
Ctrl_2_Held  = 			$FFFFF606 ; 1 byte
Ctrl_2_Press  = 			$FFFFF607 ; 1 byte
Demo_Time_left  = 		$FFFFF614 ; 2 bytes

Vscroll_Factor  = 		$FFFFF616
Hint_counter_reserve  = 		$FFFFF624 ; Must contain a VDP command word, preferably a write to register $0A. Executed every V-INT.
Delay_Time  = 			$FFFFF62A ; number of frames to delay the game
RNG_seed  = 			$FFFFF636 ; used for random number generation
Game_paused  = 			$FFFFF63A
DMA_data_thunk  = 		$FFFFF640 ; Used as a RAM holder for the final DMA command word. Data will NOT be preserved across V-INTs, so consider this space reserved.

Water_Level_1  = 			$FFFFF646
Water_Level_2  = 			$FFFFF648
Water_Level_3  = 			$FFFFF64A
Water_routine  = 			$FFFFF64D
Water_move  = 			$FFFFF64E
Water_on  = 			$FFFFF64C ; is set based on Water_flag
New_Water_Level  = 		$FFFFF650
Water_change_speed  = 		$FFFFF652
Palette_frame_count  = 		$FFFFF65E
Super_Sonic_palette  = 		$FFFFF65F
Ctrl_2_Logical  = 		$FFFFF66A ; 2 bytes
Ctrl_2_Held_Logical  = 		$FFFFF66A ; 1 byte
Ctrl_2_Press_Logical  = 		$FFFFF66B ; 1 byte
Sonic_Look_delay_counter  =  	$FFFFF66C ; 2 bytes
Tails_Look_delay_counter  =  	$FFFFF66E ; 2 bytes
Super_Sonic_frame_count  = 	$FFFFF670
Plc_Buffer  = 			$FFFFF680 ; Pattern load queue

Misc_Variables  = 		$FFFFF700

; extra variables for the second player (CPU) in 1-player mode
Tails_control_counter  = 		$FFFFF702 ; how long until the CPU takes control
Tails_respawn_counter  = 		$FFFFF704
Tails_CPU_routine  = 		$FFFFF708
Tails_CPU_target_x  = 		$FFFFF70A
Tails_CPU_target_y  = 		$FFFFF70C
Tails_interact_ID  = 		$FFFFF70E ; object ID of last object stood on

Level_started_flag  = 		$FFFFF711
CNZ_Bumper_routine  = 		$FFFFF71A
Dirty_flag  = 			$FFFFF72C ; if whole screen needs to redraw
Water_flag  = 			$FFFFF730 ; if the level has water or oil

Sonic_top_speed  = 		$FFFFF760
Sonic_acceleration  = 		$FFFFF762
Sonic_deceleration  = 		$FFFFF764
Obj_placement_routine  = 		$FFFFF76C
Obj_load_addr_0  = 		$FFFFF770
Obj_load_addr_1  = 		$FFFFF774
Obj_load_addr_2  = 		$FFFFF778
Obj_load_addr_3  = 		$FFFFF77C
Demo_button_index  = 		$FFFFF790 ; index into button press demo data, for player 1
Demo_press_counter  = 		$FFFFF792 ; frames remaining until next button press, for player 1
Demo_button_index_2P  = 		$FFFFF732 ; index into button press demo data, for player 2
Demo_press_counter_2P  = 		$FFFFF734 ; frames remaining until next button press, for player 2
Collision_addr  = 		$FFFFF796
Current_Boss_ID  = 		$FFFFF7AA
Control_Locked  = 		$FFFFF7CC
Chain_Bonus_counter  = 		$FFFFF7D0 ; counts up when you destroy things that give points, resets when you touch the ground
Bonus_Countdown_1  = 		$FFFFF7D2 ; level results time bonus or special stage sonic ring bonus
Bonus_Countdown_2  = 		$FFFFF7D4 ; level results ring bonus or special stage tails ring bonus
Update_Bonus_score  = 		$FFFFF7D6
Camera_X_pos_coarse  = 		$FFFFF7DA ; (Camera_X_pos - 128) / 256

Sprite_Table  = 			$FFFFF800 ; Sprite attribute table buffer

Normal_palette  = 		$FFFFFB00
Normal_palette_line_2  = 		$FFFFFB20
Normal_palette_line_3  = 		$FFFFFB40
Normal_palette_line_4  = 		$FFFFFB60
Second_palette  = 		$FFFFFB80
Second_palette_line2  = 		$FFFFFBA0
Second_palette_line3  = 		$FFFFFBC0
Second_palette_line4  = 		$FFFFFBE0

Object_Respawn_Table  = 		$FFFFFC00
System_Stack  = 			$FFFFFE00
Level_Inactive_flag  =  		$FFFFFE02 ; (2 bytes)
Timer_frames  = 			$FFFFFE04 ; (2 bytes)
Debug_object  = 			$FFFFFE06
Debug_placement_mode  = 		$FFFFFE08
Current_ZoneAndAct  = 		$FFFFFE10 ; 2 bytes
Current_Zone  = 			$FFFFFE10 ; 1 byte
Current_Act  = 			$FFFFFE11 ; 1 byte
Life_count  = 			$FFFFFE12
Current_Special_Stage  = 		$FFFFFE16
Continue_count  = 		$FFFFFE18
Super_Sonic_flag  = 		$FFFFFE19
Time_Over_flag  = 		$FFFFFE1A
Extra_life_flags  = 		$FFFFFE1B

; If set, the respective HUD element will be updated.
Update_HUD_lives  = 		$FFFFFE1C
Update_HUD_rings  = 		$FFFFFE1D
Update_HUD_timer  = 		$FFFFFE1E
Update_HUD_score  = 		$FFFFFE1F

Ring_count  = 			$FFFFFE20 ; 2 bytes
Timer  = 				$FFFFFE22 ; 4 bytes
Timer_minute_word  = 		$FFFFFE22 ; 2 bytes
Timer_minute  = 			$FFFFFE23 ; 1 byte
Timer_second  = 			$FFFFFE24 ; 1 byte
Timer_centisecond  = 		$FFFFFE25 ; 1 byte
Score  = 				$FFFFFE26 ; 4 bytes
Last_star_pole_hit  = 		$FFFFFE30 ; 1 byte -- max activated starpole ID in this act

Saved_Last_star_pole_hit  = 	$FFFFFE31
Saved_x_pos  = 			$FFFFFE32
Saved_y_pos  = 			$FFFFFE34
Saved_Ring_count  = 		$FFFFFE36
Saved_Timer  = 			$FFFFFE38
Saved_art_tile  = 		$FFFFFE3C
Saved_layer  = 			$FFFFFE3E
Saved_Camera_X_pos  = 		$FFFFFE40
Saved_Camera_Y_pos  = 		$FFFFFE42
Saved_Water_Level  = 		$FFFFFE50
Saved_Water_routine  = 		$FFFFFE52
Saved_Water_move  = 		$FFFFFE53
Saved_Extra_life_flags  = 	$FFFFFE54
Saved_Extra_life_flags_2P  = 	$FFFFFE55
Saved_Camera_Max_Y_pos  = 	$FFFFFE56
Saved_Dynamic_Resize_Routine  = 	$FFFFFE58

Logspike_anim_counter  = 		$FFFFFEA0
Logspike_anim_frame  = 		$FFFFFEA1
Rings_anim_counter  = 		$FFFFFEA2
Rings_anim_frame  = 		$FFFFFEA3
Unknown_anim_counter  = 		$FFFFFEA4 ; I think this was $FFFFFEC4 in the alpha
Unknown_anim_frame  = 		$FFFFFEA5
Ring_spill_anim_counter  = 	$FFFFFEA6 ; scattered rings
Ring_spill_anim_frame  = 		$FFFFFEA7
Ring_spill_anim_accum  = 		$FFFFFEA8

; values for the second player (some of these only apply to 2-player games)
Tails_top_speed  = 		$FFFFFEC0 ; Tails_max_vel
Tails_acceleration  = 		$FFFFFEC2
Tails_deceleration  = 		$FFFFFEC4
Life_count_2P  = 			$FFFFFEC6
Extra_life_flags_2P  = 		$FFFFFEC7
Update_HUD_lives_2P  = 		$FFFFFEC8
Update_HUD_rings_2P  = 		$FFFFFEC9
Update_HUD_timer_2P  = 		$FFFFFECA
Update_HUD_score_2P  = 		$FFFFFECB ; mostly unused
Time_Over_flag_2P  = 		$FFFFFECC
Ring_count_2P  = 			$FFFFFED0
Timer_2P  = 			$FFFFFED2 ; 4 bytes
Timer_minute_word_2P  = 		$FFFFFED2 ; 2 bytes
Timer_minute_2P  = 		$FFFFFED3 ; 1 byte
Timer_second_2P  = 		$FFFFFED4 ; 1 byte
Timer_centisecond_2P  = 		$FFFFFED5 ; 1 byte
Score_2P  = 			$FFFFFED6
Last_star_pole_hit_2P  = 		$FFFFFEE0

Saved_Last_star_pole_hit_2P  = 	$FFFFFEE1
Saved_x_pos_2P  = 		$FFFFFEE2
Saved_y_pos_2P  = 		$FFFFFEE4
Saved_Ring_count_2P  = 		$FFFFFEE6
Saved_Timer_2P  = 		$FFFFFEE8
Saved_art_tile_2P  = 		$FFFFFEEC
Saved_layer_2P  = 		$FFFFFEEE

Loser_Time_Left  = 		$FFFFFEF8
Results_Screen_2P  = 		$FFFFFF10 ; 0  =  act, 1  =  zone, 2  =  game, 3  =  SS, 4  =  SS all
Results_Data_2P  = 		$FFFFFF20 ; $18 bytes
EHZ_Results_2P  = 		$FFFFFF20 ; 6 bytes
MCZ_Results_2P  = 		$FFFFFF26 ; 6 bytes
CNZ_Results_2P  = 		$FFFFFF2C ; 6 bytes
SS_Results_2P  = 			$FFFFFF32 ; 6 bytes
SS_Total_Won  = 			$FFFFFF38 ; 2 bytes (player 1 then player 2)
Perfect_rings_left  = 		$FFFFFF40
Player_mode  = 			$FFFFFF70 ; 0  =  Sonic and Tails, 1  =  Sonic, 2  =  Tails
Player_option  = 			$FFFFFF72 ; 0  =  Sonic and Tails, 1  =  Sonic, 2  =  Tails

Two_player_items  = 		$FFFFFF74
Level_select_zone  = 		$FFFFFF82
Sound_test_sound  = 		$FFFFFF84
Title_screen_option  = 		$FFFFFF86
Current_Zone_2P  = 		$FFFFFF88
Current_Act_2P  = 		$FFFFFF89
Two_player_mode_copy  = 		$FFFFFF8A
Options_menu_box  = 		$FFFFFF8C
Level_Music  = 			$FFFFFF90
Game_Over_2P  = 			$FFFFFF98
Got_Emerald  = 			$FFFFFFB0
Emerald_count  = 			$FFFFFFB1
Got_Emeralds_array  = 		$FFFFFFB2 ; 7 bytes
Next_Extra_life_score  = 		$FFFFFFC0
Next_Extra_life_score_2P  = 	$FFFFFFC4
Level_Has_Signpost  = 		$FFFFFFC8 ; 1 byte ; 1  =  signpost, 0  =  boss or nothing
Level_select_flag  = 		$FFFFFFD0
Slow_motion_flag =		$FFFFFFD1
Correct_cheat_entries =		$FFFFFFD4
Correct_cheat_entries_2 =	$FFFFFFD6 ; for 14 continues or 7 emeralds codes
Two_player_mode =		$FFFFFFD8 ; flag (0 for main game)
Two_player_flag = 		Two_player_mode 
; Values in these variables are passed to the sound driver during V-INT.
; They use a playlist index, not a sound test index.
Music_to_play =			$FFFFFFE0
SFX_to_play =			$FFFFFFE1 ; normal
SFX_to_play_2 =			$FFFFFFE2 ; alternating stereo
Music_to_play_2 =		$FFFFFFE4 ; alternate (higher priority?) slot
Sound_Driver_Choice	=	$FFFFFFE8
 
Demo_mode_flag =		$FFFFFFF0 ; 1 if a demo is playing (2 bytes)
Demo_number =			$FFFFFFF2; which demo will play next (2 bytes)
Graphics_Flags =		$FFFFFFF8 ; misc. bitfield
Debug_mode_flag =		$FFFFFFFA ; (2 bytes)
Checksum_fourcc =		$FFFFFFFC ; (4 bytes)
 
; ---------------------------------------------------------------------------
; VDP addressses
VDP_data_port =			$C00000 ; (8=r/w, 16=r/w)
VDP_control_port =		$C00004 ; (8=r/w, 16=r/w)
 
; ---------------------------------------------------------------------------
; Z80 addresses
; Z80 addresses
Z80_RAM =			$A00000 ; start of Z80 RAM
Z80_RAM_End =			$A02000 ; end of non-reserved Z80 RAM
Z80_Version =			$A10001
Z80_Port_1_Data =		$A10002
Z80_Port_1_Control =		$A10008
Z80_Port_2_Control =		$A1000A
Z80_Expansion_Control =		$A1000C
Z80_Bus_Request =		$A11100
Z80_Reset =			$A11200
Security_Addr =			$A14000
 
; 覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧・

; enum Z80_Control

Z80_Snd_Variables: equ $A01C00
Song_Tempo:	 equ $A01C08
PlayMusic_Norm:	 equ $A01C0A
PlaySFX_Norm:	 equ $A01C0B
PlaySFX_Secondary: equ $A01C0C
Z80_Pause_Song:	 equ $A01C10
Security_Addr =			$A14000
 
; ===========================================================================
; Music Offset List. It's my way of simplifying music lists.
; ===========================================================================

; ===========================================================================
; PLC Offset List. Each Number represents an Entry in ArtLoadCues.
; If you edit the list, feel free to add or fix the entries on here.
; ===========================================================================

; ---------------------------------------------------------------------------
; Main Loading PLC numbers
; ---------------------------------------------------------------------------
MainPLC			= 0
SecondaryPLC	= 1
AnimalPLC		= 2
GameOverPLC		= 3
; ---------------------------------------------------------------------------
; EHZ - Level 00
; ---------------------------------------------------------------------------
MainEHZ			= 4  ; EHZ  PLC
SecondaryEHZ	= 5  ; EHZ  PLC sec
; ---------------------------------------------------------------------------
; Unk1 - Level 01
; ---------------------------------------------------------------------------
MainUnk1		= 6  ; UNK1 PLC
SecondaryUnk1	= 7  ; UNK1 PLC Sec
; ---------------------------------------------------------------------------
; WZ - Level 02
; ---------------------------------------------------------------------------
MainWZ			= 8  ; WZ   PLC 
SecondaryWZ 	= 9  ; WZ   PLC Sec
; ---------------------------------------------------------------------------
; Unk2 - Level 03
; ---------------------------------------------------------------------------
MainUnk2		= 50  ; UNK2 PLC
SecondaryUnk2	= 51  ; UNK2 PLC Sec
; ---------------------------------------------------------------------------
; MTZ - Level 04
; ---------------------------------------------------------------------------
MainMTZ			= $A ; MTZ  PLC 
SecondaryMTZ	= $B ; MTZ  PLC sec
; ---------------------------------------------------------------------------
; MTZ2 - Level 05
; ---------------------------------------------------------------------------
MainMTZ2		= $C ; MTZ2 PLC  
SecondaryMTZ2	= $D ; MTZ2 PLC sec
; ---------------------------------------------------------------------------
; Unk3 - Level 06 - Wings Fortress in S2F
; ---------------------------------------------------------------------------
MainUnk3		= $E ; UNK3 PLC
SecondaryUnk3	= $F ; UNK3 PLC Sec
; ---------------------------------------------------------------------------
; Unk4 - Unused
; ---------------------------------------------------------------------------
MainUnk4		= $10 ; UNK4 PLC  
SecondaryUnk4   = $11 ; UNK4  PLC sec
; ---------------------------------------------------------------------------
; HTZ - Level 07
; ---------------------------------------------------------------------------
MainHTZ		  	= $12 ; HTZ  PLC  
SecondaryHTZ	= $13 ; HTZ  PLC sec
; ---------------------------------------------------------------------------
; HPZ - Level 08
; ---------------------------------------------------------------------------
MainHPZ		  	= $14 ; HTZ  PLC  
SecondaryHPZ	= $15 ; HTZ  PLC sec
; ---------------------------------------------------------------------------
; Unk5 - Unused
; ---------------------------------------------------------------------------
MainUnk5		= $16 ; UNK5 PLC  
SecondaryUnk5   = $17 ; UNK5  PLC sec
; ---------------------------------------------------------------------------
; OOZ - Level 0A
; ---------------------------------------------------------------------------
MainOOZ		  	= $18 ; OOZ  PLC  
SecondaryOOZ	= $19 ; OOZ  PLC sec
; ---------------------------------------------------------------------------
; MCZ - Level 0B
; ---------------------------------------------------------------------------
MainMCZ		  	= $1A ; MCZ  PLC  
SecondaryMCZ 	= $1B ; MCZ  PLC sec
; ---------------------------------------------------------------------------
; CNZ - Level 0C
; ---------------------------------------------------------------------------
MainCNZ		  	= $1C ; CNZ  PLC  
SecondaryCNZ 	= $1D ; CNZ  PLC sec
; ---------------------------------------------------------------------------
; CPZ - Level 0D
; --------------------------------------------------------------------------- 
MainCPZ		  	= $1E ; CPZ  PLC  
SecondaryCPZ 	= $1F ; CPZ  PLC sec
; ---------------------------------------------------------------------------
; DEZ - Level 0E - Unused.
; --------------------------------------------------------------------------- 
MainDEZ		  	= $20 ; DEZ  PLC  
SecondaryDEZ 	= $21 ; DEZ  PLC sec
; ---------------------------------------------------------------------------
; ARZ - Level 0F
; ---------------------------------------------------------------------------
MainARZ		  	= $22 ; ARZ  PLC  
SecondaryARZ 	= $23 ; ARZ  PLC sec
; ---------------------------------------------------------------------------
; Unused5 - SCZ in S2F
; ---------------------------------------------------------------------------
MainSCZ		  	= $24 ; SCZ  PLC  
SecondarySCZ 	= $25 ; SCZ  PLC sec
; --------------------------------------------------------------------------- 
; End of Level Load
; --------------------------------------------------------------------------- 
MainResults		= $26
SecondEndLoad 	= $27
; --------------------------------------------------------------------------- 
; Boss PLC's
; --------------------------------------------------------------------------- 
MainGHZBoss		= $28
SecGHZBoss 		= $29
; ===========================================================================
; Palette Offset List. Each Number represents an Entry in Palette Table.
; If you edit or add, feel free to add or fix the entries on here.
; ===========================================================================
PalSega 	= 0
PalTitle	= 1
PalLev_Sel	= 2
PalPlayers	= 3
PalGHZ		= 4
PalUnk1		= 5
PalWZ		= 6
PalUnk2		= 7
PalMTZ		= 8
PalMTZ2		= 9
PalWFZ		= $A 	; Actually it's just the CNZ2 palette. It seems that SEGA liked it so much they stuffed in two versions into the game.
PalHTZ		= $B
PalHPZ		= $C
PalUnk3		= $D
PalOOZ		= $E
PalMCZ		= $F
PalCNZ		= $10
PalCPZ		= $11
PalDEZ		= $12
PalARZ		= $13
PalSCZ		= $14
PalHPzWater = $15
PalCPzWater = $16
PalNGHzWater= $17
PalSS		= $18


zDataStart:				EQU	$1B8C
zMusicNumber:			EQU $14E0
zSFXNumber0:			EQU $14E1
zSFXNumber1:			EQU $14E2
zPauseFlag:				EQU $14E3
zPalFlag:				EQU $14E5
zTempoSpeedup:			EQU $14E6

align	macro
	cnop	0,\1
	endm
; ---------------------------------------------------------------------------
startBank:	macro
	align 	$8000
soundBankStart	SET	*
    endm

finishBank:	macro
	if (*>soundBankStart+$8000)
		inform 0,"soundBank at $%h must fit in $8000 bytes but has $%h.",soundBankStart,(*-soundBankStart)
		inform 0,"   Try moving something to the other bank."
		fail "Sound bank error!"
	else
		inform 0,"soundBank at $%h: $%h bytes, ($%h bytes free)",soundBankStart,(*-soundBankStart),$8000-(*-soundBankStart)
	endif
    endm
	
; Setup macro for DAC samples.
DAC_Setup macro loc,loc2
	k68z80Pointer	\loc
	little_endian 	\loc2-\loc
    endm

; Setup macro for DAC samples.
DAC_Setup2 macro pitch,loc,loc2
	dc.w 	pitch
	romdat_Snd 	\loc2-\loc
	romdat_Snd	\loc
	dc.w $0000
    endm
	
; ---------------------------------------------------------------------------

MusicFill macro 
    dc.w $0000
    dc.w $0000  
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    dc.w $0000 
    endm

; ---------------------------------------------------------------------------

z80_ptr	macro	addr
	dc.b	((\addr)&$00FF)>>0, ((\addr)&$FF00)>>8
    endm	
	
; macro to declare a little-endian 16-bit pointer for the Z80 sound driver
k68z80Pointer macro addr
	little_endian    ((\addr)|$8000)
	endm

little_endian macro x
	dc.w    ((\x)&$00FF)<<8|((\x)&$FF00)>>8
	endm

z80_ptr	macro	addr
	dc.b	((\addr)&$00FF)>>0, ((\addr)&$FF00)>>8
    endm

; macro to declare a little-endian 16-bit pointer for the Z80 sound driver
romptr_z80	macro	addr
	z80_ptr	(\addr)|$8000
    endm

romptr_Snd	macro	addr
	z80_ptr	(\addr)-z80_Driver
    endm
	
romdat_Snd	macro	addr
	z80_ptr	(\addr)
    endm
	
LoadZ80Ptr	macro
 	ld	\1, $8000+(\2&$7FFFh)
 	endm
	
Z80Ptr	macro
	dc.w	((\1&$FF)<<8)|((\1&$FF00)>>8)
	endm

; function to make a little-endian 16-bit pointer for the Z80 sound driver
wordZ80	macro	val
	dc.w (val&$7FFF)|$8000
	endm

; macro to declare a little-endian 16-bit pointer for the Z80 sound driver	
	
rom_ptr_z80	macro	offset
	wordZ80	(\offset|$8000)
	endm		

Bankfill macro
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
		endm
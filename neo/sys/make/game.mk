
# Source files for the game
game_src_files := AF.cpp \
AFEntity.cpp \
Actor.cpp \
Camera.cpp \
Entity.cpp \
BrittleFracture.cpp \
Fx.cpp \
GameEdit.cpp \
Game_local.cpp \
Game_network.cpp \
Item.cpp \
IK.cpp \
Light.cpp \
Misc.cpp \
Mover.cpp \
Moveable.cpp \
MultiplayerGame.cpp \
Player.cpp \
PlayerIcon.cpp \
PlayerView.cpp \
Projectile.cpp \
Pvs.cpp \
SecurityCamera.cpp \
SmokeParticles.cpp \
Sound.cpp \
Target.cpp \
Trigger.cpp \
Weapon.cpp \
WorldSpawn.cpp \
ai/AAS.cpp \
ai/AAS_debug.cpp \
ai/AAS_pathing.cpp \
ai/AAS_routing.cpp \
ai/AI.cpp \
ai/AI_events.cpp \
ai/AI_pathing.cpp \
ai/AI_Vagary.cpp \
gamesys/DebugGraph.cpp \
gamesys/Class.cpp \
gamesys/Event.cpp \
gamesys/SaveGame.cpp \
gamesys/SysCmds.cpp \
gamesys/SysCvar.cpp \
gamesys/TypeInfo.cpp \
anim/Anim.cpp \
anim/Anim_Blend.cpp \
anim/Anim_Import.cpp \
anim/Anim_Testmodel.cpp \
script/Script_Compiler.cpp \
script/Script_Interpreter.cpp \
script/Script_Program.cpp \
script/Script_Thread.cpp \
physics/Clip.cpp \
physics/Force.cpp \
physics/Force_Constant.cpp \
physics/Force_Drag.cpp \
physics/Force_Field.cpp \
physics/Force_Spring.cpp \
physics/Physics.cpp \
physics/Physics_AF.cpp \
physics/Physics_Actor.cpp \
physics/Physics_Base.cpp \
physics/Physics_Monster.cpp \
physics/Physics_Parametric.cpp \
physics/Physics_Player.cpp \
physics/Physics_RigidBody.cpp \
physics/Physics_Static.cpp \
physics/Physics_StaticMulti.cpp \
physics/Push.cpp
src_path := neo/game

# Append src path
src_files = $(src_files:%=$(src_path)/%)


jpeg_src_files = jcapimin.c \
jccoefct.c \
jccolor.c \
jcdctmgr.c \
jchuff.c \
jcinit.c \
jcmainct.c \
jcmarker.c \
jcmaster.c \
jcomapi.c \
jcparam.c \
jcphuff.c \
jcprepct.c \
jcsample.c \
jdapimin.c \
jdapistd.c \
jdatadst.c \
jdatasrc.c \
jdcoefct.c \
jdcolor.c \
jddctmgr.c \
jdhuff.c \
jdinput.c \
jdmainct.c \
jdmarker.c \
jdmaster.c \
jdmerge.c \
jdphuff.c \
jdpostct.c \
jdsample.c \
jdtrans.c \
jerror.c \
jfdctflt.c \
jfdctfst.c \
jfdctint.c \
jidctflt.c \
jidctfst.c \
jidctint.c \
jidctred.c \
jmemmgr.c \
jmemnobs.c \
jquant1.c \
jquant2.c \
jutils.c

ogg_src_files = oggsrc/bitwise.c \
oggsrc/framing.c \
vorbissrc/analysis.c \
vorbissrc/bitrate.c \
vorbissrc/block.c \
vorbissrc/codebook.c \
vorbissrc/envelope.c \
vorbissrc/floor0.c \
vorbissrc/floor1.c \
vorbissrc/info.c \
vorbissrc/lookup.c \
vorbissrc/lpc.c \
vorbissrc/lsp.c \
vorbissrc/mapping0.c \
vorbissrc/mdct.c \
vorbissrc/psy.c \
vorbissrc/registry.c \
vorbissrc/res0.c \
vorbissrc/sharedbook.c \
vorbissrc/smallft.c \
vorbissrc/synthesis.c \
vorbissrc/vorbisenc.c \
vorbissrc/vorbisfile.c \
vorbissrc/windowvb.c

renderer_src_files = Cinematic.cpp \
GuiModel.cpp \
Image_files.cpp \
Image_init.cpp \
Image_load.cpp \
Image_process.cpp \
Image_program.cpp \
Interaction.cpp \
Material.cpp \
MegaTexture.cpp \
Model.cpp \
ModelDecal.cpp \
ModelManager.cpp \
ModelOverlay.cpp \
Model_beam.cpp \
Model_ase.cpp \
Model_liquid.cpp \
Model_lwo.cpp \
Model_ma.cpp \
Model_md3.cpp \
Model_md5.cpp \
Model_prt.cpp \
Model_sprite.cpp \
RenderEntity.cpp \
RenderSystem.cpp \
RenderSystem_init.cpp \
RenderWorld.cpp \
RenderWorld_demo.cpp \
RenderWorld_load.cpp \
RenderWorld_portals.cpp \
VertexCache.cpp \
cg_explicit.cpp \
draw_arb.cpp \
draw_arb2.cpp \
draw_common.cpp \
draw_exp_stub.cpp \
draw_nv10.cpp \
draw_nv20.cpp \
draw_r200.cpp \
tr_backend.cpp \
tr_deform.cpp \
tr_font.cpp \
tr_guisurf.cpp \
tr_light.cpp \
tr_lightrun.cpp \
tr_main.cpp \
tr_orderIndexes.cpp \
tr_polytope.cpp \
tr_render.cpp \
tr_rendertools.cpp \
tr_shadowbounds.cpp \
tr_stencilshadow.cpp \
tr_subview.cpp \
tr_trace.cpp \
tr_trisurf.cpp \
tr_turboshadow.cpp

framework_src_files = CVarSystem.cpp \
CmdSystem.cpp \
Common.cpp \
Compressor.cpp \
Console.cpp \
DemoFile.cpp \
DeclAF.cpp \
DeclEntityDef.cpp \
DeclFX.cpp \
DeclManager.cpp \
DeclParticle.cpp \
DeclPDA.cpp \
DeclSkin.cpp \
DeclTable.cpp \
EditField.cpp \
EventLoop.cpp \
File.cpp \
FileSystem.cpp \
KeyInput.cpp \
Unzip.cpp \
UsercmdGen.cpp \
Session_menu.cpp \
Session.cpp \
async/AsyncClient.cpp \
async/AsyncNetwork.cpp \
async/AsyncServer.cpp \
async/MsgChannel.cpp \
async/NetworkSystem.cpp \
async/ServerScan.cpp

cm_src_files = CollisionModel_contacts.cpp \
CollisionModel_contents.cpp \
CollisionModel_debug.cpp \
CollisionModel_files.cpp \
CollisionModel_load.cpp \
CollisionModel_rotate.cpp \
CollisionModel_trace.cpp \
CollisionModel_translate.cpp

dmap_src_files = dmap.cpp \
facebsp.cpp \
gldraw.cpp \
glfile.cpp \
leakfile.cpp \
map.cpp \
optimize.cpp \
output.cpp \
portals.cpp \
shadowopt3.cpp \
tritjunction.cpp \
tritools.cpp \
ubrush.cpp \
usurface.cpp

aas_src_files = AASBuild.cpp \
AASBuild_file.cpp \
AASBuild_gravity.cpp \
AASBuild_ledge.cpp \
AASBuild_merge.cpp \
AASCluster.cpp \
AASFile.cpp \
AASFile_optimize.cpp \
AASFile_sample.cpp \
AASReach.cpp \
AASFileManager.cpp \
Brush.cpp \
BrushBSP.cpp

roq_src_files = NSBitmapImageRep.cpp \
codec.cpp \
roq.cpp \
roqParam.cpp

renderbump_src_files := renderbump.cpp

snd_src_files = snd_cache.cpp \
snd_decoder.cpp \
snd_efxfile.cpp \
snd_emitter.cpp \
snd_shader.cpp \
snd_system.cpp \
snd_wavefile.cpp \
snd_world.cpp

ui_src_files = BindWindow.cpp \
ChoiceWindow.cpp \
DeviceContext.cpp \
EditWindow.cpp \
FieldWindow.cpp \
GameBearShootWindow.cpp \
GameBustOutWindow.cpp \
GameSSDWindow.cpp \
GuiScript.cpp \
ListGUI.cpp \
ListWindow.cpp \
MarkerWindow.cpp \
RegExp.cpp \
RenderWindow.cpp \
SimpleWindow.cpp \
SliderWindow.cpp \
UserInterface.cpp \
Window.cpp \
Winvar.cpp


sys_src_files = sys_local.cpp \
posix/posix_net.cpp \
posix/posix_main.cpp \
posix/posix_signal.cpp \
posix/posix_threads.cpp \
linux/stack.cpp \
linux/main.cpp \
stub/util_stub.cpp

ifeq ($(local_dedicated),0)

sys_src_files += linux/glimp.cpp \
posix/posix_input.cpp \
linux/input.cpp \
linux/libXNVCtrl/NVCtrl.c

else

sys_src_files += linux/dedicated.cpp

endif

define __append_path
# 1: Name of the module
# 2: Path to prepend
# 3: File extension e.g c or cpp
$1_obj_files := $$($1_src_files:%.$3=$2/%.o)
endef

core_modules := jpeg ogg renderer framework cm dmap aas roq renderbump snd ui sys

# Append path
$(eval $(call __append_path,jpeg,renderer/jpeg-6,c))
$(eval $(call __append_path,ogg,sound/OggVorbis,c))
$(eval $(call __append_path,renderer,renderer,cpp))
$(eval $(call __append_path,framework,framework,cpp))
$(eval $(call __append_path,cm,cm,cpp))
$(eval $(call __append_path,dmap,tools/compilers/dmap,cpp))
$(eval $(call __append_path,aas,tools/compilers/aas,cpp))
$(eval $(call __append_path,roq,tools/compilers/roqvq,cpp))
$(eval $(call __append_path,renderbump,tools/compilers/renderbump,cpp))
$(eval $(call __append_path,snd,sound,cpp))
$(eval $(call __append_path,ui,ui,cpp))

# sys contains both cpp and c files so cannot use __append_path
# 1: Name of module
# 2: Extension to filter out 
# 3: Extension to convert to .o
__append_path_filt = $(patsubst %.$3,$1/%.o,$(filter-out %.$2,$($1_src_files)))
sys_obj_files := $(call __append_path_filt,sys,c,cpp)
sys_obj_files += $(call __append_path_filt,sys,cpp,c)

core_obj_files := 
$(foreach core_module,$(core_modules),\
$(eval core_obj_files += $(addprefix $(build_path)/neo/,$($(core_module)_obj_files))))

core_cppflags = $(BASECPPFLAGS) $(DEPENDCPPFLAGS) $(CORECPPFLAGS) $(OPTCPPFLAGS) -fPIC

core_name := libcore.so
core_linker := $(CXX) -o

core_dirs := $(sort $(dir $(core_obj_files)))

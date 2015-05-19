SYS_MAKE_PATH = neo/sys/make

include $(SYS_MAKE_PATH)/DefaultSettings.mk

build_path = $(BUILD_ROOT)/build

OS := `uname -o`

BASECPPFLAGS = -pipe
# Warnings
BASECPPFLAGS += -Wall -Wno-unknown-pragmas

# Build for 32 bit
BASECPPFLAGS += -m32

# Don't wrap gcc messages
BASECPPFLAGS += -fmessage-length=0
BASECPPFLAGS += -fpermissive

# This define is necessary to make sure threading support is enabled in X
CORECPPFLAGS = -DXTHREADS

# Flags for generating dependencies
DEPENDCPPFLAGS = -MMD -MP

ifeq ($(OS),GNU/Linux)
# Only export what we mean to from the game SO
BASECPPFLAGS += -fvisibility=hidden
endif

# Process the options and define the correct flags
include $(SYS_MAKE_PATH)/ProcessOptions.mk

# Include the different modules of Doom 3 
modules = idlib 

# Include the logic for each module, i.e src files and flags
$(foreach module,$(modules),$(eval include $$(SYS_MAKE_PATH)/$(module).mk))

RELEASECPPFLAGS := -O3 -Winline -ffast-math 
RELEASECPPFLAGS += -fno-unsafe-math-optimizations -fomit-frame-pointer

DEBUGCPPFLAGS := -g -O1 -D_DEBUG


.PHONY: build
build: OPTCPPFLAGS = $(RELEASECPPFLAGS)
build: $(modules)

.PHONY: debug
debug: OPTCPPFLAGS = $(DEBUGCPPFLAGS)
debug: $(modules)

$(sort $(dir $(idlib_obj_files))):
	mkdir -p $@

.PHONY: idlib 
idlib: CPPFLAGS = $(idlib_cppflags)
idlib: $(sort $(dir $(idlib_obj_files))) $(idlib_obj_files) 
	$(CXX) $< -o $@

$(build_path)/%.o: %.cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean: 
	rm -rf $(BUILD_ROOT)

SYS_MAKE_PATH = neo/sys/make

include $(SYS_MAKE_PATH)/DefaultSettings.mk

build_path = $(BUILD_ROOT)/build

OS := `uname -o`

BASECPPFLAGS = -pipe
# Warnings
BASECPPFLAGS += -Wall -Wno-unknown-pragmas  -fdiagnostics-color=always

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

# Include template for building each module
include $(SYS_MAKE_PATH)/Template.mk

# Include the different modules of Doom 3 
modules = idlib core

# Include the logic for each module, i.e src files and flags
$(foreach module,$(modules),$(eval include $$(SYS_MAKE_PATH)/$(module).mk))

RELEASECPPFLAGS := -O3 -Winline -ffast-math 
RELEASECPPFLAGS += -fno-unsafe-math-optimizations -fomit-frame-pointer

DEBUGCPPFLAGS := -g -O1 -D_DEBUG

TYPES := release debug

TYPE_PATHS := $(prefix $(BUILD_ROOT),$(TYPES))

.PHONY: build
build: OPTCPPFLAGS = $(RELEASECPPFLAGS)
build: TYPE = release
build: $(modules)

.PHONY: debug
debug: OPTCPPFLAGS = $(DEBUGCPPFLAGS)
debug: TYPE = debug
debug: $(modules)

.PHONY: clean
clean: 
	rm -rf $(BUILD_ROOT)

$(build_path)/%.o: %.cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

$(build_path)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Create build targets for each module based on the template
$(foreach module,$(modules),$(eval $(call __build_module,$(module))))

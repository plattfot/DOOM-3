# Expects OPTCPPFLAGS to be defined

idlib_src_files := bv/Bounds.cpp \
bv/Frustum.cpp \
bv/Sphere.cpp \
bv/Box.cpp \
geometry/DrawVert.cpp \
geometry/Winding2D.cpp \
geometry/Surface_SweptSpline.cpp \
geometry/Winding.cpp \
geometry/Surface.cpp \
geometry/Surface_Patch.cpp \
geometry/TraceModel.cpp \
geometry/JointTransform.cpp \
hashing/CRC32.cpp \
hashing/MD4.cpp \
hashing/MD5.cpp \
math/Angles.cpp \
math/Lcp.cpp \
math/Math.cpp \
math/Matrix.cpp \
math/Ode.cpp \
math/Plane.cpp \
math/Pluecker.cpp \
math/Polynomial.cpp \
math/Quat.cpp \
math/Rotation.cpp \
math/Simd.cpp \
math/Simd_Generic.cpp \
math/Vector.cpp \
BitMsg.cpp \
LangDict.cpp \
Lexer.cpp \
Lib.cpp \
containers/HashIndex.cpp \
Dict.cpp \
Str.cpp \
Parser.cpp \
MapFile.cpp \
CmdArgs.cpp \
Token.cpp \
Base64.cpp \
Timer.cpp \
Heap.cpp

# Path to the src files
idlib_src_path := neo/idlib

# Create obj files, these will be created in the build_path but will
# keep the structure.
idlib_obj_files := $(idlib_src_files:%.cpp=$(build_path)/$(idlib_src_path)/%.o)

# Max allowed -O1. Why?
idlib_cppflags = $(BASECPPFLAGS) $(DEPENDCPPFLAGS) $(CORECPPFLAGS) $(patsubst -O3,-O1,$(OPTCPPFLAGS))

idlib_dirs := $(sort $(dir $(idlib_obj_files)))
ifeq ($(IDLIB_STATIC),1)

idlib_name := libidlib.a
idlib_linker := ar -qc

else

idlib_name := libidlib.so
idlib_cppflags += -fPIC
idlib_linker = $(CXX) -o

endif

define __build_module

$$($1_dirs):
	mkdir -p $$@

$$($1_obj_files): | $$($1_dirs)

.PHONY: $1
$1: CPPFLAGS = $$($1_cppflags)
$1: $$(build_path)/$$($1_name)

$$(build_path)/$$($1_name): $$($1_obj_files) 
	$$($1_linker) $$@ $$^

endef

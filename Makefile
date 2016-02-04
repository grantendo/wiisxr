#This is just here for convenience
#Call "make help" for available commands
ifndef ECHO
ECHO = echo
endif

.PHONY:  all

all:
	@$(ECHO) "Rebuilding Wii and logging to build.log..."
	@$(MAKE) -C Gamecube clean -f Makefile_Wii
	@$(MAKE) -C Gamecube -f Makefile_Wii 2> temp.log
  #This step removes all leading pathes from the build.log
	@sed 's|.*wiisxr/Gamecube|/wiisxr/Gamecube|' temp.log > build.log
  #note that msys doesn't seem to like sed -i
	@rm temp.log

Wii:
	@$(ECHO) "Building Wii..."
	@$(MAKE) -C Gamecube -f Makefile_Wii
 
GC:
	@$(ECHO) "Building Wii..."
	@$(MAKE) -C Gamecube -f Makefile_GC
 
clean:
	@$(ECHO) "Cleaning..."
	@$(MAKE) -C Gamecube clean -f Makefile_Wii

help:
	@$(ECHO)
	@$(ECHO) "Available commands:"
	@$(ECHO)
	@$(ECHO) "make            # cleans, rebuilds and log errors (Wii)"
	@$(ECHO) "make Wii        # build everything (Wii)"
	@$(ECHO) "make GC         # build everything (Gamecube)"
	@$(ECHO) "make clean      # clean everything"

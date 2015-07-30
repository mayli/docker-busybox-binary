SUBDIRS := i686 x86_64

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)

$(SUBDIRS):
	for dir in $(SUBDIRS); do \
		if ! [ -d $$dir ]; then cp -r arch $$dir; fi;\
		$(MAKE) -C $$dir $(MAKECMDGOALS); \
	done

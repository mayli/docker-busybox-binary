SUBDIRS := 1.20.0 1.21.1 latest

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)
	rm -rf $(SUBDIRS)

$(SUBDIRS):
	for dir in $(SUBDIRS); do \
		if ! [ -d $$dir ]; then cp -r version $$dir; fi;\
		$(MAKE) -C $$dir $(MAKECMDGOALS); \
	done

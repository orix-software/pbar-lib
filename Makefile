SOURCES8=$(wildcard src/*.s)
OBJECTS8=$(SOURCES8:.s=.o)

NAME_LIB=pbar

ifeq ($(CC65_HOME),)
        CC = cl65
        AS = ca65
        LD = ld65
        AR = ar65
else
        CC = $(CC65_HOME)/bin/cl65
        AS = $(CC65_HOME)/bin/ca65
        LD = $(CC65_HOME)/bin/ld65
        AR = $(CC65_HOME)/bin/ar65
endif

all: $(SOURCES8) $(OBJECTS8) binary after_success
.PHONY : all

$(OBJECTS8): $(SOURCES8)
	@mkdir build/lib8/ -p
	@mkdir tmp/src/ -p
	@$(AS) -ttelestrat $(@:.o=.s) -o tmp/$@ --include-dir src/include
	@$(AR) r $(NAME_LIB).lib  tmp/$@
	@cp $(NAME_LIB).lib build/lib8/

binary:
	@echo build example
	@mkdir build/bin/ -p
	@$(CC) -ttelestrat example/pbar.c build/lib8/pbar.lib -o pbar1000 --start-addr 2048
	@$(CC) -ttelestrat example/pbar.c build/lib8/pbar.lib -o pbar2304 --start-addr 2304
	@chmod +x dependencies/orix-sdk/bin/relocbin.py3
	@dependencies/orix-sdk/bin/relocbin.py3 -o build/bin/pbar -2 pbar1000 pbar2304
	@mkdir build/usr/include/ -p
	@mkdir build/usr/share/doc/pbar -p
	@cp src/include/pbar.h build/usr/include/
	@cp src/include/pbar.inc build/usr/include/
	@cp docs/api/pbar-lib.md build/usr/share/doc/pbar
	@cp example/pbar.c build/usr/share/doc/pbar

clean:
	rm tmp/src/*.o
	rm $(NAME_LIB).lib
	rm build/lib8/$(NAME_LIB).lib
	rmdir build/lib8/
	rm build/bin/pbar
	rmdir build/bin/


after_success:
	echo man not managed


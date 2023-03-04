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

all: $(SOURCES8) $(OBJECTS8) example after_success

$(OBJECTS8): $(SOURCES8)
	@mkdir build/lib8/ -p
	@mkdir tmp/src/ -p
	@$(AS) -ttelestrat $(@:.o=.s) -o tmp/$@ --include-dir src/include
	@$(AR) r $(NAME_LIB).lib  tmp/$@
	@cp $(NAME_LIB).lib build/lib8/

example:
	@mkdir build/bin/ -p
	@$(CC) -ttelestrat example/pbar.c build/lib8/pbar.lib -o build/bin/pbar

clean:
	rm src/*.o
	rm $(NAME_LIB).lib
	rm build/lib8/$(NAME_LIB).lib
	rm build/bin/pbar

after_success:
	echo man not managed


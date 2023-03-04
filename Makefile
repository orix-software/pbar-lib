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

all: $(SOURCES8) $(OBJECTS8) example

$(OBJECTS8): $(SOURCES8)
	@mkdir target/telestrat/lib/ -p
	@mkdir tmp/src/ -p
	@ca65 -ttelestrat $(@:.o=.s) -o tmp/$@ --include-dir src/include
	@ar65 r $(NAME_LIB).lib  tmp/$@
	@cp $(NAME_LIB).lib target/telestrat/lib/

example:
	@cl65 -ttelestrat example/pbar.c pbar.lib -o pbar

clean:
	rm src/*.o
	rm $(NAME_LIB).lib
	rm pbar



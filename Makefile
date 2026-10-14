# Mini-OS for Smart Emergency Response Center
# CS 225 - Copperbelt University
#
# Two targets:
#   make cli    -> serc_cli.exe   (console - what the assignment requires)
#   make gui    -> serc_gui.exe   (raylib dashboard - bonus)
#   make all    -> both
#
# Requires:  gcc (MSYS2 UCRT64 or MinGW) and raylib for the GUI.

CC      := gcc
CFLAGS  := -std=c11 -Wall -Wextra -O2 -Iinclude
LDFLAGS := -lm

# raylib + Windows GUI link flags (only used for serc_gui.exe)
GUI_LIBS := -lraylib -lopengl32 -lgdi32 -lwinmm

CORE_SRC := src/pcb.c src/scheduler.c src/memory.c src/ipc.c \
            src/deadlock.c src/logger.c
CORE_OBJ := $(CORE_SRC:.c=.o)

.PHONY: all cli gui clean run-cli run-gui

all: cli gui

cli: serc_cli.exe
gui: serc_gui.exe

serc_cli.exe: $(CORE_OBJ) src/main_cli.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

serc_gui.exe: $(CORE_OBJ) src/main_gui.o
	$(CC) $(CFLAGS) -o $@ $^ $(GUI_LIBS) $(LDFLAGS)

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

run-cli: cli
	./serc_cli.exe

run-gui: gui
	./serc_gui.exe

clean:
	-rm -f src/*.o serc_cli.exe serc_gui.exe

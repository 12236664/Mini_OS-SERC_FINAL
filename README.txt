================================================================
   Mini-OS for the Smart Emergency Response Centre (SERC)
   Copperbelt University - CS 225 - Assignment 1
================================================================

WHAT THIS IS
------------
A mini operating-system simulator written in C. The same engine
runs through two front-ends:

  serc_cli.exe   - interactive console menu (the graded artefact)
  serc_gui.exe   - graphical dashboard built with raylib (bonus)

It implements six OS components - the brief required four:
  1. Process management (PCB, states)
  2. CPU scheduling     (FCFS, SJF, Priority, Round Robin)
  3. Memory management  (First / Best / Worst fit, fragmentation)
  4. Inter-process communication (message queue + shared page)
  5. Deadlock avoidance (Banker's algorithm)
  6. File logging       (logs/serc.log)


HOW TO RUN (no compiling required)
----------------------------------
Both .exe files in this folder are ready to run.

  serc_cli.exe         double-click, or run from a terminal
  serc_gui.exe         double-click - opens the dashboard

The first thing to do in the CLI is press 9 to load the demo
workload of 5 emergency tasks. Then try option 4 -> 5 to compare
all four schedulers, or 7 to play with Banker's algorithm.

The GUI seeds the demo workload automatically. The top-right
buttons are:
  Seed demo      reset and load the 5-task demo
  Add task       create one extra random emergency task
  Reset system   wipe everything


HOW TO REBUILD FROM SOURCE
--------------------------
Requirements (Windows):
  - MSYS2 (https://www.msys2.org) with the UCRT64 environment
  - The following pacman packages:
      pacman -S mingw-w64-ucrt-x86_64-gcc \
                mingw-w64-ucrt-x86_64-raylib

Once installed, double-click build.bat in this folder.
Or, from a terminal:
  make all

That produces both serc_cli.exe and serc_gui.exe.


FILES YOU CAN SHARE
-------------------
Just zip the whole MiniOS-SERC folder. It is self-contained:
  - source code (src/, include/)
  - both .exe files
  - libraylib.dll and glfw3.dll (raylib runtime)
  - docs/Technical_Report.docx
  - docs/Presentation.pptx
  - screenshots/
  - this README


DEMO SCRIPT FOR THE PRESENTATION
--------------------------------
1. Open serc_gui.exe.
2. Dashboard tab: show stat cards and the process table.
3. Scheduler tab: click each algorithm + RUN, compare numbers.
4. Memory tab: point out the partition strip and fragmentation.
5. Deadlock tab: show the safe sequence at the top.
6. Log tab: show events streaming from logs/serc.log.
7. Drop to serc_cli.exe; option 9, then 4 -> 5, then 7 to show
   the same engine in console form.


CONTACT
-------
Group members: see docs/Technical_Report.docx cover page.

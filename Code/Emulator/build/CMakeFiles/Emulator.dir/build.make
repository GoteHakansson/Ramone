# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/eanbarda/projects/groupProject/Ramone/Code/Emulator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build

# Include any dependencies generated for this target.
include CMakeFiles/Emulator.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Emulator.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Emulator.dir/flags.make

CMakeFiles/Emulator.dir/main.cpp.o: CMakeFiles/Emulator.dir/flags.make
CMakeFiles/Emulator.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Emulator.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Emulator.dir/main.cpp.o -c /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/main.cpp

CMakeFiles/Emulator.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Emulator.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/main.cpp > CMakeFiles/Emulator.dir/main.cpp.i

CMakeFiles/Emulator.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Emulator.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/main.cpp -o CMakeFiles/Emulator.dir/main.cpp.s

CMakeFiles/Emulator.dir/src/emulator.cpp.o: CMakeFiles/Emulator.dir/flags.make
CMakeFiles/Emulator.dir/src/emulator.cpp.o: ../src/emulator.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Emulator.dir/src/emulator.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Emulator.dir/src/emulator.cpp.o -c /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/src/emulator.cpp

CMakeFiles/Emulator.dir/src/emulator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Emulator.dir/src/emulator.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/src/emulator.cpp > CMakeFiles/Emulator.dir/src/emulator.cpp.i

CMakeFiles/Emulator.dir/src/emulator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Emulator.dir/src/emulator.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/src/emulator.cpp -o CMakeFiles/Emulator.dir/src/emulator.cpp.s

CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.o: CMakeFiles/Emulator.dir/flags.make
CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.o: /home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.o -c /home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp

CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp > CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.i

CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp -o CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.s

# Object files for target Emulator
Emulator_OBJECTS = \
"CMakeFiles/Emulator.dir/main.cpp.o" \
"CMakeFiles/Emulator.dir/src/emulator.cpp.o" \
"CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.o"

# External object files for target Emulator
Emulator_EXTERNAL_OBJECTS =

Emulator: CMakeFiles/Emulator.dir/main.cpp.o
Emulator: CMakeFiles/Emulator.dir/src/emulator.cpp.o
Emulator: CMakeFiles/Emulator.dir/home/eanbarda/projects/groupProject/Ramone/Code/libSocketCan/src/socketcan.cpp.o
Emulator: CMakeFiles/Emulator.dir/build.make
Emulator: CMakeFiles/Emulator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable Emulator"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Emulator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Emulator.dir/build: Emulator

.PHONY : CMakeFiles/Emulator.dir/build

CMakeFiles/Emulator.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Emulator.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Emulator.dir/clean

CMakeFiles/Emulator.dir/depend:
	cd /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/eanbarda/projects/groupProject/Ramone/Code/Emulator /home/eanbarda/projects/groupProject/Ramone/Code/Emulator /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build /home/eanbarda/projects/groupProject/Ramone/Code/Emulator/build/CMakeFiles/Emulator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Emulator.dir/depend


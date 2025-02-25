#
#             LUFA Library
#     Copyright (C) Dean Camera, 2014.
#
#  dean [at] fourwalledcubicle [dot] com
#           www.lufa-lib.org
#
# --------------------------------------
#         LUFA Project Makefile.
# --------------------------------------

# Run "make help" for target help.

MCU          = atmega16u2
ARCH         = AVR8
F_CPU        = 16000000
F_USB        = $(F_CPU)
OPTIMIZATION = s
TARGET       = Joystick
MODULES      = $(wildcard Modules/*.c)
SRC          = $(TARGET).c Descriptors.c $(LUFA_SRC_USB) $(MODULES)
LUFA_PATH    = ./lufa/LUFA
CC_FLAGS     = -DUSE_LUFA_CONFIG_HEADER -IConfig/
LD_FLAGS     =

# Default target
all:

# Include LUFA build script makefiles
include $(LUFA_PATH)/Build/lufa_core.mk
include $(LUFA_PATH)/Build/lufa_sources.mk
include $(LUFA_PATH)/Build/lufa_build.mk
include $(LUFA_PATH)/Build/lufa_cppcheck.mk
include $(LUFA_PATH)/Build/lufa_doxygen.mk
include $(LUFA_PATH)/Build/lufa_dfu.mk
include $(LUFA_PATH)/Build/lufa_hid.mk
include $(LUFA_PATH)/Build/lufa_avrdude.mk
include $(LUFA_PATH)/Build/lufa_atprogram.mk

# Repeat A Module
repeat-a: all
repeat-a: CC_FLAGS += -DREPEAT_A

# Loop Tournament Module
loop-tournament: all
loop-tournament: CC_FLAGS += -DLOOP_TOURNAMENT

# Release Pokemons Module
release-pokemons: all
release-pokemons: CC_FLAGS += -DRELEASE_POKEMONS

# Loop Battle Tower Module
loop-battle-tower: all
loop-battle-tower: CC_FLAGS += -DLOOP_BATTLE_TOWER
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
WAYBAR_CONFIG_SRC = config.jsonc style.css
WAYBAR_INSTALL_DIR := $(HOME)/.config/waybar
EXECUTABLES := swaymsg brightnessctl playerctl pulsemixer waybar cliphist
ROW := "%-15s|%-20s\n"

all: install

install:
	@if [ -d "$(WAYBAR_INSTALL_DIR)" ]; then echo "$(WAYBAR_INSTALL_DIR) already exists"; exit 1; fi
	mkdir -p $(WAYBAR_INSTALL_DIR) && cp -r $(WAYBAR_CONFIG_SRC) $(WAYBAR_INSTALL_DIR)

check:
	for exec in $(EXECUTABLES); do which $$exec > /dev/null 2>/dev/null && printf $(ROW) "$$exec" "Found" || printf $(ROW) "$$exec" "Not found"; done

clean:
	rm -rf $(WAYBAR_INSTALL_DIR)


.PHONY: check
.SILENT: check


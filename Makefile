.PHONY: all clean

CA65 := ca65
LD65 := ld65
MKDIR := mkdir

OUT_DIR := build

CFG := common.cfg

TARGET := $(OUT_DIR)/music0.nes

all: $(TARGET)

$(OUT_DIR)/%.nes: $(OUT_DIR)/%.o $(OUT_DIR)/ines_header.o | $(OUT_DIR)/.
	$(LD65) --config $(CFG) -o $@ $^

$(OUT_DIR)/%.o: %.s65 common.s65 | $(OUT_DIR)/.
	$(CA65) -o $@ $<

$(OUT_DIR)/.:
	$(MKDIR) -p $@

clean:
	-$(RM) -r $(OUT_DIR)

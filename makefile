ROOT := $(shell pwd)
BUILD	:= $(ROOT)/build

PROC ?= 8
ECHO := @echo

QTROOT := $(ROOT)/ext/qt6
QTPATH := $(ROOT)/tools/qt6
QTMAKE := $(QTPATH)/bin/qmake
QTOOLS := $(QTMAKE)

qtest: $(QTMAKE)
	@$(QTMAKE) --help

$(QTOOLS): | $(BUILD)/Makefile
	$(ECHO) Compiling QT6...
	@cd $(BUILD); cmake --build . --parallel $(PROC);\
		mkdir -p $(QTPATH); cmake --install .

$(BUILD)/Makefile:
	$(ECHO) Configuring QT6...
	@cd $(QTROOT); perl init-repository;\
		mkdir -p $(BUILD); cd $(BUILD);\
		$(QTROOT)/configure -prefix $(QTPATH);\

clean:
	rm -rf $(BUILD)


EMACS_DIR = $(HOME)/.config/emacs

all: emacs

emacs:
	mkdir -p $(EMACS_DIR)
	cp init.el $(EMACS_DIR)/init.el


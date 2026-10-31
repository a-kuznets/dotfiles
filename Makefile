.PHONY: all help symlink-mac check-lsp

all: symlink-mac

help:
	@echo "Available commands:"
	@echo "  make symlink-mac    # Symlink all components for mac"
	@echo "  make check-lsp      # Show which nvim language servers are installed"

symlink-mac:
	@ln -sfnv "$(PWD)/src/zsh/.zshrc"         "$(HOME)/.zshrc"
	@ln -sfnv "$(PWD)/src/vim/.vimrc"         "$(HOME)/.vimrc"
	@ln -sfnv "$(PWD)/src/tmux/.tmux.conf"    "$(HOME)/.tmux.conf"

	@mkdir -p "$(HOME)/.config"
	@ln -sfnv "$(PWD)/src/nvim/nvim"          "$(HOME)/.config/nvim"
	@ln -sfnv "$(PWD)/src/ghostty/ghostty"    "$(HOME)/.config/ghostty"

	@mkdir -p "$(HOME)/.local/bin"
	@ln -sfnv "$(PWD)/src/tmux/tscope.sh"     "$(HOME)/.local/bin/tscope"

check-lsp:
	@nvim -l "$(PWD)/src/nvim/check-lsp.lua"

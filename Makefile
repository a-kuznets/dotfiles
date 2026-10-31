.PHONY: all setup-mac symlink-mac install-mac help

all: setup-mac

help:
	@echo "Available commands:"
	@echo "  make symlink-mac    # Symlink all components for mac"

symlink-mac:
	@ln -sfnv "$(PWD)/src/zsh/.zshrc"         "$(HOME)/.zshrc"
	@ln -sfnv "$(PWD)/src/vim/.vimrc"         "$(HOME)/.vimrc"
	@ln -sfnv "$(PWD)/src/tmux/.tmux.conf"    "$(HOME)/.tmux.conf"

	@mkdir -p "$(HOME)/.config"
	@ln -sfnv "$(PWD)/src/nvim/nvim"          "$(HOME)/.config/nvim"
	@ln -sfnv "$(PWD)/src/ghostty/ghostty"    "$(HOME)/.config/ghostty"

	@mkdir -p "$(HOME)/.local/bin"
	@ln -sfnv "$(PWD)/src/tmux/tscope.sh"     "$(HOME)/.local/bin/tscope"


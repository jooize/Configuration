#!/bin/sh

# Should take first argument as dotfile directory

dotfiles="$HOME"/.dotfiles

install_prezto()
{
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$dotfiles"/.zprezto
	cd "$dotfiles"
	for rcfile in "$dotfiles"/.zprezto/runcoms/z*; do
		rcfilename=`basename $rcfile`
		ln -s "$rcfile" .$rcfilename
	done
}

symlink()
{
	cd "$HOME"
	for dotfile in "$dotfiles/.*"; do
		ln -s "$dotfile" "$destination/$dotfile"
	done
}

install()
{
	git clone git://github.com/jooize/Dotfiles.git "$dotfiles"
	install_prezto
	symlink
	git clone https://github.com/gmarik/vundle.git "$dotfiles"/.vim/bundle/vundle
	vim +BundleInstall +qall
}

case "$1" in
	'install')
		install
		;;
	'symlink')
		symlink
		;;
	*)
		echo "Usage: Dotfiles.sh <install|symlink>"
		;;
esac

if ! [ -t 0 ]; then
	install
fi

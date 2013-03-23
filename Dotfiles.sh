#!/bin/sh

destination="$HOME"
dotfiles="$HOME"/.dotfiles

install_prezto()
{
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$dotfiles"/.zprezto
	#cd "$dotfiles"
	#for rcfile in "$dotfiles"/.zprezto/runcoms/z*; do
		#rcfilename=`basename $rcfile`
		#ln -s "$rcfile" .$rcfilename
	#done
}

install_vundle()
{
	git clone https://github.com/gmarik/vundle.git "$dotfiles"/.vim/bundle/vundle
	vim +BundleInstall +qall
}

symlink()
{
	cd "$destination"
	for dotfile in "$dotfiles"/.*; do
		if [ "$dotfile" != "$dotfiles"/.git ]; then
			ln -s "$dotfile"
		fi
	done
}

download()
{
	git clone git://github.com/jooize/Dotfiles.git "$dotfiles"
}

install()
{
	install_prezto
	symlink
	install_vundle
}

case "$1" in
	'install')
		install
		;;
	'symlink')
		symlink
		;;
	*)
		if ! [ -t 0 ]; then
			# If script runs through pipe
			download
			install
		else
			echo "Usage: Dotfiles.sh <install|symlink>"
		fi
		;;
esac


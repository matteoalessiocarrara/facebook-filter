#!/bin/zsh
# questo script è per eseguire il merge fra un mio branch privato e master

echo "Ricordati di aggiornare la versione delle librerie, eventualmente"
echo
echo

git status

echo "Attenzione! Non ci devono essere file modificati. Seguira un git commit automatico. Continuare? [yn]"
read c

if [[ "$c" == "y" ]]
then
	# elimina il file .gitmodules
	rm .gitmodules

	# elimina le librerie gestite da submodules
	rm -r src/lib/htmlfbapi

	git commit -am "Eliminato .gitmodules e lib"
	
	# aggiunge le librerie come subtree
	git subtree add --prefix=src/lib/htmlfbapi https://github.com/matteoalessiocarrara/HTML-Facebook-API v4.0.0 --squash

else
	echo "Annullato"
fi



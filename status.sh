#!/bin/bash
<<alias
if ! grep -q sniff "$HOME/.bash_profile"; then

echo "alias sniff='curl -w \"@/path/to/sniff.txt\" -o /dev/null -O --remote-name --remote-header-name -s'" >> ~/.bash_profile
	source  ~/.bash_profile

fi
alias
alias sniff='curl -w "./sniff.txt" -o /dev/null -O --remote-name --remote-header-name -s'
sniff google.com

#!/bin/zsh

git-prompt(){
	git rev-parse 2> /dev/null && git status --porcelain -b | awk '
/^## / {
	branch = $0;
	sub(/^## /, "", branch);
	sub(/\.\.\..*/, "", branch);

	if ($0 ~ /ahead /) {
		ahead = $0;
		sub(/.*ahead /,  "", ahead);
		sub(/\].*|, .*/, "", ahead);
	}

	if ($0 ~ /behind /) {
		behind = $0;
		sub(/.*behind /, "", behind);
		sub(/\].*|, .*/, "", behind);
	}

	m = 1;
}

m == 0 && /^\?\? /  { untracked++; m = 1; }
m == 0 && /^U. /    { conflicts++; m = 1; }
m == 0 && /^.U /    { conflicts++; m = 1; }
m == 0 && /^DD /    { conflicts++; m = 1; }
m == 0 && /^AA /    { conflicts++; m = 1; }
m == 0 && /^.M /    { changed++;          }
m == 0 && /^.D /    { changed++;          }
m == 0 && /^[^ ]. / { staged++;           }
m == 1              { m = 0;              }

END {
	printf("\033[1m%s\033[0m", branch);

	if (untracked) printf " \033[33m?\033[0m%d", untracked;
	if (conflicts) printf " \033[31m!\033[0m%d", conflicts;
	if (changed  ) printf " \033[32m+\033[0m%d", changed  ;
	if (staged   ) printf " \033[34m*\033[0m%d", staged   ;
	if (behind   ) printf " \033[31m↓\033[0m%d", behind   ;
    if (ahead    ) printf " \033[36m↑\033[0m%d", ahead    ;
	printf(" ");
}'
}

virtualenv_info(){
	[[ -n ${VIRTUAL_ENV} ]] || return
	echo "(%B%F{green}${VIRTUAL_ENV:t}%b) "
}

set-rprompt(){
	PROMPT="%{$fg_bold[red]%}%(?..%? )%B%F{blue}%n%b%f@%m %B%1~%b %% "
	SPROMPT="zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? "
}

add-zsh-hook precmd set-rprompt

alias l='ls -lah'
alias dir='ls -lah'
alias suid='sudo -s'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias df='df -h'
alias dmesg='dmesg -T'
export PAGER=less
export LESS="rMPMF< -->p< (q=Quit,f=Forward,u=Up,h=Help)>" #  less prompt
export EDITOR=vi

alias dspace-package='cd /yorkspace/source/DSpace && mvn -Denv=vagrant -U clean package'
alias dspace-update='cd /yorkspace/source/DSpace/dspace/target/dspace-installer && sudo -utomcat7 ant update && sudo service tomcat7 restart'

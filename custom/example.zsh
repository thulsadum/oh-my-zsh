# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

mkheader() {
FILE="$1"

[ -f $FILE ] && echo Warning file $FILE already exists! Skipping. && return

BASE="$(basename $FILE)"
GUARD="$(echo $BASE|tr '[:lower:].' '[:upper:]_')_INCLUDED"

cat > $FILE <<EOD
#ifndef $GUARD
#define $GUARD

/**
 * @file $BASE
 * @author Sebastian Claus <anthrax2k4@freenet.de>
 * @date $(date +%c) 
 * @brief
 *
 */

#endif //$GUARD
EOD

}

uni=$HOME/docs/Uni
cpp=$HOME/dev/c++
dev=$HOME/dev

export MAVEN_HOME=/opt/maven
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export GROOVY_HOME=/opt/groovy

export PATH="$HOME/.sys/bin:$PATH:$MAVEN_HOME/bin:$JAVA_HOME/bin:$GROOVY_HOME/bin"

export LC_MESSAGES=en_GB.UTF-8

export EDITOR=vim
export PAGER=less

export VIMTEMPLATE=$HOME/.vim/skel


alias eclipse="eclipse -vmargs -Xms512m -Xmx2g"
alias minecraft="java -Xms1g -Xmx4g -jar ~/minecraft.jar"
alias pacman='sudo pacman'
alias disp1='DISPLAY=:0.1 '
alias avra='avra -I $HOME/.avra/includes -I /usr/share/avra/includes'

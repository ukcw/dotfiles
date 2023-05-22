#if not set -q MY_ABBR_SET
set -U MY_ABBR_SET true
abbr -a vim nvim
abbr -a e nvim
abbr -a mkdir "mkdir -p"
abbr -a g git
abbr -a gs "git status"
#end

# helpers to set Java version
#alias j18="export JAVA_HOME=`/usr/libexec/java_home -v 18`; java -version"
#alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"

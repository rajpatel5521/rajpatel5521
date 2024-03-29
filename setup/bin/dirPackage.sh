
export CDPATH=.:~

declare -a dirStack

function pd() {
  local len=${#dirStack[@]}
  local p=$(pwd)
  while [ $len -gt 0 ]; do
    local s=${dirStack[$len]}
    if [  "$p" = "$s"  ]; then
      break
    fi
    let len=len-1
  done
  if [ $len -eq 0 ]; then
    local len=${#dirStack[@]}
    let len=len+1
    dirStack[$len]=$(pwd)
    chdir $1
  fi
}

function pr() {
  local len=${#dirStack[@]}
  while [ $len -gt 0 ]; do
    echo $len ${dirStack[$len]}
    let len=len-1
  done
}

installDir() {
  local dirStack=$1
  local len=0
  cat $DIR_LIST | while read d
  do
    dirStack[$len]=$d
    let len=len+1
  done
}
}

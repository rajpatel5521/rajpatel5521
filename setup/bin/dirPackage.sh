
export CDPATH=.:~

declare -a dirStack

function pd() {
  local len=${#dirStack[@]}
  local p=$(pwd)
  while [ $len -gt 0 ]; do
    local s=$dirStack[$len]
    if [  "p" = "$s"  ]; then
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

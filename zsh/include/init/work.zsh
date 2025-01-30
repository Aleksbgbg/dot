ssh_light() {
  ssh -Y ${@:2} "$1" -t "tmx2 a || tmx2"
}

ssh_full() {
  gcert
  ssh_light "$1" ${@:2}
}

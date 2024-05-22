ssh_light() {
  ssh "$1" -t "tmx2 a || tmx"
}

ssh_full() {
  gcert
  ssh_light "$1"
}

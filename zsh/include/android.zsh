adb_configure() {
  adb root
  adb shell vdc checkpoint commitChanges
  adb remount
  adb shell setenforce 0
}

adb_four_corner_exit() {
  adb root
  adb shell am start -a com.android.setupwizard.FOUR_CORNER_EXIT
}

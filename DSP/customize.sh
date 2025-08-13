SKIPUNZIP=0

print_modname() {
	ui_print "*********************************"
	ui_print "-      xaga/rubens 音频优化"
	ui_print "*********************************"
	ui_print "- 默认为监听调音"
	ui_print "- 选择人声将启用音量调节器"
	ui_print "*********************************"
}

set_permissions() {
	set_perm_recursive $MODPATH 0 0 0755 0644
	set_perm_recursive $MODPATH/system/system_ext/etc 0 0 0755 0644
	set_perm_recursive $MODPATH/system/vendor/etc 0 0 0755 0644 u:object_r:vendor_configs_file:s0
}

print_modname
set_permissions

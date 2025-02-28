SKIPUNZIP=0

print_modname() {
	ui_print "*********************************"
	ui_print "-      HLMC的xaga音效v2"
	ui_print "*********************************"
	ui_print "- 场景选择视频"
	ui_print "*********************************"
}

set_permissions() {
	set_perm_recursive $MODPATH 0 0 0755 0644
}

install_pangu_fix() {
	if [ $MAGISK_VER_CODE -ge 26000 ]; then
		rm -rf $MODPATH/modules/pangu_fix.zip
		return
	fi

	ui_print "- 是否安装盘古修复"
	ui_print "- 此模块可以修复MIUI14的NFC及Joyose无响应等问题"
	ui_print "- 若您不需要或已安装其他修复模块，请取消安装，谨慎操作❗❗❗"
	ui_print "- 单击音量上键即可确认安装"
	ui_print "- 单击音量下键取消安装"

	while [ "$key_click" = "" ]; do
		key_click=$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')
		sleep 0.2
	done

	case $key_click in
	KEY_VOLUMEUP)
		magisk --install-module $MODPATH/modules/pangu_fix.zip
		ui_print "- 已安装 pangu_fix。"
		;;
	*)
		ui_print "- 已取消安装 pangu_fix。"
		;;
	esac

	rm -rf $MODPATH/modules/pangu_fix.zip
}

if [ $KSU ]; then
    ui_print "- 目前由于 KSU 挂载权限不足，模块无法正常生效。"
    ui_print "- 已为您取消安装。"
    abort
fi

print_modname
set_permissions
#install_pangu_fix
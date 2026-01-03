#!/bin/bash

OUTPUT="HDMI-A-1"

# === 步骤 1: 获取最纯净的数据 ===
# sed 's/\x1b\[[0-9;]*m//g' : 这句咒语专门用来删除所有的颜色代码
# 这样 002 就会变回干净的 2
CURRENT_ROTATION=$(kscreen-doctor -o | sed 's/\x1b\[[0-9;]*m//g' | sed -n "/$OUTPUT/,/Output:/p" | grep "Rotation" | awk '{print $2}')

# === 步骤 2: 判断 ===
# 我们使用 -eq (等于)，这是数学比较
# 即使 CURRENT_ROTATION 是 "002"，bash 也会认为它等于 2
if [[ "$CURRENT_ROTATION" -eq 2 ]]; then
    # 当前是竖屏(2)，切换回横屏
    kscreen-doctor output.$OUTPUT.rotation.none
elif [[ "$CURRENT_ROTATION" -eq 8 ]]; then
    # 当前是右竖屏(8)，切换回横屏
    kscreen-doctor output.$OUTPUT.rotation.none
else
    # 其他情况(1 或 0 或 空)，切换为左竖屏
    kscreen-doctor output.$OUTPUT.rotation.left
fi

# fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx

xrdb -m ~/.Xresources
exec i3

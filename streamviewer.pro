QT -= gui
CONFIG += c++11 console
CONFIG -= app_bundle
TARGET	= streamviewer

#include( ../../common.pri )

contains(QT_CONFIG, opengl): QT += opengl
QT += sql svg
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TRANSLATIONS = res/player_zh_CN.ts res/player.ts

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += $$files(src/*.h)
SOURCES += $$files(src/*.cpp)

win32:CONFIG(release, debug|release): LIBS += -L/usr/lib/x86_64-linux-gnu/release/ -lQt5AV -lQt5AVWidgets
else:win32:CONFIG(debug, debug|release): LIBS += -L/usr/lib/x86_64-linux-gnu/debug/ -lQt5AV -lQt5AVWidgets
else:unix: LIBS += -L/usr/lib/x86_64-linux-gnu/ -lQt5AV -lQt5AVWidgets #-lQt5Svg -lQt5OpenGL -lQt5Widgets -lQt5Gui -lQt5Sql -lQt5Core -lGL -lpthread

QT5INCLUDEPATH = /usr/include/x86_64-linux-gnu/qt5

INCLUDEPATH += $$QT5INCLUDEPATH/QtAVWidgets
DEPENDPATH += $$QT5INCLUDEPATH/QtAVWidgets

tv.files = res/tv.ini

RESOURCES += res/player.qrc \
    theme/theme.qrc

DISTFILES += \
    res/help-zh_CN.html \
    res/help.html \
    res/player_zh_CN.qm \
    res/tv.ini

#INCLUDEPATH += $$QT5INCLUDEPATH
#DEPENDPATH += $$QT5INCLUDEPATH

#INCLUDEPATH += $$QT5INCLUDEPATH/QtGui
#DEPENDPATH += $$QT5INCLUDEPATH/QtGui

#INCLUDEPATH += $$QT5INCLUDEPATH/QtSql
#DEPENDPATH += $$QT5INCLUDEPATH/QtSql

#INCLUDEPATH += $$QT5INCLUDEPATH/QtCore
#DEPENDPATH += $$QT5INCLUDEPATH/QtCore

#INCLUDEPATH += $$QT5INCLUDEPATH/QtSvg
#DEPENDPATH += $$QT5INCLUDEPATH/QtSvg

#INCLUDEPATH += $$QT5INCLUDEPATH/QtOpenGL
#DEPENDPATH += $$QT5INCLUDEPATH/QtOpenGL

#INCLUDEPATH += $$QT5INCLUDEPATH/QtWidgets
#DEPENDPATH += $$QT5INCLUDEPATH/QtWidgets

#INCLUDEPATH += $$QT5INCLUDEPATH/Qt5Gui
#DEPENDPATH += $$QT5INCLUDEPATH/Qt5Gui

#INCLUDEPATH += $$QT5INCLUDEPATH/Qt5Widgets
#DEPENDPATH += $$QT5INCLUDEPATH/Qt5Widgets

#INCLUDEPATH += $$QT5INCLUDEPATH/Qt5Core
#DEPENDPATH += $$QT5INCLUDEPATH/Qt5Core


#STATICLINK=1

#unix:!android:!mac {
##debian
#player_bins = streamviewer
#DEB_INSTALL_LIST = $$join(player_bins, \\n.$$[QT_INSTALL_BINS]/, .$$[QT_INSTALL_BINS]/)
##DEB_INSTALL_LIST *= \
##            usr/share/applications/Player.desktop \
##            usr/share/applications/QMLPlayer.desktop \
##            usr/share/icons/hicolor/scalable/apps/QtAV.svg
##deb_install_list.target = qtav-players.install
#deb_install_list.commands = echo \"$$join(DEB_INSTALL_LIST, \\n)\" >$$PROJECTROOT/debian/$${deb_install_list.target}
#QMAKE_EXTRA_TARGETS += deb_install_list
#target.depends *= $${deb_install_list.target}

#qtav_players_links.target = qtav-players.links
#qtav_players_links.commands = echo \"$$[QT_INSTALL_BINS]/Player /usr/bin/Player\n$$[QT_INSTALL_BINS]/QMLPlayer /usr/bin/QMLPlayer\" >$$PROJECTROOT/debian/$${qtav_players_links.target}
#QMAKE_EXTRA_TARGETS *= qtav_players_links
#target.depends *= $${qtav_players_links.target}
#}

#BIN_INSTALLS += tv
#target.path = $$[QT_INSTALL_BINS]

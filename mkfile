</$objtype/mkfile

LIB=liblua.a
#BIN=lua
#compiled in mkfile_bin

OFILES=\
    onelua$O \
    
    
HFILES=\
	/sys/include/ape/lauxlib.h \
    /sys/include/ape/lua.h \
    /sys/include/ape/luaconf.h \
    /sys/include/ape/lualib.h 

	
UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\
	${LIB:/$objtype/%=/386/%}\

</sys/src/cmd/mksyslib

CC=pcc
LD=pcc
CFLAGS= -c -I. -D_C99_SNPRINTF_EXTENSION -D_POSIX_SOURCE \
        -D_SUSV2_SOURCE -DLUA_POSIX -DENABLE_CJSON_GLOBAL \
        -DMAKE_LIB

%.$O: %.c
	$CC $CFLAGS $stem.c

install:V:
    cp liblua.a /$objtype/lib/ape/liblua.a
	cp lauxlib.h /sys/include/ape/lauxlib.h
    cp lua.h /sys/include/ape/lua.h
    cp luaconf.h /sys/include/ape/luaconf.h
    cp lualib.h /sys/include/ape/lualib.h 
    rm -f onelua.$O
    @{
		mk -f mkfile_bin install
	}

clean:V:
	rm -f *.[$OS]

nuke:V:
	rm -f $LIB
	rm -f /$objtype/lib/ape/liblua.a
	rm -f $HFILES
    @{
		mk -f mkfile_bin nuke
	}

# This way everything works as expected ever for
# `make -C /path/to/project` or
# `make -f /path/to/project/Makefile`.
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_DIR := $(patsubst %/,%,$(dir $(MAKEFILE_PATH)))

PREFIX ?= /usr
PREFIX_MAN = ${PREFIX}/share/man

MANPAGE_FILES  = man3/lua_Alloc.3
MANPAGE_FILES += man3/lua_atpanic.3
MANPAGE_FILES += man3/lua_call.3
MANPAGE_FILES += man3/lua_CFunction.3
MANPAGE_FILES += man3/lua_checkstack.3
MANPAGE_FILES += man3/lua_close.3
MANPAGE_FILES += man3/lua_concat.3
MANPAGE_FILES += man3/lua_cpcall.3
MANPAGE_FILES += man3/lua_createtable.3
MANPAGE_FILES += man3/lua_Debug.3
MANPAGE_FILES += man3/lua_dump.3
MANPAGE_FILES += man3/lua_equal.3
MANPAGE_FILES += man3/lua_error.3
MANPAGE_FILES += man3/lua_gc.3
MANPAGE_FILES += man3/lua_getallocf.3
MANPAGE_FILES += man3/lua_getfenv.3
MANPAGE_FILES += man3/lua_getfield.3
MANPAGE_FILES += man3/lua_getglobal.3
MANPAGE_FILES += man3/lua_gethook.3
MANPAGE_FILES += man3/lua_gethookcount.3
MANPAGE_FILES += man3/lua_gethookmask.3
MANPAGE_FILES += man3/lua_getinfo.3
MANPAGE_FILES += man3/lua_getlocal.3
MANPAGE_FILES += man3/lua_getmetatable.3
MANPAGE_FILES += man3/lua_getstack.3
MANPAGE_FILES += man3/lua_gettable.3
MANPAGE_FILES += man3/lua_gettop.3
MANPAGE_FILES += man3/lua_getupvalue.3
MANPAGE_FILES += man3/lua_Hook.3
MANPAGE_FILES += man3/lua_insert.3
MANPAGE_FILES += man3/lua_Integer.3
MANPAGE_FILES += man3/lua_isboolean.3
MANPAGE_FILES += man3/lua_iscfunction.3
MANPAGE_FILES += man3/lua_isfunction.3
MANPAGE_FILES += man3/lua_islightuserdata.3
MANPAGE_FILES += man3/lua_isnil.3
MANPAGE_FILES += man3/lua_isnone.3
MANPAGE_FILES += man3/lua_isnoneornil.3
MANPAGE_FILES += man3/lua_isnumber.3
MANPAGE_FILES += man3/lua_isstring.3
MANPAGE_FILES += man3/lua_istable.3
MANPAGE_FILES += man3/lua_isthread.3
MANPAGE_FILES += man3/lua_isuserdata.3
MANPAGE_FILES += man3/lua_lessthan.3
MANPAGE_FILES += man3/lua_load.3
MANPAGE_FILES += man3/lua_newstate.3
MANPAGE_FILES += man3/lua_newtable.3
MANPAGE_FILES += man3/lua_newthread.3
MANPAGE_FILES += man3/lua_newuserdata.3
MANPAGE_FILES += man3/lua_next.3
MANPAGE_FILES += man3/lua_Number.3
MANPAGE_FILES += man3/lua_objlen.3
MANPAGE_FILES += man3/lua_pcall.3
MANPAGE_FILES += man3/lua_pop.3
MANPAGE_FILES += man3/lua_pushboolean.3
MANPAGE_FILES += man3/lua_pushcclosure.3
MANPAGE_FILES += man3/lua_pushcfunction.3
MANPAGE_FILES += man3/lua_pushfstring.3
MANPAGE_FILES += man3/lua_pushinteger.3
MANPAGE_FILES += man3/lua_pushlightuserdata.3
MANPAGE_FILES += man3/lua_pushliteral.3
MANPAGE_FILES += man3/lua_pushlstring.3
MANPAGE_FILES += man3/lua_pushnil.3
MANPAGE_FILES += man3/lua_pushnumber.3
MANPAGE_FILES += man3/lua_pushstring.3
MANPAGE_FILES += man3/lua_pushthread.3
MANPAGE_FILES += man3/lua_pushvalue.3
MANPAGE_FILES += man3/lua_pushvfstring.3
MANPAGE_FILES += man3/lua_rawequal.3
MANPAGE_FILES += man3/lua_rawget.3
MANPAGE_FILES += man3/lua_rawgeti.3
MANPAGE_FILES += man3/lua_rawset.3
MANPAGE_FILES += man3/lua_rawseti.3
MANPAGE_FILES += man3/lua_Reader.3
MANPAGE_FILES += man3/lua_register.3
MANPAGE_FILES += man3/lua_remove.3
MANPAGE_FILES += man3/lua_replace.3
MANPAGE_FILES += man3/lua_resume.3
MANPAGE_FILES += man3/lua_setallocf.3
MANPAGE_FILES += man3/lua_setfenv.3
MANPAGE_FILES += man3/lua_setfield.3
MANPAGE_FILES += man3/lua_setglobal.3
MANPAGE_FILES += man3/lua_sethook.3
MANPAGE_FILES += man3/lua_setlocal.3
MANPAGE_FILES += man3/lua_setmetatable.3
MANPAGE_FILES += man3/lua_settable.3
MANPAGE_FILES += man3/lua_settop.3
MANPAGE_FILES += man3/lua_setupvalue.3
MANPAGE_FILES += man3/lua_State.3
MANPAGE_FILES += man3/lua_status.3
MANPAGE_FILES += man3/lua_toboolean.3
MANPAGE_FILES += man3/lua_tocfunction.3
MANPAGE_FILES += man3/lua_tointeger.3
MANPAGE_FILES += man3/lua_tolstring.3
MANPAGE_FILES += man3/lua_tonumber.3
MANPAGE_FILES += man3/lua_topointer.3
MANPAGE_FILES += man3/lua_tostring.3
MANPAGE_FILES += man3/lua_tothread.3
MANPAGE_FILES += man3/lua_touserdata.3
MANPAGE_FILES += man3/lua_type.3
MANPAGE_FILES += man3/lua_typename.3
MANPAGE_FILES += man3/lua_Writer.3
MANPAGE_FILES += man3/lua_xmove.3
MANPAGE_FILES += man3/lua_yield.3

all: check

check: ${MANPAGE_FILES}
	@for m in ${MANPAGE_FILES}; do \
		mandoc -Tlint $$m -W error,style,unsupp,warning,stop; \
	done

install: ${MANPAGE_FILES}
	@mkdir -p ${PREFIX_MAN}/man3
	@for m in ${MANPAGE_FILES}; do \
		install $$m ${PREFIX_MAN}/man3/$$(basename $$m); \
	done

uninstall: ${MANPAGE_FILES}
	@for m in ${MANPAGE_FILES}; do \
		rm ${PREFIX_MAN}/man3/$$(basename $$m); \
	done

.PHONY: all check install uninstall

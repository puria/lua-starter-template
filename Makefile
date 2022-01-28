# SPDX-FileCopyrightText: 2022 2022 Puria Nafisi Azizi <puria@dyne.org>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

.PHONY: test local build lint clean

LUA_VERSION:=5.1
LUA_TREE:=lua_modules
MODULE:=lua-starter-template
ROCKS:=luarocks --lua-version=${LUA_VERSION} --tree=${LUA_TREE}
LUA_PATH:="$$(luarocks --lua-version=${LUA_VERSION} path --lr-path);;"
LUA_CPATH="$$(luarocks --lua-version=${LUA_VERSION} path --lr-cpath);;"
BIN:=${LUA_TREE}/bin


local: build
	${ROCKS} make --force --local ${MODULE}-dev-1.rockspec

deps:
	${ROCKS} install busted
	${ROCKS} install luacheck
	${ROCKS} install luacov
	python3 -m pip install --user pipx

build:
	${ROCKS} build
	# ${ROCKS} make ${MODULE}-dev-1.rockspec

test: luarocks build
	LUA_PATH=${LUA_PATH} LUA_CPATH=${LUA_CPATH} ${BIN}/busted spec

luarocks:
	luarocks init --lua-versions=${LUA_VERSION}
	eval $(luarocks --lua-version=${LUA_VERSION} path)

lint:
	pipx run reuse lint
	LUA_PATH=${LUA_PATH} LUA_CPATH=${LUA_CPATH} ${BIN}/luacheck .

clean:
	rm -rf ${LUA_TREE} lua luarocks .luarocks luacov.stats.out

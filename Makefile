
.PHONY: test local build lint clean

LUA_VERSION:=5.1
LUA_TREE:=lua_modules
MODULE:=lua-starter-template
ROCKS:=luarocks --lua-version=${LUA_VERSION} --tree=${LUA_TREE}

local: build
	${ROCKS} make --force --local ${MODULE}-dev-1.rockspec

deps:
	${ROCKS} install busted
	${ROCKS} install luacheck
	${ROCKS} install luacov

build:
	${ROCKS} build
	# ${ROCKS} make ${MODULE}-dev-1.rockspec

test: luarocks build
	LUA_PATH="$$(luarocks --lua-version=${LUA_VERSION} path --lr-path);;" LUA_CPATH="$$(luarocks --lua-version=${LUA_VERSION} path --lr-cpath);;" ${LUA_TREE}/bin/busted spec

luarocks:
	luarocks init --lua-versions=${LUA_VERSION}
	eval $(luarocks --lua-version=${LUA_VERSION} path)

lint:
	pipx run reuse lint
	luacheck .

clean:
	rm -rf ${LUA_TREE} lua luarocks .luarocks luacov.stats.out

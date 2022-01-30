# SPDX-FileCopyrightText: 2022 2022 Puria Nafisi Azizi <puria@dyne.org>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

LUA_VERSION:=5.1
LUA_TREE:=lua_modules
MODULE:=lua-starter-template
ROCKS:=luarocks --lua-version=${LUA_VERSION} --tree=${LUA_TREE}
LUA_PATH:="$$(luarocks --lua-version=${LUA_VERSION} path --lr-path);;"
LUA_CPATH="$$(luarocks --lua-version=${LUA_VERSION} path --lr-cpath);;"
BIN:=${LUA_TREE}/bin


.DEFAULT_GOAL := help
.PHONY: help
help: ## ℹ️ show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\n\033[36m%-15s\033[0m %s\n", $$1, $$2}'


.PHONY: deps
deps: ## 📦 install dependencies for development
	${ROCKS} install busted
	${ROCKS} install luacheck
	${ROCKS} install luacov
	python3 -m pip install --user pipx

.PHONY: build
build: ## 🛠️ build the package
	${ROCKS} build
	# ${ROCKS} make ${MODULE}-dev-1.rockspec

.PHONY: test
test: ## 🧪 run the uni tests with busted and luacov coverage
	@LUA_PATH=${LUA_PATH} LUA_CPATH=${LUA_CPATH} ${BIN}/busted
	@cat luacov.report.out

.PHONY: luarocks
luarocks: ## 🪨 install and setup a local tree of lua/luarocks
	luarocks init --lua-versions=${LUA_VERSION}
	eval $(luarocks --lua-version=${LUA_VERSION} path)

.PHONY: lint
lint: ## 🚨 execute luacheck and reuse tool license compliancy
	pipx run reuse lint
	LUA_PATH=${LUA_PATH} LUA_CPATH=${LUA_CPATH} ${BIN}/luacheck .

.PHONY: clean
clean: ## 🧹 clean build garbage
	rm -rf luacov.stats.out luacov.report.out

.PHONY: deepclean
deepclean: ## 💣 clean every thing
	rm -rf ${LUA_TREE} lua luarocks .luarocks luacov.stats.out luacov.report.out

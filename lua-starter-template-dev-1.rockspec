-- SPDX-FileCopyrightText: 2022 Puria Nafisi Azizi <puria@dyne.org>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

package = "lua-starter-template"
version = "dev-1"
source = {
   url = "https://github.com/puria/lua-starter-template"
}
description = {
   homepage = "https://github.com/puria/lua-starter-template",
   license = "AGPL-3"
}
build = {
   type = "builtin",
   modules = {
      ['lua-starter-template'] = "src/init.lua"
   }
}

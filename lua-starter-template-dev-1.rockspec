-- SPDX-FileCopyrightText: 2022 Puria Nafisi Azizi <puria@dyne.org>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

package = "lua-starter-template"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      starter = "src/init.lua"
   }
}

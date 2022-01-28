-- SPDX-FileCopyrightText: 2022 Puria Nafisi Azizi <puria@dyne.org>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

std = "min"
files["spec/"].std = "+busted"
include_files = {
    "src/**/*.lua",
    "spec/**/*.lua"
}

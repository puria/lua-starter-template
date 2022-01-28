-- SPDX-FileCopyrightText: 2022 2022 Puria Nafisi Azizi <puria@dyne.org>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

local m = require("starter")

describe("Busted unit testing framework", function()
  it("should work properly", function()
    assert.are.equals(m.hello(), 'world')
  end)
end)

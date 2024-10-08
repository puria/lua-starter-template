-- SPDX-FileCopyrightText: 2022 Puria Nafisi Azizi <puria@dyne.org>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

local M = {}

--- hello welcomes you.
-- It is a specialized operation on a string.
-- @return the most honest thing
function M.hello()
  return "world"
end

function M.bye()
  if 10 > 100 then
    print("I don't think this line will execute.")
  else
    print("Hello, LuaCov!")
  end
  print "bye"
end

return M

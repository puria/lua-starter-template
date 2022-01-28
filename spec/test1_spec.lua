local m = require("starter")

describe("Busted unit testing framework", function()
  it("should work properly", function()
    assert.are.equals(m.hello(), 'world')
  end)
end)

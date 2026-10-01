---@module 'luassert'

describe("GitHub search query", function()
  local search_query = require("snacks.gh.util").search_query

  it("converts label and issue type filters to GitHub qualifiers", function()
    assert.are.equal('label:"Bug"', search_query(":l(Bug)"))
    assert.are.equal('type:"Feature"', search_query(":t(Feature)"))
  end)

  it("preserves regular search terms and supports names with spaces", function()
    assert.are.equal(
      'crash label:"good first issue" type:"Bug"',
      search_query("crash :l(good first issue) :t(Bug)")
    )
  end)
end)

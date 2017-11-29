-- Show functions by shortybsd
local component = require("component")
local blah = component.blah -- change this

local str = {}
for x,y in pairs(blah) do
  table.insert(str,x)
end
table.sort(str)
str = table.concat(str,', ')
print(str)

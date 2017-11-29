-- Testing Inventory Controller
-- and reading HarvestCraft Apiary inv
-- by shortybsd

local comp = require("component")
local sides = require("sides")
local inv = comp.inventory_controller
local slots = 19
for i = 1,slots do
  local slot = inv.getStackInSlot(sides.down,i)
  if slot then
    print(i..". "..slot.name.." Qty: "..slot.size.." Dmg: "..slot.damage)
  else
    print(i..". Empty")
  end
end

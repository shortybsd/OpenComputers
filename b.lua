-- Designed and written by Todd S.
-- (shortybsd)

local component = require("component")
local robot = require("robot")
local str = {}
for x,y in pairs(robot) do
  table.insert(str,x)
end
table.sort(str)
str = table.concat(str,', ')
print(str)

function yellow()
  robot.setLightColor(0xFFFF00)
end

function blue()
  robot.setLightColor(0x0000FF)
end

function green()
  robot.setLightColor(0x00FF00)
end

function red()
  robot.setLightColor(0xFF0000)
end

function white()
  robot.setLightColor(0xFFFFFF)
end

-- this is my sleep command
-- so s(5) would sleep for 5 secs
function s(i)
  os.sleep(i)
end
function forward()
  robot.forward()
end
function back()
  robot.back()
end

function dropInv()
  for i = 1, robot.inventorySize() do
    robot.select(i)
    robot.dropDown()
  end
  robot.select(1)
end

print("Inventory Size: "..robot.inventorySize())
green()
yellow()
forward()
for i=1,19 do
  robot.suckDown()
end
yellow()
back()
red()
dropInv()
green()

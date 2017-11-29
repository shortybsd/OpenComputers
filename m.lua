-- Shorty's Robot Control Program
-- by shortybsd

local comp = require("component")
local r = require("robot")
local args = {...}
local direction = tostring(args[1])
local distance = tonumber(args[2])

-- Move Forward
if direction == "f" and distance then
  for i = 1, distance do
    r.forward()
  end
end

-- Move Backwards
if direction == "b" and distance then
  for i = 1, distance do
    r.back()
  end
end

-- Turn Left
if direction == "l" and distance then
  for i = 1, distance do
    r.turnLeft()
  end
end

-- Turn Right
if direction == "r" and distance then
  for i = 1, distance do
    r.turnRight()
  end
end

-- Move Up
if direction == "u" and distance then
  for i = 1, distance do
    r.up()
  end
end

-- Move Down
if direction == "d" and distance then
  for i = 1, distance do
    r.down()
  end
end

if tonumber(direction) then
  print("You cannot use a number for the first parameter!")
end
if direction and distance == nil then
  print("You need a number for the second parameter!")
end

if direction == nil and direction ~= nil then
  print("Usage: m [direction] [distance]")
end

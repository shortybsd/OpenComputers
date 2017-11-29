-- Todd's Battery Program - Ender Capacitor with progress bar
-- Created by: shortybsd

local comp = require("component")
local bank = comp.capacitor_bank
local gpu = comp.gpu
local colors = {
black = 0x00000, green = 0x000FF00, lightGray = 0xBBBBBB, white = 0xFFFFFF, blue = 0x00000FF
}
gpu.setResolution(100,32)
gpu.setBackground(colors.black)
gpu.fill(1,1,100,50," ")

while true do
  local w, h = gpu.getResolution()
  local se = bank.getEnergyStored()
  local te = bank.getMaxEnergyStored()
  local ePer = math.floor(se/te*100,2)
  local rfpt = math.floor(bank.getAverageChangePerTick())

  gpu.setBackground(colors.black)
  gpu.setForeground(colors.white)
  gpu.set(1,21,"       RF/tick: "..rfpt.."   ")
  gpu.set(1,22,"        Energy: "..se.."    ")
  gpu.set(1,23,"Energy Percent: "..ePer.."%     ")

  gpu.setBackground(colors.lightGray)
  gpu.fill(1, 25, 100, 2, " ")
  local curWidth = math.ceil(ePer * w/100)
  gpu.setBackground(colors.green)
  gpu.fill(1,25, curWidth, 2," ")
  gpu.setForeground(colors.white)
  gpu.setBackground(colors.black)
  os.sleep(0.5)
end

----------------------------------
-- Reactor program by shortybsd --
----------------------------------
local term = require("term")
local component = require("component")
local sides = require("sides")
local gpu = component.gpu

local rea = component.br_reactor
local tur = component.br_turbine
local battery = component.capacitor_bank
local stored = battery.getEnergyStored()
local max = battery.getMaxEnergyStored()
local per = stored/max*100

function myUptime(x)
  seconds = x
  --hours
  if x >=3600 then
    hours = math.floor(seconds/3600)
    seconds = seconds%3600
    minutes = math.floor(seconds/60)
    seconds = seconds%60
    return hours.."hr()s "..minutes.."min(s) "..seconds.."sec(s)"
  end

  --minutes
  if x >=60 and x <=3599 then
    minutes = math.floor(seconds/60)
    seconds = seconds%60
    return minutes.."min(s) "..seconds.."sec(s)"
  end

  -- seconds
  if x <=59 then
    return seconds.."sec(s)"
  end
end

-- resolution 80/25
gpu.setResolution(40,19)

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

local function checkOnline()
if rea.getActive("true") then
  status = "Online"
--  gpu.setBackground(0x00FF00)
  gpu.setForeground(0X00FF00)
else
  status = "Offline"
  gpu.setBackground(0x41414141)
  gpu.setForeground(0XFFFFFF)
end
end

term.clear()
ut = 0
while true do
  ut = ut+1
  local battery = component.capacitor_bank
  local stored = battery.getEnergyStored()
  local max = battery.getMaxEnergyStored()
  local per = round(stored/max*100,0)
  local energyProd = round(tur.getEnergyProducedLastTick(),0)
  local rotorSpeed = round(tur.getRotorSpeed(),1)
  local reaFuel = round(rea.getFuelAmount(),0)
  local reaFuelRea = round(rea.getFuelReactivity(),0)
  local reaFuelTemp = round(rea.getFuelTemperature(),0)

  checkOnline()
  --  term.clear()
  --term.clearLine()
  term.setCursor(1,1)
  print("--------- Turbine & Reactor --------                   ")
  term.setCursor(1,2)
  print("Turbine Rotor Speed:      "..rotorSpeed.."             ")
  term.setCursor(1,3)
  print("Turbine Energy Output:    "..energyProd.." RF          ")
  term.setCursor(1,4)
  print("Reactor Core Temperature: "..reaFuelTemp.." C          ")
  term.setCursor(1,5)
  print("Reactor Fuel Reactivity:  "..reaFuelRea.."%            ")
  term.setCursor(1,6)
  print("Reactor Fuel Amount:      "..reaFuel.."                ")
  term.setCursor(1,8)
  print("--------- Battery ------------------                   ")
  term.setCursor(1,9)
  print("Stored Energy: "..stored.." "..per.."%                 ")
  term.setCursor(1,11)
  print("------------------------------------                   ")
  term.setCursor(1,12)
  print("- Reactor Status:  "..status.."                        ")
  term.setCursor(1,13)
  print("Uptime: "..myUptime(ut).."                             ")
  term.setCursor(1,14)
  print("------------------------------------                   ")
  term.setCursor(1,15)
  print("Test Uptime: "..ut)
    if per >= 80 then
      rea.setActive(false)
    end
    if per <= 10 then
      rea.setActive(true)
    end
  os.sleep(1)
end

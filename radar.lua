-- Tape Player, Radar Autoplay when near
-- by shortybsd ... lol

local comp = require("component")
local tape = comp.tape_drive
tape.setVolume(1)

function isToddHere(val)
  local comp = require("component")
  local r = comp.radar
  local range = 5
  local players = r.getPlayers()
  for k,v in pairs(players) do
    if v["name"] == "shortybsd" then
      return true
    end
  end
  return false
end

while true do
  local comp = require("component")
  local cb = comp.chat_box  
  local tape = comp.tape_drive
  if isToddHere(true) then
    if tape.getState() == "STOPPED" then
      tape.seek(-tape.getSize())
      os.sleep(1)  
      cb.say("§5Welcome Todd you Tit pickle you ...")
      os.sleep(1)
      tape.play()
      os.sleep(1)
    end
  else
    tape.stop()
    os.sleep(1)      
  end    
os.sleep(0.1)
end

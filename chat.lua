-- Chat with Commands - Computronics
-- by shortybsd

local comp = require("component")
local cb = comp.chat_box
local event = require("event")
local int = require("internet")
local bank = comp.capacitor_bank
local gpu = comp.gpu
local rfpt = bank.getAverageOutputPerTick()
local es = bank.getEnergyStored()
local days = os.time()
local daysf = days*1000/60/60-6000
local daysp = daysf/24000
local colors = {
black = 0x000000, green = 0x00FF00, lightGray = 0xBBBBBB, white = 0xFFFFFF
}
gpu.setBackground(colors.black)
gpu.setForeground(colors.green)
gpu.fill(1,1,300,300," ")
gpu.set(1,30,"########## Commands ##########")
gpu.set(1,31,"!Time - Shows the time and how many Minecraft days since server was last restarted.")
gpu.set(1,32,"!rfpt - Shows the RF/t load on the capacitor.")
gpu.set(1,33,"!colors - Shows all the color codes as well as bold, italic, strikeout and a few others.")
cb.setName("§2ElementTech")
-- 3 username
-- 4 what they typed

while true do
  local ed = {event.pull()}
    if ed[1] == "chat_message" then
      --print(os.date(" %I %M %p"))
      --int.request("http://worldclockapi.com/api/json/cst/now")()
      print(os.date("Current time is: %X%p"))
      local fs = require("filesystem")
      local f = io.open("/home/chat.log","a")
      f:write(os.date("%I:%M%p ").." "..ed[3]..": "..ed[4].."\n")
      f:close()
      print(ed[3]..": "..ed[4])
    end
    if ed[4] == "hello" or ed[4]=="hi"  then
      cb.say("§4Hello there "..ed[3])
    end
    if ed[4]=="!colors" then
      cb.say("§00§11§22§33§44§55§66§77§88§99§aa§bb§cc§dd§ee§ff k=obfucated §kTEST§R,L=bold §Lbold text§r, M is strikethrough §Mstrike!§R,n=underline §Nunderline it!§R,o=italic §OItalics!§R and r=reset")
    end
    -- TIME command
    if ed[4]=="!time" then
      cb.say("§6Time in Minecraft is currently "..os.date("%I:%M %p"))
      cb.say("§6"..math.floor(daysp).." days have passed in Minecraft since last server restart.")
    end    
    if ed[4]=="!rfpt" then
      cb.say("Enery Stored: "..es.." RF/t: "..math.floor(rfpt))
    end
    if ed[4] == "shit pickle" or ed[4]=="SHIT PICKLE" or ed[4]=="Shit pickle" or ed[4]=="Shit Pickle" then
      cb.say("§2SHIT PICKLE §6DICK PICKLE §5TIT PICKLE §2SHIT PICKLE §6DICK PICKLE §5TIT PICKLE §2SHIT PICKLE §6DICK PICKLE §5TIT PICKLE")
    end
  os.sleep(0.1)
end

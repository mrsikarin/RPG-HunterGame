print('script_server:hello world')
require "script_server.player"

local cfg = Entity.GetCfg('myplugin/player1')

local function setStatus(player)
    player:setProp("damage",player:getValue("defaultDamage")+(player:getValue("str")*2))  
    player:setProp("defense",player:getValue("defaultDefense")+(player:getValue("vit")*2))
    player:setProp("maxVp",player:getValue("defaultmaxVp")+(player:getValue("int")*2))
end

PackageHandlers.registerServerHandler("SetStatusPlayer", function(player, packet)
  setStatus(player)
end)

PackageHandlers.registerServerHandler("refreshBar", function(player, packet)
  PackageHandlers.sendServerHandler(player,"refreshBar",{})
end)

--[[PackageHandlers.registerServerHandler("questUpdate", function(player, packet)
  PackageHandlers.sendServerHandler(player,"questUpdate",{})
end)]]--

Trigger.RegisterHandler(cfg, "ENTITY_ENTER", function(context)
  local player = context.obj1
  player:setValue("defaultDamage",player:prop("damage"))
  player:setValue("defaultDefense",player:prop("defense"))
  player:setValue("defaultmaxVp",player:prop("maxVp"))
  setStatus(player)
end)
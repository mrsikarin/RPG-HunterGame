print('script_client:hello world')
local status

World.Timer(10, function()
    --local guiMgr = GUIManager:Instance()
	local btn = UI:openWindow("Interface/btnAtk")
  status = UI:openWindow("Interface/playerUI")
  local tutorial = UI:openWindow("Interface/Tutorial")
  btn:btnControl(0)
  status:refreshBar()
  --status:questUpdate()
  local soundID = TdAudioEngine.Instance():play2dSound("asset/Sound/clouds-29191.mp3", true)
  TdAudioEngine:setSoundsVolume(soundID,1)
  print(soundID)
  
end)

PackageHandlers.registerClientHandler("changeItem",function(player,packet)
  local btn = UI:openWindow("Interface/btnAtk")  
  btn:btnControl(packet.index)
end)

PackageHandlers.registerClientHandler("takeDamage",function(player,packet)
  print("takeDamage")
  local window = UI:CreateGUIWindow("interface/damage")
  --PackageHandlers.sendClientHandler("CreatePopUp",{dmg = packet.dmg},function(...) end)
  
  local SceneUI = Instance.new("SceneUI", player.map.Root)
  window:setDmg(packet.dmg)
  SceneUI.Window = window
  SceneUI.LocalPosition = player:getPosition()
  local i = World.Timer(20, function()
    SceneUI:destroy()
  end)

end)

PackageHandlers.registerClientHandler("refreshBar",function(context)
    status:refreshBar()
end)

PackageHandlers.registerClientHandler("questUpdate",function(context)
    status:questUpdate()
end)

--[[
PackageHandlers.registerClientHandler("getExp",function(player,packet)
  local exp = packet.exp
  local curExp = player:getValue("exp")
  local level = player:getValue("level")
  local maxXp = level * 100
  --local status = UI:openWindow("playerUI")
  local levelup = false
  if curExp + exp >= maxXp then
    player:setValue("level",level+1)
    player:setValue("exp",(curExp + exp) - maxXp)
    player:setValue("point",player:getValue("point") + 4)
    --levelup = true
  else
    player:setValue("exp",curExp + exp)
  end
  --status:refreshBar()
  PackageHandlers.sendClientHandler("refreshBar",{},function(...) end)

  --return levelup
end)]]--

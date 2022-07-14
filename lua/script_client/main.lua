print('script_client:hello world')
local status
World.Timer(10, function()
    --local guiMgr = GUIManager:Instance()
	local window = UI:openWindow("Interface/btnAtk")
  status = UI:openWindow("Interface/playerUI")
  status:refreshBar()
  status:questUpdate()

  
end)

PackageHandlers.registerClientHandler("changeItem",function(player,packet)
  print(packet.index)
end)


PackageHandlers.registerClientHandler("refreshBar",function(context)
    status:refreshBar()
end)

PackageHandlers.registerClientHandler("questUpdate",function(context)
    status:questUpdate()
end)
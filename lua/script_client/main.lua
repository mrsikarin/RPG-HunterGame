print('script_client:hello world')
World.Timer(10, function()
    --local guiMgr = GUIManager:Instance()
	local window = UI:openWindow("Interface/btnAtk")
  
end)

PackageHandlers.registerClientHandler("changeItem",function(player,packet)
  print(packet.index)
end)
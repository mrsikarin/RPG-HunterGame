--You can use 'params.parameter name' to get the parameters defined in the node. 					
--For example, if a parameter named 'entity' is defined in the node, you can use 'params.entity' to get the value of the parameter.
local player = params.player
local questTitle = params.quest

local questPlayer = player:getValue("quest")
local status = UI:openWindow("playerUI")

if(questTitle == questPlayer.title) then
  questPlayer.progress = questPlayer.progress + 1

  if(questPlayer.progress >= questPlayer.task) then
    questPlayer.progress = questPlayer.task
    player:setValue("questStatus",true)
  end
  
  print(questPlayer.progress .. "/" .. questPlayer.task)
  
  player:setValue("quest",questPlayer)
  PackageHandlers.sendClientHandler("questUpdate",{},function(...) end)
end

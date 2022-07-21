local cfg = Entity.GetCfg("myplugin/player1")
Trigger.RegisterHandler(cfg, "HAND_ITEM_CHANGED", function(context)
    local entity = context.obj1                                             
    local newItem = context.item
    local oldItem = context.oldItem
    local index = 0
    print("Change")
    if newItem ~= nil then 
      if string.match(newItem:full_name(),"sword") then                        
        index = 1
      end     
    end
    PackageHandlers.sendServerHandler(entity,"changeItem",{index = index})
end)

Trigger.RegisterHandler(cfg, "ENTITY_ENTER", function(context)
  print("Player Enter Game!!!!!")
end)
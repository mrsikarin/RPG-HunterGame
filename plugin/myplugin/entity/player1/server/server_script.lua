PackageHandlers:Receive("GetReward", function(player,packet)
    player:addItem("myplugin/".."gold-coin",100,nil,"reward")
  end)
  local exp = params.exp
  local player = params.player
  local curExp = player:getValue("exp")
  local level = player:getValue("level")
  local maxXp = level * 100
  local status = UI:openWindow("playerUI")
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
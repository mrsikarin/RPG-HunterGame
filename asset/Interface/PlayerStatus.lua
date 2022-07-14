print("startup ui")

local point = Me:getValue("point")
local point_text = self:child("Point")

local upAtk = self:child("upAtk")
local upVit = self:child("upVit")
local upInt = self:child("upInt")
local upDex = self:child("upDex")

-- text

local tx_Str = self:child("txStr")
local tx_Vit = self:child("txVit")
local tx_Int = self:child("txInt")
local tx_Dex = self:child("txDex")
local tx_level = self:child("Text_level")

local tx_Atk = self:child("Atk_stat")
local tx_mana = self:child("mana_stat")
local tx_Def= self:child("Def_stat")
local tx_Haste= self:child("Haste_stat")
-- value
local str,vit,int,dex = Me:getValue("str"),Me:getValue("vit"),Me:getValue("int"),Me:getValue("dex")
local lv = Me:getValue("level")
local Atk,Def,Haste,mana= Me:prop("damage"),Me:prop("defense"),0,Me:getValue("defaultmaxVp")
--PackageHandlers.sendClientHandler("SetStatusPlayer",{atk=Atk,def=Def,haste=Haste,mana=mana},function(...) end)


upAtk.onMouseClick = function()
  if point > 0 then
    point = point - 1
    str = str+1
    
    self:refreshPoint() 
    --PackageHandlers.sendClientHandler("SetStatusPlayer",{},function(...) end)
  end
end

upVit.onMouseClick = function()
  if point > 0 then
    point = point - 1
    vit = vit+1

    self:refreshPoint() 
    
  end
end

upInt.onMouseClick = function()
  if point > 0 then
    point = point - 1
    int = int+1

    self:refreshPoint() 
  end
end

upDex.onMouseClick = function()
  if point > 0 then
    point = point - 1
    dex = dex+1

    self:refreshPoint() 
  end
end



function self:refreshPoint() 
  point_text:setText(point)
  Me:setValue("point",point)
  Me:setValue("str",str)
  Me:setValue("vit",vit)
  Me:setValue("dex",dex)
  Me:setValue("int",int)
  PackageHandlers.sendClientHandler("SetStatusPlayer",{},function(...) self:refreshStat() end)
end
function self:refreshStat()
  tx_Str:setText(str)
  tx_Vit:setText(vit)
  tx_Int:setText(int)
  tx_Dex:setText(dex)
  tx_level:setText(string.format("Level %s",lv))
  tx_Atk:setText(Me:prop("damage"))
  tx_mana:setText(Me:prop("maxVp"))
  tx_Def:setText(Me:prop("defense"))
  tx_Haste:setText(Haste)
  
end
self:refreshPoint()
self:refreshStat()
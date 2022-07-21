local closeBtn = self:child("CloseBtn")

local questBtn1 = self:child("QuestBtn1")
local questBtn2 = self:child("QuestBtn2")
local questBtn3 = self:child("QuestBtn3")
local questBtn4 = self:child("QuestBtn4")
local questBtn5 = self:child("QuestBtn5")

closeBtn.onMouseClick = function()
  UI:closeWindow(self)
end

questBtn1.onMouseClick = function()
  print("open1")
  Me:setValue("questNum",1,true)
  UI:openWindow("Interface/QuestInfo")
end

questBtn2.onMouseClick = function()
  print("open2")
  Me:setValue("questNum",2,true)
  UI:openWindow("Interface/QuestInfo")
end

questBtn3.onMouseClick = function()
  print("open3")
  Me:setValue("questNum",3,true)
  UI:openWindow("Interface/QuestInfo")
end

questBtn4.onMouseClick = function()
  print("open4")
  Me:setValue("questNum",4,true)
  UI:openWindow("Interface/QuestInfo")
end

questBtn5.onMouseClick = function()
  print("open5")
  Me:setValue("questNum",5,true)
  UI:openWindow("Interface/QuestInfo")
end

PackageHandlers.sendClientHandler("questUpdate",{},function(...) end)
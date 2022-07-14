local acceptBtn = self:child("AcceptBtn")
local submitBtn = self:child("SubmitBtn")
local closeBtn = self:child("CloseBtn")

local reward_txt = self:child("Reward_txt")
local detail_txt = self:child("Detail_txt")

local status = UI:openWindow("playerUI")

local quest = {
  title = "Kill pig",
  task = 1,
  progress = 0,
  reward = 10
  }

detail_txt:setText(quest.title)
reward_txt:setText(quest.reward.." bronze coins, ".. quest.reward * 30 .. " exp")



if(Me:getValue("questStatus") == false) then
  submitBtn.Visible = false
  submitBtn.Disabled = true
  acceptBtn.Visible = true
  acceptBtn.Disabled = false
else
  submitBtn.Visible = true
  submitBtn.Disabled = false
  acceptBtn.Visible = false
  acceptBtn.Disabled = true
end
  

acceptBtn.onMouseClick = function()
  Me:setValue("questStatus",false)
  Me:setValue("getQuest",true)
  Me:setValue("quest",quest)
  PackageHandlers.sendClientHandler("questUpdate",{},function(...) end)
  
  print(Me:getValue("getQuest"))
  print("Accept quest")
  UI:closeWindow(self)
end

submitBtn.onMouseClick = function()
  PackageHandlers:SendToServer("GetReward",{})
  Me:setValue("questStatus",false)
  Me:setValue("quest",{})
  Me:setValue("getQuest",false)
  PackageHandlers.sendClientHandler("questUpdate",{},function(...) end)
  
  print(Me:getValue("getQuest"))
  print("quest success")
  UI:closeWindow(self)
end

closeBtn.onMouseClick = function()
  UI:closeWindow(self)
end



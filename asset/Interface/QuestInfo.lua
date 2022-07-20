local acceptBtn = self:child("AcceptBtn")
local submitBtn = self:child("SubmitBtn")
local closeBtn = self:child("CloseBtn")

local reward_txt = self:child("Reward_txt")
local detail_txt = self:child("Detail_txt")

--local status = UI:openWindow("playerUI")

local questInfo = {
    {title = "Kill Pig",task = 100,progress = 0,reward = 100},
    {title = "Kill Turtle Mage",task = 100,progress = 0,reward = 100},
    {title = "Kill Toad",task = 100,progress = 0,reward = 100},
    {title = "Kill Skeleton Warrior",task = 100,progress = 0,reward = 100},
    {title = "Kill Boar",task = 1,progress = 0,reward = 100}
  }

local quest = questInfo[Me:getValue("questNum")]



--[[local quest = {
  title = "Kill pig",
  task = 100,
  progress = 0,
  reward = 100
  }]]--

detail_txt:setText("Task "..quest.title)
reward_txt:setText("Reward "..quest.reward.." coins")



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



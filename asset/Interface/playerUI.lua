print("startup ui")

local expbar = self:child("expbar")
local level = self:child("level")

local questDetail = self:child("detailTxt")
local questReward = self:child("rewardTxt")
local questUI = self:child("Quest")

local maxValue,curValue
function self:refreshBar()
  maxValue = Me:getValue("level") * 100
  curValue = Me:getValue("exp")
  level:setText(string.format("Lv.%s",Me:getValue("level")))
  expbar:setMaxValue(maxValue)
  expbar:setCurrentValue(curValue)

end

function self:questUpdate()
  if(Me:getValue("getQuest") == false) then
    questUI.Visible = false
  else
    local quest = Me:getValue("quest")
    questDetail:setText("Task: "..quest.title.." "..quest.progress.."/"..quest.task)
    --questReward:setText("Reward: "..quest.reward.." bronze coins & ".. quest.reward*30 .." exp")
  
    questUI.Visible = true
  end
end


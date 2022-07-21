print("startup ui")

local btnmelee = self:child("btn_melee")
local btnmagic = self:child("btn_magic")

function self:btnControl(index)
  if index == 1 then
    btnmelee.Visible = true
    btnmagic.Visible = false
  elseif index == 2 then
    btnmelee.Visible = false
    btnmagic.Visible = true
  else
    btnmelee.Visible = false
    btnmagic.Visible = false
  end
end


btnmelee.onMouseClick = function()
  Skill.Cast("myplugin/".."c-player-melee-normal",{}, Me)
end

btnmagic.onMouseClick = function()
  Skill.Cast("myplugin/".."c-player-magic-normal",{}, Me)
end
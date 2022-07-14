print("startup ui")

local btnmelee = self:child("btn_melee")
local btnmagic = self:child("btn_magic")

btnmelee.onMouseClick = function()
  Skill.Cast("myplugin/".."c-player-melee-normal",{}, Me)
end

btnmagic.onMouseClick = function()
  Skill.Cast("myplugin/".."c-player-magic-normal",{}, Me)
end
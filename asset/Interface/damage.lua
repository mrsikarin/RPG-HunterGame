print("startup ui")
local dmg = self:child("dmg")

function self:setDmg(d)
  dmg:setText(d)
end
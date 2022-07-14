local btn = self:child("Button")
btn.onMouseClick = function()
    print("Click atkBtn")
    PackageHandlers:SendToServer("magicAttack",{})
end
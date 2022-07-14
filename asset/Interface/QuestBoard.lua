local closeBtn = self:child("CloseBtn")

closeBtn.onMouseClick = function()
  UI:closeWindow(self)
end

PackageHandlers.sendClientHandler("questUpdate",{},function(...) end)
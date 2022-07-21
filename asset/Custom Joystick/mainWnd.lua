print("startup ui")
local blockman = Blockman:Instance()
local PointMaxDis = 70

---actionContral
function self:onOpen()
    local Point = self:child('Point')
    self.originPolePosX = Point:getXPosition()
    self.originPolePosY = Point:getYPosition()
    local rect = Point:getPixelPosition()
    local pixelSize = Point:getPixelSize()
    self.originPoleAbsPosX = rect.x + pixelSize.width / 2
    self.originPoleAbsPosY = rect.y + pixelSize.height / 2
end

function self:onPoleTouchMove(dx, dy)
    local fMaxDis = PointMaxDis
    local offX = dx - self.originPoleAbsPosX
    local offY = dy - self.originPoleAbsPosY
    local disSqr = offX * offX + offY * offY
    disSqr = disSqr ~= 0 and disSqr or 1
    if disSqr > fMaxDis * fMaxDis then
        local rate = math.sqrt(fMaxDis * fMaxDis / disSqr)
        offX = offX * rate
        offY = offY * rate
        disSqr = fMaxDis * fMaxDis
    end
    self:child('Point'):setXPosition({ self.originPolePosX[1], self.originPolePosX[2] + offX })
    self:child('Point'):setYPosition({ self.originPolePosY[1], self.originPolePosX[2] + offY })
    blockman.gameSettings.poleForward = -offY / math.sqrt(disSqr)
    blockman.gameSettings.poleStrafe = -offX / math.sqrt(disSqr)

end

function self:onPoleTouchUp()
    local Pole = self:child('Pole')
    Pole.MoveBg:setAlpha(0.75)
    Pole.Point:setXPosition(self.originPolePosX)
    Pole.Point:setYPosition(self.originPolePosY)
    blockman.gameSettings.poleForward = 0
    blockman.gameSettings.poleStrafe = 0
end

self:child('MoveArea').onMouseMove = function(instance, window, dx, dy)
    self:onPoleTouchMove(dx, dy)
end

self:child('MoveArea').onMouseButtonUp = function(instance, window, ...)
    self:onPoleTouchUp()
end

self:child('MoveArea').onMouseLeavesArea = function(instance, window, ...)
    self:onPoleTouchUp()
end


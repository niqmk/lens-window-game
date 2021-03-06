local Sprite = {}

function Sprite.new(filename,gridSizeX,gridSizeY)
    local self = newObject(Sprite)
    self.filename = filename
    self.image = love.graphics.newImage(filename)
    self.image:setFilter('nearest','nearest')
    self.quads = {}
    self.animations = {}
    self.gridWidth = gridSizeX
    self.gridHeight = gridSizeY
    for y = 0, self.image:getHeight()-gridSizeY,gridSizeY do
        for x = 0, self.image:getWidth()-gridSizeX,gridSizeX do
            self.quads[#self.quads + 1] = love.graphics.newQuad(x,y,gridSizeX,gridSizeY,self.image:getDimensions())
        end
    end
    return self
end

function Sprite:createAnimation(animName,startQuad,endQuad)
    self.animations[animName] = {
        first=startQuad,
        last=endQuad,
        name=animName
    }
end

return Sprite
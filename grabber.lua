require "vector"

GrabberClass = {}

function GrabberClass:new()
  local grabber = {}
  local metadata = {__index = GrabberClass}
  setmetatable(grabber, metadata)
  
  grabber.previousMousePos = nil
  grabber.currentMousePos = nil
  
  grabber.grabPos = nil
  
  -- NEW: we'll want to keep track of the object (ie. card) we're holding
  grabber.heldObject = nil
  
  return grabber
end

function GrabberClass:update(cards)
  self.currentMousePos = Vector(
    love.mouse.getX(),
    love.mouse.getY()
  )
  
  -- Click (just the first frame)
  if love.mouse.isDown(1) then
    if not self.heldObject then
      self:grab(cards)
    end
    
    if self.heldObject then
      self.heldObject.position = self.currentMousePos
    end
  end
  -- Release
  if not love.mouse.isDown(1) and self.grabPos ~= nil then
    self:release()
  end 
end

function GrabberClass:grab(cards)
  self.grabPos = self.currentMousePos
  
  for _, card in ipairs(cards) do
    if card.state == CARD_STATE.MOUSE_OVER then
      self.heldObject = card
      card.state = CARD_STATE.GRABBED
      break
    end
  end
end
function GrabberClass:release()
  --print("RELEASE - ")
  -- NEW: some more logic stubs here
  
  if self.heldObject == nil then -- we have nothing to release
    return
  end
  
  -- Checking is card is in illegal position
  -- return the heldObject to the grabPosition
  local isBadSpot =
    self.heldObject.position.x >= 0 and
    self.heldObject.position.x <= 50 and
    self.heldObject.position.y >= 0 and
    self.heldObject.position.y <= 50
    
    print(isBadSpot)
    
  if isBadSpot then
    print(self.grabPos.x)
    self.heldObject.position = self.grabPos
  else
    local releasePos = self.currentMousePos
    self.heldObject.position = releasePos
    self.grabPosition = nil
  end
  
  self.heldObject.state = CARD_STATE.IDLE-- it's no longer grabbed
  
  self.heldObject = nil
  self.grabPos = nil
end
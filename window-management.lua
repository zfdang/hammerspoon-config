-- change this settings for window animation
-- 0: disable animation
hs.window.animationDuration = 0.2


window = require "hs.window"
grid = require "hs.grid"
grid.setMargins('0, 0')

module = {}
local windowMeta = {}

function Cell(x, y, w, h)
  return hs.geometry(x, y, w, h)
end

-- Bind new method to windowMeta
function windowMeta.new()
  local self = setmetatable(windowMeta, {
    -- Treate table like a function
    -- Event listener when windowMeta() is called
    __call = function (cls, ...)
      return cls.new(...)
    end,
  })
  
  self.window = window.focusedWindow()
  self.screen = window.focusedWindow():screen()
  self.windowGrid = grid.get(self.window)
  self.screenGrid = grid.getGrid(self.screen)
  
  return self
end

module.maximizeWindow = function ()
  local this = windowMeta.new()
  hs.grid.maximizeWindow(this.window)
end

module.centerOnScreen = function ()
  local this = windowMeta.new()
  this.window:centerOnScreen(this.screen)
end

module.throwLeft = function ()
  local this = windowMeta.new()
  this.window:moveOneScreenWest()
end

module.throwRight = function ()
  local this = windowMeta.new()
  this.window:moveOneScreenEast()
end

module.leftHalf = function ()
  local this = windowMeta.new()
  local cell = Cell(0, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
  this.window.setShadows(true)
end

module.rightHalf = function ()
  local this = windowMeta.new()
  local cell = Cell(0.5 * this.screenGrid.w, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

module.topHalf = function ()
  local this = windowMeta.new()
  local cell = Cell(0, 0, this.screenGrid.w, 0.5 * this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

module.bottomHalf = function ()
  local this = windowMeta.new()
  local cell = Cell(0, 0.5 * this.screenGrid.h, this.screenGrid.w, 0.5 * this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

return module

--Emma Skovgaard

local Inventories = {}

--Makes a new inventory
--Note the limit is for number of items
function Inventories:new()
  local newObj = {
    items = {}
  }
  self.__index = self
  return setmetatable(newObj, self)
end

--Checks if you have a specific item in the inventory
function Inventories:check(item)
  if self.items[item] then
    if self.items[item] > 0 then
      return true
    else
      return false
    end
  else
    return false
  end
end

--Returns the count for an item
function Inventories:checkAmount(item)
  if self.items[item] then
    return self.items[item]
  else
    return 0
  end
end

--Adds a specificed amount of an item to an inventory
function Inventories:add(item,amount)
  if self.items[item] then
    self.items[item] = self.items[item] + amount
  else
    self.items[item] = amount
  end
end

--Takes a specificed amount of a certain item out of the inventory
--Won't work if you don't have enough of that item
function Inventories:take(item,amount)
  if self.items[item] then
    if self.items[item] - amount >= 0 then
      self.items[item] = self.items[item] - amount
    end
		if self.items[item] == 0 then
			self.items[item] = nil
		end
  end
end

--This sets a specific count for an item
--This overrides any item the player already has
function Inventories:setAmount(item,amount)
  self.items[item] = amount
end

--Useful for removing quest items
function Inventories:remove(item)
  self.items[item] = nil
end

--For loading inventories
function Inventories:setItems(table)
  self.items = table
end

--For saving inventories
function Inventories:getItems(table)
  return self.items
end

return Inventories

-- Types --
export type EnumItem = {
	Name: string,
	Value: number,
	EnumType: any,
}

type EnumNames = { string }

-- Modules --

local LIST_KEY, NAME_KEY = newproxy(), newproxy()

--[=[
	Defines the Enums class.
]=]
local Enums = {}
Enums.__index = Enums

--[=[
	Constructs a new Enum.

	--- 
	Example:

	```lua
	type Directions = {
		Up: EnumItem,
		Down: EnumItem,
		Left: EnumItem,
		Right: EnumItem
	}

	local Directions = Enums.new("Directions", {
		"Up",
		"Down",
		"Left",
		"Right",
	}) :: Directions

	local Upward = Directions.Up
	Upward.Name --> Returns "Up"
	Upward.Value --> Returns 1
	```
]=]
function Enums.new(name: string, enums: EnumNames)
	assert(type(name) == "string", "Name as a string required")
	assert(type(enums) == "table", "Enums as a table required")
	local self = {}
	self[LIST_KEY] = {}
	self[NAME_KEY] = name

	for i, enumName in ipairs(enums) do
		assert(type(enumName) == "string", "Enum name must be a string")
		
		local EnumItem = table.freeze({
			Name = enumName,
			Value = i,
			EnumType = self
		})

		self[enumName] = EnumItem
		table.insert(self[LIST_KEY], EnumItem)
	end
	return table.freeze(setmetatable(self, Enums))
end

--[=[
	Returns `true` if `obj` belongs to the Enums.

	---
	Example:

	```lua
	type Directions = {
		Up: EnumItem,
		Down: EnumItem,
		Left: EnumItem,
		Right: EnumItem
	}

	local Directions = Enums.new("Directions", {
		"Up",
		"Down",
		"Left",
		"Right",
	}) :: Directions

	Directions:from(Directions.Up) --> True
	```
]=]
function Enums:from(obj: any): boolean
	return type(obj) == "table" and obj.EnumType == self
end

--[=[
	Get the name of the enum.

	---
	Example:

	```lua
	local Directions = Enums.new("Directions", {
		"Up",
		"Down",
		"Left",
		"Right",
	})
	
	Directions:getName() --> returns "Directions"
	```
]=]
function Enums:getName(): string
	return self[NAME_KEY]
end

export type Enums = typeof(Enums.new(...))

return Enums
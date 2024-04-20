# ✨ Enums

Define a custom built Enum. Taken from `sleitnick` for modifications.

Install using wally: 

```toml
Enums = "shards-tech/enums@0.1.0"
```

Simple use of case:

```lua
type EnumItem = Enums.EnumItem
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
    "Right"
}) :: Directions

local Upward = Directions.Up
Directions:from(Upward) --> True!
```

Makes sure to use typecast for Intellesense.

## 📃 Documentation

Types:
```lua
export type EnumItem = {
	Name: string,
	Value: number,
	EnumType: any,
}

type EnumNames = { string }
```

1. Using `Enums.new(Name: string, EnumList: EnumNames)` returns a `table`

For example:

```lua
local Directions = Enums.new("Directions", {
    "Up",
    "Down",
    "Left",
    "Right"
})

local Upward = Directions.Up
```

1. Using `Enums:from(Object: any)` returns a `boolean`

For example:

```lua
local Directions = Enums.new("Directions", {
    "Up",
    "Down",
    "Left",
    "Right"
})

local Upward = Directions.Up
Directions:from(Upward) --> True, Upward is from Directions.
```

3. Using `Enums:getName()` returns a `string`
   
For example:

```lua
local Directions = Enums.new("Directions", {
    "Up",
    "Down",
    "Left",
    "Right"
})

Directions:getName() --> Returns "Directions"
```

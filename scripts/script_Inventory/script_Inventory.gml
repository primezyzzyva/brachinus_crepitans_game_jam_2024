// Script assets have changed for v2.3.0 see
// https://www.youtube.com/watch?v=3FGMKQ_8bIc
function Inventory2() constructor
{
	_inventory_items = [];
	
	item_set = function (_name, _quantity, _sprite, _usable = false)
	{
		array_push(_inventory_items,{name : _name, quantity: _quantity, sprite: _sprite, usable: _usable});
	}
	
	item_find = function(_name) 
	{
		for (var i = 0; i < array_length(_inventory_items); i++)
		{
			if (_name == _inventory_items[i].name)
			{
				return i;
			}
		}
	}
	
	item_add = function(_name, _quantity, _sprite, _usable)
	{
		var index = item_find(_name);
		
		if (index >= 0)
		{
			_inventory_items[index].quantity += _quantity;
		}
		else
		{
			item_set(_name, _quantity, _sprite, _usable);
		}
	}
	item_add_from_struct = function(_ingredient_struc)
	{
		var index = item_find(_ingredient_struc.name);
		
		if (index >= 0)
		{
			_inventory_items[index].quantity += _ingredient_struc.quantity;
		}
		else
		{
			item_set(_ingredient_struc.name, _ingredient_struc.quantity, _ingredient_struc.sprite, _ingredient_struc.usable);
		}
	}
	
	item_has = function(_name, _quantity)
	{
		var index = item_find(_name);
		
		if (index >= 0)
		{
			return _inventory_items[index].quantity >= _quantity;
		}
		return false;
	}
	
	item_subtract = function(_name, _quantity)
	{
		var index = item_find(_name);
		
		if (index >= 0)
		{
			if (item_has(_name, _quantity))
			{
				_inventory_items[index].quantity -= _quantity;
				
				if (_inventory_items[index].quantity <= 0)
				{
						item_remove(index);
				}
			}
		}
		return false;
	}
	
	item_remove = function(_index)
	{
		array_delete(_inventory_items, _index, 1);
	}
	
	item_get = function ()
	{
		return _inventory_items;
	}
	
	item_use = function(_sprite)
	{
		switch (_sprite)
		{
			case sprite_vial_white_cylinder: global.friends_with_ants = true; break;
			case sprite_vial_blue_cylinder: global.friends_with_pill_bugs = true; break;
			case sprite_vial_red_cylinder: global.friends_with_water_striders = true; break;
			case sprite_vial_yellow_cylinder: global.friends_with_wasps = true; break;
			case sprite_vial_purple_cylinder: global.friends_with_scorpions = true; break;
			case sprite_vial_yellow_round_long: global.game_won = true; break;
		}
				
		item_subtract(name_from_sprite_index(_sprite), 1);
	}
	
	to_string = function()
	{
		return json_stringify(_inventory_items);
	}
}
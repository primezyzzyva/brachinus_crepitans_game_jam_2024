// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Recipe(): Inventory2() constructor
{
	_recipes = [];
	
	
	recipe_find = function(_name)
	{
		for (var i = 0; i < array_length(_recipes); i++)
		{
			if (_name == _recipes[i].name)
			{
				return i;
			}
		}
	}
	
	recipe_add = function (_name, _requirement, _products, _sprite)
	{
		array_push(_recipes, {name: _name, requirements: _requirement, products: _products, sprite: _sprite});
	}
	
	recipe_has = function(_name)
	{
		var index = recipe_find(_name);
		var can_craft = false;
		
		if (index >= 0)
		{
			can_craft = true;
			
			for (var requirement_index = 0; requirement_index < array_length(_recipes[index].requirements); requirement_index++)
			{
				if (!item_has(_recipes[index].requirements[requirement_index].name, _recipes[index].requirements[requirement_index].quantity))
				{
					can_craft = false;
					break;
				}
			}
		}
		
		return can_craft;
	}
	
	recipe_craft = function(_name)
	{
		var index = recipe_find(_name);
		
		if (index >= 0)
		{
			if (recipe_has(_name))
			{
				for (var requirement_index = 0; requirement_index < array_length(_recipes[index].requirements); requirement_index++)
				{
					item_subtract(_recipes[index].requirements[requirement_index].name,
								  _recipes[index].requirements[requirement_index].quantity);
				}	
				
				for (var product_index = 0; product_index < array_length(_recipes[index].products); product_index++)
				{
					item_add(_recipes[index].products[product_index].name,
							 _recipes[index].products[product_index].quantity,
							 _recipes[index].products[product_index].sprite);
				}
			}
		}
	}
	
	recipe_get = function()
	{
		return _recipes;
	}
}
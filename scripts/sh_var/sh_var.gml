function sh_var(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 4
		return "Not enough arguments. Usage: var <instance(:index) or global> <variable> <value>";
	
	// get arguments
	var pretarget = args[1];
	var variable = args[2];
	var value = WCscr_allargs(args, 3);
	
	// resolve target
	var target_one = false; // only target one instance
	var target = noone;
	
	if pretarget == "global"
	{
		// global variable
		target_one = true;
		target = global;
	}
	else
	{
		var obj = WCscr_findobj(pretarget);
		if is_array(obj)
		{
			target = obj[0];
			target_one = obj[1];
		}
		else
			return obj;
	}
	if target == noone // target non existent
		return "Instance " + pretarget + " doesn't exist";
	
	// array index
	var arrind = -1;
	if string_pos("[", variable) > 0
	{
		arrind = [];
		var arraydet = 0;
		var arrind_find = "";
		var nonarrayvar = variable;
			
		for(var i = 1; i <= string_length(variable); i++)
		{
			var charat = string_char_at(variable, i);
			if arraydet == 0 or arraydet == 2
			{
				if charat == "["
				{
					if arraydet == 0
						nonarrayvar = string_copy(variable, 1, i - 1);
						
					arrind_find = "";
					arraydet = 1;
					
					continue;
				}
				else if arraydet == 2
					return "Malformed array index for \"" + variable + "\"";
			}
				
			if arraydet == 1
			{
				if charat == "]"
				{
					arraydet = 2;
					if string_digits(arrind_find) == arrind_find
						array_push(arrind, real(arrind_find));
					else
						return "The given array index for \"" + variable + "\" is not a valid number";
				}
				else
					arrind_find += charat;
			}
		}
		if array_length(arrind) == 0
			arrind = -1;
		else
			variable = nonarrayvar;
	}
		
	// variable exists
	var var_exists = false;
	if variable_instance_exists(target, variable)
	or (target == global && variable_global_exists(variable))
	or target == all
		var_exists = true;
	
	// prep function
	setvar = function(target, variable, value, arrind = -1)
	{
		// resolve value type
		value = WCscr_getvalue(value);
		var ret = value;
		
		if arrind != -1
		{
			if variable == "alarm" && target != global && is_real(value)
			{
				with target
					alarm[arrind[0]] = value;
				return value;
			}
			
			var arr = variable_instance_get(target, variable);
			if array_length(arrind) == 2
				arr[arrind[0]][arrind[1]] = value;
			else if array_length(arrind) == 3
				arr[arrind[0]][arrind[1]][arrind[2]] = value;
			else
				arr[arrind[0]] = value;
			
			value = arr;
		}
		variable_instance_set(target, variable, value);
		
		// handle frozen var
		for(var i = 0; i < ds_list_size(WC_frozen); i++)
		{
			var frozen = WC_frozen[|i];
			if target != global
			{
				with target
				{
					if instance_exists(frozen[0]) && frozen[0].id == target.id && frozen[1] == variable
						other.WC_frozen[|i][2] = value;
				}
			}
			else if frozen[0] == global && frozen[1] == variable
				WC_frozen[|i][2] = value;
		}
		return ret;
	}
	
	// set the variable
	var setval = value;
		
	if target_one
		setval = setvar(target, variable, value, arrind);
	else with target
		setval = other.setvar(self, variable, value, arrind);
	
	value = setval;
	
	// log
	if is_string(value)
		value = "string \"" + string(value) + "\"";
	if arrind != -1
	{
		variable = string(variable);
		for(i = 0; i < array_length(arrind); i++)
			variable += "[" + string(arrind[i]) + "]";
	}
		
	if target != global
	{
		obj = (target_one ? "object " : "objects ") + string(pretarget);
		if target == all
			obj = "all objects";
		
		return (var_exists ? "Set " : "Set new variable ") + string(variable) + " to " + string(value) + " in " + obj;
	}
	else
		return (var_exists ? "Set " : "Set new global variable ") + "global." + string(variable) + " to " + string(value);
}
function meta_var()
{
	return
	{
		description: "set a global or an instance's variable",
		arguments: ["instance", "variable", "value"],
		suggestions: [
			function()
			{
				var obj_array = [];
				for(var i = 0; i < instance_count; i++)
				{
					var inst = instance_find(all, i);
					if !instance_exists(inst)
						continue;
					var obj = inst.object_index;
					
					for(var j = 0; j < instance_number(obj); j++)
					{
						if instance_find(obj, j).id == inst.id
							array_push(obj_array, object_get_name(obj) + ":" + string(j));
					}
				}
				array_sort(obj_array, true);
				array_insert(obj_array, 0, "all");
				array_insert(obj_array, 0, "global");
				return obj_array;
			},
			[],
			[]
		],
		argumentDescriptions: [
			"either \"global\" or an instance",
			"the name of the variable that has to be set",
			"the value you want to set the variable to. if you want to force it to be a string, put apostrophes (') around it"
		],
	}
}

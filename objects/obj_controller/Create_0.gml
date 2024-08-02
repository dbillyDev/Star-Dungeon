/// @description Métodos
globalvar devMode; devMode = DEVMODE;

globalvar gp_id; gp_id = 0;
globalvar gp_deadzone; gp_deadzone = 0.25;

//Checando se tem um controle conectado
controller_input = function()	{
	//Criando uma variavel para checar o slots do gamepad
	var gamepad_slots = gamepad_get_device_count();
	
	for (var i = 0; i < gamepad_slots; i++)	{
		if (gamepad_is_connected(i))	{
			//Se tiver algum gamepad, então o gamepad vai ter o valor da entrada que ele está
			gp_id = i;
			//Setando o deadzone do gamepad
			gamepad_set_axis_deadzone(gp_id, gp_deadzone);
			return true;
		}
	}
	return false;
}
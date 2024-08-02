/// @description Alguns Debugs aqui
if (devMode)	{
	draw_text(20, 20, obj_player.velh);
	draw_text(20, 40,"Gamepad Axis X Value: " + string(gamepad_axis_value(gp_id, gp_axislh)));
	draw_text(20, 60,"Gamepad Axis Y Value: " + string(gamepad_axis_value(gp_id, gp_axislv)));
}
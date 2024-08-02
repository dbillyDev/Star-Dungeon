///@desc State Machine
//Inputs
var right, left, down, up;

right	= keyboard_check(ord("D"))	|| gamepad_axis_value(gp_id, gp_axislh) > gp_deadzone;
left	= keyboard_check(ord("A"))	|| gamepad_axis_value(gp_id, gp_axislh) < -gp_deadzone;
down	= keyboard_check(ord("S"))	|| gamepad_axis_value(gp_id, gp_axislv) > gp_deadzone;
up		= keyboard_check(ord("W"))	|| gamepad_axis_value(gp_id, gp_axislv) < -gp_deadzone;

//Movimentação
var _velh = (right - left)	* max_vel;
var _velv = (down - up)		* max_vel;

velh = lerp(velh, _velh, vel_amnt);
velv = lerp(velv, _velv, vel_amnt);

#region Colisão
//Horizontal
var col = instance_place(x + velh, y, obj_block);

if (col)	{
	//Colisão
	if (velh > 0) {
		//Se eu colidir com a esquerda do bloco, a minha posição vai ser a mesma da esquerda do bloco
		x = lerp(x, col.bbox_left + (x - bbox_right), vel_amnt * 2)
	}
	
	if (velh < 0)	{
		//Se eu colidir com a direita do bloco, a minha posição vai ser a mesma da direita do bloco
		x = lerp(x, col.bbox_right + (x - bbox_left), vel_amnt * 2);
	}
	
	velh = 0;
}

x += velh;

//Vertical
var col = instance_place(x, y + velv, obj_block);

if (col)	{
	//Colisão
	if (velv > 0) {
		//Se eu colidir com o topo do bloco, a minha posição vai ser a mesma do topo
		y = lerp(y, col.bbox_top + (y - bbox_bottom), vel_amnt * 2);
	}
	
	if (velv < 0)	{
		//Se eu colidir com a parte de baixo do bloco, a minha posição vai ser a mesma da parte de baixo
		y = lerp(y, col.bbox_bottom + (y - bbox_top), vel_amnt * 2);
	}
	
	velv = 0;
}

y += velv;
#endregion

if (devMode)	{
	//Arrasatando o player
	if (distance_to_point(mouse_x, mouse_y) < 16)	{
		if (mouse_check_button(mb_left))	{
			dragging = true;
		}
	}
	
	if (dragging)	{
		//Mudando a posição
		x = lerp(x, mouse_x, vel_amnt);
		y = lerp(y, mouse_y, vel_amnt);
		
		//Soltando o player
		if (!mouse_check_button(mb_left))	{
			dragging = false;
		}
	}
}


show_message("");
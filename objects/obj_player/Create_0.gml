///@desc Variaveis
//Movimentação
velh = 0;
velv = 0;

max_vel = 4;
vel_amnt = 0.15;

//roll
roll_vel = 10; //Velocidade do roll
roll_dir = 0; //Direção do roll
roll_time = 10;	//Tempo maximo de roll
roll_count = 0;	//Cronomêtro do roll


//Criando objetos
instance_create_layer(x, y, layer, obj_gun);
instance_create_layer(x, y, layer, obj_cam);
camTarget = id;

//Controle
state = "idle";
gun = noone;

dragging = false;

//Métodos
shooting = function()	{
	if (gun)	{
		var _fire = mouse_check_button(mb_left);
		gun.shoot = _fire;
	}
	
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	
	//Mudando a escala da arma
	if (gun.image_angle < 90)	{
		gun.image_yscale = -1;
	}else	{
		gun.image_yscale = 1;
	}
	
	//Achando a posição da arma
	var _x = x + lengthdir_x(sprite_width, _dir);
	var _y = y + lengthdir_y(sprite_height, _dir);
	
	//Fazendo a arma seguir a gnt
	gun.x = _x;
	gun.y = _y;
}
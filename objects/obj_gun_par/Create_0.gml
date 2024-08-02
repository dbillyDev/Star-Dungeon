///@desc Variaveis e sistema de tiro
bullet = obj_bullet;
spd = 4;
delay = 5;
delay_count = 0;
shoot = true;

xscale = 0.8;
yscale = 0.8;

image_xscale = xscale;
image_yscale = yscale;

shooting = function()	{
	//Alterando a angulação da arma
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	if (shoot)	{
		delay_count--;
		
		if (delay_count <= 0)	{
			//Resetando o delay do tiro
			delay_count = delay;
			//Criando o tiro
			var _bullet = instance_create_layer(x, y, layer, bullet);
			
			//Configurando o tiro
			_bullet.speed = spd;
			_bullet.direction = point_direction(x, y, mouse_x, mouse_y);
		}
	}
}
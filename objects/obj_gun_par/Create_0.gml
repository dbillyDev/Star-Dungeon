///@desc Variaveis e sistema de tiro
bullet = obj_bullet;
spd = 4;
delay = 5;
delay_count = 0;
shoot = false;
parent = noone;

max_ammo = 15;
ammo = max_ammo

xscale = 0.8;
yscale = 0.8;

image_xscale = xscale;
image_yscale = yscale;

shooting = function()	{
	if (shoot && ammo)	{
		delay_count--;
		
		if (delay_count <= 0)	{
			//Resetando o delay do tiro
			delay_count = delay;
			
			//Diminuindo a munição
			ammo--;
			
			//Criando o tiro
			var _bullet = instance_create_layer(x, y, layer, bullet);
			
			var _dir = 0

			if (parent != noone)	{
				_dir = point_direction(parent.x, parent.y, mouse_x, mouse_y);
			}
			//Configurando o tiro
			_bullet.speed = spd;
			_bullet.direction = _dir;
		}
	}
}
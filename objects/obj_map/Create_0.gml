/// @description Variaveis e métodos
//Configs da grid
cell_size = sprite_get_width(spr_block);
cell_height = room_height div cell_size;
cell_width = room_width div cell_size;


//Criando a grid
grid = ds_grid_create(cell_width, cell_height);
ds_grid_clear(grid, 0);

//Randomizando
randomize();

//Variaveis temporárias
var dir = irandom(100);
var xx = cell_width div 2;
var yy = cell_height div 2;
var chances = 1;
var steps = 400;

for (var i = 0; i < steps; i++)	{
	if (irandom(chances) == chances)	{
		dir = irandom(3);
	}
	
	xx += lengthdir_x(1, dir * 90);
	yy += lengthdir_y(1, dir * 90);
	
	xx = clamp(xx, 2, cell_width - 2);
	yy = clamp(yy, 2, cell_height - 2);
	
	grid[# xx, yy] = 1;
}

for (var xx = 0; xx < cell_width; xx++)	{
	for (var yy = 0; yy < cell_height; yy++)	{
		if (grid[# xx, yy] == 0)	{
			instance_create_layer(xx * cell_size, yy * cell_size, "Instances", obj_block);
		}
		
		if (grid[# xx, yy] == 1)	{
			if (!instance_exists(obj_player))	{
				instance_create_layer(xx * cell_size + cell_size / 2, yy * cell_size + cell_size / 2, "Instances", obj_player);
			}
		}
	}
}
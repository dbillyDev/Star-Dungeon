///@desc Variaveis
//Movimentação
velh = 0;
velv = 0;

max_vel = 4;
vel_amnt = 0.15;

//Criando objetos
instance_create_layer(x, y, layer, obj_cam);
camTarget = id;

//Controle
state = "idle";
dragging = false;
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
instance_create_layer(x, y, layer, obj_cam);
camTarget = id;

//Controle
state = "idle";
dragging = false;
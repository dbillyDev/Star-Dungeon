/// @description Mudando o x da camera
if (camTarget)	{
	x = lerp(x, camTarget.x, 0.1);
	y = lerp(y, camTarget.y, 0.1);
}
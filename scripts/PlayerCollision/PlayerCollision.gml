var _collsion = false;

//Horizontal Tiles
if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)){
	x -= x mod TILES_SIZE;
	if(sign(hSpeed) == 1){
		x += TILES_SIZE - 1;
	}
	hSpeed = 0;
	_collsion = true;
}

//Horizontal Move Commit
x += hSpeed;

//Verical Tiles
if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed)){
	y -= y mod TILES_SIZE;
	if(sign(vSpeed) == 1){
		y += TILES_SIZE - 1;
	}
	vSpeed = 0;
	_collsion = true;
}

//Verical Move Commit
y += vSpeed;

return _collsion;
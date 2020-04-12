if(sprite_index != sPlayerAttackSlash){
	sprite_index = sPlayerAttackSlash;
	localFrame = 0;
	image_index = 0;
}

//Update Sprite
PlayerAnimateSprite();

if(animationEnd){
	state = PlayerStateFree;
	animationEnd = false;
}
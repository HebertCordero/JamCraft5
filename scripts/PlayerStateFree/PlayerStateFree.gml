//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

//Update Sprite Index
var _oldSprite = sprite_index;
if(inputMagnitude != 0) {
	 direction = inputDirection;
	sprite_index = spriteRun;
} else sprite_index = spriteIdle;
if(_oldSprite != sprite_index){
	localFrame = 0;
}
//Update Image Index
PlayerAnimateSprite();

//Activate key logic
if(keyActivate){
	//1. Check for an entity to activate.
	var _activateX = lengthdir_x(10, direction);
	var _activateY = lengthdir_y(10, direction);
	activate = instance_position(x + _activateX, y + _activateY, pEntity);
	//2. If there is nothing or there is something but it has no script.
	if(activate == noone || activate.entityActivateScript == -1){
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	} else {
		//3. Otherwise, there is something and it has a script activate!
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		//4. If the thing we activate is an NPC make it face toward us!
		if(activate.entityNPC){
			with(activate){
				direction = point_direction(x,y,other.x,other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}
}
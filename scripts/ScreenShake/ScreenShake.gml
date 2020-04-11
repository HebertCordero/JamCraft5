/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in the frames (60 = 1 second)

with(global.iCamera){
	if(argument0 > shakeRemain){
		shakeMagnitude = argument0;
		shakeRemain = shakeMagnitude;
		shakeLength = argument1;
	}
}
extends Node
	
	
var music_volume:
	get():
		return $MusicPlayer.volume_linear
	set(new_volume):
		$MusicPlayer.volume_linear = new_volume

var sound_volume:
	get():
		return $SoundPlayer.volume_linear
	set(new_volume):
		$SoundPlayer.volume_linear = new_volume


func play_sound(soundfile: String):
	$SoundPlayer.stream = AudioStreamMP3.load_from_file(soundfile)
	$SoundPlayer.play()

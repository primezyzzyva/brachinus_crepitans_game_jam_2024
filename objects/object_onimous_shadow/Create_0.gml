/// @description Insert description here
// You can write your code in this editor

forward = 1;
left = 1;
speed = 5;
debug_shadow = false;
debug_move = false;

// Setting parameter for audio
// Credit to @GameMaker Rob on youtube for his tutorial on how to do this
// https://youtu.be/ZpPBlD9FyKw
sound_emitter = audio_emitter_create();
audio_max_distance_to_be_heard = 7000;
audio_starts_to_drop_at = 2000;

// Set the model falloff to be based on linear distance from emitter to listener
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(sound_emitter, x, y, 0);
audio_emitter_falloff(sound_emitter, audio_starts_to_drop_at, audio_max_distance_to_be_heard, 1);

audio_playing = false;

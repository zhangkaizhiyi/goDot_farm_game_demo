extends Node


signal sg_give_seed;
signal sg_feed_animal;


func action_give_seed():
	sg_give_seed.emit();

func action_feed_animal():
	sg_feed_animal.emit();

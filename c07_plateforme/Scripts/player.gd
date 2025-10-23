extends CharacterBody2D 
class_name Player

# Pas de classe Generic pour le moment car juste une seule entité
var anim_player : AnimationPlayer
var sprite : Sprite2D
var direction : Vector2

func _ready() -> void:
	anim_player = $AnimationPlayer
	sprite = $Sprite2D
	anim_player.play("idle")


func _physics_process(delta: float) -> void:
	move_and_slide()

func get_animation_player() -> AnimationPlayer:
	return anim_player

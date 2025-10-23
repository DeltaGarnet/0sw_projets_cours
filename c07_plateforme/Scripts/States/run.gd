class_name PlayerRun
extends BaseState

@export var player: Player
var anim_player: AnimationPlayer
const SPEED := 220.0

func enter():
	anim_player = player.get_animation_player()
	anim_player.play("run")

func manage_input() -> float:
	return Input.get_axis("left", "right");

func handle_inputs(event: InputEvent) -> void:
	# j'ai déplacer la logique dans update pour attaquer en run
	pass    

func update(delta: float) -> void:
	var dir := manage_input()
	# Si on arrête d'appuyer sur gauche/droite → retour à Idle
	if dir == 0:
		Transitioned.emit(self, "Idle")

	# Si on attaque pendant qu'on court
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "Attack")
	pass

func physics_update(delta: float) -> void:
	var dir := manage_input()

	player.velocity.x = dir * SPEED
	player.move_and_slide()

	# Flip du sprite selon la direction
	if dir != 0:
		player.sprite.flip_h = dir < 0    

func exit() -> void:
	player.velocity.x = 0

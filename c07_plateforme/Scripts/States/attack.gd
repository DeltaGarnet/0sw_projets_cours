class_name PlayerAttack
extends BaseState

@export var player: Player
var anim_player: AnimationPlayer
var attack_timer := 0.0
const ATTACK_DURATION := 0.4  # durée de l’attaque en secondes

func enter():
	anim_player = player.get_animation_player()
	anim_player.play("attack")
	attack_timer = 0.0

func handle_inputs(input_event: InputEvent) -> void:
	# Optionnel : ignorer les mouvements pendant l'attaque
	pass

func update(delta: float) -> void:
	attack_timer += delta
	if attack_timer >= ATTACK_DURATION:
		Transitioned.emit(self, "Idle")

func physics_update(delta: float) -> void:
	pass

func exit() -> void:
	pass

extends ByNodeScript

var old_config: PlayerConfiguration

func _ready() -> void:
	super()
	var player: Player = Thunder._current_player
	
	if !old_config:
		old_config = player.config
	player.config = old_config.duplicate(true)
	
	Thunder._current_player_state.player_power = Data.PLAYER_POWER.SMALL
	
	player.scale = Vector2(0.5, 0.5)
	player.update_collisions(Thunder._current_player_state, false)
	
	player.config.jump_speed_stopped = 6
	player.config.jump_speed_moving = 8
	player.config.jump_velocity = 350
	player.config.stomp_multiplicator = 0.5
	player.config.fall_speed = 15
	player.config.max_fall_speed = 300
	
	player.config.acceleration_speed = old_config.acceleration_speed / 2.0
	player.config.deceleration_speed = old_config.deceleration_speed / 2.0
	player.config.initial_acceleration = old_config.initial_acceleration / 2.0
	player.config.initial_accel_trigger = old_config.initial_accel_trigger / 2.0
	player.config.max_walk_speed = old_config.max_walk_speed / 2.0
	player.config.max_run_speed = 300
	
	player.config.sound_pitch = 1.5


func _physics_process(delta: float) -> void:
	super(delta)
	

func _exit_tree() -> void:
	Thunder._current_player.config = old_config
	Thunder._current_player.scale = Vector2.ONE

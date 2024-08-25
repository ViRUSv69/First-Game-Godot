extends ProgressBar

@onready var bar_value = 0
@export var max_bar_value = 10
var level = 0

func _ready() -> void:
	$Timer.start()

func _process(delta: float) -> void:
	%LevelBar.max_value = max_bar_value
	bar_value = $Timer.wait_time - $Timer.time_left
	%LevelBar.value = bar_value
	if bar_value == 0:
		level += 1
	%leveltext.text = str(level)

func _on_timer_timeout() -> void:
	bar_value = 0
	max_bar_value += 10
	$Timer.wait_time += 10
	$Timer.start()

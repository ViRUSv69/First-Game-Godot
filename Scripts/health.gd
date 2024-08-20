extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("health_filler_50"):
		queue_free()
		body.health_filler_50()

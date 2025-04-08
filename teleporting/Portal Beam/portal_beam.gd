extends Area2D
var speed = 300
var direction = 1
var handler 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.x += speed * direction * delta
	
	if direction > 0:
		$Sprite2D.flip_v = false
		$Sprite2D.position.x = -22
		#$GPUParticles2D.process_material.emission_shape_offset = Vector3.ZERO
		#$GPUParticles2D.angle_max = 0.0
		#$GPUParticles2D.angle_min = 0.0
	elif direction < 0:
		$Sprite2D.flip_v = true
		$Sprite2D.position.x = 68
		#$GPUParticles2D.process_material.emission_shape_offset = Vector3(152.8,-9.18,0)
		#$GPUParticles2D.angle_max = 180.0
		#$GPUParticles2D.angle_min = 180.0
	pass



func remove_beam():
	queue_free()
	
	handler.beam_holder.remove_at(0)
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	remove_beam()
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("enemy"):
		remove_beam()
	pass # Replace with function body.

extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#print("One must imagine Sisyphus happy.")
	pass # Replace with function body.

var time_elapsed = -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time_elapsed += delta * 2
	set_applied_force(Vector2(10000*sin(time_elapsed)*delta, 0))

extends KinematicBody

#Cheats
export var can_fly: bool = false
export var time: float = 1.0
const SURVIVAL = 0
const CREATIVE = 1
const HARDCORE = 2
#export var gamemode:int = SURVIVAL
export var speed = 2.0

#Node Shortcuts
onready var LifeBar = get_node("GUI/Life")
onready var StaminaBar = get_node("GUI/Stamina")


#Interactions&Items
var Interactor = null
var ExInteractor = null

#Ladder
var climbing = false

#Looking Vars
var change = Vector2()
var roty = 0
export var mouse_sens = 0.1

#Movements vars
var dir = Vector3()#where the player want go
var vel = Vector3()#where the player goes

#WalkingVars
var mov_type = IDLE
const IDLE = 0
const WALKILNG = 1
const RUNNING = 2
const SPRINTING = 3
const SNEAKING = 4

export var gravity:float = -30.0
export var gravity_accel:float = 0.04
export var max_falling_speed:float = -40.0

var grav = gravity

export var walk_speed:float = 2.0
export var run_speed:float = 4.0
export var sprint_speed:float = 8.0
export var sneak_speed:float = 0.5
export var accel_power:float = 2.0
export var deaccel_power:float = 3.0

export var jump_power:float = 10.0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Engine.set_time_scale(time)

func _process(delta):
	if can_fly:
		fly(delta)
	elif climbing:
		climb(delta)
	else:
		walk(delta)
	
	Interactor = $"3D/Camera/Camera/RayCast".get_collider()
	if !Interactor == null:
		#$GUI/Label.text = Interactor.name
		if Interactor.is_in_group("Face"):
			Interactor.selected = true
			Interactor.Update()
	
	if !ExInteractor == null and !ExInteractor == Interactor:
		if ExInteractor.is_in_group("Face"):
			ExInteractor.selected = false
			ExInteractor.Update()
		
	ExInteractor = Interactor

func _input(event):
	if event is InputEventMouseMotion:
		change.x = event.relative.x * mouse_sens
		change.y = event.relative.y * mouse_sens
		
		$"3D/Camera".rotate_y(deg2rad(-change.x))
		
		if change.y + roty < 90 and change.y + roty > -90:
			$"3D/Camera/Camera".rotate_x(deg2rad(-change.y))
			roty += change.y
	
	if Input.is_action_just_pressed("1st"):
		if !Interactor == null:
			if Interactor.is_in_group("Face"):
				Interactor.Destroy()
	
	if Input.is_action_just_pressed("2nd"):
		if !Interactor == null:
			if Interactor.is_in_group("Face"):
				Interactor.Place("Basic/Full")

func walk(delta):
	
	var floor_dist: Vector3 = to_local($"3D/FloorCheck".get_collision_point())
	var on_floor: bool = false
	if floor_dist.y < 0 and floor_dist.y > -0.5:
		on_floor = true
		#translate(Vector3(0, floor_dist.y + 0.002, 0))#Force the player on ground
	
	
	var aim = $"3D/Camera/Camera".get_camera_transform().basis
	
	var Up = Input.is_action_pressed("up")
	var Down = Input.is_action_pressed("down")
	var Left = Input.is_action_pressed("left")
	var Right = Input.is_action_pressed("right")
	
	var Jump = Input.is_action_just_pressed("jump")
	var Run = Input.is_action_pressed("run")
	var Sneak = Input.is_action_pressed("sneak")
	
	var real_speed: float = 0
	
	dir = Vector3()
	
	if Up:
		dir -= aim.z
	if Down:
		dir += aim.z
	if Left:
		dir -= aim.x
	if Right:
		dir += aim.x
	
	
	if Run and !StaminaBar.exhausted:
		if Up:
			mov_type = SPRINTING
			real_speed = sprint_speed
			StaminaBar.running = true
			StaminaBar.stamina_consuming = 32.0
		elif Left or Right:
			mov_type = RUNNING
			real_speed = run_speed
			StaminaBar.running = true
			StaminaBar.stamina_consuming = 16.0
	elif Sneak:
		mov_type = SNEAKING
		real_speed = sneak_speed
		StaminaBar.running = false
	elif Up or Down or Left or Right:
		mov_type = WALKILNG
		real_speed = walk_speed
		StaminaBar.running = false
	else:
		mov_type = IDLE
		real_speed = walk_speed
		StaminaBar.running = false
	
	$GUI/Label.text = String(String(on_floor) + " - " + String(floor_dist))
	
	dir = dir.normalized()
	
	if !on_floor:
		gravity -= gravity_accel * delta
		gravity = min(gravity, max_falling_speed)
		vel.y += gravity * delta
	else:
		gravity = grav
		vel.y += gravity * delta
	
	var tmp_vel = vel
	tmp_vel.y = 0
	
	var target = dir * real_speed * speed
	
	var accel
	if dir.dot(tmp_vel) > 0:
		accel = accel_power
	else:
		accel = deaccel_power
	
	tmp_vel = tmp_vel.linear_interpolate(target, accel * delta)
	
	vel.x = tmp_vel.x
	vel.z = tmp_vel.z
	vel = move_and_slide(vel, Vector3(0, 1, 0))
	
	if Jump and on_floor:
		$GUI/Stamina.stamina -= 4.0
		vel.y = jump_power
	

func climb(delta):
	
	var aim = $"3D/Camera/Camera".get_camera_transform().basis
	
	var Up = Input.is_action_pressed("up")
	var Down = Input.is_action_pressed("down")
	var Left = Input.is_action_pressed("left")
	var Right = Input.is_action_pressed("right")
	
	var Jump = Input.is_action_pressed("jump")
	var Run = Input.is_action_pressed("run")
	var Sneak = Input.is_action_pressed("sneak")
	
	var real_speed:float
	
	dir = Vector3()
	
	if Up:
		dir -= aim.z
	if Down:
		dir += aim.z
	if Left:
		dir -= aim.x
	if Right:
		dir += aim.x
	
	if Jump:
		dir += aim.y#with these, you can go up or down with JUMP and SNEAK
	if Sneak:
		dir -= aim.y
	
	if Run:
		real_speed = 32#if running increase the speed
	else:
		real_speed = 16
	
	
	dir = dir.normalized()
	
	vel = vel.linear_interpolate(dir * real_speed, delta)
	
# warning-ignore:return_value_discarded
	move_and_slide(vel)
	

func fly(delta):
	
	var aim = $"3D/Camera/Camera".get_camera_transform().basis
	
	var Up = Input.is_action_pressed("up")
	var Down = Input.is_action_pressed("down")
	var Left = Input.is_action_pressed("left")
	var Right = Input.is_action_pressed("right")
	
	var Jump = Input.is_action_pressed("jump")
	var Run = Input.is_action_pressed("run")
	var Sneak = Input.is_action_pressed("sneak")
	
	var real_speed:float
	
	dir = Vector3()
	
	if Up:
		dir -= aim.z
	if Down:
		dir += aim.z
	if Left:
		dir -= aim.x
	if Right:
		dir += aim.x
	
	if Jump:
		dir += aim.y#with these, you can go up or down with JUMP and SNEAK
	if Sneak:
		dir -= aim.y
	
	if Run:
		real_speed = 8#if running increase the speed
	else:
		real_speed = 4
	
	
	dir = dir.normalized()
	
	vel = vel.linear_interpolate(dir * real_speed, delta)
	
# warning-ignore:return_value_discarded
	move_and_slide(vel)
	

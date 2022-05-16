extends Timer

export(float, 0, 920) var min_time
export(float, 0, 2240) var max_time

func _ready():
	init_wait()
	connect("timeout",self,"init_wait")

func begin():
	init_wait()
	.begin()

func init_wait():
	self.wait_time = (rand_range(min_time,max_time))

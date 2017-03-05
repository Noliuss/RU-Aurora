// -- Spark visual_effect --
/obj/visual_effect/sparks
	name = "sparks"
	icon_state = "sparks"
	anchored = 1
	mouse_opacity = 0

/obj/visual_effect/sparks/New(var/turf/loc)
	..(loc)
	life_ticks = rand(5,10)

/obj/visual_effect/sparks/tick()
	. = ..()

	var/turf/T = loc
	if(T)
		T.hotspot_expose(1000, 100)

	if (life_ticks < 2)
		animate(src, alpha = 0, time = 2, easing = SINE_EASING | EASE_IN)

/obj/visual_effect/sparks/start(var/direction)
	..()
	if (direction)
		spawn (5)
			step(src, direction)

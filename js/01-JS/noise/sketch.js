function setup() {
	createCanvas(W = 640, W)
	strokeWeight(f = 5)

}


function draw() {
	clear(t = map(sin(f += 0.01), -1, 1, 4, 20))
	for (y = 2; y < W; y += 8)
		for (x = 2; x < W; x += 8)
			point(cos(r = noise(x / W, y / W - f) * t) * TAU + x, sin(r) * TAU + y)
}
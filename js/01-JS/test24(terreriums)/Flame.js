function Flame(e, mouse, mousey) {

	this.da = PI / 100; // map worthy
	this.dx = 0.08; // noise value
	this.xoff = 0;     
	this.scala = map(mouse,0, width, 0,300);     // maps the size
	this.speeda = map(mousey,0,height,0.001,0.01);   // maps the speed


	this.update = function() {
		this.yoff += this.speeda; // map worthy 
	}

	this.ship = function(c, b) {
		beginShape();         // creates the desin
		for (var a = -PI / 2; a <= 3 * PI / 2; a += this.da) {
			this.n = noise(this.xoff, this.yoff);
			this.r = sin(-1 * a) * map(this.n, 0,1, c, b);
			this.x = r * cos(a);
			this.y = r * sin(a*e);
			if (a < PI / 2) {
				this.xoff += this.dx;
			} else {
				this.xoff -= this.dx;
			}
			vertex(this.x, this.y);
		}
		endShape();
	}

	this.render = function() {   // layering the design
		fill(50,224,158,50*e/2);    
		this.ship(50, 400+this.scala,4);
		fill(224, 50,194,50*e/2);
		this.ship(20, 100+this.scala,8);
		fill(200, 10, 250,50*e/2);
		this.ship(30, 200+this.scala,8);
		fill(20, 150, 150,50*e/2);
		this.ship(40, 300+this.scala,8);
		this.update();
	}
	this.render();    // renders it in the functio itsel
	
}
function Ball(m,idin, oin) {
    this.pos = createVector(random(200,300), random(100,50))
    this.diameter = m;
    this.vel = createVector(0, 0);
    this.acc = createVector(0, 0);
    this.id = idin;
    this.others = oin;
		
		this.applyForce = function(force){
			var f = p5.Vector.div(force,this.diameter);
			this.acc.add(f);
		}
		
		this.CalForce = function(v) {
			var force = p5.Vector.sub(this.pos, v.pos);
			var distan = force.mag();
			distan = constrain(distan, 5.0, 15.0);
			force.normalize();
			var S = (friction * v.m * (this.m / 2)) / (distan * distan);
			force.mult(S);
			return force;
	};
		


    this.collide = function() {
        for (var i = this.id + 1; i < numBalls; i++) {
            var dx = this.others[i].pos.x - this.pos.x;
            var dy = this.others[i].pos.y - this.pos.y;
            var distance = Math.sqrt(dx * dx + dy * dy);
            var minDist = this.others[i].diameter / 2 + this.diameter / 2;

            if (distance < minDist) {
                var angle = atan2(dy, dx);
                var targetX = this.pos.x + cos(angle) * minDist;
                var targetY = this.pos.y + sin(angle) * minDist;
                var ax = (targetX - this.others[i].pos.x) * spring;
                var ay = (targetY - this.others[i].pos.y) * spring;
                this.vel.x -= ax;
                this.vel.y -= ay;
                this.others[i].vel.x += ax;
                this.others[i].vel.y += ay;
            }
        }
    }

    this.move = function() {
        this.vel.add(this.acc);
    		this.pos.add(this.vel);
        if (this.pos.x + this.diameter / 2 > width) {
            this.pos.x = width - this.diameter / 2;
            this.vel.x *= friction;
        } else if (this.pos.x - this.diameter / 2 < 0) {
            this.pos.x = this.diameter / 2;
            this.vel.x *= friction;
        }
        if (this.pos.y + this.diameter / 2 > height) {
            this.pos.y = height - this.diameter / 2;
            this.vel.y *= friction;
        } else if (this.pos.y - this.diameter / 2 < 0) {
            this.pos.y = this.diameter / 2;
            this.vel.y *= friction;
        }
    }

    this.display = function() {
        ellipse(this.pos.x, this.pos.y, this.diameter, this.diameter);
    }
    
    this.click = function() {
		var d = dist(mouseX, mouseY, this.pos.x, this.pos.y);
		if (d < this.diameter/2) {
			this.col = color(30, 145, 260);
		}
	}
}
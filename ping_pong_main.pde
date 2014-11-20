pong player, computer;
ping ball;
PFont f;
void setup() {
  size(1020, 620);
  smooth();
  noStroke();

  f = createFont("Calibri-48", 24);
  textFont(f);
  
  int p=5;

  player = new pong(2, p);
  computer = new pong(width-player.sizeX-2, -p);
  ball = new ping(random(200, 800), random(100, 500), 2.32, player.sizeX);
}

void draw() {
  background(40);

    player.render(mouseY*1.11235);
 // player.render(ball.pingLocation.y);
  computer.render(ball.pingLocation.y);


  ball.render(player.y(), computer.y(), player.pong, computer.pong);

  println(ball.pingLocation.x+" "+ball.pingLocation.y);

  fill(22, 200, 90);
  text(ball.score, 10, 20);
}

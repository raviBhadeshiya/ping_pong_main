class pong {
  PVector pong;
  float Xcordinate, Ycordinate, sizeY=90, sizeX=15;
  pong(float x, float pv)
  {
    pong = new PVector(pv, 0);
    Xcordinate=x;
  }
  void render(float y)
  {
    if (y<height-sizeY/2||y>sizeY/2)Ycordinate=y-sizeY/2;
    strokeJoin(BEVEL);
    fill(200, 147, 36);
    rect(Xcordinate, Ycordinate, sizeX, sizeY);
  }
  float y() {
    return Ycordinate;
  }
}
class ping {
  int score=0;
  PVector pingLocation, pingVelocity, pongPlayer, pongComputer;
  float sizeX;
  ping(float x, float y, float v, float size) {
    pingLocation = new PVector(x, y);
    pingVelocity = new PVector(v, v);
    sizeX=size;
  }
  void render(float playerY, float computerY, PVector pong, PVector computer)
  {     
    if (pingVelocity.x>20||pingVelocity.y>20)
    {      
      pingVelocity.x=10;     
      pingVelocity.y=10;
    }
    pongPlayer=pong;
    pongComputer=computer;
    fill(148, 165, 32);
    bounce(playerY, computerY);
//    float tx=pingLocation.x, ty=pingLocation.y;
    pingLocation.add(pingVelocity);

    ellipse(pingLocation.x, pingLocation.y, 25, 25);

//    for (int i=0;i<5;i++)
//    {
//      fill(130-i*5, 155-i*5, 20-i*5);
//      ellipse(tx-5*(pingVelocity.x*i), ty-5*(pingVelocity.y*i), 18-3*i, 18-3*i);
//    }
  }

  void bounce(float player, float computer)
  {
    if (pingLocation.y>=height||pingLocation.y<=0) {
      pingVelocity.y=pingVelocity.y*-1;
      fill(50, 42, 200);
    }
    if (pingLocation.x<=0||pingLocation.x>=width) {
      pingVelocity.x=pingVelocity.x*-1;
      fill(50, 42, 200);
      score =0;
    }
    if (pingLocation.y>=player&&pingLocation.y<=player+80&&sizeX+2>=pingLocation.x-10)
    {
      pingVelocity.add(pongPlayer);
      fill(50, 42, 200);
    }
    if (pingLocation.y>=computer&&pingLocation.y<=computer+80&&width-sizeX-2<=pingLocation.x+10)
    {
      pingVelocity.add(pongComputer);
      score++;
      fill(50, 42, 200);
    }
  }
}


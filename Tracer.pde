
class Tracer{
  
  //t: type; 0 = top, 1 = left
  int x, y, i, t;
  
  Tracer(int x, int y, int index, int type){
    this.x = x;
    this.y = y;
    i = index;
    t = type;
  }
  
  float angle;
  float sx, cy;
  void DrawSelf(float angle){
    noFill();
    strokeWeight(strokeWeight);
    stroke(220, 30, 140);
    circle(x, y, circleDiameter);
    
    noStroke();
    fill(220, 30, 140);
    sx = x + sin(angle) * circleDiameter / 2;
    cy = y + cos(angle) * circleDiameter / 2;
    circle(sx, cy, strokeWeight * 2);
    
    noFill();
    stroke(255, 255, 255, 30);
    strokeWeight(2);
    if(t == 0){
      line(sx, 0, sx, height);
    } else{
      line(0, cy, width, cy);
    }
  }
}

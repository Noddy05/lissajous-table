

class Result{
  
  int top, left;
  ArrayList<PVector> path = new ArrayList<PVector>();
  
  Result(int top, int left){
    this.top = top;
    this.left = left;
  }
  
  void Update(){
    path.add(new PVector(tracers[top].sx, tracers[left].cy));
  }
  
  void DrawSelf(){
    for(int i = 1; i < path.size(); i++){
      PVector point = path.get(i);
      PVector previous = path.get(i - 1);
      stroke(255);
      line(point.x, point.y, previous.x, previous.y);
    }
  }
}

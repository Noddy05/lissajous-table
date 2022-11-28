final int tableSize = 15;
int border = 30;
int circleDiameter = 40;
int strokeWeight = 4;

Tracer[] tracers = new Tracer[tableSize * 2];
Result[] results = new Result[tableSize * tableSize];

void setup(){
  size(800, 800);
  fullScreen(P2D);
  
  for(int i = 1; i <= tableSize; i++){
    int x = int(map(i, 0, tableSize, border, width - border));
    int y = int(map(i, 0, tableSize, border, height - border));
    tracers[(i - 1) * 2    ] = new Tracer(x, border, i, 0);
    tracers[(i - 1) * 2 + 1] = new Tracer(border, y, i, 1);
  }
  for(int x = 0; x < tableSize; x++){
    for(int y = 0; y < tableSize; y++){
      results[y + x * tableSize] = new Result(x * 2, y * 2 + 1);
    }
  }
}

float angle;
int pointAfter = 3;
void draw(){
  background(30);
  
  for(int i = 1; i <= tableSize; i++){
    float properAngle = angle * i;
    
    tracers[(i - 1) * 2    ].DrawSelf(properAngle);
    tracers[(i - 1) * 2 + 1].DrawSelf(properAngle);
  }
  if(frameCount % pointAfter == 0) {
    for(int x = 0; x < tableSize; x++){
      for(int y = 0; y < tableSize; y++){
        if(angle > PI * 2 + 0.2){
          results[y + x * tableSize].path.remove(0);
        }
        results[y + x * tableSize].Update();
      }
    }
  }
  for(int x = 0; x < tableSize; x++){
    for(int y = 0; y < tableSize; y++){
      results[y + x * tableSize].DrawSelf();
    }
  }
  
  angle += 0.01;
  
}

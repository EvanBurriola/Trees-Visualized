class Node{
  int key;
  Node l;
  Node r;
  
  Node p;
  
  //Postion
  float x;
  float y;
  float rad;
  
  Node(int key){
    this.key = key;
    l = null;
    r = null;
    p = null;
    //Defaults
    x = width/2; y = 50; rad = 25;
  }
  
  Node(int key, float x, float y){
    this.key = key;
    l = null;
    r = null;
    
    //Defaults
    this.x = x; this.y = y; rad = 25;
  }
  
  public void pos(float x, float y){
    this.x = x; this.y = y;
  }
  
  public void rad(int rad){
    this.rad = rad;
  }
  
}

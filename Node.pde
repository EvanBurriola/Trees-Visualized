class Node{
  int key;
  Node l;
  Node r;
  
  //Parent needed to draw lines between nodes(could use child, just thought of that..)
  Node p;
  
  //Postion
  float x;
  float y;
  float diam;
  
  //Display
  int col = #ffffff;
  
  
  //Most commonly used, then just manually set x/y attributes
  Node(int key){
    this.key = key;
    l = null;
    r = null;
    p = null;
    //Defaults
    x = width/2; y = 50; diam = 25;
  }
  
  Node(int key, float x, float y){
    this.key = key;
    l = null;
    r = null;
    
    //Defaults
    this.x = x; this.y = y; diam = 25;
  }
  
  @Override
  public String toString(){
    return key + ": x = " + x + " y = " + y + "\n";
  }
  
  public void pos(float x, float y){
    this.x = x; this.y = y;
  }
  
  public void diam(int diam){
    this.diam = diam;
  }
  
  
  
}

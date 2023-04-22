//Evan Burriola : 2023
//Processing 4.0b8
//https://github.com/evanburriola12/trees-visualized

class Node{
  int key;
  Node l;
  Node r;
  
  //Parent needed to draw lines between nodes(could use child, just thought of that..)
  Node p;
  
  //Postion
  float x;
  float y;
  float diam = 50;
  
  //Display
  int col = #ffffff;
  
  
  //Most commonly used, then just manually set x/y attributes
  Node(int key){
    this.key = key;
    l = null;
    r = null;
    p = null;
    //Defaults
    //x = width/2; y = 50; diam = 50;
  }
  
  void update(){
    if(this.p == null){ //Root
      this.x = width/2;
      this.y = 50;
      return;
    }
    
    int depth = getDepth(this);
    int prevLayerElems = int(pow(2, depth-1)); //Will always be int
    float prevSegmentWidth = (width)/prevLayerElems; //divide the width of the screen into equal parts for amnt of elems    
    
    if(this.p.r == this){
      this.x = p.x + prevSegmentWidth/2;
    } else{
      this.x = p.x - prevSegmentWidth/2;
    }
    this.y = 50*(depth+1) + 10*(depth*(depth+1)/2); //Depth const + Guass offset
  }

  void show(){
    //Draw circle for each node
    fill(this.col);
    circle(this.x, this.y, this.diam);

    // Display node key
    fill(0);
    textSize(this.diam/2);
    textAlign(CENTER);
    text(this.key, this.x, this.y+5); 
  }
  
  int getDepth(Node node){
    if(node == null)
      return 0;
    
    return getDepth(node.p) + 1;
  }
  
  @Override
  public String toString(){
    return key + ": x = " + x + " y = " + y + "\n";
  }
}

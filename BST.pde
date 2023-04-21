class BST{
  Node root;
  
  BST(){
    this.root = null;
  }

  //Given a start node and a key to find
  Node find(Node x, int targetKey){
      //Base case: the node doesn't exists, or has been found
      if (x == null || x.key == targetKey)
          return x;
      //Traverse left subtree if target key is less than current
      if (targetKey < x.key)
          return find(x.l,targetKey);
      //Traverse right subtree because the target is greater than the current
      return find(x.r,targetKey);
  }
  
  //Given a start node and a key to find
  //Node grab(Node node, float targetX, float targetY){
  //     //Circle hitbox
  //     if(targetX >= (node.x - node.rad) && targetX <= (node.x + node.rad))
  //       if(targetY >= (node.y - node.rad) && targetY <= (node.y + node.rad))
  //         return node;

             
  //     //grab(node.l,targetX,targetY);
  //     //grab(node.r,targetX,targetY);
  //}  
  
  
  //New nodes are inserted as leafs
  boolean insert(int key){
      //Don't allow duplicate insertions
      if (find(root,key) != null)
          return false;

      if(root == null){ //Insert root (depth 0);
          Node newNode = new Node(key);
          root = newNode;
          return true;
      }
      
      Node prev = null;
      Node cur = root;
      int depth = 0;
      //this deviation will be bounded by the layers width

      Node newNode = new Node(key);

      while(cur != null){
        depth++;
         prev = cur;
        //cur = key < cur.key ? cur.l : cur.r;
        if(key < cur.key){
          cur = cur.l;
        } else{
          cur = cur.r;
        }
        newNode.y += 50 + (10*depth); //Increase in depth
      }
      
      //Number of elements that this layer of the tree can contain
      int prevLayerElems = int(pow(2,depth-1)); //Will always be int
      float prevSegmentWidth = (width)/prevLayerElems; //divide the width of the screen into equal parts for amnt of elems
      
      //print(key + ":\n" + "  layerElems: " + prevLayerElems + "\n" + 
      //"  layerPos: " + layerPos + "\n" + 
      //"  medianDeviation: " + dev_from_med + "\n");
      //newNode.x = segmentWidth*layerPos;
      
      if(prev.key < key){
          prev.r = newNode;
          newNode.x = prev.x + prevSegmentWidth/4;
      }else{
          prev.l = newNode;
          newNode.x = prev.x - prevSegmentWidth/4;
      }
      
      newNode.p = prev;
      
      return true;
  }
  
  void show(){
    out(root);
  }
  
  void out(Node node){
      if(node == null)
          return;
      out(node.l);
      //println(node.key);
      if(node.p != null)
        line(node.x, node.y, node.p.x, node.p.y);  
      fill(255);
      circle(node.x,node.y,node.rad);
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text(node.key,node.x,node.y+5);
      out(node.r);
  }
  

}

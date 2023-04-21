//Evan Burriola : 2023
//Processing 4.0b8
//https://github.com/evanburriola12/trees-visualized

class BST{
  Node root;
  ArrayList<Node> nodes = new ArrayList<>();
  
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
  
  
  Node select(float targetX, float targetY){ 
    for( Node node : nodes){
      //Circle hitbox
      if(sqrt(sq(node.x - targetX) + sq(node.y - targetY)) < node.diam/2){
         return node;
       }
    }
    return null;
  }  
  
  
  //New nodes are inserted as leafs
  boolean insert(int key){
      //Don't allow duplicate insertions
      if (find(root,key) != null)
          return false;

      if(root == null){ //Insert root (depth 0);
          Node newNode = new Node(key);
          root = newNode;
          nodes.add(newNode);
          return true;
      }
      
      Node prev = null;
      Node cur = root;
      int depth = 0;

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
      
      if(prev.key < key){
          prev.r = newNode;
          newNode.x = prev.x + prevSegmentWidth/4;
      }else{
          prev.l = newNode;
          newNode.x = prev.x - prevSegmentWidth/4;
      }
      
      newNode.p = prev;
      
      nodes.add(newNode);
      return true;
  }
  
  void show(){
    out(root);
  }
  
  void out(Node node){
    //in order recursive traversal
      if(node == null)
          return;
          
      //Draw line between nodes
      if(node.p != null)
        line(node.x, node.y, node.p.x, node.p.y); 
        
      out(node.l);
      out(node.r);
      
      //Drawn after lines and traversal to appear on top
      //Draw circle for each node
      fill(node.col);
      circle(node.x,node.y,node.diam);
      
      // Display node key 
      fill(0);
      textSize(node.diam/2);
      textAlign(CENTER);
      text(node.key,node.x,node.y+5);
  }
  

}

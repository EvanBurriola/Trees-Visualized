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
  
  //New nodes are inserted as leafs
  boolean insert(int key){
      //Don't allow duplicate insertions
      if (find(root,key) != null)
          return false;

      if(root == null){
          Node newNode = new Node(key);
          root = newNode;
          return true;
      }
      
      Node prev = null;
      Node cur = root;
      int depth = 1;

      while(cur != null){
          prev = cur;
          cur = key < cur.key ? cur.l : cur.r;
      }

      Node newNode = new Node(key);
      newNode.y += 50;

      if(prev.key < key){
          prev.r = newNode;
          newNode.x += 50;
      }else{
          prev.l = newNode;
          newNode.x -= 50;
      }
      
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
      fill(255);
      circle(node.x,node.y,node.rad);
      out(node.r);
  }
  

}

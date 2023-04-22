//Evan Burriola : 2023
//Processing 4.0b8
//https://github.com/evanburriola12/trees-visualized

class BST {
  Node root;
  ArrayList<Node> nodes = new ArrayList<>(); //Needed for node hitbox on select

  BST() {
    this.root = null;
  }

  //Given a start node and a key to find
  Node find(Node x, int targetKey) {
    //Base case: the node doesn't exists, or has been found
    if (x == null || x.key == targetKey)
      return x;
    //Traverse left subtree if target key is less than current
    if (targetKey < x.key)
      return find(x.l, targetKey);
    //Traverse right subtree because the target is greater than the current
    return find(x.r, targetKey);
  }


  Node select(float targetX, float targetY) {
    for ( Node node : nodes) {
      //Circle hitbox
      if (sqrt(sq(node.x - targetX) + sq(node.y - targetY)) < node.diam/2) {
        return node;
      }
    }
    return null;
  }


  //New nodes are inserted as leafs
  //ITERATIVE INSERT
  boolean insert(int key) {
    //Don't allow duplicate insertions
    if (find(root, key) != null)
      return false;

    if (root == null) { //Insert root (depth 0);
      Node newNode = new Node(key);
      root = newNode;
      nodes.add(root);
      return true;
    }

    Node prev = null;
    Node cur = root;

    Node newNode = new Node(key);

    while (cur != null) {
      prev = cur;
      if (key < cur.key) {
        cur = cur.l;
      } else {
        cur = cur.r;
      }
    }

    if (prev.key < key) {
      prev.r = newNode;
    } else {
      prev.l = newNode;
    }

    newNode.p = prev;
    nodes.add(newNode);
    
    return true;
  }

  //Iterative delete -> expanded from Geeksforgeeks alg.
  public boolean delete(int key) {
    if (find(root, key) == null) //Key exists
      return false;

    if (root == null)
      return false;

    Node prev = null;
    Node cur = root;

    while (cur != null && cur.key != key) {
      prev = cur;
      cur = key < cur.key ? cur.l : cur.r;
    }

    if (cur == null)
      return false;

    if (cur.l == null || cur.r == null) { //No more than 1 CHILD
      Node replacer;

      if (cur.l == null)
        replacer = cur.r;
      else
        replacer = cur.l;

      if (prev == null) { //Root
        nodes.remove(root); //cur still points to old root
        if(replacer != null)
          replacer.p = null;
        root = replacer;
        return true; //Can return here, all subtree info is in replacer(only child)
      }

      if (cur == prev.l) //Point parent to new child
        prev.l = replacer;
      else
        prev.r = replacer;

      if(replacer != null)
        replacer.p = prev;
        
      nodes.remove(cur);
    } else { //two children
      prev = null;
      Node temp;

      temp = cur.r;
      while (temp.l != null) { //inorder successor
        prev = temp;
        temp = temp.l;
      }

      if (prev != null){
        prev.l = temp.r;
        if(temp.r != null)
          temp.r.p = prev; //Do the 'up' assign
      }else{
        cur.r = temp.r;
        if(temp.r != null)
          temp.r.p = cur; //Do the 'up' assign
      }
      
      nodes.remove(temp);
      cur.key = temp.key;
      
    }
    return true;
  }

  void show() {
    out(root);
  }

  void out(Node node) {
    //in order recursive traversal
    if (node == null)
      return;

    //Draw line between nodes
    if (node.p != null)
      line(node.x, node.y, node.p.x, node.p.y);

    out(node.l);
    out(node.r);
    
    //Drawn after lines and traversal to appear on top
    node.update();
    node.show();
  }
}

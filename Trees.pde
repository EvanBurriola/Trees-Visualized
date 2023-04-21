BST tree = new BST();
void setup(){
  size(1920, 1080);
  background(100);
  
  tree.insert(4);
  tree.insert(12);
  tree.insert(2);
  tree.insert(1);
  tree.insert(11);
  tree.insert(13);
  tree.insert(15);
  tree.insert(5);
  tree.insert(6);
  tree.insert(7);
  tree.insert(8);
  tree.insert(9);
  
}

void draw(){
  tree.show();
}

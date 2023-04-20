BST tree = new BST();
void setup(){
  size(1280, 720);
  background(100);
  
  tree.insert(4);
  tree.insert(12);
  tree.insert(2);
  tree.insert(1);
}

void draw(){
  tree.show();
}

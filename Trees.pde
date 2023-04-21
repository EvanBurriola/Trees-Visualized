BST tree = new BST();
Node selectedNode = null;
void setup(){
  size(720, 720);
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
  background(100);
  tree.show();
  if(selectedNode != null){
    displaySelected();
  }
  
}

void mouseClicked(){
  //Reset the previous selection
  if(selectedNode != null){
    selectedNode.col = #ffffff;
  }
  
  selectedNode = tree.select(mouseX,mouseY);
  if(selectedNode != null){
    print(selectedNode.toString());
    selectedNode.col = #68f5fc;
  }else{
  println("NULL");
  }
}

void displaySelected(){
 text(selectedNode.toString(), 100, 50);
}

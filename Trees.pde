//Evan Burriola : 2023
//Processing 4.0b8
//https://github.com/evanburriola12/trees-visualized
BST tree = new BST();
Node selectedNode = null;
String currentKey;

void setup() {
  size(1280, 720);
  background(100);
  fill(0);
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(100);
  tree.show();

  //displayNodes();
  if (selectedNode != null) {
    displaySelected();
  }

  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Type to Insert Node:", 115, 25);
  if (currentKey != null) {
    text(currentKey, 75, 50);
  }
}

void mouseClicked() {
  //Reset the previous selection
  if (selectedNode != null) {
    selectedNode.col = #ffffff;
  }

  selectedNode = tree.select(mouseX, mouseY);
  if (selectedNode != null) {
    print(selectedNode.toString());
    selectedNode.col = #68f5fc;
  } else {
    println("NULL");
  }
}

void keyPressed() {
  if (Character.isDigit(key)) {
    if (currentKey == null) {
      currentKey = Character.toString(key);
    } else if (currentKey.length() <= 3) {
      currentKey += key;
    }
  } else if (key == BACKSPACE && currentKey != null && currentKey.length() != 0) {
    currentKey = currentKey.substring(0, currentKey.length() - 1);
  } else if (key == ENTER && currentKey != null && currentKey.length() != 0) {
    tree.insert(Integer.parseInt(currentKey));
    currentKey = null;
  } else if (selectedNode != null && key == DELETE) {
    selectedNode.col = #ffffff;
    tree.delete(selectedNode.key);
    selectedNode = null;
  }
}

void displaySelected() {
  text(selectedNode.toString(), width-125, 50);
  text("Press Delete to remove", width-125, 25);
}

//void displayNodes() {
//  for (int i = 0; i < tree.nodes.size(); i++) {
//    text(tree.nodes.get(i).key, 25+(30*i), height-50);
//  }
//}

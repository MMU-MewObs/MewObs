

public class ConfigMaker{
  PApplet papp;
  int x = 40, y = 90, index;
  String prefix = "enterControl_";
  ControlFont cf1 = new ControlFont(createFont("Arial", 15, true));
  
  ConfigMaker(PApplet app){
    papp = app;
    textSize(15);
    text("Key", x, 80);
    text("Label", x + 70, 80);
    text("Steve", x + 290, 80);
    text("MEG", x + 510, 80);
    drawNewRow();
  }
  
  public void drawNewRow(){
    gui.addTextfield(prefix + index +  "key")
      .setPosition(x, y)
      .setSize(50,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    gui.addTextfield(prefix + index +  "label")
      .setPosition(x + 70, y)
      .setSize(200,20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    gui.addTextfield(prefix + index +  "steve")
      .setPosition(x + 290, y)
      .setSize(200,20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
    gui.addTextfield(prefix + index +  "meg")
      .setPosition(x + 510, y)
      .setSize(200, 20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
    index++;
    y+= 30;
    drawAddButton();
  }
  
  Button addButton = null;
  
  public void drawAddButton(){
    if(addButton == null){
     addButton = gui.addButton("drawNewRow")
      .setPosition(360, y)
      .setFont(cf1)
      .setLabel("Add")
      .plugTo(this);
    } else {
      addButton.setPosition(360, y);
    }
   
  }
  
  void hide(){
    
  }
  
  
  
}
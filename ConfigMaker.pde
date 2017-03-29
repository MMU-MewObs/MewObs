

public class ConfigMaker{
  PApplet papp;
  int x = 10, y = 140, index;
  String prefix = "enterControl_";
  ControlFont cf1 = new ControlFont(createFont("Arial", 15, true));
  ControlFont cf2 = new ControlFont(createFont("Helvetica", 54, true));
  ControlFont cf3 = new ControlFont(createFont("Arial", 22, true));
  
  ArrayList<Integer> rows;
  
  ConfigMaker(PApplet app){
    papp = app;
    textSize(15);
    text("Key", x, 135);
    text("Label", x + 70, 135);
    text("Steve", x + 290, 135);
    text("MEG", x + 510, 135);
    
    text("Group",10,75);
    text("Id",120,75);
    text("Run",230,75);
    text("EditMe1",340,75);
    text("EditMe2",450,75);
    text("EditMe3",560,75);
  
    rows = new ArrayList<Integer>();
    drawNewRow();
    
    gui.addTextfield("group")
      .setPosition(10,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
      gui.addTextfield("id")
      .setPosition(120,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
       gui.addTextfield("run")
      .setPosition(230,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
       gui.addTextfield("editme1")
      .setPosition(340,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
     gui.addTextfield("editme2")
      .setPosition(450,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
       gui.addTextfield("editme3")
      .setPosition(560,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
  }
  
  public void drawNewRow(){
    
     gui.addLabel("Config Maker Section")
      .setPosition(200,0)
      .setColorBackground(0)
      .setColor(0)
      .setFont(cf2)
      .plugTo(this);
    
    gui.addTextfield(prefix + index +  "_key")
      .setPosition(x, y)
      .setColorBackground(0)
      .setSize(50,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    gui.addTextfield(prefix + index +  "_label")
      .setPosition(x + 70, y)
      .setColorBackground(0)
      .setSize(200,20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    gui.addTextfield(prefix + index +  "_steve")
      .setPosition(x + 290, y)
      .setColorBackground(0)
      .setSize(200,20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
    gui.addTextfield(prefix + index +  "_meg")
      .setPosition(x + 510, y)
      .setColorBackground(0)
      .setSize(200, 20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    gui.addButton(prefix + index +  "_remove")
      .setPosition(x + 720, y)
      .setColorBackground(0)
      .setFont(cf1)
      .setLabel("Remove");
      
       gui.addButton(prefix + index +  "Save")
      .setPosition(880,550)
      .setSize(100,40)
      .setColorBackground(0)
      .setFont(cf3)
      .setLabel("Save");
    
    
    rows.add(index);
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
      .setColorBackground(0)
      .plugTo(this);
    } else {
      addButton.setPosition(360, y);
    }
   
  }
  
  void hide(){
    
  }
  
  
  
}
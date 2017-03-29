

public class ConfigMaker {
  PApplet papp;
  int x = 10, y = 140, index;
  String prefix = "enterControl_";
  ControlFont cf1 = new ControlFont(createFont("Arial", 15, true));
  ControlFont cf2 = new ControlFont(createFont("Helvetica", 54, true));
  ControlFont cf3 = new ControlFont(createFont("Arial", 22, true));

  ArrayList<Integer> rows;
Textlabel title2;

Textfield txtgroup;
Textfield txtid;
Textfield txtrun;
Textfield txteditme1;
Textfield txteditme2;
Textfield txteditme3;

Textfield txtkey;
Textfield txtlabel;
Textfield txtmeg;

RadioButton rdbtnSteve;

Button btnsave;
Button btnback;
Button btnremove;
Button addButton = null;




  ConfigMaker(PApplet app) {
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
    
    txtgroup= gui.addTextfield("group")
      .setPosition(10,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
    txtid= gui.addTextfield("id")
      .setPosition(120,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    txtrun= gui.addTextfield("run")
      .setPosition(230,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    txteditme1= gui.addTextfield("editme1")
      .setPosition(340,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
    
   txteditme2=gui.addTextfield("editme2")
      .setPosition(450,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
    txteditme3=gui.addTextfield("editme3")
      .setPosition(560,80)
      .setColorBackground(0)
      .setSize(100,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
      
      
    btnsave =gui.addButton("Save")
      .setPosition(880,550)
      .setSize(100,40)
      .setColorBackground(0)
      .setFont(cf3)
      .setLabel("Save")
      .plugTo(this);
      
    btnback=gui.addButton("Back")
      .setPosition(880,500)
      .setSize(100,40)
      .setColorBackground(0)
      .setFont(cf3)
      .setLabel("Back")
      .plugTo(this);
    
    
  }



  public void drawNewRow(){
    
  title2=  gui.addLabel("Config Maker Section")
      .setPosition(200,0)
      .setColorBackground(0)
      .setColor(0)
      .setFont(cf2)
      .plugTo(this);
    
   txtkey= gui.addTextfield(prefix + index +  "_key")
      .setPosition(x, y)
      .setColorBackground(0)
      .setSize(50,20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

   txtlabel= gui.addTextfield(prefix + index +  "_label")
      .setPosition(x + 70, y)
      .setColorBackground(0)
      .setSize(200,20)
      .setFont(cf1)
      .setValue("hello world")
      .setCaptionLabel("") 
      .plugTo(this);

   rdbtnSteve= gui.addRadioButton(prefix + index +  "_steve")
      .setPosition(x+300, y)
      .setSize(40, 20)
      .setItemsPerRow(2)
      .setColorBackground(0)
      .setSpacingColumn(50)
      .addItem("State", 1)
      .addItem("Event", 2)
      .setValue(1)
      .plugTo(this);

   txtmeg= gui.addTextfield(prefix + index +  "_meg")
      .setPosition(x + 510, y)
      .setColorBackground(0)
      .setSize(200, 20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

    btnremove= gui.addButton(prefix + index +  "_remove")
      .setPosition(x + 720, y)
      .setColorBackground(0)
      .setFont(cf1)
      .setLabel("Remove")
      .plugTo(this);

    rows.add(index);
    index++;
    y+= 30;
    drawAddButton();
  }

  



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

  public void getRowsAsCSVString() {
    String str;
    for (Integer i : rows) {
      println(gui.getController(prefix + i + "_label").getStringValue());
    }
  }

  public void Back(){
    txtgroup.hide();
    txtid.hide();
    txtrun.hide();
    txteditme1.hide();
    txteditme2.hide();
    txteditme3.hide();
    title2.hide();
    txtkey.hide();
    txtlabel.hide();
    rdbtnSteve.hide();
    txtmeg.hide();
    btnremove.hide();
    addButton.hide();
    btnback.hide();
    

    refreshState(Mode.SELECTOR);
  }
  
  void hide(){

  }
}
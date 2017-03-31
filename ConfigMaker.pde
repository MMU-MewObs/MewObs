

public class ConfigMaker {
  PApplet papp;
  int x = 10, y = 140, index;
  String prefix = "enterControl_";
  ControlFont cf1 = new ControlFont(createFont("Arial", 15, true));
  ControlFont cf2 = new ControlFont(createFont("Helvetica", 54, true));
  ControlFont cf3 = new ControlFont(createFont("Arial", 22, true));

<<<<<<< HEAD
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



=======
  ArrayList<ConfigRow> rows;

  Textlabel title;
  Textfield txtGroup, txtId, txtRun, txtEditMe1, txtEditMe2, txtEditMe3;
  Button btnSave, btnBack;
>>>>>>> origin/master

  ConfigMaker(PApplet app) {
    papp = app;

    rows = new ArrayList<ConfigRow>();

    drawLabels();
    drawNewRow();
<<<<<<< HEAD
    
    txtgroup= gui.addTextfield("group")
      .setPosition(10,80)
=======

    title = gui.addLabel("Config Maker Section")
      .setPosition(200, 0)
>>>>>>> origin/master
      .setColorBackground(0)
      .setColor(0)
      .setFont(cf2)
      .plugTo(this);

    txtGroup = gui.addTextfield("group")
      .setPosition(10, 80)
      .setColorBackground(0)
      .setSize(100, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
<<<<<<< HEAD
    
    txtid= gui.addTextfield("id")
      .setPosition(120,80)
=======

    txtId = gui.addTextfield("id")
      .setPosition(120, 80)
>>>>>>> origin/master
      .setColorBackground(0)
      .setSize(100, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
<<<<<<< HEAD
      
    txtrun= gui.addTextfield("run")
      .setPosition(230,80)
=======

    txtRun = gui.addTextfield("run")
      .setPosition(230, 80)
>>>>>>> origin/master
      .setColorBackground(0)
      .setSize(100, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
<<<<<<< HEAD
      
    txteditme1= gui.addTextfield("editme1")
      .setPosition(340,80)
=======

    txtEditMe1 = gui.addTextfield("editme1")
      .setPosition(340, 80)
>>>>>>> origin/master
      .setColorBackground(0)
      .setSize(100, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
<<<<<<< HEAD
    
   txteditme2=gui.addTextfield("editme2")
      .setPosition(450,80)
=======

    txtEditMe2 = gui.addTextfield("editme2")
      .setPosition(450, 80)
>>>>>>> origin/master
      .setColorBackground(0)
      .setSize(100, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
<<<<<<< HEAD
      
    txteditme3=gui.addTextfield("editme3")
      .setPosition(560,80)
=======

    txtEditMe3 = gui.addTextfield("editme3")
      .setPosition(560, 80)
>>>>>>> origin/master
      .setColorBackground(0)
      .setSize(100, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);
<<<<<<< HEAD
      
      
    btnsave =gui.addButton("Save")
      .setPosition(880,550)
      .setSize(100,40)
=======

    btnSave = gui.addButton("Save")
      .setPosition(880, 550)
      .setSize(100, 40)
>>>>>>> origin/master
      .setColorBackground(0)
      .setFont(cf3)
      .setLabel("Save")
      .plugTo(this);
<<<<<<< HEAD
      
    btnback=gui.addButton("Back")
      .setPosition(880,500)
      .setSize(100,40)
=======

    btnBack = gui.addButton("Back")
      .setPosition(880, 500)
      .setSize(100, 40)
>>>>>>> origin/master
      .setColorBackground(0)
      .setFont(cf3)
      .setLabel("Back")
      .plugTo(this);
  }


<<<<<<< HEAD

  public void drawNewRow(){
    
  title2=  gui.addLabel("Config Maker Section")
      .setPosition(200,0)
      .setColorBackground(0)
      .setColor(0)
      .setFont(cf2)
      .plugTo(this);
    
   txtkey= gui.addTextfield(prefix + index +  "_key")
=======
  public void drawNewRow() {
    Textfield keyField = gui.addTextfield(prefix + index +  "_key")
>>>>>>> origin/master
      .setPosition(x, y)
      .setColorBackground(0)
      .setSize(50, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

<<<<<<< HEAD
   txtlabel= gui.addTextfield(prefix + index +  "_label")
=======
    Textfield labelField = gui.addTextfield(prefix + index +  "_label")
>>>>>>> origin/master
      .setPosition(x + 70, y)
      .setColorBackground(0)
      .setSize(200, 20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

<<<<<<< HEAD
   rdbtnSteve= gui.addRadioButton(prefix + index +  "_steve")
=======
    RadioButton r = gui.addRadioButton(prefix + index +  "_steve")
>>>>>>> origin/master
      .setPosition(x+300, y)
      .setSize(40, 20)
      .setItemsPerRow(2)
      .setColorBackground(0)
      .setSpacingColumn(50)
      .addItem(prefix + index + "State", 0)
      .addItem(prefix + index + "Event", 1)
      .hideLabels()
      .setValue(1)
      .plugTo(this);

<<<<<<< HEAD
   txtmeg= gui.addTextfield(prefix + index +  "_meg")
=======
    Textlabel state = gui.addLabel(prefix + index +  "_state")
      .setPosition(x+340, y)
      .setText("State")
      .setFont(createFont("Arial", 15))
      .plugTo(this);

    Textlabel event = gui.addLabel(prefix + index +  "_event")
      .setPosition(x+430, y)
      .setText("Event")
      .setFont(createFont("Arial", 15))
      .plugTo(this);

    r.activate(0);

    Textfield megField = gui.addTextfield(prefix + index +  "_meg")
>>>>>>> origin/master
      .setPosition(x + 510, y)
      .setColorBackground(0)
      .setSize(200, 20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

<<<<<<< HEAD
    btnremove= gui.addButton(prefix + index +  "_remove")
      .setPosition(x + 720, y)
      .setColorBackground(0)
      .setFont(cf1)
      .setLabel("Remove")
      .plugTo(this);

    rows.add(index);
=======
    rows.add(new ConfigRow(keyField, labelField, r, state, event, megField));
>>>>>>> origin/master
    index++;
    y+= 30;
    if (index < 15) {
      drawAddButton(false);
    } else {
      drawAddButton(true);
    }
  }

<<<<<<< HEAD
  
=======
  Button addButton = null;
  public void drawAddButton(boolean hideButton) {
    if (addButton == null) {
      addButton = gui.addButton("drawNewRow")
        .setPosition(360, y)
        .setFont(cf1)
        .setLabel("Add")
        .plugTo(this);
    } else {
      background(background1);
      drawLabels();
      if (hideButton) {
        addButton.hide();
      } else {
        addButton.setPosition(360, y);
      }
    }
  }

  public void drawLabels() {
    textSize(15);
    text("Key", x, 135);
    text("Label", x + 70, 135);
    text("Steve", x + 290, 135);
    text("MEG", x + 510, 135);
    text("Group", 10, 75);
    text("Id", 120, 75);
    text("Run", 230, 75);
    text("EditMe1", 340, 75);
    text("EditMe2", 450, 75);
    text("EditMe3", 560, 75);
  }
>>>>>>> origin/master

  public void Back() {
    for (ConfigRow r : rows) {
      r.hide();
    }
    addButton.hide();
    title.hide();
    txtGroup.hide(); 
    txtId.hide(); 
    txtRun.hide(); 
    txtEditMe1.hide(); 
    txtEditMe2.hide(); 
    txtEditMe3.hide();
    btnSave.hide(); 
    btnBack.hide();
    refreshState(Mode.SELECTOR);
  }

  public void Save() {
    selectFolder("Choose output location:", "outputDirectorySelected", null, this);
  }

  public void outputDirectorySelected(File selection) {
    if (selection != null) {
      String outputFileName = JOptionPane.showInputDialog(null, "Choose output file name", "");
      File renamedOutput = new File(selection.getAbsolutePath()+ "/" + outputFileName + ".csv");
      if (outputFileName != null) {
        if (renamedOutput.exists() == true && JOptionPane.showConfirmDialog(null, "File already exists, do you want to overwrite it?", "Override File", JOptionPane.YES_NO_OPTION) != JOptionPane.YES_OPTION) {
          JOptionPane.showMessageDialog(null, "Cancelled saving file", "Cancelled saving file", javax.swing.JOptionPane.INFORMATION_MESSAGE);
          return;
        }
        try {
          FileWriter output = new FileWriter(renamedOutput.getAbsolutePath(), true);
          output.write("type, key, label, steve, meg " + "\n" );

          for (ConfigRow r : rows) {
            output.write(r.getRowAsCSVString());
          }
          
          output.write("2" + ", " + txtGroup.getText() + "," + txtId.getText() + "," + txtRun.getText() + "," + txtEditMe1.getText() + "," + txtEditMe2.getText() + "," + txtEditMe3.getText() + "\n");

          output.flush();
          output.close();
        } 
        catch (IOException err) {
          println("Error occoured trying to write to file");         
          err.printStackTrace();
        }
      } else {
        JOptionPane.showMessageDialog(null, "Input failed", "File name cannot be empty", javax.swing.JOptionPane.INFORMATION_MESSAGE);
      }
    } else {
      JOptionPane.showMessageDialog(null, "Cancelled saving file", "Cancelled saving file", javax.swing.JOptionPane.INFORMATION_MESSAGE);
    }
  }
}

public class ConfigRow {
  Textfield key;
  Textfield label;
  RadioButton steve;
  Textlabel state, event;
  Textfield meg;

  ConfigRow(Textfield key, Textfield label, RadioButton steve, Textlabel state, Textlabel event, Textfield meg) {
    this.key = key;
    this.label = label;
    this.steve = steve;
    this.state = state;
    this.event = event;
    this.meg = meg;
  }

<<<<<<< HEAD
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
=======
  public String getRowAsCSVString() {
    String str = "1, ";
    str += key.getText() + ",";
    str += label.getText() + ",";
    if (steve.getValue() == 0) {
      str += "st,";
    } else {
      str += "eve,";
    }
    str += meg.getText() + "\n";
    return str;
>>>>>>> origin/master
  }

  public void hide() {
    key.hide();
    label.hide();
    steve.hide();
    state.hide();
    event.hide();
    meg.hide();
  }
}
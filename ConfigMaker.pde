

public class ConfigMaker {
  PApplet papp;
  int x = 40, y = 90, index;
  String prefix = "enterControl_";
  ControlFont cf1 = new ControlFont(createFont("Arial", 15, true));

  ArrayList<Integer> rows;

  ConfigMaker(PApplet app) {
    papp = app;
    textSize(15);
    text("Key", x, 80);
    text("Label", x + 70, 80);
    text("Steve/Event", x + 290, 80);
    text("MEG", x + 510, 80);
    rows = new ArrayList<Integer>();
    drawNewRow();
  }

  public void drawNewRow() {
    gui.addTextfield(prefix + index +  "_key")
      .setPosition(x, y)
      .setSize(50, 20)
      .setFocus(true)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

    gui.addTextfield(prefix + index +  "_label")
      .setPosition(x + 70, y)
      .setSize(200, 20)
      .setFont(cf1)
      .setValue("hello world")
      .setCaptionLabel("") 
      .plugTo(this);

    gui.addRadioButton(prefix + index +  "_steve")
      .setPosition(x+300, y)
      .setSize(40, 20)
      .setItemsPerRow(2)
      .setSpacingColumn(50)
      .addItem("State", 1)
      .addItem("Event", 2)
      .setValue(1)
      .plugTo(this);

    gui.addTextfield(prefix + index +  "_meg")
      .setPosition(x + 510, y)
      .setSize(200, 20)
      .setFont(cf1)
      .setCaptionLabel("") 
      .plugTo(this);

    gui.addButton(prefix + index +  "_remove")
      .setPosition(x + 720, y)
      .setFont(cf1)
      .setLabel("Remove")
      .plugTo(this);

    rows.add(index);
    index++;
    y+= 30;
    drawAddButton();
  }

  Button addButton = null;

  public void drawAddButton() {
    if (addButton == null) {
      addButton = gui.addButton("drawNewRow")
        .setPosition(360, y)
        .setFont(cf1)
        .setLabel("Add")
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

  void hide() {
  }
}
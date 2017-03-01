import java.util.*;
import javax.swing.JOptionPane;

public class Selector {
  File videoFile;
  File configFile;
  Mode nextState;
  
  ControlFont cf1 = new ControlFont(createFont("Arial", 15));
  ControlFont cf2 = new ControlFont(createFont("Ubuntu", 54));
  
  Selector(Mode nextState) {
    background(200, 200, 200);
    this.nextState = nextState;
    
    //TITLE
    Textlabel title=gui.addLabel("Wellcome to Mewobs")
        .setPosition(200,50)
        .setColor(0)
        .setFont(cf2)
        .plugTo(this);
        
    //VIDEO BUTTON

    
    Button btnVideo = gui.addButton("videoSelector")
      .setLabel("1) Choose Video File")
      .setPosition(150, 200)
      .setColorBackground(0)
      .setSize(200,50)
      .plugTo(this);
    btnVideo.getCaptionLabel().toUpperCase(true).setFont(cf1);

    //FILE BUTTON
    Button btnSettings = gui.addButton("configSelector")
      .setLabel("2) Choose Config File")
      .setPosition(380, 200)
      .setColorBackground(0)
      .setSize(200, 50)
      .plugTo(this);
    btnSettings.getCaptionLabel().toUpperCase(true).setFont(cf1);

    //NEXT BUTTON
    Button btnNextState = gui.addButton("toNextState")
      .setLabel("3) Next")
      .setPosition(610,200)
      .setColorBackground(0)
      .setSize(200, 50)
      .plugTo(this);

    btnNextState.getCaptionLabel().toUpperCase(true).setFont(cf1);
  }

  void videoSelector() {
    selectInput("Select a video to process:", "videoFileSelected", null, this);
  }

  void videoFileSelected(File selection) {
    if (selection != null) {
      JOptionPane.showMessageDialog(null,"File Chosen Succesfully,If needed to change click again", "File Confirmation", javax.swing.JOptionPane.INFORMATION_MESSAGE);
      if (isValidFileType(selection, new String[]{"mp4", "mov"}) == true) {
        videoFile = selection;
      } else {
        JOptionPane.showMessageDialog(null, "Unsupported file type", "Unsupported file type", javax.swing.JOptionPane.INFORMATION_MESSAGE);
      }
    }
  }

  void configSelector() {
    selectInput("Select a video to process:", "configFileSelected", null, this);
  }

  void configFileSelected(File selection) {
    if (selection != null) {
       JOptionPane.showMessageDialog(null,"File Chosen Succesfully,If needed to change click again", "File Confirmation", javax.swing.JOptionPane.INFORMATION_MESSAGE);
      if (isValidFileType(selection, new String[]{"csv"}) == true) {
        configFile = selection;
      } else {
        JOptionPane.showMessageDialog(null, "Unsupported file type", "Unsupported file type", javax.swing.JOptionPane.INFORMATION_MESSAGE);
      }
    }
  }



void toNextState() {
  if(configFile ==null || videoFile==null)
  { 
JOptionPane.showMessageDialog(null, "Please Provide the feilds", "1 or more Feilds Empty", javax.swing.JOptionPane.INFORMATION_MESSAGE);
  }
  else{
    gui.hide();
    refreshState(nextState);
  }
  }
  
 
  private boolean isValidFileType(File file, String[] acceptedTypes) {
    String extension, path = file.getAbsolutePath();
    int i = path.lastIndexOf('.');
    int p = Math.max(path.lastIndexOf('/'), path.lastIndexOf('\\'));
    if (i > p) {
      extension = path.substring(i+1).toLowerCase();
      List valid = Arrays.asList(acceptedTypes);
      if (valid.contains(extension)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
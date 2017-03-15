import java.io.*;
import java.lang.*;

final int STEVE = 1;
final int GROUP = 2;
final int LOG = 3;
final int OTHER = 4;

public class EventRecorder {
  ArrayList<Event> events;
  String userVars;
  String videoFileName;
  FileWriter output;
  File outputFile;
  File configFile;
  Logger logger;
  EventRecorder(File configFile, String videoFileName) {
    logger = new Logger(600, 20);
    this.configFile = configFile; //<>// //<>//
    Date d = new Date();
    new File(dataPath("")).mkdirs();
    this.outputFile = new File(dataPath(d.getTime() + ".csv"));
    if(!outputFile.exists()){
      try {
        outputFile.createNewFile();
      } catch (IOException err){
        println("Error occoured trying to create file");
        err.printStackTrace();
      }
    }
    this.videoFileName = videoFileName;
    ArrayList<String> behaviours = new ArrayList<String>(Arrays.asList(loadStrings(configFile.getAbsolutePath())));
    behaviours.remove(0); //remove first row of column headings
    events = new ArrayList<Event>();
    for (String x : behaviours) {
      String[] row = (x.split(","));
      switch(Integer.valueOf((row[0]))) {
      case STEVE:
        events.add(new Event(row[1].charAt(0), row[2], row[3], row[4]));
        break;
      case GROUP:
        userVars = String.join(",", new String[]{row[1], row[2], row[3], row[4]});
        break;
      case LOG:
        events.add(new Event(row[1].charAt(0), row[2], row[3], row[4]));
      }
    }
    try {
      output = new FileWriter(outputFile.getAbsolutePath(), true);
    } catch(IOException err) {
      println("Couldn't get output file.");
      err.printStackTrace();
    }
  }
  
  public void render(){
    logger.render();
  }

  public void keyEvent(char k, float time, float duration) {
    if(k == 'x'){
      saveFile();
    }
     //make this a dynamic key
    for (Event e : events) {
      if (e.keyStroke == k) {
        // dont break out of loop incase multiple steves are required for a single keystokes
        try {
          output.write(e.getOutputString(",") + "," + time + "," + duration + "," + userVars +  "\n" );
          output.flush();
          logger.addLine(e.getGUIString() + "     " + time, true);
        } catch (IOException err){
          println("Error occoured trying to write to file");
          err.printStackTrace();
        }
      }
    }
  }
  
  public void keyEvent(boolean k, float time, float duration) {
    
  }
  
  public void saveFile(){
    selectFolder("Choose output location:", "outputDirectorySelected", null, this);
  }
  
  public void outputDirectorySelected(File selection){
    if (selection != null) {
      String outputFileName = JOptionPane.showInputDialog(null, "Choose output file name", videoFileName.replaceFirst("[.][^.]+$", "") + "_" + configFile.getName().replaceFirst("[.][^.]+$", ""));
      File renamedOutput = new File(selection.getAbsolutePath()+ "/" + outputFileName + ".csv");
      if(outputFileName != null){
        println(renamedOutput.getAbsolutePath());
        if(renamedOutput.exists() == true && JOptionPane.showConfirmDialog(null, "File already exists, do you want to overwrite it?", "Override File", JOptionPane.YES_NO_OPTION) != JOptionPane.YES_OPTION){
          JOptionPane.showMessageDialog(null, "Cancelled saving file", "Cancelled saving file", javax.swing.JOptionPane.INFORMATION_MESSAGE);
          return;
        }
        try {
          output.flush();
          output.close();
          outputFile.renameTo(renamedOutput);
        } catch (IOException err){
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

public class Event {
  char keyStroke;
  String label, steve, meg;
  Event(char keyStroke, String label, String steve, String meg) {
    this.keyStroke = keyStroke;
    this.label = label;
    this.steve = steve;
    this.meg = meg;
    
  }

  String getOutputString(String seperator) {
    String[] toWrite = new String[3];
    toWrite[0] = label;
    toWrite[1] = steve;
    toWrite[2] = meg;
    return join(toWrite, seperator);
  }
  
  String getGUIString(){
    String[] toWrite = new String[3];
    toWrite[0] = ( steve == "eve" ? "Event: " : "State :");
    toWrite[1] = label.substring(0, 1).toUpperCase() + label.substring(1).toLowerCase();
    toWrite[2] = meg.substring(0, 1).toUpperCase() + meg.substring(1).toLowerCase();
    return join(toWrite, "     ");
  }
}
import java.io.*;

final int STEVE = 1;
final int GROUP = 2;
final int OTHER = 3;


public class EventRecorder {
  ArrayList<Event> events;
  String userVars;
  String videoFileName;
  FileWriter output;
  File outputFile;
  File configFile;
  EventRecorder(File configFile, String videoFileName) {
    this.configFile = configFile;
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
        events.add(new Event(row[1].charAt(0), row[2], row[3], row[4], row[5], row[6]));
        break;
      case GROUP:
        userVars = String.join(",", new String[]{row[1], row[2], row[3], row[4], row[5], row[6]});
        break;
      }
    }
    try {
      output = new FileWriter(outputFile.getAbsolutePath(), true);
    } catch(IOException err) {
      println("Couldn't get output file.");
      err.printStackTrace();
    }
  }

  public void keyEvent(char k, float time, float duration) {
    if(k == 'x'){
      saveFile();
    }
    
    // make this a dynamic key
    for (Event e : events) {
      if (e.keyStroke == k) {
        // dont break out of loop incase multiple steves are required for a single keystokes
        println(e.getOutputString());
        try {
          output.write(e.getOutputString() + "," + time + "," + duration + "," + userVars +  "\n" );
          output.flush();
        } catch (IOException err){
          println("Error occoured trying to write to file");
          err.printStackTrace();
        }
      }
    }
  }
  
  public void saveFile(){
    selectFolder("Choose output location:", "outputDirectorySelected", null, this);
  }
  
  public void outputDirectorySelected(File selection){
    if (selection != null) {
      String outputFileName = JOptionPane.showInputDialog(null, "Choose output file name", videoFileName.replaceFirst("[.][^.]+$", "") + "_" + configFile.getName().replaceFirst("[.][^.]+$", ""));
      if(outputFileName != null){
        try {
          output.flush();
          output.close();
          File renamedOutput = new File(selection.getAbsolutePath()+ "/" + outputFileName + ".csv");
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

// TODO: reduce megs to 1 if format still works with Matthew
public class Event {
  char keyStroke;
  String label, steve, meg1, meg2, meg3;
  Event(char keyStroke, String label, String steve, String meg1, String meg2, String meg3) {
    this.keyStroke = keyStroke;
    this.label = label;
    this.steve = steve;
    this.meg1 = meg1;
    this.meg2 = meg2;
    this.meg3 = meg3;
  }

  // TODO: add other megs if they exist
  String getOutputString() {
    String[] toWrite = new String[5];
    toWrite[0] = label;
    toWrite[1] = steve;
    toWrite[2] = meg1;
    toWrite[3] = meg2;
    toWrite[4] = meg3;
    return join(toWrite, ",");
  }
}
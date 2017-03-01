final int EVENT = 1;
final int GROUP = 2;

public class EventRecorder {
  ArrayList<Event> events;
  PrintWriter output;
  EventRecorder(File configFile, File outputFile) {
    ArrayList<String> behaviours = new ArrayList<String>(Arrays.asList(loadStrings(configFile.getAbsolutePath())));
    behaviours.remove(0); //remove first row of column headings
    events = new ArrayList<Event>();
    for (String x : behaviours) {
      String[] row = (x.split(","));
      switch(Integer.valueOf((row[0]))) {
      case EVENT:
        events.add(new Event(row[1].charAt(0), row[2], row[3], row[4], row[5], row[6]));
        break;
      case GROUP:
        break;
      }
    }
    output = createWriter(outputFile.getAbsolutePath()); 
  }

  public void keyEvent(char k, float time, float duration) {
    // make this a dynamic key
    if(key == 'x'){
      flushOutput();
      return;
    }
    
    for (Event e : events) {
      if (e.keyStroke == k) {
        // dont break out of loop incase multiple steves are required for a single keystokes
        println(e.getOutputString());
        output.println(e.getOutputString() + "," + time + "," + duration);
      }
    }
  }
  
  public void flushOutput(){
    output.flush();
    output.close();
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
    String[] towrite = new String[3];
    towrite[0] = label;
    towrite[1] = steve;
    towrite[2] = meg1;
    return join(towrite, ",");
  }
}
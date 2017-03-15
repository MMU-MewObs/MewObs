public class Logger {
  ArrayList<String> items = new ArrayList<String>();
  int activeItem = -1, top, x, y;
  Logger(int x, int top){
    this.x = x;
    this.top = top;
    y = top;
  }
  
  public void addLine(String item, boolean isActive){
    items.add(item);
    if(isActive){
      activeItem = items.size();
    }
    text(item, x, y+2);
    y += 17;
  }
  
  public void stopTimers(){
    activeItem = -1;
  }
  
  public void render(){
    y = top;
    for(String i : items){
      text(i, x, y);
      y += 17;
    }
  }
}
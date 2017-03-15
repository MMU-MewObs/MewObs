public class Logger {
  ArrayList<String> items = new ArrayList<String>();
  int activeItem = -1, top, x, y;
  Logger(int x, int top) {
    this.x = x;
    this.top = top;
    y = top;
  }

  public void addLine(String item, boolean isActive) {

    items.add(item);
    if (isActive) {
      activeItem = items.size()-1;
    }
    text(item, x, y+2);
    fill(255);
    ellipse(x-5, y-3, 2, 2);
    fill(0);
    y += 17;
  }

  public void stopTimers() {
    activeItem = -1;
  }

  public void render() {
    y = top;
    int arraySize = items.size();

    for (int i = 0; i < arraySize; i++) {
      text(items.get(i), x, y);
      if (i == activeItem) {
        fill(255);
        ellipse(x-5, y-3, 2, 2);
        fill(0);
      }
      y+=17;
    }
  }
}
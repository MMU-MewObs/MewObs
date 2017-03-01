import controlP5.*;
ControlP5 gui;

enum Mode {
  LAUNCH, SELECTOR, PLAY
}
Mode currentMode = Mode.SELECTOR;

Selector selector;
Player player;
EventRecorder recorder;

void setup() {
  size(1000, 500);
  gui = new ControlP5(this);
  refreshState(Mode.SELECTOR);
}

void refreshState(Mode newMode) {
  currentMode = newMode;
  switch(newMode) {
  case LAUNCH:
  case SELECTOR:
    selector = new Selector(Mode.PLAY);
    break;
  case PLAY:
    player = new Player(this, selector.videoFile, true, 30,30,250);
    File o = new File("output.csv");
    recorder = new EventRecorder(selector.configFile, o);
    break;
  }
}

void keyPressed() {
  switch(currentMode) {
  case LAUNCH:
    break;
  case SELECTOR:
    break;
  case PLAY:
    recorder.keyEvent(key, player.getTime(), player.getDuration());
    break;
  }
}

void draw() {
  switch(currentMode) {
  case LAUNCH:
    break;
  case SELECTOR:
    break;
  case PLAY:
    //player.render();
    //recorder.render();
    break;
  }
}
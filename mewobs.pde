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
  refreshState(Mode.PLAY);
}

void refreshState(Mode newMode) {
  currentMode = newMode;
  switch(newMode) {
  case LAUNCH:
  case SELECTOR:
    selector = new Selector(Mode.PLAY);
    break;
  case PLAY:
    //File videoFile = new File("/Users/olliedavies/Clients/MMU/mewobsV2/sample.mov");
    //File configFile = new File("/Users/olliedavies/Clients/MMU/mewobsV2/assign.csv");
    player = new Player(this, selector.videoFile, true, 30,30,250);
    recorder = new EventRecorder(selector.configFile, selector.videoFile.getName());
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
    player.render();
    //recorder.render();
    break;
  }
}
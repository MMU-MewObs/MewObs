import controlP5.*;
ControlP5 gui;
import java.util.*;
import javax.swing.JOptionPane;

enum Mode {
  LAUNCH, SELECTOR, PLAY
}
Mode currentMode = Mode.SELECTOR;

Selector selector;
Player player;
EventRecorder recorder;
PImage image;

void setup() {
  size(1000, 600);
  gui = new ControlP5(this);
  refreshState(Mode.SELECTOR);
  //image=loadImage("play.png");
}

//ControlFont cf1 = new ControlFont(createFont("Arial", 15));

void refreshState(Mode newMode) {
  currentMode = newMode;
  switch(newMode) {
  case LAUNCH:
  case SELECTOR:
    selector = new Selector(Mode.PLAY);
    break;
  case PLAY:
    player = new Player(this, selector.videoFile, true, 15,15,300);
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
    background(200, 200, 200); 
    player.render();
    break;
  }

}
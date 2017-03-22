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
PImage image, background1;

void setup() {
  size(1000, 600);
  smooth();
  frameRate(30);
  background1=loadImage("images/bg.jpg");
  background1.resize(width, height);
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
    background(background1);
    player = new Player(this, selector.videoFile, selector.accelerometerFile, true, 2, 2, 317);
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
    background(background1);
    player.render();
    recorder.updateLogEvents(player.getTime());
    recorder.render();
    break;
  }
}
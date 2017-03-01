import processing.video.*;

public class Player {
  Movie mov;
  int x, y, xSize, ySize;
  float ratio;
  boolean autoplay = true;
  PApplet app;

  File videoFile;

  Player(PApplet papp, File video, Boolean autoplay, int x, int y, int ySize) {
    app = papp;
    videoFile = video;
    this.autoplay = autoplay;
    this.x = x;
    this.y = y;
    this.ySize = ySize;
    background(0);
    mov = new Movie(app, video.getAbsolutePath());
    mov.play();
    mov.jump(0);
    if (autoplay == false) {
      pause();
    }
    render();
  }

  public void play() {
    mov.play();
  }
  
  public float getTime(){
    return mov.time();
  }
  
  public float getDuration(){
    return mov.duration();
  }

  public void render() {
    if (mov.available() == true) {
      mov.read();
      ratio = (float) mov.width / mov.height;
    }
    image(mov, x, y, ratio * ySize, ySize);
  }
}
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
    gui();
  }

  public void gui() {
    PImage playb,pauseb,muteb,mediumb,highb;
    
    playb=loadImage("images/play.png");
    playb.resize(25,25);
    
    pauseb=loadImage("images/pause.png");
    pauseb.resize(25,25);
    
    muteb=loadImage("images/mute.png");
    muteb.resize(25,25);
    
    mediumb=loadImage("images/medium.png");
    mediumb.resize(25,25);
    
    highb=loadImage("images/loud.png");
    highb.resize(25,25);
    
    Button play =gui.addButton("play")
      .setPosition(20, 320)
      .setImage(playb)
      .plugTo(this);
    play.getCaptionLabel();

    Button pause =gui.addButton("pause")
      .setPosition(60, 320)
      .setImage(pauseb)
      .plugTo(this);
    pause.getCaptionLabel();
    
    Slider videoLenght =gui.addSlider("")
      .setSize(170,15)
      .setColorBackground(0)
      .setPosition(100, 325)
      .setRange(0, mov.duration());
    
    Textlabel volume = gui.addLabel("Volume:")
        .setPosition(290,325)
        .setSize(30,30)
        .setColorValue(0)
        .setFont(createFont("Helvetica",13))
        .plugTo(this);
        
    
    Button Mute =gui.addButton("mute")
      .setImage(muteb)
      .setPosition(370, 320)
      .plugTo(this);
    Mute.getCaptionLabel();
    
    Button Medium =gui.addButton("Medium")
      .setImage(mediumb)
      .setPosition(410, 320)
      .plugTo(this);
    Medium.getCaptionLabel();
 
    Button High =gui.addButton("High")
      .setImage(highb)
      .setPosition(450, 320)
      .plugTo(this);
    High.getCaptionLabel();
    
    ListBox speed =gui.addListBox("Speed")
      .setPosition(485,325)
      .setSize(80,100)
      .setItemHeight(15)
      .setBarHeight(15)
      .setColorBackground(0);
     speed.addItem("Speed 0.5", 0.5); 
     speed.addItem("Speed 1", 1); 
     speed.addItem("Speed 1.5", 1.5); 
     speed.addItem("Speed 2", 2);

  }

  public void play() {
    mov.play();
  }

  public float getTime() {
    return mov.time();
  }

  public float getDuration() {
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
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
    int slidervalue=100;

    Button play =gui.addButton("play")
      .setLabel("PLy")
      .setPosition(20, 320)
      .setSize(30, 30)
      .setColorBackground(0)
      .plugTo(this);
    play.getCaptionLabel();

    Button pause =gui.addButton("pause")
      .setLabel("POZ")
      .setSize(30, 30)
      .setPosition(60, 320)
      .setColorBackground(0)
      .plugTo(this);
    pause.getCaptionLabel();
    
    Slider videoLenght =gui.addSlider("")
      .setSize(150,10)
      .setColorBackground(0)
      .setPosition(100, 330)
      .setRange(0, mov.duration());
    
    
    Textlabel volume = gui.addLabel("Volume:")
        .setPosition(280,330)
        .setSize(30,30)
        .setColorValue(0)
        .setFont(createFont("Georgia",12))
        .plugTo(this);
        
    
    Button Mute =gui.addButton("mute")
      .setLabel("Mute")
      .setSize(30, 30)
      .setPosition(370, 320)
      .setColorBackground(0)
      .plugTo(this);
    Mute.getCaptionLabel();
    
    Button Medium =gui.addButton("Medium")
      .setLabel("Mid")
      .setSize(30, 30)
      .setPosition(410, 320)
      .setColorBackground(0)
      .plugTo(this);
    Medium.getCaptionLabel();
 
    Button High =gui.addButton("High")
      .setLabel("High")
      .setSize(30, 30)
      .setPosition(450, 320)
      .setColorBackground(0)
      .plugTo(this);
    High.getCaptionLabel();
    
    ListBox speed =gui.addListBox("Speed")
      .setPosition(490,330)
      .setSize(100,100)
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
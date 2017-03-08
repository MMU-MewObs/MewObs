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
  
      Button play,pause;
      
      PImage muteb,mute_click,mute_hover,mediumb,medium_click,medium_hover,loudb,loud_click,loud_hover;
    PImage play_click,play_hover,playb;
    PImage pause_click,pause_hover,pauseb;

  public void gui() {

    
    //PLAY BUTTON
    playb=loadImage("images/play.png");
    play_click=loadImage("images/play_click.png");
    play_hover=loadImage("images/play_hover.png");
    playb.resize(25,25);
    play_click.resize(25,25);
    play_hover.resize(25,25);
    
    //PAUSE BUTTON
    pauseb=loadImage("images/pause.png");
    pause_click=loadImage("images/pause_click.png");
    pause_hover=loadImage("images/pause_hover.png");
    pauseb.resize(25,25);
    pause_click.resize(25,25);
    pause_hover.resize(25,25);
    
    //MUTE
    muteb=loadImage("images/mute.png");
    mute_click=loadImage("images/mute_click.png");
    mute_hover=loadImage("images/mute_hover.png");
    muteb.resize(25,25);
    mute_click.resize(25,25);
    mute_hover.resize(25,25);
    
    //MEDIUM
    mediumb=loadImage("images/medium.png");
    medium_click=loadImage("images/medium_click.png");
    medium_hover=loadImage("images/medium_hover.png");
    mediumb.resize(25,25);
    medium_click.resize(25,25);
    medium_hover.resize(25,25);
    
    //LOUD
    loudb=loadImage("images/loud.png");
    loud_click=loadImage("images/loud_click.png");
    loud_hover=loadImage("images/loud_hover.png");
    loudb.resize(25,25);
    loud_click.resize(25,25);
    loud_hover.resize(25,25);
    
    //****BUTTONS****
    play =gui.addButton("btnPlay")
      .setPosition(20, 320)
      .setImages(playb,play_hover,play_click)
      .setSize(25,25)
      .plugTo(this);
    play.getCaptionLabel();

    Button pause =gui.addButton("pause")
      .setPosition(60, 320)
      .setImages(pauseb,pause_hover,pause_click)
      .setSize(25,25)
      .plugTo(this);
    pause.getCaptionLabel();
    
    Slider videoLenght =gui.addSlider("slider")
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
      .setImages(muteb,mute_hover,mute_click)
      .setSize(25,25)
      .setPosition(370, 320)
      .plugTo(this);
    Mute.getCaptionLabel();
    
    Button Medium =gui.addButton("Medium")
      .setImages(mediumb,medium_hover,medium_click)
       .setSize(25,25)
      .setPosition(410, 320)
      .plugTo(this);
    Medium.getCaptionLabel();
 
    Button High =gui.addButton("High")
      .setImages(loudb,loud_hover,loud_click)
       .setSize(25,25)
      .setPosition(450, 320)
      .plugTo(this);
    High.getCaptionLabel();

    ScrollableList Speed = gui.addScrollableList("SpeedCtrl")
      .setPosition(485,325)
      .setSize(80,100)
      .setItemHeight(15)
      .setBarHeight(15)
      .addItem("Speed 0.5", 0.5)
      .addItem("Speed 1",0.99)
      .addItem("Speed 1.5", 1.5) 
      .addItem("Speed 2",1.99)
      .setColorBackground(0)
      .plugTo(this);
  }
  
 public void SpeedCtrl(int n) {
    mov.speed((float)gui.get(ScrollableList.class, "SpeedCtrl").getItem(n).get("value"));
   
}
  
  
  public void mute()
  {
    mov.volume(0);
  }
  public void Medium()
  {
    mov.volume(0.5);
  }
  public void High()
  {
    mov.volume(1);
  }
  
  public void pause()
  {
    mov.pause();
  }
  
  public void btnPlay(){
    mov.play();
  }
  //NOT WORKING**
  public void slider()
  {
    mov.time();
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
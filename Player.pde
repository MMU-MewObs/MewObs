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
    mov = new Movie(app, video.getAbsolutePath());
    mov.play();
    mov.jump(0);
    if (autoplay == false) {
      pause();
    }
    render();
    gui();
  }

  Button play, pause;

  PImage muteb, mute_click, mute_hover, mediumb, medium_click, medium_hover, loudb, loud_click, loud_hover;
  PImage play_click, play_hover, playb;
  PImage pause_click, pause_hover, pauseb;
  PImage backb, back_click, back_hover;
  PImage forwardb, forward_click, forward_hover;
  PImage screenb,screen_click,screen_hover;
  Slider videoLength;

  public void gui() {
    
    //PLAY BUTTON
    
    playb=loadImage(dataPath("images/play.png"));
    play_click=loadImage(dataPath("images/play_click.png"));
    play_hover=loadImage(dataPath("images/play_hover.png"));
    playb.resize(25, 25);
    play_click.resize(25, 25);
    play_hover.resize(25, 25);

    //PAUSE BUTTON
    pauseb=loadImage(dataPath("images/pause.png"));
    pause_click=loadImage(dataPath("images/pause_click.png"));
    pause_hover=loadImage(dataPath("images/pause_hover.png"));
    pauseb.resize(25, 25);
    pause_click.resize(25, 25);
    pause_hover.resize(25, 25);

    //MUTE
    muteb=loadImage(dataPath("images/mute.png"));
    mute_click=loadImage(dataPath("images/mute_click.png"));
    mute_hover=loadImage(dataPath("images/mute_hover.png"));
    muteb.resize(25, 25);
    mute_click.resize(25, 25);
    mute_hover.resize(25, 25);

    //MEDIUM
    mediumb=loadImage(dataPath("images/medium.png"));
    medium_click=loadImage(dataPath("images/medium_click.png"));
    medium_hover=loadImage(dataPath("images/medium_hover.png"));
    mediumb.resize(25, 25);
    medium_click.resize(25, 25);
    medium_hover.resize(25, 25);

    //LOUD
    loudb=loadImage(dataPath("images/loud.png"));
    loud_click=loadImage(dataPath("images/loud_click.png"));
    loud_hover=loadImage(dataPath("images/loud_hover.png"));
    loudb.resize(25, 25);
    loud_click.resize(25, 25);
    loud_hover.resize(25, 25);

    //BACK
    backb=loadImage(dataPath("images/back.png"));
    back_click=loadImage(dataPath("images/back_click.png"));
    back_hover=loadImage(dataPath("images/back_hover.png"));
    backb.resize(25, 25);
    back_click.resize(25, 25);
    back_hover.resize(25, 25);

    //FORWARD
    forwardb=loadImage(dataPath("images/forward.png"));
    forward_click=loadImage(dataPath("images/forward_click.png"));
    forward_hover=loadImage(dataPath("images/forward_hover.png"));
    forwardb.resize(25, 25);
    forward_click.resize(25, 25);
    forward_hover.resize(25, 25);

    screenb=loadImage(dataPath("images/screen.png"));
    screen_click=loadImage(dataPath("images/screen_click.png"));
    screen_hover=loadImage(dataPath("images/screen_hover.png"));
    screenb.resize(55, 55);
    screen_click.resize(55, 55);
    screen_hover.resize(55, 55);

  


    //****BUTTONS****
    play =gui.addButton("btnPlay")
      .setPosition(35, 320)
      .setImages(playb, play_hover, play_click)
      .setSize(25, 25)
      .plugTo(this);
    play.getCaptionLabel();

    Button pause =gui.addButton("pause")
      .setPosition(5, 320)
      .setImages(pauseb, pause_hover, pause_click)
      .setSize(25, 25)
      .plugTo(this);
    pause.getCaptionLabel();

    videoLength =gui.addSlider("slider")
      .setSize(170, 15)
      .setLabelVisible(false)
      .setColorBackground(0)
      .setPosition(70, 325)
      .setRange(0, mov.duration())
      .plugTo(this);
      
      videoLength.getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      videoLength.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

    Textlabel volume = gui.addLabel("Volume:")
      .setPosition(245, 325)
      .setColorValue(0)
      .setFont(createFont("Helvetica", 13))
      .plugTo(this);

    Button Mute =gui.addButton("mute")
      .setImages(muteb, mute_hover, mute_click)
      .setSize(25, 25)
      .setPosition(300, 320)
      .plugTo(this);
    Mute.getCaptionLabel();

    Button Medium =gui.addButton("Medium")
      .setImages(mediumb, medium_hover, medium_click)
      .setSize(25, 25)
      .setPosition(335, 320)
      .plugTo(this);
    Medium.getCaptionLabel();

    Button High =gui.addButton("High")
      .setImages(loudb, loud_hover, loud_click)
      .setSize(25, 25)
      .setPosition(370, 320)
      .plugTo(this);
    High.getCaptionLabel();

    ScrollableList Speed = gui.addScrollableList("SpeedControl")
      .setPosition(400, 325)
      .setSize(80, 100)
      .setItemHeight(15)
      .setBarHeight(15)
      .setOpen(false)
      .addItem("Speed 0.5", 0.5)
      .addItem("Speed 1", 0.99)
      .addItem("Speed 1.5", 1.5) 
      .addItem("Speed 2", 1.99)
      .setColorBackground(0)
      .plugTo(this);

    Button Back =gui.addButton("Back")
      .setImages(backb, back_hover, back_click)
      .setPosition(490, 320)
      .setSize(25, 25)
      .plugTo(this);

    Button forward=gui.addButton("forward")
      .setImages(forwardb, forward_hover, forward_click)
      .setPosition(525, 320)
      .setSize(25, 25)
      .plugTo(this);
      
      Boolean save;
      
     Button screenshot=gui.addButton("screenshot")
       .setImages(screenb,screen_hover,screen_click)
       .setPosition(945,545)
       .setSize(55,55)
       .setColorBackground(0)
       .plugTo(this);
  }
  
  public void screenshot()
  {
    String desktopPath=System.getProperty("user.home")+"/Desktop";
    saveFrame( System.getProperty("user.home") + "/Desktop/mewobs_####.png");
    
   
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

  public void btnPlay() {
    mov.play();
  }

  //NOT WORKING**
  public void slider(float value)
  {
    mov.jump(value);
  }

  public void Back()
  {
    mov.jump(mov.time()-5);
  }
  public void forward()
  {
    mov.jump(mov.time()+5);
  }

  public float getTime() {
    return mov.time();
  }

  public float getDuration() {
    return mov.duration();
  }


  void keyPressed() {
    if (key==27)
      key=0;
  }

  public void render() {
    if (mov.available() == true) {
      mov.read();
      ratio = (float) mov.width / mov.height;
    }
    image(mov, x, y, ratio * ySize, ySize);
  }
}
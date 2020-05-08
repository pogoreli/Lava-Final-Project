class leaderBoardSetup {
  PFont f;
  PImage background;
  readfile rf;
  leaderBoardSetup() {
    background=loadImage("bi.jpg");
    
    rf=new readfile();
    f= createFont("Algerian", 80); // font style
  }

  void boardDisplay() {
    //rf.back();
    
    rf.getdata();
    

    rf.best();
   
    rf.display();
    
  }
}

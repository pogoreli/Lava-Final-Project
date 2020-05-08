class Module1{

  int mod;
 
  PImage background;
  
  
  //classes of the game:
  Order1 ord1;
    Fill fil;
  
  
  Module1(int tmod){
      mod = tmod;
      fillInTheBlank=true;
  ord1 = new Order1(mod);
  
  fil = new Fill(mod);
  
  
  
 background =loadImage("bi.jpg");

  
  }
  
  
  void play1(){
    
   ////println(enter);
    
    
    if (trueFalse&&enter){
      
    }else if(mCQ&&enter){
      
      
    }else if(fillInTheBlank&&enter){
      fil.fillDraw();
      
    }else if(Order&&enter){
      ord1.order1Display();
      
    }else{
      
      
    }
    if(!enter&&!fillInTheBlank&&!Order){
      PfillInTheBlank=true;
    }
    
   if(PfillInTheBlank&&!enter){
background(200);
tint(200,200,200); 
image(background,0,height/5,width,height); 
  fill(255);
  textSize(45);
  textAlign(CENTER);
  
  text("TEXT PORTION", width/2, 150);
    fill(0);
   textSize(25);
rectMode(CORNER);
fill(168, 119, 50,50);
rect(0,height/3,width,height/2);
fill(0);
     
  text("of finllinthe blanks", width/2, height/2);
  
  
  if(keyPressed){
    enter =true;
    PfillInTheBlank =false;
    fillInTheBlank =true;
    keyPressed = false;
  }
  
  
  
  }
  
  if(!enter&&!Order){
      Order=true;
    }
  
  
  if(POrder&&!enter&&!HOrder&&!PfillInTheBlank){
background(200);
tint(200,200,200); 
image(background,0,height/5,width,height); 
  fill(255);
  textSize(45);
  textAlign(CENTER);
  
  text("TEXT PORTION", width/2, 150);
    fill(0);
   textSize(25);
rectMode(CORNER);
fill(168, 119, 50,50);
rect(0,height/3,width,height/2);
fill(0);
     
  text("OFF ORDERRR", width/2, height/2);
  
  
  if(keyPressed){
    enter =true;
    POrder=false;
    keyPressed = false;
  }
  
  
  
  }
  
   if(HOrder&&!enter){
     
     enter =false;
     POrder = false;
     fill(255);
  textSize(45);
  textAlign(CENTER);
  
  text("HINT!", width/2, 150);
    fill(0);
   textSize(25);
rectMode(CORNER);
fill(168, 119, 50,50);
rect(0,height/3,width,height/2);
fill(0);
     if(mod==1){
  text("First, we need to know what type of memory. \n Second, we need to give it a name!", width/2, height/2);
     }else{   text("We want a new array with type int of size 42", width/2, height/2);
     }
  
     if(keyPressed){
       Order = true;
       enter = true;
       HOrder = false;
       keyPressed = false;
       
     }
     
     
   }
  
    
  ////println("HOrder ="+HOrder);
   ////println("Order ="+Order);
    ////println("POrder ="+POrder);
     ////println("enter ="+HOrder);
      ////println("PfillIn ="+PfillInTheBlank);
       ////println("fillIn ="+fillInTheBlank);
    
      
  
    
    
  }
  
  
  
  
}

//

//Varibles so that we know which page to display:
boolean animation = true;
boolean intro= false;
boolean story = false;
boolean instruction = false;
boolean addInstructions = false;
boolean userName = false;
boolean menu =false;
boolean module1 =false;
boolean module2 =false;
boolean leaderBoard = false;


  boolean trueFalse=false;;
  boolean mCQ=false;
  boolean fillInTheBlank=false;
  boolean Order=false;
  
  boolean PtrueFalse=false;
  boolean PmCQ=false;
  boolean PfillInTheBlank=true;
  boolean POrder=false;
  
   boolean HtrueFalse=false;
  boolean HmCQ=false;
  boolean HfillInTheBlank=false;
  boolean HOrder=false;
  
  
   boolean enter = false;
   
   boolean doneG= false;
 
  //Order:
   boolean lost =false;
  boolean won =false;
  boolean again=false;
  


//Input class:
String typing = "";
String username= "";
PImage background;
float buttonXmin;
float buttonXmax;
float buttonYmin;
float buttonYmax;
boolean writing = false;

//fill in the blanks;
int fg_question=0;
//fill_the_gap_question[] fg=new fill_the_gap_question[2];
int score=0;//variable, which stores the score

//LeaderBoard:
Table table;
//int user_id=3;







//Pages as objects:

Animation ani;

Intro in;

Story sto;

Text_Input use;

Menu men;

Instructions instructions;

leaderBoardSetup led;

Module1 mod1;
Module1 mod2;



void setup(){
size(800,800,P3D);

ani = new Animation();

in = new Intro();

sto = new Story();

use = new Text_Input();

men = new Menu();

mod1 = new Module1(1);

mod2 = new Module1(2);

instructions= new Instructions();

led = new leaderBoardSetup();
//mod2 = new Module2();
table = loadTable("leaderboard.csv", "header");
int num=table.getRowCount();

}
void draw(){

  if (animation){
  ani.AnimationDisplay();
  }else if(intro){
  in.display();
  in.press();
    
  }else if(story){
    sto.StoryDisplay();
  }else if(instruction){
    instructions.display();
  }else if(userName){
    use.InputDisplay();

}else if(menu){
  men.menuDisplay();
  
}else if(module1){
  mod1.play1();
  
} else if(module2){
 mod2.play1();
  
}else if(leaderBoard){
  led.boardDisplay();
  
}

  
  if(!animation && !story)
  {
  score();
  user();
  }
  
  







}




    
  



  
  

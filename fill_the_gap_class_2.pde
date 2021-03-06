class fill_the_gap_question_1
{
  boolean lost = false;
  boolean win = false;
  int lostCounter =0;
  int questionNumber;
  int boxnumber=1;//variable, which is choosing which textbox to use
  int attempt;//variable, which counts the attempts
  char correct='U';//U/C/W variable which stores the condition of the answer
  boolean done=false; //variable for checking whether the question was already answered
  
  textbox[] t=new textbox[4];//creating textbox objects
  timer timer1=new timer(60);//creating a timer
  
  
  fill_the_gap_question_1()
  {
  setFillTheBlank();
  questionNumber=0;
  doneG=false;
  fg_question=1;
  }
  
  
  void correct()//action which is happening if the answer is correct/incorrect
{
  if(correct=='C')
  {
    fill(#32a85a);
    textSize(40);
    textAlign(CENTER);
    text("that's correct!",width/2,height/5);
    win = true;
   
    
     
  }else if(correct=='W')
  {
    fill(#a84432);
    textSize(40);
    textAlign(CENTER);
    text("That's wrong! try again!",width/2,height/5);
    
    lost = true;
    
  }
  
  
  
  if(win&&keyPressed){
    PfillInTheBlank=false;
    correct ='U';
    fillInTheBlank=false;
    enter =false;
    Order=true;
    POrder =true;
    win =false;
    keyPressed = false;
  }
  
  if(lost&&keyPressed){
    PfillInTheBlank=false;
    POrder =true;
    
       correct ='U';
     enter =false;
    fillInTheBlank=false;
    Order=true;
    lost=false;
     keyPressed = false;
  }
  
  //if(lostCounter==2){
  //  fillInTheBlank=false;
  //   Order=true;
    
  //}
  
  
  
  
  
  
}

void drawFillTheBlank()//void draw for fill the blank
{
  switching();//choosing the text field
  back();//background
  user();//displaying username
  score();//displaying score
  submitButton();//submitting the assigment
  for(int i=0; i<t.length; i++)
  {
  t[1].textDisplay();
  t[1].textInput();
  }
  correct();
  timer1.timerVisualisation();
  timer1.timerCount();
}

void setFillTheBlank()//void setup for fill the blank
{

  //for(int i=0;i<location_and_size[questionNumber].length;i++)
  //{
    t[1]=new textbox(location_and_size[1][0][0],
    location_and_size[1][0][1],location_and_size[1][0][2],
    int(location_and_size[1][0][3]),answers[1][0],
    int(location_and_size[1][0][4]));
  //}
  
  for(int i=0; i<t.length; i++)
  {
  t[1].setValues();
  }
  
  //timersetup();
}

void submitButton()
{
  fill(255,0,0);//text on top of the screen
  textSize(40);
  textAlign(CENTER);
  text("FILL THE GAPS",width/2,height/6);
  
  float buttonXmin;//defining the coordinates of the button
  float buttonXmax;//defining the coordinates of the button
  float buttonYmin;//defining the coordinates of the button
  float buttonYmax;//defining the coordinates of the button
  
  buttonXmin=(width/2)-((0.3*width)/2);//defining the coordinates of the button
  buttonXmax=(width/2)+((0.3*width)/2);//defining the coordinates of the button
  buttonYmin=(height*0.8)-((0.08*height)/2);//defining the coordinates of the button
  buttonYmax=(height*0.8)+((0.08*height)/2);//defining the coordinates of the button
  
  noStroke();
  fill(255,0,0);//button color
  rectMode(CENTER);
  
  rect(width/2, height*0.8,0.3*width, 0.08*height,55,55,55,55);//creating the rectangle for the button
  fill(255);
  text("SUBMIT",width/2,height*0.815);
  
  if(mousePressed)//checking whether the button was pressed
  {
    if(mouseX>=buttonXmin && mouseX<=buttonXmax && mouseY>=buttonYmin && mouseY<=buttonYmax)//filter for false positive
    {
      delay(300);
      if(mouseX>=buttonXmin && mouseX<=buttonXmax && mouseY>=buttonYmin && mouseY<=buttonYmax)//filter for false positive
      {
      buttonAction();//calling the button action
      }
    }
  } 
}

void buttonAction()
{
  boolean[] res=new boolean[t.length];//creating an array for results
  
  for(int i=0; i<t.length; i++)
    {
      res[i]=t[1].check();//getting the results from the object
      
    }
    
    boolean result=true;//checking whether every textbox answered correctly (variable)
    
    for(int i=0; i<t.length; i++)//checking whether every textbox answered correctly
    {
      if(!res[i])
      {
        result=false;
      }
    }
      
    if(result)//if all of them are correct
    {
      if(!done)//if the question have not been answered yer
      {
      done=true;//marking that the question was already answered
      doneG=done;
      correct='C';//changing the mode to correct
      score=score+timer1.scoreCounter();//adding the score, dependant on timer
      }
    }else
    {
      if(!done)//if the question have not been answered yer
      {
         correct='W';//condition is incorrect
         attempt++;//adding one more attempt
      }
    }
    boxnumber=0; //reseting the choice of an active textbox
}

void switching()//checking what texbox was chosen by user
{
  if(mousePressed)
  {
    for(int i=0; i<t.length; i++)
    {
      if(mouseX>=t[1].Xmin && mouseX<=t[1].Xmax && mouseY>=t[1].Ymin && mouseY<=t[1].Ymax)
      {
       boxnumber=i+1;
      }
  }
  }
}
class textbox
{
  float X;//X coordinate of a textbox
  float Y;//Y coordinate of a textbox
  float len;//length of a textbox
  float hei=0.1*height;//height of a textbox
  int number;//number of a textbox
  String correctAnswer;//correct answer which must be entered to the textbox
  String typing = "";//variable, which stores the data entered by user
  char condition='U'; //conditions: U-unanswered, C-correct, W-wrong
  int limit;//maximal number of symbols allowed to enter by user
  
  float Xmin;//coordinates of the fields for the choice by mouse
  float Xmax;//coordinates of the fields for the choice by mouse
  float Ymin;//coordinates of the fields for the choice by mouse
  float Ymax;//coordinates of the fields for the choice by mouse
  
  textbox(float x, float y, float l, int NUMBER, String CORRECTANSWER, int lim)//constructor
  {
    X=x;
    Y=y;
    len=l;
    number=NUMBER;
    correctAnswer=CORRECTANSWER;
    limit=lim;
  }
  
  void setValues()//setting the inicial values for coordinates of the fields
  {
  //variables
    Xmin=X-(len/2);
    Xmax=X+(len/2);
    Ymin=Y-(hei/2);
    Ymax=Y+(hei/2);
  }
  
  void textDisplay()//displaying the text in the boxes
  {
    
    if(condition=='U')//If the question is not yet answered
    {
      if(number==boxnumber)//if the field is chosen by user
      {
        stroke(#34b7eb);//stroke is blue
        strokeWeight(10);
      }else
      {
        noStroke();
      }
    }else if(condition=='C')//if the answer is correct
    {
      if(number==boxnumber)//if the field is chosen by user
      {
        stroke(#34b7eb);//stroke is blue
        strokeWeight(10);
      }else
      {
      stroke(#32a85a);//the stroke is green
      strokeWeight(10);
      }
    }else
    {//if the answer is incorrect or empty
      if(number==boxnumber)//if the field is chosen by user
      {
        stroke(#34b7eb);//stroke is blue
        strokeWeight(10);
      }else
      {
      stroke(#a84432);//the stroke is red
      strokeWeight(10);
      }
    }
    
      String showtext=typing;//isolating the typing variable to avoid a bug
      textAlign(CENTER);
      textSize(60);
      fill(255);
      rectMode(CENTER);
      rect(X, Y,len, hei,55,55,55,55);//showing the textbox white rectangle
      fill(0);
      text(showtext,X,Y+height*0.025);//showing the textbox text, entered by user
  
  }
  
  void textInput()//keyboard input
  {
    if(number==boxnumber)//if the textfield number matches with the user's choice type in that field
    {
      if(keyPressed)//if the keyboard key is pressed
      {
        if(key==TAB || key==ENTER || key==RETURN || key==ESC || key==DELETE)//protection from keys, which are not used in the input
        {
          //no action
        }else if(key==BACKSPACE)//delete the last symbol if the backspace is pressed
        {
          if(typing.length()>=1)//checking whetcher there is text in the field
          {
            char check=key;//protection from false positive
            delay(300);//protection from false positive
              if(check==key)//protection from false positive
                {
                  typing=typing.substring(0, typing.length()-1);//removing the last symbol of the string
                  delay(300);//delay to prevent removal of more than one symbol
                }
           }
         }else//if any other key is pressed
         {
            if(typing.length()<limit)//checking whether any room is left in the string (it must not exceed the limit)
            {
              char check=key;//protection from false positive
              delay(300);//protection from false positive
              if(check==key)//protection from false positive
                {
                  char k=key;
                  delay(300);
                  typing = typing + k;
                  
                  delay(300);//protection from duplicates
                  typing=typing.toUpperCase();
                 }
             } 
          }
      }
    }
  }
  
  boolean check()//checking whether the entered answer is correct
  {
    if(typing.equals(correctAnswer.toUpperCase()))//comparing the user's responce with the correct answer
    {
      condition='C';//changing the condition to correct
      return true;
    }else
    {
      condition='W';//changing the condition to incorrect
      return false;
    }
  } 
  
}
}

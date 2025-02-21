class Dot{
   
  //Variables for the dot
  PVector pos;
  PVector vel;
  PVector acc;
  boolean dead = false;


  //Add a brain to the dot
  Brain brain;
  
  
  //CConstructor
  Dot(){

    //We will use 400 vectors
    brain = new Brain(400);

    //We will initialite dots in the middle of the screen and still
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  
  }
  
  void show(){
      
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);  
          
  }
  
  void move(){



    //We will define the acceleration with the next element of the array
    if(brain.directions.length > brain.step){
      acc = brain.directions[brain.step];
      brain.step++;
    }else{
      //If there is not more directions the dot may be killed
      dead = true;


    }


    vel.add(acc);
    vel.limit(5); //We limit the velocity so it dont accelerates for ever
    pos.add(vel);
    
  }

  //We want to eliminate the dot if it goes out the boundaries
  void update(){
    
    if(!dead){
      move();
    
      if (pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2){
        dead = true;
      }

    }
  }
    
}
    

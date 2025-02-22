class Dot{
   
  //Variables for the dot
  PVector pos;
  PVector vel;
  PVector acc;

  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;

  float fitness = 0;


  //Add a brain to the dot
  Brain brain;
  
  
  //CConstructor
  Dot(){

    //We will use 400 vectors
    brain = new Brain(400);

    //We will initialite dot's variables
    pos = new PVector(width/2, height-10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  
  }
  
  void show(){
      
      if(isBest){
        fill(0, 255, 0);
        ellipse(pos.x, pos.y, 8, 8);  
      }

      else{
        fill(0);
        ellipse(pos.x, pos.y, 4, 4);  
      }


          
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


  void update(){
    
    //Stop moving when going out of boundaries or when we reach the goal
    if(!dead && !reachedGoal){
      move();
    
      if (pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2){
        dead = true;
      }
      else if (dist(pos.x, pos.y, goal_dot.x, goal_dot.y) < 5){

        reachedGoal = true;

      }
      
      //Added the obstacles
      else if(pos.x > 0 && pos.y < 310 && pos.x < 600 && pos.y > 300){
        dead = true;
      }
      else if(pos.x > 200 && pos.x < 800 && pos.y > 600 && pos.y < 610){
        dead = true;
      }

    }
  }

  void calculateFitness(){

    //We also want to add the steps needed to get to the goal 
    if (reachedGoal){
      fitness = 1.0/16.0 +10000.0/(float)(brain.step*brain.step);
    }
    else{
      float distanceToGoal = dist(pos.x, pos.y, goal_dot.x, goal_dot.y);
      fitness = 1.0/(distanceToGoal*distanceToGoal); //Inverse because we want te smaller the better
    } 
  }

  //A way to get a baby from a Dot
  Dot gimmeBaby(){
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }

}
    

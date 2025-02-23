//THIS IS THE MAIN FILE

//To solve the problem we need:
/*

    fitness function
    Mutation
    Crossover

*/

//This file should verify if the dino is dead by colapsing to other object

Dino test;
Obstacle test_obstacle;

float gravity = 2;

void setup(){
    size(800, 800);
    test = new Dino(gravity);
    test_obstacle = new Obstacle(5.0, 5.0, 10.0);

}

void draw(){
    background(255);

    line(0, height/2 +50, width, height/2 + 50);


    //--------- DINO ----------

    test.show();

    //if key pressed we want a big jump (up) or small jump(rigth)
    test.jump();

    
    //----------- OBSTACLES ---------
    test_obstacle.show();

    //We should move the obstacles to the left
    test_obstacle.move();
}


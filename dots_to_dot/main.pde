Population test;
PVector goal_dot = new PVector(400, 10); //Where the dots should go


void setup() {
    size(800, 800);
    test = new Population(1000);
}

void draw() {
    background(255);

    //goal_dot
    fill(255, 0, 0);
    ellipse(goal_dot.x, goal_dot.y, 10, 10);

    //Some obstacles
    fill(0, 0, 255);
    rect(0, 300, 600, 10);
    rect(200, 600, 600, 10);

    if(test.allDotsDead()){
        //If all dots are dead we want to start the genetic algorithm
        test.calculateFitness();
        test.naturalSelection();
        test.mutateDemBabies();



    }else{
        test.update();
        test.show();
    }

    /*
    fill(0);
    textSize(10);
    text("min_Steps: " + test.minStep, 5, 30);
    */
}


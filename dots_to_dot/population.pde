class Population{
    Dot[] dots;
    float fitnessSum;
    int gen = 1;
    int bestDot = 0;

    int minStep = 400;

    //Constructor
    Population(int size){
        dots = new Dot[size];

        for(int i = 0; i < size; i++){
            dots[i] = new Dot();
        }

    }

    void show(){
        for(int i = 1; i < dots.length; i++){
            dots[i].show();
        }

        //So the best is shown over the other ones
        dots[0].show();

    }

    void update(){
        for(int i = 0; i < dots.length; i++){

            //Si un punto supera la cantidad de pasos
            if(dots[i].brain.step > minStep){
                dots[i].dead = true;
            }else{
                dots[i].update();
            }
        }

    }

    void calculateFitness(){
        for(int i = 0; i < dots.length; i++){
            dots[i].calculateFitness();
        }
    }

    boolean allDotsDead(){
    
        for(int i = 0; i < dots.length; i++){
            if(dots[i].dead == false && dots[i].reachedGoal == false){
                return false;
            }
        }

        return true;
    }

    void naturalSelection(){
        //array to store the new next generation
        Dot[] newDots = new Dot[dots.length];
        calculateFitnessSum();

        //Elitism for the best dot
        setBestDot();
        newDots[0] = dots[bestDot].gimmeBaby();
        newDots[0].isBest = true;

        for(int i = 1; i < newDots.length; i++){
            
            //Select parent based on fitness
            Dot parent = selectParent();
            
            //get baby from parents
            newDots[i] = parent.gimmeBaby();
        }

        dots = newDots.clone();
        gen++;
    }

    void calculateFitnessSum(){
        fitnessSum = 0;
        for(int i = 0; i < dots.length; i++){
            fitnessSum += dots[i].fitness;
        }

    }

    Dot selectParent(){
        //We select a random number as a roulete.
        float rand = random(fitnessSum);

        float runningSum = 0;

        for(int i = 0; i < dots.length; i++){
            runningSum += dots[i].fitness;
            if(runningSum > rand){
                return dots[i];
            }
        }

        //Should never get to this point
        return null;
    }

    void mutateDemBabies(){
        for(int i = 1; i < dots.length; i++){
            dots[i].brain.mutate();
        }
    }

    //We dont want to mutate the best dots
    void setBestDot(){
        float max = 0;
        int maxIndex = 0;

        for(int i = 0; i < dots.length; i++){
            if(dots[i].fitness > max){
                max = dots[i].fitness;
                maxIndex = i;
            }
        }

        bestDot = maxIndex;

        //If it reached the goal we want to limit the maximum steps to the steps it took
        if(dots[bestDot].reachedGoal){
            minStep = dots[bestDot].brain.step;
            println("Step:", minStep);
        }

    }


}
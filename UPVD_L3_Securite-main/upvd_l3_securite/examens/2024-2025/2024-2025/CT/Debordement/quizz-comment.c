#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// number of questions and answers in the arrays
#define NQ 64
// number of questions asked per batch
#define n 5

char *questions[NQ]={
                     "Who painted the Mona Lisa?",
                     "What is the capital of France?",
                     "Who wrote 'Romeo and Juliet'?",
                     "Which planet is known as the Red Planet?",
                     "In which year did World War II end?",
                     "What is the largest ocean on Earth?",
                     "Who was the first man to walk on the moon?",
                     "What is the largest mammal in the world?",
                     "Which country is known as the Land of the Rising Sun?",
                     "What is the currency of the United Kingdom?",
                     "What is the tallest mountain in the world?",
                     "Which element has the chemical symbol 'O'?",
                     "Who discovered penicillin?",
                     "What is the capital of Italy?",
                     "Which continent is the Sahara Desert located on?",
                     "What is the largest desert in the world?",
                     "Who invented the telephone?",
                     "What is the main ingredient in guacamole?",
                     "In which country did the Olympic Games originate?",
                     "Which river is the longest in the world?",
                     "What is the largest country in the world by land area?",
                     "Which is the smallest country in the world?",
                     "Who is known as the Father of India?",
                     "In which year did the Titanic sink?",
                     "Which element has the atomic number 1?",
                     "Which famous scientist developed the theory of relativity?",
                     "What is the largest island in the world?",
                     "Who was the first president of the United States?",
                     "What is the capital of Japan?",
                     "Which famous ship sank in 1912 after hitting an iceberg?",
                     "What is the smallest planet in the solar system?",
                     "What is the longest river in the United States?",
                     "Which animal is known as the King of the Jungle?",
                     "What is the most spoken language in the world?",
                     "Which country is famous for its pyramids?",
                     "What is the chemical symbol for gold?",
                     "What is the currency of Japan?",
                     "Which is the largest planet in our solar system?",
                     "What year did the Berlin Wall fall?",
                     "Which country has the most population?",
                     "Who was the first woman to fly solo across the Atlantic Ocean?",
                     "Which human organ is capable of regenerating itself?",
                     "What is the hardest natural substance on Earth?",
                     "Which is the longest mountain range in the world?",
                     "Which planet is closest to the sun?",
                     "Who wrote '1984'?",
                     "What is the capital of Spain?",
                     "Which animal is known for its ability to change colors?",
                     "What is the largest continent?",
                     "What does DNA stand for?",
                     "What is the fastest land animal?",
                     "What is the main ingredient in sushi?",
                     "What is the smallest bone in the human body?",
                     "Who discovered gravity?",
                     "Which sea is the saltiest in the world?",
                     "Which country invented pizza?",
                     "What is the chemical formula for water?",
                     "What is the capital of Germany?",
                     "Who painted the Sistine Chapel ceiling?",
                     "What is the symbol for the chemical element Iron?",
                     "Which animal is the largest land mammal?",
                     "Who invented the light bulb?",
                     "What is the name of the longest river in South America?",
                     "Which country is known as the land of maple syrup?"
};
 
char *correct_answers[NQ]={
                   "Leonardo da Vinci",
                   "Paris",
                   "William Shakespeare",
                   "Mars",
                   "1945",
                   "Pacific Ocean",
                   "Neil Armstrong",
                   "Blue whale",
                   "Japan",
                   "Pound Sterling",
                   "Mount Everest",
                   "Oxygen",
                   "Alexander Fleming",
                   "Rome",
                   "Africa",
                   "Antarctic Desert",
                   "Alexander Graham Bell",
                   "Avocado",
                   "Greece",
                   "Nile River",
                   "Russia",
                   "Vatican City",
                   "Mahatma Gandhi",
                   "1912",
                   "Hydrogen",
                   "Albert Einstein",
                   "Greenland",
                   "George Washington",
                   "Tokyo",
                   "Titanic",
                   "Mercury",
                   "Missouri River",
                   "Lion",
                   "Mandarin Chinese",
                   "Egypt",
                   "Au",
                   "Yen",
                   "Jupiter",
                   "1989",
                   "China",
                   "Amelia Earhart",
                   "Liver",
                   "Diamond",
                   "The Andes",
                   "Mercury",
                   "George Orwell",
                   "Madrid",
                   "Chameleon",
                   "Asia",
                   "Deoxyribonucleic Acid",
                   "Cheetah",
                   "Rice",
                   "Stapes",
                   "Isaac Newton",
                   "Dead Sea",
                   "Italy",
                   "H2O",
                   "Berlin",
                   "Michelangelo",
                   "Fe",
                   "African Elephant",
                   "Thomas Edison",
                   "Amazon River",
                   "Canada"
};
  
int ask_questions() {

  int correct=0;
  int i;
  int k;
  char asw[32];
  
  //while( i < n )
  //for(i=0;i<n;i++)
  for(i=n;i>0;i--)
    {  
      k=((unsigned int) rand());
      printf("%s\n",questions[k & 63]);
      printf("answer:");
      //scanf("%s",asw);
      gets(asw);
      //printf("strcmp %d\n",strcmp(questions[k],asw));
      //if( strcmp(correct_answers[k],asw) == 0 )
      if( strcasestr(asw,correct_answers[k & 63]) != NULL )
        {
          printf("Yes! good answer\n");
          //printf(asw);
          //printf("\n");
          correct++;
        }
      else
        {
          printf(asw);
          printf("is not correct!");
          printf("the answer was : '%s'\n",correct_answers[k & 63]);          
        }
      //      i++;
    }
  return(correct);
}


int main()
{
  int play=1;
  char c;
  int r;
  int score;
  srand(time(NULL));
  //printf("%p\n",&play);
  //printf("main=%p\n,ask_questions=%p\n",main,ask_questions);
  /*
  for(int i=0;i<NQ;i++)
    {
      printf("QUESTION=%s\n, ANSWER=%s\n",questions[i],correct_answers[i]);
    }
  */
  
  //printf("Welcome to the quizz!\n");
  printf("We will ask you a batch of  %d questions. Try to give correct answers\n",n);

  
  while( play == 1 )
    {
      
      printf("ready? Type enter to proceed to the questions:\n");
      getchar();
      // ask 5 random questions
      r=ask_questions();
      if( r == 5)
        score+=10;

      printf("Do you want to play another time  ? (1=yes/0=no):\n");
      scanf("%d",&play);
      
    }
  
  printf("Your final score is %d \n",score);


  return(0);
}

#include<p18f45k80.h>

void delay(unsigned long time){
    for (time; time > 0; time--){
        unsigned char x;
        for(x = 0; x < 4; x++){
            Nop();
        }
    }
//    unsigned long x;
//    for(x = 0; x < time; x++){
//        int y;
//        for(y = 0; y < 12; y++){
//            Nop();
//        }
//    }
}

/* 
 * File:   Main.c
 * Author: Jason
 *
 * Created on September 27, 2019, 9:04 PM
 */
#include <p18f45k80.h>
#include <stdio.h>
#include <stdlib.h>
#include "I2C.h"
#include "SSD1306_OLED.h"
#include <string.h>
#include "delay.h"
#include "Microchip_logo_img.h"


#pragma config FOSC = HS1
#pragma config WDTEN = OFF
#pragma config XINST = ON
#pragma config SOSCSEL = DIG

/*
 * 
 */

char buffer[8];

char message_0[] = "64 x 32";
char message_1[] = "SSD1306";
char message_2[] = "OLED";
char message_3[] = "DISPLAY";

char message_4[] = "Large";
char message_5[] = "Font";

char message_6[] = "Hello";
char message_7[] = "World!";


unsigned int number;


void displayPercentage(unsigned char col, unsigned char row, unsigned char value){
    if(value < 10){
        sprintf(buffer, (const far rom char*)"  %d%", value);
        OLEDWriteLargeString(col, row, buffer);
    }else if(value >= 10 && value < 100){
        sprintf(buffer, (const far rom char*)" %d%", value);
        OLEDWriteLargeString(col, row, buffer);
    }else{
        sprintf(buffer, (const far rom char*)"%d%", value);
        OLEDWriteLargeString(col, row, buffer);
    }
}



//
//void OLEDWriteROMString(const rom char *string){     
//    while(*string){      
//        OLEDWriteCharacter(*string++);      
//    }  
//}

void main(void){
        
    unsigned int i;
    
    number = 0;
    
    TRISCbits.TRISC3 = 1;       //set to input for SCL I2c 
    TRISCbits.TRISC4 = 1;       //set to input for SDA I2c
    
    LATCbits.LATC3 = 0;
    LATCbits.LATC4 = 0;
    
    i2c_init();
    
    INTCONbits.GIE = 1;
    
    initOLED();
    
    delay(100);
    
    clearOLED();
    
    OLEDWriteCmd1(OLED_CMD_SET_CONTRAST, 0x26);
       

    setCursor(0,4);
	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(0x40);
	for(i = 0; i < 256; i++){
		i2c_write(image_data_OLED[i]);
	}
	i2c_stop();
    
    delay(200000);
    
    clearOLED();
    
    delay(1000);
    
    setCursor(0, 4);
    OLEDWriteString(message_0);
    setCursor(0, 5);
    OLEDWriteString(message_1);
    setCursor(0, 6);
    OLEDWriteString(message_2);
    setCursor(0, 7);
    OLEDWriteString(message_3);
    
    delay(200000);
    
    clearOLED();
    
    OLEDWriteLargeString(0, 4, message_4);
    OLEDWriteLargeString(0, 6, message_5);
    
    delay(200000);
    
    clearOLED();
    
     
    while(1){
        
        setCursor(0, 4);
        OLEDWriteString(message_6);
        setCursor(0, 5);
        OLEDWriteString(message_7);
        
        sprintf(buffer, (const far rom char*)"%d", number);
        OLEDWriteLargeString(0, 6, buffer);
        if(number >= 1000){
            number = 0;
        }else{
            number++;
        }
        delay(50000);
        

    }
    
    
}


// misc area for testing stuff...

//        unsigned char x;
//        unsigned char y;
//        unsigned int q;
//        
//        setCursor(0, 0);
//        
//        for(q = 0; q < 1024; q++){
//            i2c_start(I2C_START_CMD);
//            i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
//            i2c_write(0x40);
//            i2c_write(0xFF);
//            delay(2000);
//        }
//        i2c_stop(); 
//*********************************************************************
//        displayPercentage(3, 5, number);
//        
//        if(number >= 100){
//            number = 0;
//        }else{
//            number++;
//        }
        
//        OLEDWriteLargeCharacter(0, 0, 'A');
        
        
//        sprintf(buffer, (const far rom char*)"%d", number);
//        setCursor(25,1);
//        OLEDWriteString(buffer);
//        OLEDWriteLargeString(0, 1, buffer);
//        number++;
//    

//    setCursor(5,7);
//    OLEDWriteCharacter('A');
//    setCursor(120, 7);
//    OLEDWriteCharacter('B');
//    setCursor(5,4);
//    OLEDWriteCharacter('C');
//    setCursor(120, 4);
//    OLEDWriteCharacter('D');



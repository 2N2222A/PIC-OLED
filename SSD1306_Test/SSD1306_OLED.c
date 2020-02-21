
#include "I2C.h"
#include "SSD1306_OLED.h"
#include "Terminal6.h"
#include "Terminal12.h"
#include "delay.h"

/*
 * This library is for the SSD1306 type OLED controller.  
 * THis code is for a 64x32 type OLED display with i2c control.  It may need to be modified for 
 * other display resolutions such as the 128x64 and 128x32 types.  
 * 
 * Some things to note:
 * For normal display orientation, i.e. pins on the bottom, the coordinates are pages (rows) 0 to 3 and the column
 * offset begins at position 32 (0 column on display but position is 32 in GDRAM map).  
 * For 180 degree orientation, i.e. pins on the top, the coordinates are pages 4 to 7 and again the column
 * offset begins at memory map position 32.   
 * 
 */


void initOLED(){

	OLEDWriteCmd(OLED_CMD_DISPLAY_OFF);                     // pg 64, turn off display for initialisation
	OLEDWriteCmd1(OLED_CMD_SET_MUX_RATIO, 0x3F);            // Set mux ration tp select max number of rows - 64
	OLEDWriteCmd1(OLED_CMD_SET_DISPLAY_OFFSET, 0x00);       // Set display offet to 0
	OLEDWriteCmd(OLED_CMD_SET_DISPLAY_START_LINE);			// Set display start line at 0
	OLEDWriteCmd(OLED_CMD_SET_SEGMENT_REMAP);				// Mirror the X axis (default is 0xA0)
	OLEDWriteCmd(OLED_CMD_SET_COM_SCAN_MODE);				// Mirror the Y Axis (does not work for some reason)
	OLEDWriteCmd1(OLED_CMD_SET_COM_PIN_MAP, 0x12);			// Alternate COM pin map
	OLEDWriteCmd1(OLED_CMD_SET_CONTRAST, 0x7F);				// contrast
	OLEDWriteCmd(OLED_CMD_DISPLAY_RAM);                     // render from GDDRAM
	OLEDWriteCmd(OLED_CMD_DISPLAY_NORMAL);					// self explanatory
	OLEDWriteCmd1(OLED_CMD_SET_DISPLAY_CLK_DIV, 0x80);		// default oscillator setting
	OLEDWriteCmd1(OLED_CMD_SET_CHARGE_PUMP, 0x14);			// enable charge pimps
	OLEDWriteCmd1(OLED_CMD_SET_PRECHARGE, 0x22);			// high capacitance type precharge (or 0xF1)
	OLEDWriteCmd1(OLED_CMD_SET_VCOMH_DESELCT, 0x30);		// set VCOMH to max
	OLEDWriteCmd1(OLED_CMD_SET_MEMORY_ADDR_MODE, 0x00);     // Horizontal addressing mode
	OLEDWriteCmd(OLED_CMD_DISPLAY_ON);						// turn on display
}


void setCursor(unsigned char col, unsigned char row){

	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(OLED_CONTROL_BYTE_CMD_STREAM);
	i2c_write(OLED_CMD_SET_COLUMN_RANGE);
	i2c_write(col + COL_OFFSET);
	i2c_write(0x5F); // column end address  0x60;
	i2c_write(OLED_CMD_SET_PAGE_RANGE);
	i2c_write(row);
	i2c_write(0x07); // row end address   0x03;
	i2c_stop();


}


void OLEDWriteCharacter(char character){                          //This function is used to draw small ASCII 5x7 pixel characters
    unsigned char i;

	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(0x40);

    for(i=0; i<5; i++){
        //LcdWriteData(&(Terminal6x8[character - 0x20][i]));  // Read font array 
        i2c_write((Terminal6x8[character - 0x20][i]));  // Read font array 
    }

    i2c_write(0x00);

    i2c_stop();

}


void OLEDWriteString(char *characters){     
    while(*characters){      
        OLEDWriteCharacter(*characters++);      
    }  
}


void OLEDWriteLargeCharacter(unsigned char col, unsigned char row, char character){
    unsigned char i;
    setCursor(col, row);                                                  //Set character position
    for(i=0; i<11; i++){
    //LcdWriteData(&(Terminal11x16[z-0x20][2*i]));  //Read font array from PROGMEM and display top half of character
        OLEDWriteData(Terminal11x16[character - 32][2 * i]);
    //LcdWriteData((Terminal11x16[z-0x20][2*i]));  //Read font array from PROGMEM and display top half of character
    }OLEDWriteData(0x00);
    setCursor(col, row+1);                                               //Set position with y position set lower to display bottom half of character
    for(i=0; i<11; i++){
    //LcdWriteData(&(Terminal11x16[z-0x20][(2*i)+1])); //Read font array from PROGMEM and display bottom half of character
        OLEDWriteData(Terminal11x16[character - 32][(2*i)+1]); //Read font array from PROGMEM and display bottom half of character
    }OLEDWriteData(0x00);
}


void OLEDWriteLargeString(unsigned char col, unsigned char row, char *characters){     
    while(*characters){      
        OLEDWriteLargeCharacter(col, row, *characters++);
        col+= 13;       //Advance location for the next character by character width amount plus padding
    }  
}


void OLEDWriteData(unsigned char dat){
	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(0x40);
	i2c_write(dat);
	i2c_stop();
}

// control structure: C0 | D/C | X | X | X | X | X | X 

void OLEDWriteCmd(unsigned char dat){
	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(0x80);
	i2c_write(dat);
	i2c_stop();
}


void OLEDWriteCmd1(unsigned char dat, unsigned char dat_1){
	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(0x00);
	i2c_write(dat);
    i2c_write(dat_1);
	i2c_stop();
}


void clearOLED(){
	unsigned int i;
    setCursor(0,0);
	i2c_start(I2C_START_CMD);
	i2c_write(SSD1306_ADDRESS | I2C_WRITE_CMD);
	i2c_write(0x40);
	for(i = 0; i < 1024; i++){
		i2c_write(0x00);
	}
	i2c_stop();
}	


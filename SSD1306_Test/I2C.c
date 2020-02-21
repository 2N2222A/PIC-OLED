
#include <p18f45k80.h>

#include "I2C.h"

//**************************************************************************************************************************

// Start PIC18F14K22 I2C Function
void i2c_init(void) {
  // Initial PIC18F14K22 I2C bus Ports: RB4 - SDA and RB6 - SCL, Set as Input
//  TRISBbits.TRISB4 = 1;
//  TRISBbits.TRISB6 = 1;  

  // Initial the PIC18F14K22 MSSP Peripheral I2C Master Mode
  // I2C Master Clock Speed: 16000000 / ((4 * (SSPADD + 1)) = 16000000 / (4 * (39 + 1))
  SSPSTAT = 0x80;      // Slew Rate is disable for 100 kHz mode
  SSPCON1 = 0x28;      // Enable SDA and SCL, I2C Master mode, clock = FOSC/(4 * (SSPADD + 1))
  SSPCON2 = 0x00;      // Reset MSSP Control Register
  SSPADD = 0x27;         // Standard I2C Clock speed: 100 kHz  (original is decimal 39)

  PIR1bits.SSPIF=0;    // Clear MSSP Interrupt Flag
}

//**************************************************************************************************************************

void i2c_idle(void)
{
  // Wait I2C Bus and Status Idle (i.e. ACKEN, RCEN, PEN, RSEN, SEN)
  while (( SSPCON2 & 0x1F ) || ( SSPSTATbits.R_W));
}

//******************************************************************************************************************

void i2c_start(unsigned char stype)
{
  i2c_idle();                     // Ensure the I2C module is idle
  if (stype == I2C_START_CMD) {
    SSPCON2bits.SEN = 1;          // Start I2C Transmission
    while(SSPCON2bits.SEN);
  } else {
    SSPCON2bits.RSEN = 1;         // ReStart I2C Transmission
    while(SSPCON2bits.RSEN);
  }
}

//**************************************************************************************************************************

void i2c_stop(void)
{
  // Stop I2C Transmission
  SSPCON2bits.PEN = 1;
  while(SSPCON2bits.PEN);
}

//**************************************************************************************************************************

unsigned char i2c_slave_ack(void)
{
  // Return: 1 = Acknowledge was not received from slave
  //         0 = Acknowledge was received from slave
  return(SSPCON2bits.ACKSTAT);
}

//**************************************************************************************************************************

void i2c_write(unsigned char data)
{
  // Send the Data to I2C Bus
  SSPBUF = data;
  if (SSPCON1bits.WCOL)         // Check for write collision
    return;  
  while(SSPSTATbits.BF);        // Wait until write cycle is complete
  i2c_idle();                   // Ensure the I2C module is idle
}

//**************************************************************************************************************************

void i2c_master_ack(unsigned char ack_type)
{
  SSPCON2bits.ACKDT = ack_type;   // 1 = Not Acknowledge, 0 = Acknowledge
  SSPCON2bits.ACKEN = 1;          // Enable Acknowledge
  while (SSPCON2bits.ACKEN == 1);
}

//**************************************************************************************************************************

unsigned char i2c_read(void)
{
  
  i2c_idle();                     // Ensure the I2C module is idle                         
  // Enable Receive Mode
  SSPCON2bits.RCEN = 1;           // Enable master for 1 byte reception
  while(!SSPSTATbits.BF);         // Wait until buffer is full
  return(SSPBUF);
}

//******************************************************************************************************************
//

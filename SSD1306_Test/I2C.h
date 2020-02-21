#ifndef I2C_H
#define I2C_H

// I2C Bus Control Definition
#define I2C_DATA_ACK 0
#define I2C_DATA_NOACK 1
#define I2C_WRITE_CMD 0
#define I2C_READ_CMD 1

#define I2C_START_CMD 0
#define I2C_REP_START_CMD 1
#define I2C_REQ_ACK 0
#define I2C_REQ_NOACK 0

void i2c_init(void);
void i2c_start(unsigned char stype);
void i2c_stop(void);
unsigned char i2c_slave_ack(void);
void i2c_write(unsigned char data);
void i2c_master_ack(unsigned char ack_type);
unsigned char i2c_read(void);

#endif

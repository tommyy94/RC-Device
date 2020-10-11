#ifndef SPI_H_
#define SPI_H_

#include <stdbool.h>


#define SPI_QUEUE_SIZE		(4)

void	 SPI0_Init(void);
bool     SPI_SelfTest(Spi *spi, uint16_t *msg, uint16_t *recv, uint32_t len);
uint16_t SPI0_vTransmitHalfword(uint16_t const halfword);
void     SPI0_vTransmitByte(uint8_t const byte);

void     SPI0_DMA_Init(void);
void     SPI0_DMA_TransmitMessage(uint16_t *msg, uint16_t *recv, uint32_t len);


#endif /* SPI_H_ */

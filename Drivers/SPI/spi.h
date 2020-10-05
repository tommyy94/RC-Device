#ifndef SPI_H_
#define SPI_H_

#include <stdbool.h>


#define SPI_QUEUE_SIZE		(4)

void	 SPI0_Init(void);
bool     SPI_SelfTest(Spi *spi, uint16_t *msg, uint16_t *recv, uint32_t len);

void     SPI0_DMA_Init(void);
void     SPI_DMA_TransmitMessage(Spi *spi, uint16_t *msg, uint16_t *recv, uint32_t len);


#endif /* SPI_H_ */

#ifndef SPI_H_
#define SPI_H_

#include <same70q21b.h>
#include <utils_assert.h>


#define SPI_QUEUE_SIZE		(32)

void	 SPI0_Init(void);
bool	 SPI_SelfTest(Spi *spi);
uint32_t SPI_TxMessage(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len);
void	 SPI_TxMessageIrq(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len);
void	 SPI_TxByteIrq(Spi *spi, uint8_t byte);


#endif /* SPI_H_ */

#ifndef DMA_H_
#define DMA_H_

void DMA_Init(void);
void DMA_memcpy(uint32_t *dest, uint32_t *src, uint32_t n);

#endif /* DMA_H_ */

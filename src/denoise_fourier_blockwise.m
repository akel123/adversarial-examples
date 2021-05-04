function img_denoised = denoise_fourier_blockwise(img_adv, lowPassRadius, highPassRadius)
    lowPassRadius = str2num(lowPassRadius); 
    highPassRadius = str2num(highPassRadius);


    img_denoised = blockproc(img_adv, [23,23], @(block_struct) denoise_block(block_struct.data, lowPassRadius, highPassRadius));
end

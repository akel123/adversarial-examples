function img_denoised = denoise_softthresh(img_adv, thresh_mul, wavelet_func)
    thresh_mul = str2num(thresh_mul);
    [thr_adv,sorh_adv,keepapp_adv] = ddencmp('den','wv',img_adv);
    img_denoised = wdencmp('gbl',img_adv,wavelet_func,2,thresh_mul*thr_adv,sorh_adv,keepapp_adv);
     
end

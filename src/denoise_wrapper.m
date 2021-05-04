function res = denoise_wrapper(input_dir_adv, images, save_dir_adv, denoise_method, varargin)
  Adv_Examples_Dir   =  input_dir_adv;
  Adv_Examples_Dir   =  strcat(Adv_Examples_Dir, '/'); 
  Save_Dir_Adv       =  save_dir_adv;
  
  %Adv_Examples       =  dir(Adv_Examples_Dir);
  %Adv_Examples       =  dir(Adv_Examples_Dir);
  [temp, numImages]  =  size(images);
  disp(numImages)
  %for n=3:3+numImages-1
  for n=1:numImages
    %Open an image and its adversarial counterpart
    %Adv_Image_Name      = Adv_Examples(n).name;
    Adv_Image_Name      = images{n};
    %disp(Adv_Image_Name)
    img_adv    = imread(strcat(Adv_Examples_Dir, Adv_Image_Name));
    %disp(denoise_method) 
    if strcmp(denoise_method, 'softthresh')
      thresh_mul   = varargin{1};
      wavelet_func = varargin{2};
      img_denoised = denoise_softthresh(img_adv, thresh_mul, wavelet_func);
    elseif strcmp(denoise_method, 'lv1approx')
      wavelet_func = varargin{1};
      img_denoised = denoise_lv1approx(img_adv, wavelet_func);
    elseif strcmp(denoise_method, 'fourier-whole')
      lowPassRadius   = varargin{1};
      highPassRadius   = varargin{2};
      img_denoised = denoise_fourier_whole(img_adv, lowPassRadius, highPassRadius);
    elseif strcmp(denoise_method, 'fourier-blockwise')
      lowPassRadius   = varargin{1};
      highPassRadius   = varargin{2};
      img_denoised = denoise_fourier_blockwise(img_adv, lowPassRadius, highPassRadius);
    else
      wavelet_func = varargin{1};
    end
     
    %[thr_adv,sorh_adv,keepapp_adv] = ddencmp('den','wv',img_adv);
    %Aimg_adv = wdencmp('gbl',img_adv,wavelet_func,2,thresh_mul*thr_adv,sorh_adv,keepapp_adv);

    imwrite(uint8(img_denoised), fullfile(Save_Dir_Adv, Adv_Image_Name));
  end
  res = 1;
end 

function img_denoised = denoise_fourier_whole(img_adv, radiusLowPass, radiusHighPass)
    radiusLowPass = str2num(radiusLowPass);
    radiusHighPass = str2num(radiusHighPass);

    [M, N, D] = size(img_adv); % image size
    X=0:N-1;
    Y=0:M-1;
    Z = 0:D-1;
    [X, Y, Z ]=meshgrid(X,Y,Z);
    Cx=0.5*N;
    Cy=0.5*M;
    %Cz=0.5*D;
    %% Construct the filter
    % Low pass
    [x, y] = meshgrid(1:N, 1:M);
    filterSpectrumLow = zeros(M, N);
    filterSpectrumLow((x  - N/2).^2 + (y  - M/2).^2 <= radiusLowPass.^2) = 1;
    % High pass
    filterSpectrumHigh = ones(M,N);
    filterSpectrumHigh((x  - N/2).^2 + (y  - M/2).^2 <= radiusHighPass.^2) = 0;
    % Band Pass Filter
    filterSpectrum = filterSpectrumHigh .* filterSpectrumLow;
    %% Apply the filter to the image
    % obtain Fourier transform
    F = fft2(img_adv);
    F = fftshift(F);

    % Apply low pass filter in the frequency domain
    J=F.*filterSpectrum;
    J1=ifftshift(J);
    B1=ifft2(J1);
    %disp(uint8(abs(B1)) - block);
    img_denoised = uint8(abs(B1));
end

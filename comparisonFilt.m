function filt = comparisonFilt(figtest, D0)

figure, subplot(221), imshow(figtest), title('Image originale');
[M, N] = size(figtest);

gauss = lpfilter('gaussian', M, N, D0, 0); 
productfilt_gauss = fft2(figtest).*gauss;
figtest_filt_gauss = im2uint8(mat2gray(ifft2(productfilt_gauss)));
subplot(222), imshow(figtest_filt_gauss), title('filtre gaussien');

ideal = lpfilter('ideal', M, N, D0, 0); 
productfilt_ideal = fft2(figtest).*ideal;
figtest_filt_ideal = im2uint8(mat2gray(ifft2(productfilt_gauss)));
subplot(223), imshow(figtest_filt_ideal), title('filtre idéal');

btw = lpfilter('btw', M, N, D0, 4); 
productfilt_btw = fft2(figtest).*btw;
figtest_filt_btw = im2uint8(mat2gray(ifft2(productfilt_btw)));
subplot(224), imshow(figtest_filt_btw), title('filtre butterworth ordre 4');

stitle = sprintf('Lowpass ; D0 = %f', D0);
sgtitle(stitle)
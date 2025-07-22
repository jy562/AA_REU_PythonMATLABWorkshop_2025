% AA REU Workshop Tutorial Code
% DFT and FFT.

clear; clc; close all;

%% DFT matrix:

N = 256;
omega_n = exp(-2i*pi/N);
[I, J] = meshgrid(1:N, 1:N);
DFT_mat = omega_n.^((I-1).*(J-1));

imagesc(real(DFT_mat));
colormap jet; colorbar;
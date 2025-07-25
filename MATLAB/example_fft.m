% AA REU Workshop Tutorial Code
% DFT and FFT.

clear; clc; close all;

%% DFT matrix:

N = 8;
omega_n = exp(-2i*pi/N);
[I, J] = meshgrid(1:N, 1:N);
DFT_mat = omega_n.^((I-1).*(J-1));

figure;
imagesc(real(DFT_mat));
cbar = colorbar; cbar.TickLabelInterpreter = "latex";
colormap jet; title("DFT Matrix");

% Inverse transform:
% iDFT_mat = inv(DFT_mat);
iDFT_mat = 1/N*omega_n.^(-(I-1).*(J-1));
% 1/N makes it unitary.

figure;
imagesc(real(iDFT_mat));
cbar = colorbar; cbar.TickLabelInterpreter = "latex";
colormap jet; title("iDFT Matrix");

%% Quick Test:

u1 = [1 1 1 1 -1 -1 -1 -1]'; % make sure it's a column vector.
u1_hat = DFT_mat * u1;
u1_recover = iDFT_mat * u1_hat;

figure;
imagesc(real(iDFT_mat*DFT_mat));
cbar = colorbar; cbar.TickLabelInterpreter = "latex";
colormap jet; title("Unitary Matrix Check");



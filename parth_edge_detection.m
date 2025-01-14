% Created on 15/01/25
% Created by Parth Shukla., BT22ECE079
% Modified to add additional functionalities

clc
clear all
close all

% Reading the image
I = imread("landscape.jpg");

% Displaying value of a specified pixel
disp(I(1010,505));

% Grayscale img using single layer of color img
I_gray1 = I(:,:,1);

% Grayscale img using average method
I_r = I(:,:,1);
I_g = I(:,:,2);
I_b = I(:,:,3);
I_gray2 = round((I_r + I_g + I_b) / 3);

% Grayscale img using luminosity method
I_gray3 = round(0.299 * I_r + 0.587 * I_g + 0.114 * I_b);

% Binary image using thresholding
threshold = 128; % Set threshold value
I_binary = imbinarize(I_gray3, threshold / 255);

% Image rotation
rotation_angle = 45; % Rotation angle in degrees
I_rotated = imrotate(I, rotation_angle, 'bilinear', 'crop');

% Edge detection using Canny method
I_edges = edge(I_gray3, 'canny');

% Displaying the original, grayscale, and binary images
figure(1)
subplot(2, 2, 1), imshow(I); xlabel("Original Image");
subplot(2, 2, 2), imshow(I_gray1); xlabel("Grayscale Image #1");
subplot(2, 2, 3), imshow(I_gray2); xlabel("Grayscale Image #2");
subplot(2, 2, 4), imshow(I_binary); xlabel("Binary Image");

% Displaying additional functionalities: rotation and edge detection
figure(2)
subplot(1, 3, 1), imshow(I); xlabel("Original Image");
subplot(1, 3, 2), imshow(I_rotated); xlabel("Rotated Image");
subplot(1, 3, 3), imshow(I_edges); xlabel("Edge Detection (Canny)");

% Saving results as images
imwrite(I_binary, "BinaryImage.jpg");
imwrite(I_rotated, "RotatedImage.jpg");
imwrite(I_edges, "EdgeDetection.jpg");

disp("Image processing complete. Outputs saved as images.");

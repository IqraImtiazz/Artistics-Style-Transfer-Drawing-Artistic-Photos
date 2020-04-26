clear 
close all

tic;
addpath('DomainTransformFilters-Source-v1.0/');

imsize=400;

% import images

[file,path] = uigetfile('*.jpg');
temp = fullfile(path,file);

% content=im2double(imread('images/house 2-small.jpg'));
% content=im2double(imread('images/selfie.jpg'));
% content=im2double(imread('images/eagles.jpg'));
% content=im2double(imread('images/lena.jpg'))
content=im2double(imread(temp));
content=content(1:imsize,1:imsize,:);


% style=im2double(imread('images/starry-night - small.jpg'));
% style=im2double(imread('images/night2.jpg'));
% style=im2double(imread('images/femme.jpg'));
% style=im2double(imread('images/man.jpg'));
% style=im2double(imread('images/picasso2.jpg'));
% style=im2double(imread('images/lamuse.jpg'));
% style=im2double(imread('images/derschrei.jpg'));
% style=im2double(imread('images/horse.jpg'));

[file,path] = uigetfile('*.jpg');
temp = fullfile(path,file);

style=im2double(imread(temp));
style=style(1:imsize,1:imsize,:);

hall=style_transfer(...
    imgaussfilt(content,100),...
    style,...
    ones(400,400,3),...
    ones(400,400),...
    0,...
    0,...
    [36 22],...
    [4 2 1],...
    imsize);

est_img=style_transfer(...
    content,...
    style,...
    hall,...
    segment(rgb2gray(content), 1),...
    0.25,...
    1.5,...
    [36 22 13],...
    [4 2 1],...
    imsize);

figure
imshow(est_img)

toc;
sound(sin(6.28*1000*[1:0.1:500]));



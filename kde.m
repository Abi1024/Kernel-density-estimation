%Abiyaz Chowdhury, Kernel density estimation of a univariate PDF
%Supports both Parzen windows and nearest neighbors

clc;
clear all;
close all;

N = 10000; %number of observations 
D = 1; %number of dimensions, the current implementation only supports D = 1
std = 1; %standard deviation of data set
mu = 0; %mean of data set
x = randn(N,1)+mu; %data set is drawn from a normal distribution
 
input = 0.5; %query point, we wish to calculate p(0.5) using kernel density estimation

%Parzen window with uniform kernel
h = 0.15; %each Parzen window is a cube of size length h
V = h^D; %volume of window

K = sum(abs(x-input)<=(h/2)) %number of points from the data set that lie within the Parzen window

predicted_prob_kernel = K/(N*V) %predicted probability as estimated by the kernel density estimator

actual_prob = normpdf(input,mu,std) %actual probability using the formula for the normal distribution

%Nearest neighbors density estimation
k = 20; %number of nearest neighbors

h = 0.01; %expanding window starts at a small height
K = 0;

while K < k %grow the window until it contains k points
    K = sum(abs(x-input)<=(h/2));
    h = h*1.1;
end

V = h^D;
K = sum(abs(x-input)<=(h/2));

predicted_prob_nearest_neighbors = K/(N*V) %predicted probability as estimated by the nearest neighbors density estimator

actual_prob = normpdf(input,mu,std) %actual probability using the formula for the normal distribution





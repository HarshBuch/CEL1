%Harsh buch
%20BME080
%CASE STUDY 1 = 2D_Unsteady Conduction in Square Copper Plate.
clear all
clc
%% PreProcessor
%Define variables
L = input('L = ') ; %Length of plate
W = input('W = ') ; %Width of plate
n = input('n = '); %Nodes
dx = L/(n-1);
dy = W/(n-1);
x = linspace(0,L,n); %Grid points x
y = linspace(0,W,n); %Grid points y
alpha = 113/1000000; %Thermal diffusivity
dt = input('dt = '); %Time step
 
%Maximum number of time = 16
T_max = input('T_max = ');
 
%Initial Temp vector
T = zeros(n,n);
%Boundary Conditions
T(:,1) = input('Temp left=');
T(:,n) = input('Temp right=');
T(1,:) = input('Temp bottom=');
T(n,:) = input('Temp top=');
%% Processor
% Iterate wrt time steps
for t = 0:T_max
  for i = 2:n-1
    for j=2:n-1
        T_w = T(i-1,j);
        T_p = T(i,j);
        T_e = T(i+1,j);
        T_n = T(i,j+1);
        T_s = T(i,j-1);
        T(i,j) = (T_p)+(alpha*dt/(dx^2))*(T_e-4*T_p+T_w+T_s+T_n);
    end
  end
end
contourf(T,'edgecolor','none')
colorbar
% surf(x,y,T) 
% axis equal
% grid off
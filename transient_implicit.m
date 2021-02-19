clear all
close all 
clc 

%solving a 2D unsteady state heat conduction equation
%alpha*(d^2(T)/dx^2 + d^2(T)/dy^2) = dT/dt

%number of grid points
nx = 10;
ny = 10;

%creating mesh
x = linspace(0,1,nx) ;
y = x ;
dx = x(2) - x(1) ;
dy = dx ;

%specifying constant values
alpha = 1.4 ;
dt = 1e-4 ;

%assigning BCs
T = 300*ones(10,10);
T(1,:) = 600;
T(end,:) = 900;
T(:,1) = 400;
T(:,end) = 800;
T(1,1) = 500;
T(1,end) = 700;
T(end,1) = 650;
T(end,end) = 850;
Told = T;
T_previous_nt = Told ;


%initializing a variable
error = 1000;
tol = 1e-4;

%calculating constants
k1 = (alpha*dt)/dx^2 ;
k2 = (alpha*dt)/dy^2 ;
term1 = 1/(1 + 2*k1 +2*k2);
term2 = k1 * term1 ;
term3 = k2 * term1 ;

%number of time steps
nt = 1000;

transient_implicit_jacobi(nt,error,tol,nx,ny,T,Told,T_previous_nt,term1,term2,term3);
transient_implicit_gs(nt,error,tol,nx,ny,T,Told,T_previous_nt,term1,term2,term3);
transient_implicit_sor(nt,error,tol,nx,ny,T,Told,alpha,T_previous_nt,term1,term2,term3);
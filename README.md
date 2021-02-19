# Transient-State-2D-Heat-Conduction
The Boundary conditions for the problem are as follows;

Top Boundary = 600 K\
Bottom Boundary = 900 K\
Left Boundary = 400 K\
Right Boundary = 800 K

I wrote codes for both explicit as well as implicit methods.\
For implicit method, Iterative solvers were used(three types of solver Jacobi, Gauss Seidel and SOR method)

For unsteady state explicit equation : T_(i,j)^(n+1) = T_(i,j)^n + alpha*deltat(frac{T_(i+1,j)^n - 2*T_(i,j)^n + T_(i-1,j)^n}{dx^2} + frac{T_(i,j+1)^n - 2*T_(i,j)^n + T_(i,j-1)^n}{dy^2})

Result by explicit method

<img src="https://user-images.githubusercontent.com/74448981/108529054-15ea5000-72fa-11eb-9812-79a15f9b323d.JPG" height="500" width="600">








For unstaedy state implicit equation : T_(i,j)^(n+1) = frac{T_(i,j)^n + k1(T_(i+1,j)^(n+1) + T_(i-1,j)^(n+1)) + k2(T_(i,j+1)^(n+1) + T_(i,j-1)^(n+1))}{(1 + 2k1 +2k2)}
where,
k1 = frac{alpha*dt}{dx^2}

k2 = frac{alpha*dt}{dy^2}            

 

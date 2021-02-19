function [ T ] = transient_implicit_sor(nt,error,tol,nx,ny,T,Told,alpha,T_previous_nt,term1,term2,term3)
  
Told = T;
T_previous_nt = Told ;
 
  
%time loop
  
  for k = 1:nt
  
  sor_iter = 1 ;
     while(error > tol)
     
        
        
         %space loop
         for i = 2:nx-1
       
                for j = 2:ny-1
                     
                     H = Told(i+1,j) + T(i-1,j);
                     V = Told(i,j+1) + T(i,j-1);
                     
                     T(i,j) = Told(i,j)*(1-alpha) + alpha * ((term1*T_previous_nt(i,j)) + (term2*H) + (term3*V));

                end
              
         end
  
    %updating the velocity and calculating the error
    error = max(max(abs(T - Told))) ;
    Told = T;
    
     end  
   
   %updating error value
   error = 1000;
   %calculating the residue
   error1 = max(max(abs(T - T_previous_nt)));
   %updating the tempertaure value for next time steps
   T_previous_nt = T ;
   
   %plotting the result for error with respect to nt
   figure(1);
   sor_iter = sor_iter + 1;
   semilogy(k,error1,'marker','*','color','r');
   hold on;
   xlabel('number of time steps (nt)','Fontsize',15,'Fontweight','bold','color','k');
   ylabel('error(residue)','Fontsize',15,'Fontweight','bold','color','k');
   pause(0.001)
   
    
  end

    %plotting the results for temperature distribution
    figure(2);
    contourf(T,20);
    colorbar;
    set(gca,'yDIR','reverse');
    title_text = sprintf('Transient heat conduction implicit equation using successive over relaxation method');
    title(title_text)
    xlabel('x');
    ylabel('y');
    
end
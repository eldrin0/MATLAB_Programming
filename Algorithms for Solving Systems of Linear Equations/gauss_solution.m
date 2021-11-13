%Gauss method for solving a system of linear equations algorithm
A=input('Enter the elements of matrix A: ');
b=input('Enter the elements of vector b: ');

%n is the columns dimension of matrix A
n=length(A(1,:));
%n1 is the rows dimension of matrix A
n1=length(A(:,1));
%m is the length of vector b
m=length(b);

%make sure our inputs are correct
if m ~= n || n1 ~= n
    disp("Error/(check your vector and matrix dimensions)")
else
    %create the augmented matrix
    Ab=A; Ab(:,n+1)=b';
    disp('Augmented matrix:')
    disp(Ab)
    disp('det(A)=')
    disp(det(A))
    %using gauss method we can only solve systems of equations
    %which matrix determinant is not equal to 0
    if det(A) == 0
        disp('det(A) = 0')
        disp('This system of equations does not have a solution!')
    else
       s=1; %a variable used later to check if we should find the solution matrix
       iteration_1 = 0;
       for j = 1:(n-1)
           for i = j:(n-1)
               if Ab(j,j) == 0
                   if Ab([j+1:n],j) == 0
                       disp('This system of equations does not have a solution!')
                       iteration_1 = iteration_1 + 1;
                       s=0;
                       break;
                   else
                       iteration_2 = 0;
                       for dr= 1:n-j
                          if Ab(j+dr,j)~=0 && iteration_2 ==0
                              disp("row change")
                              iteration_2 = iteration_2 + 1;
                              temp = Ab(j,:);
                              Ab(j,:)=Ab(j+dr,:);
                              Ab(j+dr,:)=temp;
                          end
                       end
                   end
               end
               if iteration_1 == 0
                   Ab(i+1,:)=Ab(i+1,:)-(Ab(i+1,j)/Ab(j,j)).*Ab(j,:);
                   pause(1)
                   disp(Ab)
               end
           end
       end
       
       %find the solution vector
       if s ~= 0
           %Give matrix A& vector b the current values after elementary row
           %operations
           A=Ab(:,[1:n]);
           b=Ab(:,n+1);
           
           %Solve the system from the bottom to the top
           X(n)=b(n)/A(n,n);
           for i = (n-1):-1:1
               X(i)=(b(i)-sum(A(i,[i+1:n]).*X([i+1:n])))/A(i,i);
           end
           disp('X=')
           disp(X)
       end
    end
end
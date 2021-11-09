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
    if det(A) ~= 0
        s=1; %a variable used later to check if we should find the solution matrix
       for j = 1:(n-1)
           for i = j:(n-1)
               if Ab(j,j) == 0
                  if Ab(j+1,j) ~= 0
                      disp("row change")
                      temp = Ab(j,:);
                      Ab(j,:)=Ab(j+1,:);
                      Ab(j+1,:)=temp;
                  else
                      disp('The system does not have solution!')
                      s=0;
                      break;
                  end
               end
               Ab(i+1,:)=Ab(i+1,:)-(Ab(i+1,j)/Ab(j,j)).*Ab(j,:);
               disp(Ab)
           end
       end
       
       %find the solution vector
       if s ~= 0
           %Give matrix A& vector b the current values after elementary row
           %operations
           A=Ab(:,1:3);
           b=Ab(:,4);
           
           %Solve the system from the bottom to the top
           X(n)=b(n)/A(n,n);
           for i = (n-1):-1:1
               X(i)=(b(i)-sum(A(i,[i+1:n]).*X([i+1:n])))/A(i,i);
           end
           disp('X=')
           disp(X)
       end
    else
        disp('det(A) = 0')
        disp('The system does not have solution!')
    end
end
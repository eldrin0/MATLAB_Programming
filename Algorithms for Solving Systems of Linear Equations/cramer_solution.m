%Cramer method for solving a system of linear equations algorithm
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
   if det(A) == 0
      disp('det(A) = 0')
      disp('This system of equations does not have a solution!')
   else %Cramer Method
       disp('det(A)=')
       disp(det(A))
       D=det(A); %determinator of matrix A
       for c = 1:n
           %for each column we create a temporary matrix similar to matrix
           %A except this temporary matrix has on one of its columns the
           %elements of the b' elements
           temp_A=A;
           temp_A(:,c)=b';
           Di=det(temp_A);
           fprintf('det(D%.0f) =%9.3f\n',c,Di)
           X(c)=Di/D;
       end
       disp('X=')
       disp(X)
   end
end
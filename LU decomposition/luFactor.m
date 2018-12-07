function [L,U,P,Inv] = luFactor(A)
%luFactor Used to find the Lower triangular matrix (L), Upper Triangular
%matrix (U), and the pivot matrix (P) of a nxn matrix. With optional
%Inverse matrix
%   Inputs: 
%       A - coefficient matrix
%    Outputs: 
%       L - lower triangular matrix
%       U - upper triangular matrix
%       P - the pivot matrix
%       Inv- (optional) The inverse of the given matrix
%           *not if user requests (4) outputs, the 4th one will be an
%           inverse matrix of the user selected matrix. If there is only 3
%           outputs selected it will output be L,U,P respectively.
%------------------------------------------------------------------
%===   created with pride by: Brandon Tighe                     ===
%===   for: Mech 105                                            ===
%===   on: 10/20/18                                             ===
%===   Revised 10/26/18 to add Inverse operation                ===
%------------------------------------------------------------------

%input error
if nargin~=1 error('Enter only 1 argument in the form of a nxn matrix.'),end

%square matrix check/error
[row,col]= size(A);
if row~=col error('Make sure matrix is an nxn SQUARE matrix'),end

%build initial identity matricies for P,L,Identity(to call on for inverse)
P=eye(row);
L=eye(row);
Identity=eye(row);
%for loop selects which column to work with (square matrix row=col)
for i=1:(col-1)         
    % A %debug checkpoint
    [M,I]=max(abs(A(i:col,i)));%find Max abs value (M) and its index (I)
    rBigA=A(I+i-1,:); %alter I for limited row coeff check/name biggest row
    Atemp=A(i,:);           %put top working row in temp storage
    A(i,:)=rBigA;           %replace top working row with bigget coeff row
    A(I+i-1,:)=Atemp;       %replace biggest coeff row with top working row
    %A %debug checkpoint
    
    %use same method as above to pivot P
    rBigP=P(I+i-1,:);   
    Ptemp=P(i,:);
    P(i,:)=rBigP;
    P(I+i-1,:)=Ptemp;
    %P %debug checkpoint
    
    %except for the first iteration, use same method to pivot L *note: only
    %pivoting the specified elements, not entire rows.
    if i>1
        rBigL=L(I+i-1,i-1);
        Ltemp=L(i,i-1);
        L(i,i-1)=rBigL;
        L(I+i-1,i-1)=Ltemp;
       % L %debug checkpoint 
    end
      
    %determine elements of L, and update L, then use its elements to
    %perform row operations on A, and update A
    for k=1:(row-i)
        L(i+k,i)=A(i+k,i)/rBigA(i);
        A(i+k,:)=A(i+k,:)-(L(i+k,i)*rBigA);
    end

end
%define outputs
L;
U=A;
P;

%optional output if user reqests inverse
if nargout>3 
   for ii=1:col             
       di=L\Identity(:,ii); %forward substitution
       xi=U\di;             %backward substitution
       Inv(:,ii)=(xi);      %fill matrix "Inv"
   end
else Inv=0;
   
   end

end


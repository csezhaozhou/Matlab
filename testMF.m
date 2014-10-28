    clc;
    clear;
    R = [
         [5,3,0,1],
         [4,0,0,1],
         [1,1,0,5],
         [1,0,0,4],
         [0,1,5,4],
        ];
    
   N = length(R); 
   M = length(R(1,:));
   K = 2;
   
   P = rand(N,K);
   Q = rand(M,K);
   
   alpha = 0.0002;
   beta = 0.02;
   
   for step = 1:5000
    for i = 1:N
      for j = 1:M
          if R(i,j) > 0
              eij = R(i,j) - sum(P(i,:).*Q(j,:));
              for k = 1:K
                  P(i,k) = P(i,k) + alpha * (2 * eij * Q(j,k) - beta * P(i,k));
                  Q(j,k) = Q(j,k) + alpha * (2 * eij * P(i,k) - beta * Q(j,k));
              end
          end
      end
    end
    eR = P*Q';
    e = 0;
    for i = 1:N
       for j = 1:M
           if R(i,j) > 0
               e = e + (R(i,j)-eR(i,j))*(R(i,j)-eR(i,j));
               for k = 1:K
                   e = e + (beta/2)*(P(i,k)*P(i,k)+Q(j,k)*Q(j,k));
               end
           end
       end
    end
   end
   
R
eR
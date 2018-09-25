%We wish to find the product of a Pythag. triple whose sum is 1000. We begin by noting any given Pythag. triple (x,y,z) can be generated from
%an integer pair p,q such that p+q is odd and x=2pq, y=p^2-q^2, and z=p^2+q^2. Then
%x+y+z=2pq+2p^2=2p(p+q). Thus for this problem we are looking for a p,q
%such p(p+q)=500. So we let q=500/p - p and find the solution such that
%both p and q are positive.


for p = 2:500
    Temp = 500/p;
    if mod(Temp,1) == 0
        %We are insuring that q will be an integer
        q = Temp - p;
        if p > q
            if q > 0
                %We check to make both integers are positive.
                if mod(p+q,2) == 1
                    %We make sure their sum is odd.
                    Out = 2*p*q*(p^4-q^4);
                    %This is the product of 2pq, p^2-q^2, and p^2+q^2.
                end    
            end
        end
    end
end

Out
%We print the product we wanted.
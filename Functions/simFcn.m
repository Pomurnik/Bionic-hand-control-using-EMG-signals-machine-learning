function [W3, W1, W2, K3, K1, K2, S3, S2, S1, Ser4, Ser1, Ser2, Ser3,  M4, M1, M2, M3] = simFcn(n, signals, mdl)
    
    nn = predict(mdl,signals(n,:));
    
    t = 0:0.00001:2.5;
    f = 1/10;
    a1 = deg2rad(90);
    a2 = deg2rad(85);
    a3 = deg2rad(110);
    a4 = deg2rad(15);
    a5 = deg2rad(70);
    a6 = deg2rad(75);
    a7 = deg2rad(60);
    a8 = deg2rad(35);
    a9 = deg2rad(20);
    
    W3 = zeros(size(t,2),2);
    W1 = zeros(size(t,2),2);
    W2 = zeros(size(t,2),2);
    K3 = zeros(size(t,2),2);
    K1 = zeros(size(t,2),2);
    K2 = zeros(size(t,2),2);
    S3 = zeros(size(t,2),2);
    S2 = zeros(size(t,2),2);
    S1 = zeros(size(t,2),2);
    Ser4 = zeros(size(t,2),2);
    Ser1 = zeros(size(t,2),2);
    Ser2 = zeros(size(t,2),2);
    Ser3 = zeros(size(t,2),2);
    M4 = zeros(size(t,2),2);
    M1 = zeros(size(t,2),2); 
    M2 = zeros(size(t,2),2); 
    M3 = zeros(size(t,2),2);  
    W3 = zeros(size(t,2),1);
    W1 = zeros(size(t,2),1);
    W2 = zeros(size(t,2),1);
    K3 = zeros(size(t,2),1);
    K1 = zeros(size(t,2),1);
    K2 = zeros(size(t,2),1);
    S3 = zeros(size(t,2),1);
    S2 = zeros(size(t,2),1);
    S1 = zeros(size(t,2),1);
    Ser4 = zeros(size(t,2),1);
    Ser1 = zeros(size(t,2),1);
    Ser2 = zeros(size(t,2),1);
    Ser3 = zeros(size(t,2),1);
    M4 = zeros(size(t,2),1);
    M1 = zeros(size(t,2),1); 
    M2 = zeros(size(t,2),1); 
    M3 = zeros(size(t,2),1);   

    W3(:,1) = t'; 
    W1(:,1) = t'; 
    W2(:,1) = t'; 
    K3(:,1) = t'; 
    K1(:,1) = t'; 
    K2(:,1) = t'; 
    S3(:,1) = t'; 
    S2(:,1) = t'; 
    S1(:,1) = t'; 
    Ser4(:,1) = t'; 
    Ser1(:,1) = t'; 
    Ser2(:,1) = t'; 
    Ser3(:,1) = t'; 
    M4(:,1) = t'; 
    M1(:,1) = t'; 
    M2(:,1) = t'; 
    M3(:,1) = t';   
    
    W3(:,2) = deg2rad(0);
    W2(:,2) = -deg2rad(180);
    W1(:,2) = -deg2rad(180);

    K3(:,2) = deg2rad(0);
    K2(:,2) = -deg2rad(90);
    K1(:,2) = -deg2rad(180);

    S3(:,2) = deg2rad(0);
    S2(:,2) = -deg2rad(180);
    S1(:,2) = -deg2rad(180);

    Ser4(:,2) = -deg2rad(90);
    Ser3(:,2) = -deg2rad(90);
    Ser2(:,2) = -deg2rad(180);
    Ser1(:,2) = -deg2rad(180); 

    M4(:,2) = -deg2rad(90);
    M3(:,2) = -deg2rad(180);
    M2(:,2) = -deg2rad(90);
    M1(:,2) = -deg2rad(180);
    
    switch nn

        case 1
            K3(:,2) = a3*sin(2*pi*f*t) - deg2rad(0);
            K2(:,2) = a3*sin(2*pi*f*t) - deg2rad(90);
            K1(:,2) = - a3*sin(2*pi*f*t) - deg2rad(180);
        case 2
            W3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            W2(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            W1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 3
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 4
            Ser4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 5
            M4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            M3(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            M2(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            M1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 6
            K3(:,2) = a3*sin(2*pi*f*t) - deg2rad(0);
            K2(:,2) = a3*sin(2*pi*f*t) - deg2rad(90);
            K1(:,2) = - a3*sin(2*pi*f*t) - deg2rad(180);
            W3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            W2(:,2) = -a5*sin(2*pi*f*t) - deg2rad(180);
            W1(:,2) = a5*sin(2*pi*f*t) - deg2rad(180);
        case 7
            K3(:,2) = a3*sin(2*pi*f*t) - deg2rad(0);
            K2(:,2) = a3*sin(2*pi*f*t) - deg2rad(90);
            K1(:,2) = - a3*sin(2*pi*f*t) - deg2rad(180);
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a5*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a5*sin(2*pi*f*t) - deg2rad(180);
        case 8
            K3(:,2) = a3*sin(2*pi*f*t) - deg2rad(0);
            K2(:,2) = a3*sin(2*pi*f*t) - deg2rad(90);
            K1(:,2) = - a3*sin(2*pi*f*t) - deg2rad(180);
            Ser4(:,2) = -a6*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a6*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a1*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a6*sin(2*pi*f*t) - deg2rad(180);
        case 9
            K3(:,2) = a3*sin(2*pi*f*t) - deg2rad(0);
            K2(:,2) = a3*sin(2*pi*f*t) - deg2rad(90);
            K1(:,2) = - a3*sin(2*pi*f*t) - deg2rad(180);
            M4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            M3(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            M2(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            M1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 10
            W3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            W2(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            W1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 11
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            Ser4(:,2) = -a8*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a6*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a1*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a6*sin(2*pi*f*t) - deg2rad(180);
        case 12
            Ser4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            M4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            M3(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            M2(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            M1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 13
            W3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            W2(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            W1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            Ser4(:,2) = -a8*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a6*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a1*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a6*sin(2*pi*f*t) - deg2rad(180);
        case 14
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
            Ser4(:,2) = -a8*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a6*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a1*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a6*sin(2*pi*f*t) - deg2rad(180);
            M4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            M3(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            M2(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            M1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);
        case 15
            K3(:,2) = a3*sin(2*pi*f*t) - deg2rad(0);
            K2(:,2) = a3*sin(2*pi*f*t) - deg2rad(90);
            K1(:,2) = - a3*sin(2*pi*f*t) - deg2rad(180);
            W3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            W2(:,2) = -a5*sin(2*pi*f*t) - deg2rad(180);
            W1(:,2) = a5*sin(2*pi*f*t) - deg2rad(180);
            S3(:,2) = a2*sin(2*pi*f*t) - deg2rad(0);
            S2(:,2) = a5*sin(2*pi*f*t) - deg2rad(180);
            S1(:,2) = a5*sin(2*pi*f*t) - deg2rad(180);
            Ser4(:,2) = -a9*sin(2*pi*f*t) - deg2rad(90);
            Ser3(:,2) = a1*sin(2*pi*f*t) - deg2rad(90);
            Ser2(:,2) = -a6*sin(2*pi*f*t) - deg2rad(180);
            Ser1(:,2) = a6*sin(2*pi*f*t) - deg2rad(180);
            M4(:,2) = -a1*sin(2*pi*f*t) - deg2rad(90);
            M3(:,2) = -a2*sin(2*pi*f*t) - deg2rad(180);
            M2(:,2) = a2*sin(2*pi*f*t) - deg2rad(90);
            M1(:,2) = a2*sin(2*pi*f*t) - deg2rad(180);

    end

    W1 = timeseries(W1(:,2), W1(:,1));
    W2 = timeseries(W2(:,2), W2(:,1));
    K3 = timeseries(K3(:,2), K3(:,1));
    K1 = timeseries(K1(:,2), K1(:,1));
    K2 = timeseries(K2(:,2), K2(:,1));
    S3 = timeseries(S3(:,2), S3(:,1));
    S2 = timeseries(S2(:,2), S2(:,1));
    S1 = timeseries(S1(:,2), S1(:,1));
    Ser4 = timeseries(Ser4(:,2), Ser4(:,1));
    Ser1 = timeseries(Ser1(:,2), Ser1(:,1));
    Ser2 = timeseries(Ser2(:,2), Ser2(:,1));
    Ser3 = timeseries(Ser3(:,2), Ser3(:,1));
    M4 = timeseries(M4(:,2), M4(:,1));
    M1 = timeseries(M1(:,2), M1(:,1)); 
    M2 = timeseries(M2(:,2), M2(:,1)); 
    M3 = timeseries(M3(:,2), M3(:,1));     
    
end
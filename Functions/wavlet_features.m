function [data] = wavlet_features(input, n, wname, z)
    
    f = 5*(n+1); %number of features
    data = zeros(size(input,1),(f*8));

    parfor k = 1:size(input,1)
        
        data_a = zeros(1,(f*8));
        A2 = zeros(n+1, 8);
        A3 = zeros(n+1, 8);
        A4 = zeros(n+1, 8);
        
        for i = 1:8
            
            %Wavlet calculation
            [C,L] = wavedec(input(k,1 + ((i-1)*z): z + ((i-1)*z)), n, wname);
            approx = appcoef(C, L, wname);
            x = 1:1:n;
            cD = detcoef(C, L, x);
            
            %Energy
            [Ea,Ed] = wenergy(C,L);
            A1 = vertcat(Ea', Ed');
                        
            %Root-means quare
            A2(1,i) = rms(approx);
            for ii = 1:n
                A2(1 + ii,i) = rms(cD{ii});
            end
            
            %Mean absolute value
            A3(1,i) = mad(approx);
            for ii = 1:n
                A3(1 + ii,i) = mad(cD{ii});
            end
            
            %Skewness
            A4(1,i) = skewness(approx);
            for ii = 1:n
                A4(1 + ii,i) = skewness(cD{ii});
            end
            
            %Wavelet length
            A5 = L(1:end-1)';
            
            %All features
            A = vertcat(A1, A2(:,i), A3(:,i), A4(:,i), A5);
            data_a(1,1 + ((i-1)*f): f + ((i-1)*f)) = A';
            
        end
        
        data(k,:) = data_a;
        
    end

end
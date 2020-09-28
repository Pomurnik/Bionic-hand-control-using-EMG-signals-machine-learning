function [signal, t] = read_file(name)
         
   parfor k = 1:8 
        
        path_name = 'S%d';
        path_name = sprintf(path_name,k);
        file1 = '\came1.csv';
        file1 = strrep( file1, 'came', name );
        file1 = strcat(path_name,file1);
        file2 = '\came2.csv';
        file2 = strrep( file2, 'came', name );
        file2 = strcat(path_name,file2);
        file3 = '\came3.csv';
        file3 = strrep( file3, 'came', name );
        file3 = strcat(path_name,file3);
        
        A1 = readtable(file1);
        A2 = readtable(file2);
        A3 = readtable(file3);
        A1 = table2array(A1);
        A2 = table2array(A2);
        A3 = table2array(A3);

        data{k}  = vertcat(A1, A2, A3);
        
    end
    
    EMG = vertcat(data{:});
    
    fs = 4000;
    T = 1/fs;
    N = length(EMG);
    f0 = fs/N;
    t = 0:T:480 - T;
    

    EMG_fft = fft(EMG);

    cb = 20;
    ca = 450;
    [b,a] = butter(4,[cb*2/fs ca*2/fs]);
    EMG_filter = filter(b, a, EMG);

    cb = 47;
    ca = 53;
    [b,a] = butter(3,[cb*2/fs ca*2/fs],'stop');
    EMG_filter = filter(b, a, EMG_filter);
    EMG_fft_filter = fft(EMG_filter);

    signal = EMG_filter;
        
end
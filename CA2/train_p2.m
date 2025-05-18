function train_p2()
    files=dir('Map Set (Farsi)');
    len=length(files)-2;
    TRAIN_FARSI=cell(2,len);
    for i=1:len
       TRAIN_FARSI{1,i}=imread([files(i+2).folder,'\',files(i+2).name]);
       TRAIN_FARSI{2,i}=files(i+2).name(1);
    end
    save TRAININGSET_FARSI TRAIN_FARSI;

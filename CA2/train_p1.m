function train_p1()
    files=dir('Map Set (English)');
    len=length(files)-2;
    TRAIN_ENGLISH=cell(2,len);
    
    for i=1:len
       TRAIN_ENGLISH{1,i}=imread([files(i+2).folder,'\',files(i+2).name]);
       TRAIN_ENGLISH{2,i}=files(i+2).name(1);
    end
    
    save TRAININGSET_ENGLISH TRAIN_ENGLISH;

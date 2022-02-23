fs = 16000;%16khz
cd
D = 'C:\Users\Parisa\Desktop\AzMATLABPro\MainDataChangeToWAV';
cd C:\Users\Parisa\Desktop\AzMATLABPro\MainDataChangeToWAV
root_for_image= 'C:\Users\Parisa\Desktop\AzMATLABPro\spectrogram_images\';
name_for_image="";
filelist = dir(fullfile(D, '**\*.*'));  %get list of files and folders in any subfolder
filelist = filelist(~[filelist.isdir]);
num_of_files=length(filelist);

data=strings(3425,2);
label=strings(1001,1);
%[y,fs]=audioread("C:\Users\Parisa\Desktop\AzMATLABPro\MainDataChangeToWAV\1_female\Target\1_f_target_1.wav");
%a=size(y);
%a(2)
num_of_used_files=1001
for i=1:num_of_used_files
    
    temp=strcat(filelist(i).folder,"\");
    data(i,1)=strcat(temp,filelist(i).name);
    if contains(filelist(i).name,'f')==1
        data(i,2)=0;
        label(i,1)=0;
        name_for_image=strcat(string(i),"f.png");
   
    elseif contains(filelist(i).name,'m')==1
        data(i,2)=1;
        label(i,1)=1;
        name_for_image=strcat(string(i),"m.png");
    end
    %load from file
    %data(i,1)
    %class(data(i,1))
    y=audioread(data(i,1));
    %make all sounds mono
    %check if it has two column so is stereo
    col=size(y);
    %col 2 will show the number of columns of y
    if col(2)
        y=y(:,1);
    end
    
    %make audios into same size by padding zero
    %177152 is the size for an audio that is around 3 seconds but we did not
    %use this
    %70000 till about 4 second
    pad=70000-col(1);
    if pad>0
       y_new =[y;zeros(pad,1)];
      
      
        
    end
    %convert_to_melSpectrogram
    audiowrite(data(i,1),y_new,16000);
    a=audioread(data(i,1));
    melSpectrogram(a,16000);
    %temp2=strcat(root_for_image,"\")
    addr=strcat(root_for_image,name_for_image);
    axis off
    saveas(gcf,addr)
    
    filelist(i).name
    %filelist(i).folder;
      
end
save("C:\Users\Parisa\Desktop\AzMATLABPro\out.mat",'label'); 
%num_of_files;
%data

clear
%The Main Part
% the path to dataset and specifically to images
dataset = 'C:\Users\Сержан\Desktop\Lessons\DIP Digital Image Processing\hw1\dataset\'; 
images = dir('C:\Users\Сержан\Desktop\Lessons\DIP Digital Image Processing\hw1\dataset/*.jpg');
%the target image is chosen here
target = imread('kitten.jpg');

%then the original image is divided into uniform rectangular grids
target = imresize(target, [500 500],'bicubic'); 
original = target;

error = 1e100; % the error (difference of values: euclidean distance) was chosen randomly,
% later in loops it would be easily changed
% adjust the size of patch
h = 7;
w = 7;

% Here initially empty matrix is created later to fullfill it with ave rgb
% values of pictures 

part = zeros(3,length(images));
for n = 1:1:length(images)
    value = imread([dataset,images(n).name]);
    part(1,n)=sum(sum(value(:,:,1)))/((size(value,1)*size(value,2)));
    part(2,n)=sum(sum(value(:,:,2)))/((size(value,1)*size(value,2)));
    part(3,n)=sum(sum(value(:,:,3)))/((size(value,1)*size(value,2)));
end

if mod(size(target,1),h)~=0
    val_1 = floor(size(target,1)/(h))+1;
else
    val_1 = size(target,1)/(h);
end

if mod(size(target,1),w)~=0
    val_2 = floor(size(target,1)/(w))+1;
else
    val_2 = size(target,1)/(w);
end

for t = 1:1:val_1
    for t2 = 1:1:val_2
        
        x_val = 1+(t2-1)*w;
        y_val = 1+(t-1)*h;
        R_ave = double(0.0);
        G_ave = double(0.0);
        B_ave = double(0.0);
        counter=0;
        for y1 = 0:1:h
            for x1 = 0:1:w
                try
                    if (y_val+y1)>size(original,1) 
                        continue
                    end
                    if (x_val+x1)>size(original,2)
                        continue
                    end
                R_ave = R_ave+double(original(y_val+y1,x_val+x1,1));
                G_ave = G_ave+double(original(y_val+y1,x_val+x1,2));
                B_ave = B_ave+double(original(y_val+y1,x_val+x1,3));
                counter=counter+1;
                catch
                    continue    
                end
            end
        end
            R_ave=R_ave/counter;
            G_ave=G_ave/counter;
            B_ave=B_ave/counter;

            for i = 1:1:length(images)
                x_dif = (R_ave-part(1,i))^2;
                y_dif = (G_ave-part(2,i))^2;
                z_dif = (B_ave-part(3,i))^2;
                obtained_error = (x_dif+y_dif+z_dif);
                if(error>obtained_error)
                    error = obtained_error;
                    index = i;
                end
            end
       
        img_place = imread([dataset,images(index).name]);
        img_place = imresize(img_place, [h w]);
       
        for y2 = 0:1:h    
            for x2 = 0:1:w
                try
                    if (y_val+y2)>size(original,1) 
                        continue
                    end
                    if (x_val+x2)>size(original,2)
                        continue
                    end
                        target(y_val+y2,x_val+x2,:)= img_place(y2,x2,:);
                catch
                    continue
                end
            end
        end

        error = 1e10;
        
        imshow(target)
        
     end
end

imshow(target)
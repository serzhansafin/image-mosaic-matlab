% 1)warmup part (20%) (Done)
% 1.1) A grayscale image of constant intensity 100
x = 1000;
y = 1000;
I_100 = uint8(100*ones(x,y));
figure, imshow(I_100, [0 255]);
size_I_100 = size(I_100);
% end of part 1.1

% 1.2) A grayscale image with alternating black and white vertical stripes, each of which is 4 pixels wide
% I didn't understand this exercise whether it should gradually changes or
% only black and white only i.e. 0 and 1, respectively, so I have written 2
% variants of this exercise (Done)
% variant 1 (gradually changes)
r = [0:249];
v = repelem(r, 1000,4);
figure, imshow(uint8(v), [0 255]);
%end of variant 1

%variant 2 (only black and white vertical stripes as written in assignment
%in 4 pixels width each till the end which is 1000*1000 pixels)
r = [0 255];
v = repelem(r,1,[4 4]);
c = repmat(v,[1000 125]);
figure, imshow(uint8(c), [0 255]);
%end of variant 2

% end of part 1.2

% 1.3) A grayscale image with a ramp intensity distribution, described by
% I(x, y) = x/2 (Done navernoe, hotya idk)

x_1_3 = [1:1000];
y_1_3 = [1:1000];
[x_1_3, y_1_3] = meshgrid(x_1_3,y_1_3);
I_1_3 = x_1_3./2;
figure, imshow(uint8(I_1_3), [0 255]);
% end of part 1.3

    % 1.4) A grayscale image with a Gaussian intensity distribution centered at
    % (128, 128), described by intensity formula (Done)
    x_1_4 = [1:1000];
    y_1_4 = [1:1000];
    [x_1_4, y_1_4] = meshgrid(x_1_4, y_1_4);
    I_1_4 = 255*( exp( - ( ( (x_1_4-524).^2 + (y_1_4-524).^2 )/(200^2) ) ) );
    I_1_4 = uint8(I_1_4);
    figure, imshow(I_1_4, [0 255]);
% end of part 1.4

% 1.5) A color image where the upper left quadrant is yellow, the lower
% left quadrant is red, the upper right quadrant is green, and the lower 
% right quadrant is black
image = zeros(1000,1000,3); %initialize
image(1:1000,1:500,1) = 1;   %Red (maximum value)
image(1:500,1:1000,2) = 1;   %Green (maximum value)
figure, imshow(image);
%end of part 1.5

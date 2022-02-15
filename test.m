clc

img = imread("test\test_im\m\new_m.jpg");
% imshow(img)

% resnet accepts input in a specific size
img = imresize(img, [227 227]);

% load the saved trained network
net = coder.loadDeepLearningNetwork('trainedNetwork_1.mat');

[pred,probs] = classify(net,img);

disp('prediction:')
disp(pred)
disp('probabilities: (f-m)')
disp(probs)

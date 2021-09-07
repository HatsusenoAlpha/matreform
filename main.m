close all
clear all

% set input and output folder

inputpath = 'D:\works\Dataset\DEAP\data_preprocessed_matlab\';
outputpath = 'D:\works\Dataset\DEAP\DEAP_reformed\';

% get file list

file_list = dir([inputpath,'*.mat']);
file_num = length(file_list);

% reform one by one

for i = 1 : file_num
	% get file name
	file_name = file_list(i).name;
	input_file=[inputpath, file_name];
	output_file = [outputpath, file_name];
	
	% load data
	x = load(input_file);
	data1 = x.data;
	labels = x.labels;
	[m, n, k] = size(data1);
	
	% initiate reformed matrix
	data = zeros(n, k, m);
	for j = 1 : m
		data(:, :, j) = reshape(data1(j, :, :), [n, k]);
	end
	
	% save reformed matrix
	
	save(output_file, 'data', 'labels');
	
end
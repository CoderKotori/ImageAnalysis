image = dicomread('./testdata/hw2/PCA_001.dcm');    %��ȡ��һ��dcmͼ
[m, n] = size(image);                               %��ȡ����ά��
result = zeros(m, n);                               %�����������ά��ͬ��ȡͼ��

Files = dir(strcat('./testdata/hw2/', '*.dcm'));    %��ȡ���д�����dcmͼ
LengthFiles = length(Files);
%MIP�㷨����330��dcmͼ��
for i = 1:LengthFiles
    path = strcat('./testdata/hw2/', Files(i).name);
    image = dicomread(path);
    for j = 1:m
        for k = 1:n
           result(j, k) = max(result(j, k), image(j, k)); 
        end
    end
end
%��ʾ��������ͼ��
imshow(result/max(result(:)))
saveImage = result/max(result(:));
imwrite(saveImage, './outputdata/hw2/result.bmp');


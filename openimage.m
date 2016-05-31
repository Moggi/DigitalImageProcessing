function img = openimage()
    
    [filename,pathname] = uigetfile('*.jpg;*.jpeg;*.png;*.bmp','Abrir imagem');

    if isequal(filename,0)
       disp('Usuario cancelou')
    else
       filepath = fullfile(pathname, filename);
       img = imread(filepath);
    end
end


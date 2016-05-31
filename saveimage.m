function saveimage(img)

    [filename,pathname] = uiputfile('*.jpg;*.jpeg;*.png;*.bmp','Salvar imagem');
    
    if isequal(filename,0)
       disp('Usuario cancelou')
    else
       filepath = fullfile(pathname, filename);
       imwrite(img,filepath);
    end
end


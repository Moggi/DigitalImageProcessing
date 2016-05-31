function varargout = edit(varargin)
% EDIT MATLAB code for edit.fig
%      EDIT, by itself, creates a new EDIT or raises the existing
%      singleton*.
%
%      H = EDIT returns the handle to a new EDIT or the handle to
%      the existing singleton*.
%
%      EDIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDIT.M with the given input arguments.
%
%      EDIT('Property','Value',...) creates a new EDIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edit

% Last Modified by GUIDE v2.5 29-May-2016 22:24:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edit_OpeningFcn, ...
                   'gui_OutputFcn',  @edit_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before edit is made visible.
function edit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edit (see VARARGIN)

% Choose default command line output for edit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global A;
[y,x] = size(A);
I = A{x};
imshow(I);

% UIWAIT makes edit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in passaBaixa.
function passaBaixa_Callback(hObject, eventdata, handles)
% hObject    handle to passaBaixa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
h = ones(3,3);
h = h/9;
I = imfilter(I,h);
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in passaAlta.
function passaAlta_Callback(hObject, eventdata, handles)
% hObject    handle to passaAlta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
h = 10*[-1/9 -1/9 -1/9; -1/9 8/9 -1/9; -1/9 -1/9 -1/9;];
I = imfilter(I,h);
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in baixaImagem.
function baixaImagem_Callback(hObject, eventdata, handles)
% hObject    handle to baixaImagem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
h = ones(3,3);
h = h*2/9;
If = imfilter(I,h);
I = I+If;
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in altaImagem.
function altaImagem_Callback(hObject, eventdata, handles)
% hObject    handle to altaImagem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
h = 10*[-1/9 -1/9 -1/9; -1/9 8/9 -1/9; -1/9 -1/9 -1/9;];
If = imfilter(I,h);
I = I+If;
A = horzcat(A,I);
imshow(I);

% --------------------------------------------------------------------
function openImage_Callback(hObject, eventdata, handles)
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
I = openimage();
A = horzcat(A,I);
imshow(I);

% --------------------------------------------------------------------
function saveImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
saveimage(I);

% --- Executes on button press in saltPepper.
function saltPepper_Callback(hObject, eventdata, handles)
% hObject    handle to saltPepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};

x = inputdlg({'Variance 0.01~1'},...
              'Parametros Salt&Pepper', 1); 
[a,b] = size(x);
if a > 0
    v = str2num(x{1});
    try
        I = imnoise(I,'salt & pepper',v);
    catch
        errordlg('A imagem tem que ser 3D');
    end
    A = horzcat(A,I);
end
imshow(I);

% --- Executes on button press in mediana.
function mediana_Callback(hObject, eventdata, handles)
% hObject    handle to mediana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
try
    I = medfilt2(I);
catch
    errordlg('A imagem tem que estar em escala de cinza');
end
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in media.
function media_Callback(hObject, eventdata, handles)
% hObject    handle to media (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
try
    I = filter2(fspecial('average',3),I)/255;
catch
    errordlg('A imagem tem que estar em escala de cinza');
end
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in ajustamento.
function ajustamento_Callback(hObject, eventdata, handles)
% hObject    handle to ajustamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
try
    I = imadjust(I);
catch
    errordlg('A imagem tem que estar em escala de cinza');
end
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in passaBanda.
function passaBanda_Callback(hObject, eventdata, handles)
% hObject    handle to passaBanda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
mat =  1/9*[-1 -1 -1;-1 8 -1;-1 -1 -1];
I = imfilter(I,mat);
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in roberts.
function roberts_Callback(hObject, eventdata, handles)
% hObject    handle to roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
mat1 = [0 1;0 -1];
mat2 = [1 0;-1 0];
I1 = imfilter(I,mat1);
I2 = imfilter(I,mat2);
I = I1+I2;
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
mat1 = [-1 -2 -1; 0 0 0; 1 2 1;];
mat2 = [-1 0 1; -2 0 2; -1 0 1;];
I1 = imfilter(I,mat1);
I2 = imfilter(I,mat2);
I = I1+I2;
% I = filter2(fspecial('sobel'),I)/255;
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
mat1 = [-1 -1 -1; 0 0 0; 1 1 1;];
mat2 = [-1 0 1; -1 0 1; -1 0 1;];
I1 = imfilter(I,mat1);
I2 = imfilter(I,mat2);
I = I1+I2;
% I = filter2(fspecial('prewitt'),I)/255;
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in inverterCor.
function inverterCor_Callback(hObject, eventdata, handles)
% hObject    handle to inverterCor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
I = imcomplement(I);
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in binarizar.
function binarizar_Callback(hObject, eventdata, handles)
% hObject    handle to binarizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
limiar = graythresh(I);
I = im2bw(I, limiar);
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in escalaCinza.
function escalaCinza_Callback(hObject, eventdata, handles)
% hObject    handle to escalaCinza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
I = rgb2gray(I);
A = horzcat(A,I);
imshow(I);

% --- Executes on button press in gaussiano.
function gaussiano_Callback(hObject, eventdata, handles)
% hObject    handle to gaussiano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
x = inputdlg({'Variance 0.01~1','Mean'},...
              'Parametros Gaussian', 1); 
[a,b] = size(x);
if a > 1
    m = str2num(x{1});
    v = str2num(x{2});
    try
        I = imnoise(I,'gaussian',m,v);
    catch
        errordlg('A imagem tem que ser 3D');
    end
    A = horzcat(A,I);
end
imshow(I);

% --- Executes on button press in voltar.
function voltar_Callback(hObject, eventdata, handles)
% hObject    handle to voltar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
[y,x] = size(A);
I = A{x};
if x == 1
    disp('Original');
else
    A(x) = [];
    [y,x] = size(A);
    I = A{x};
end
imshow(I);

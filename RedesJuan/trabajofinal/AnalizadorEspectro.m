function varargout = AnalizadorEspectro(varargin)
% ANALIZADORESPECTRO MATLAB code for AnalizadorEspectro.fig
%      ANALIZADORESPECTRO, by itself, creates a new ANALIZADORESPECTRO or raises the existing
%      singleton*.
%
%      H = ANALIZADORESPECTRO returns the handle to a new ANALIZADORESPECTRO or the handle to
%      the existing singleton*.
%
%      ANALIZADORESPECTRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALIZADORESPECTRO.M with the given input arguments.
%
%      ANALIZADORESPECTRO('Property','Value',...) creates a new ANALIZADORESPECTRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AnalizadorEspectro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AnalizadorEspectro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AnalizadorEspectro

% Last Modified by GUIDE v2.5 17-Feb-2020 14:10:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AnalizadorEspectro_OpeningFcn, ...
                   'gui_OutputFcn',  @AnalizadorEspectro_OutputFcn, ...
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


% --- Executes just before AnalizadorEspectro is made visible.
function AnalizadorEspectro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AnalizadorEspectro (see VARARGIN)

% Choose default command line output for AnalizadorEspectro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AnalizadorEspectro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AnalizadorEspectro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

f=10e3;
cant_periodos = 2;
resolucion=200;
rep=str2double(get(handles.edit1,'string'));


%procesos

t=linspace(0,cant_periodos/f,resolucion);


cuadrada = 0;
for n = 1.0:+2.0:rep
    comp = (1/n)*sin(2*pi*n*f*t);
    if n == 1
        cuadrada = comp;
    else
        cuadrada = cuadrada + comp;
    end
end

ft_cuadrada = abs (fftshift(fft(cuadrada)));


plot(handles.axes1,t,cuadrada)
str = "Tiempo"
set(get(handles.axes1, 'title'), 'string', str)

plot(handles.axes2,ft_cuadrada)
str2 = "Frecuencia"
set(get(handles.axes2, 'title'), 'string', str2)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

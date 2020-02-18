function varargout = SeriesFourrier(varargin)
% SERIESFOURRIER MATLAB code for SeriesFourrier.fig
%      SERIESFOURRIER, by itself, creates a new SERIESFOURRIER or raises the existing
%      singleton*.
%
%      H = SERIESFOURRIER returns the handle to a new SERIESFOURRIER or the handle to
%      the existing singleton*.
%
%      SERIESFOURRIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIESFOURRIER.M with the given input arguments.
%
%      SERIESFOURRIER('Property','Value',...) creates a new SERIESFOURRIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SeriesFourrier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SeriesFourrier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SeriesFourrier

% Last Modified by GUIDE v2.5 17-Feb-2020 13:18:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SeriesFourrier_OpeningFcn, ...
                   'gui_OutputFcn',  @SeriesFourrier_OutputFcn, ...
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


% --- Executes just before SeriesFourrier is made visible.
function SeriesFourrier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SeriesFourrier (see VARARGIN)

% Choose default command line output for SeriesFourrier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SeriesFourrier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SeriesFourrier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global caso

contenido = get(hObject,'string');
a=get(hObject,'Value');
caso=string(contenido(a));


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global caso

%------Entradas---------
 p=str2double(get(handles.edit1,'string'));
 f=str2double(get(handles.edit2,'string'));
 A=str2double(get(handles.edit3,'string'));
 con_frecuencia=str2double(get(handles.edit4,'string'));


% f=1;
% p=3;
% A=10;
% con_frecuencia=4;
%------Metodos---------
t=linspace(0,p/f,500);
w = (2*pi)*f;

%casos
% dientes
% triangualos
% sinu
% cuadrada

solv = 0;

switch caso
    case 'Diente Sierra'
        for i=1:con_frecuencia
            solv = solv + ((2/pi)*((-1)^(i+1))*((1/i)*sin(t*w*i)));
        end
        
    case 'Triangulo'
        for i=1:con_frecuencia+con_frecuencia-1
            if(mod(i,2)~=0)
                solv=solv+((pi/2)-(4/pi)*(cos((i)*w*t)/(i)^2));
            end
        end    
        
    case 'Cuadrada'
        for N=1:con_frecuencia+con_frecuencia-1
            if(mod(N,2)~=0)
                solv=solv+(1/N)*sin(2*pi*N*f*t);
            end
        end
    case 'sinusoidal 0'
        solv = solv+A*sin(2*pi*f*t + 0);
    case 'sinusoidal 90'
        solv = solv+A*sin(2*pi*f*t + pi/2);
        
    case 'sinusoidal 180'
        solv = solv +A*sin(2*pi*f*t + pi);
    case 'sinusoidal 270'
        solv = solv +  A*sin(2*pi*f*t + 3*pi/2);
    otherwise
        solv = 0;
        set(handles.axes1,'visible', 'off');
end

plot(handles.axes1,t,solv)



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

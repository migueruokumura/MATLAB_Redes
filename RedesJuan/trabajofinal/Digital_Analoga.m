function varargout = Digital_Analoga(varargin)
% DIGITAL_ANALOGA MATLAB code for Digital_Analoga.fig
%      DIGITAL_ANALOGA, by itself, creates a new DIGITAL_ANALOGA or raises the existing
%      singleton*.
%
%      H = DIGITAL_ANALOGA returns the handle to a new DIGITAL_ANALOGA or the handle to
%      the existing singleton*.
%
%      DIGITAL_ANALOGA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITAL_ANALOGA.MMM with the given input arguments.
%
%      DIGITAL_ANALOGA('Property','Value',...) creates a new DIGITAL_ANALOGA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Digital_Analoga_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Digital_Analoga_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Digital_Analoga

% Last Modified by GUIDE v2.5 17-Feb-2020 13:44:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Digital_Analoga_OpeningFcn, ...
                   'gui_OutputFcn',  @Digital_Analoga_OutputFcn, ...
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


% --- Executes just before Digital_Analoga is made visible.
function Digital_Analoga_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Digital_Analoga (see VARARGIN)

% Choose default command line output for Digital_Analoga
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Digital_Analoga wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Digital_Analoga_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global caso2
contenido = get(hObject,'string');
a=get(hObject,'Value');
caso2=string(contenido(a));
if caso2 == 'Señal Digital'
    set(handles.Ax,'visible', 'off')
    set(handles.Fx,'visible', 'off')
    set(handles.thetax,'visible', 'off')
    set(handles.cpx,'visible', 'off')
    set(handles.npm,'visible', 'off')
    set(handles.nfm,'visible', 'off')
    set(handles.mmm,'visible', 'off')
    
    set(handles.edit1,'visible', 'on')
    set(handles.edit2,'visible', 'on')
    set(handles.edit3,'visible', 'on')
    set(handles.edit4,'visible', 'on')
    set(handles.dato,'visible', 'on')
    set(handles.popupmenu2,'visible', 'on')
    set(handles.popupmenu3,'visible', 'on')
end
if caso2 == 'Señal Analoga'
    set(handles.dato,'visible', 'off')
    set(handles.popupmenu2,'visible', 'off')
    set(handles.popupmenu3,'visible', 'off')
    
    set(handles.Ax,'visible', 'on')
    set(handles.Fx,'visible', 'on')
    set(handles.thetax,'visible', 'on')
    set(handles.cpx,'visible', 'on')
    set(handles.npm,'visible', 'on')
    set(handles.nfm,'visible', 'on')
    set(handles.mmm,'visible', 'on')
end

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



function Ax_Callback(hObject, eventdata, handles)
% hObject    handle to Ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ax as text
%        str2double(get(hObject,'String')) returns contents of Ax as a double


% --- Executes during object creation, after setting all properties.
function Ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fx_Callback(hObject, eventdata, handles)
% hObject    handle to Fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fx as text
%        str2double(get(hObject,'String')) returns contents of Fx as a double


% --- Executes during object creation, after setting all properties.
function Fx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function thetax_Callback(hObject, eventdata, handles)
% hObject    handle to thetax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thetax as text
%        str2double(get(hObject,'String')) returns contents of thetax as a double


% --- Executes during object creation, after setting all properties.
function thetax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thetax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cpx_Callback(hObject, eventdata, handles)
% hObject    handle to cpx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cpx as text
%        str2double(get(hObject,'String')) returns contents of cpx as a double


% --- Executes during object creation, after setting all properties.
function cpx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cpx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global caso2

%inputs Digital

contenido = get(handles.popupmenu2,'string');
a=get(handles.popupmenu2,'Value');
regla1=string(contenido(a));
regla_bit_alto=str2double(regla1);


%Carrier
Ac=str2double(get(handles.edit1,'string'));
fc=str2double(get(handles.edit2,'string'));
thetac =str2double(get(handles.edit3,'string'));
cpc=str2double(get(handles.edit4,'string'));

%datos
datos = get(handles.dato,'string');

%ask

contenido2 = get(handles.popupmenu3,'string');
a2=get(handles.popupmenu3,'Value');
regla2=string(contenido2(a2));
regla_ask_tr_carrier=str2double(regla2);

%tx
Ax= str2double(get(handles.Ax,'string'));
fx=str2double(get(handles.Fx,'string'));
thetax =str2double(get(handles.thetax,'string'));
cpx=str2double(get(handles.cpx,'string'));

%indice de modulacion 0<= mmm >= 1

m = str2double(get(handles.mmm,'string'));
%indice de modulacion 0<= npm >= 1

nfm = str2double(get(handles.nfm,'string'));
%indice de modulacion 0<= nfm >= 1

npm = str2double(get(handles.npm,'string'));


switch caso2
    case 'Señal Digital'
        %graficar cadena de funciones
        tb=100; %duracion del bit
        uno = ones(1,tb); %matriz de unos
        cero = zeros(1,tb); %matriz de ceros
        frame=[];
        frameInv=[];
        list=[];
        f='0';
        for n=1:length(datos)
            if (datos(n)=='1')
                frame = [ frame uno ]; %vector que se autoacumula
                frameInv = [frameInv cero] ;
            else 
                frame = [ frame cero ];
                frameInv = [frameInv uno];
            end
            if (datos(n)~= f)
                f=datos(n);
                list = [list length(frame)];
            end
        end
        if(regla_bit_alto==1)
            cadenaBits=5*frame; %0 a 5 voltios
        else
            cadenaBits=5*frameInv;
        end

        tc = linspace(0, 2*length(datos)/fc,length(cadenaBits));
        carrier = Ac* sin(2*pi*fc*tc+thetac);

        if(regla_ask_tr_carrier == 1)
            ask = frame.*carrier;
        else
            ask = frameInv.*carrier;
        end
        axes(handles.axes1)
        plot(cadenaBits)
        xticks(list-100)
        axis([0 length(cadenaBits) -1 6])
        str1='Datos';
        set(get(handles.axes1, 'title'), 'string', str1) 

        axes(handles.axes2)
        plot(carrier) 
        xticks(list-100)
        axis([0 length(cadenaBits) -10 10])
        str2="cadena de carrier";
        set(get(handles.axes2, 'title'), 'string', str2) 
        grid on


        plot(handles.axes3,ask) 
        xticks(list-100)
        axis([0 length(cadenaBits) -10 10])
        str3="cadena ASK";
        set(get(handles.axes3, 'title'), 'string', str3) 
        grid on
   
    case 'Señal Analoga'
        
        %procesos
        tc = linspace(0, cpc/fc,500);
        carrier = Ac* sin(2*pi*fc*tc+thetac);

        tx = linspace(0, cpx/fx,500);
        xt =Ax * sin(2*pi*fx*tx+thetax);
        % modulacion_Am 
        xam=(1+m*xt).*carrier;

        %modulacio FM
        xfm=Ac*sin(2*pi*fc*tc+ nfm*xt);

        %Modulación PM
        xt_diff = Ax*sin(2*pi*fx*tx + (thetax+pi/2));
        xpm=(Ac*sin(2*pi*fc*tc+ npm*xt_diff));


        %resultados

        plot(handles.axes1,tx,xt)
        str = "Datos analogos xt"
        set(get(handles.axes1, 'title'), 'string', str)

        
        plot(handles.axes2,tc,carrier)
        str2 = "Señal protadora del carrier(t)"
        set(get(handles.axes2, 'title'), 'string', str2)
        
        
        plot(handles.axes3,tc,xam)
        str3 = "Señal AM"
        set(get(handles.axes3, 'title'), 'string', str3)
        
        plot(handles.axes4,tc,xfm)
        str4 = "Señal FM"
        set(get(handles.axes4, 'title'), 'string', str4)
        
        plot(handles.axes5,tc,xpm)
        str5 = "Señal PM"
        set(get(handles.axes5, 'title'), 'string', str5)
        
  
        
    otherwise
        

end



function dato_Callback(hObject, eventdata, handles)
% hObject    handle to dato (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dato as text
%        str2double(get(hObject,'String')) returns contents of dato as a double


% --- Executes during object creation, after setting all properties.
function dato_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dato (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mmm_Callback(hObject, eventdata, handles)
% hObject    handle to mmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mmm as text
%        str2double(get(hObject,'String')) returns contents of mmm as a double


% --- Executes during object creation, after setting all properties.
function mmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nfm_Callback(hObject, eventdata, handles)
% hObject    handle to nfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nfm as text
%        str2double(get(hObject,'String')) returns contents of nfm as a double


% --- Executes during object creation, after setting all properties.
function nfm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function npm_Callback(hObject, eventdata, handles)
% hObject    handle to npm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of npm as text
%        str2double(get(hObject,'String')) returns contents of npm as a double


% --- Executes during object creation, after setting all properties.
function npm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to npm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

unit GCS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls,
  Data.DB, Datasnap.DBClient, Datasnap.Win.MConnect, CPort, Vcl.XPMan,
  MetropolisUI.Tile;

type
  Float=double;
  TForm1 = class(TForm)
    Label1: TLabel;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Button3: TButton;
    GroupBox4: TGroupBox;
    PaintBox1: TPaintBox;
    GroupBox5: TGroupBox;
    Button4: TButton;
    Label3: TLabel;
    ComPort1: TComPort;
    Button5: TButton;
    Edit9: TEdit;
    Image1: TImage;
    TypeGrp: TRadioGroup;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure Button1Click(Sender: TObject);
    procedure ScrollToLastLine(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CompassPaint(Sender: TObject);
    procedure ForceRepaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RxData : String;
    TxData : String;
    Buffer : String;
    Time : Integer;
    Temp : String;
    _Yaw : Integer;
  end;

var
  Form1: TForm1;

implementation

uses math;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Button2.Caption = 'OPEN' then
    begin
      Button2.Caption := 'CLOSE';
      Button5.Enabled := False;
      Button1.Enabled := True;
      Button4.Enabled := True;
      ComPort1.Open;
    end
  else if Button2.Caption = 'CLOSE' then
    begin
      Button2.Caption := 'OPEN';
      Button5.Enabled := True;
      Button1.Enabled := False;
      Button4.Enabled := False;
      ComPort1.Close;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Memo1.Lines.SaveToFile('C:\Users\hendra\Desktop\result.txt');
    Button3.Enabled := False;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    TxData := '2';
    ComPort1.WriteStr(TxData);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
    ComPort1.ShowSetupDialog;
    if ComPort1.Port = '' then
      begin
        Button2.Enabled := False;
      end
    else
      begin
        Button2.Enabled := True;
      end;
end;

procedure TForm1.ComPortRxChar(Sender: TObject; Count: Integer);
var
    Accx, Accy, Accz, Gyrox, Gyroy, Gyroz, Yaw : String;
    _Accx, _Accy, _Accz, _Gyrox, _Gyroy, _Gyroz : Integer;
    red, green, blue : Byte;
    x, y, i : Integer;
    gps : Array[0..8] of Integer;
begin
    ComPort1.ReadStr(RxData, Count);
    Memo1.Text := Memo1.Text + RxData;

    if TxData = '1' then
      begin
      Buffer := Buffer + RxData;
        if pos(#10, RxData) > 0 then
          begin
            //eliminate group number
            Temp := Copy(Buffer, 5, MaxInt);
            //parse elemen
            Edit1.Text := Copy(Temp, 1, 4);
            Temp := Copy(Temp, 5, MaxInt);
            Edit2.Text := Copy(Temp, 1, 4);
            Temp := Copy(Temp, 5, MaxInt);
            Edit3.Text := Copy(Temp, 1, 4);
            Temp := Copy(Temp, 5, MaxInt);
            Edit4.Text := Copy(Temp, 1, 4);
            Temp := Copy(Temp, 5, MaxInt);
            Edit5.Text := Copy(Temp, 1, 4);
            Temp := Copy(Temp, 5, MaxInt);
            Edit6.Text := Copy(Temp, 1, 4);
            Temp := Copy(Temp, 5, MaxInt);
            Edit9.Text := Temp;
            Buffer := '';
            Temp := '';
            //display in editlabel
            Accx := Trim(Edit1.Text);
            Accy := Trim(Edit2.Text);
            Accz := Trim(Edit3.Text);
            Gyrox := Trim(Edit4.Text);
            Gyroy := Trim(Edit5.Text);
            Gyroz := Trim(Edit6.Text);
            Yaw := Trim(Edit9.Text);
            //display data to chart
            Inc(Time);
            if (Accx <> '') and (Accy <> '') and (Accz <> '') and (Gyrox <> '') and (Gyroy <> '') and (Gyroz <> '') then
              begin
                _Accx := StrToInt(Trim(Accx));
                _Accy := StrToInt(Trim(Accy));
                _Accz := StrToInt(Trim(Accz));
                _Gyrox := StrToInt(Trim(Gyrox));
                _Gyroy := StrToInt(Trim(Gyroy));
                _Gyroz := StrToInt(Trim(Gyroz));
                Chart1.Series[0].AddXY(Time, _Accx);
                Chart1.Series[1].AddXY(Time, _Accy);
                Chart1.Series[2].AddXY(Time, _Accz);
                Chart2.Series[0].AddXY(Time, _Gyrox);
                Chart2.Series[1].AddXY(Time, _Gyroy);
                Chart2.Series[2].AddXY(Time, _Gyroz);
              end
            else
              begin
                Chart1.Series[0].AddXY(Time, _Accx);
                Chart1.Series[1].AddXY(Time, _Accy);
                Chart1.Series[2].AddXY(Time, _Accz);
                Chart2.Series[0].AddXY(Time, _Gyrox);
                Chart2.Series[1].AddXY(Time, _Gyroy);
                Chart2.Series[2].AddXY(Time, _Gyroz);
              end;
          end;
      end
    else
      begin
        //Image1.Repaint;
        Buffer := Buffer + RxData;
        if pos(#32, RxData) > 0 then
          begin
            if Length(Buffer) > 10 then
              begin
                Temp := Copy(Buffer, pos(#255, Buffer)+3, pos(#32, Buffer));
                  for y :=0 to Image1.Width-1 do
                    begin
                      red := StrToInt(Copy(Temp, 1, 1));
                      Temp := Copy(Temp, 2, MaxInt);
                      green := StrToInt(Copy(Temp, 1, 1));
                      Temp := Copy(Temp, 2, MaxInt);
                      blue := StrToInt(Copy(Temp, 1, 1));
                      Temp := Copy(Temp, 2, MaxInt);
                      Image1.Canvas.Pixels[y, x] := ((red shl 16) or (green shl 8) or (blue));
                    end;
                Buffer := '';
                Temp := '';
              end
            else
              begin
                if i > 8 then
                  begin
                    i := 0;
                  end;
                gps[i] := StrToInt(Copy(Buffer, 2, 3));
                Inc(i);
                Buffer := '';
              end;
          end
        else
          begin

          end;
      end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    TxData := '1';
    ComPort1.WriteStr(TxData);
end;

procedure TForm1.ScrollToLastLine(Sender: TObject);
begin
    SendMessage(Memo1.Handle, EM_LINESCROLL, 0, Memo1.Lines.Count);
    Button3.Enabled := True;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  {The Compass Tpaintbox has Panel1 as its TWinControl Owner so setting
  Panel1.doublebuffered property to true with prevent "flashing" of the
  compass as it is redrawn}
  //panel1.doublebuffered:=true;
  GroupBox5.DoubleBuffered := True;
end;

{************* CompassPaint *************}
procedure TForm1.CompassPaint(Sender: TObject);
{Redraw the compass at angle indicated by TSpinedit Heading.value}
Var LogRec: TLOGFONT;
    c:TPoint;
    r:float;
    {------------ DrawChar ---------}
    procedure drawchar(const s:string; dist,angle:Float);
    {draw angled characters}
    var
      x,y,w,h:integer;
      L, alpha:Float;
    begin
      with  PaintBox1, canvas do
      begin
        {get center of string}
        w:=textwidth(s);
        H:=textheight(s);
        L:=sqrt(sqr(dist+h/2)+sqr(w/2)); {distance to top left corner}
        alpha:=angle+arcsin((w/2)/L);
        x:=round(width/2+L*sin(alpha));
        y:=ROUND(height/2+L*cos(alpha));
        LogRec.lfEscapement := trunc(1800*(1+angle/pi));  {escapement in 10ths of degrees}
        Font.Handle := CreateFontIndirect( LogRec );
        TextOut(x, y, s);
      end;
    end;
    {----------- DrawHand -----------}
    procedure drawhand(angle:float);
    var
      savepencolor,savebrushcolor:TColor;
      ox,oy:float;
      pw1,pw2:TPoint; {Wide points of pointer}
      begin
      with PaintBox1, canvas do
      begin
        savepencolor:=pen.color;
        savebrushcolor:=brush.color;
        pen.color:=clblack;
        (*
        {needle straight line version}
        *)

        {Tapered pointer version}
        pen.color:=clblack;
        ox:= cos(angle+pi/2)*10;
        oy:= sin(angle+pi/2)*10;

        (* {Original draw method, replaced by polygon calls below}
        {top half}

        *)

        {top half}
        {width points at center of pointer}
        pw1:= point(trunc(c.x+ox),trunc(c.y+oy));
        pw2:= point(trunc(c.x-ox),trunc(c.y-oy));
        {top half}
        brush.color:=clred;
        polygon([point(trunc(c.x+cos(angle)*r), trunc(c.y+sin(angle)*r)),pw1, pw2]);
        {bottom half}
        brush.color:=clblack;
        polygon([point(trunc(c.x-cos(angle)*r), trunc(c.y-sin(angle)*r)),pw1, pw2]);

        {resotre entry values}
        pen.color:=savepencolor;
        brush.color:=savebrushcolor;
      end;
    end;

var
  Len, angle, angleinc, anglestart,jdist:Float;
  i,border:integer;
  rheading:float;


begin  {CompassPaint}

  with   PaintBox1, canvas do
  begin
    if typegrp.itemindex=0
    then rheading:=_Yaw*(pi/180) {rotate the compass}
    else rheading:=0; {moving the pointer}

    {assume center of dial is center of paintbox, diameter of dial is short side
     of paintbox}
    if width<height then height:=width else width:=height; {make paintbox square}
    pen.width:=4;
    pen.color:=clblack;
    brush.color:=clgray;
    brush.style:=bsSolid;
    rectangle(clientrect); {clear the previous drawing}
    pen.color:=clwhite;
    pen.width:=2;
    border:=30;
    ellipse(border,border,width-border,width-border);
    r:=width div 2 - border;
    c:=point(width div 2,width div 2);
    {draw 10 degree marks}
    {let's try making them 10% of radius}
    len:=0.9*r;
    angleInc:= Pi/18; {2Pi/36 radians = 10 degrees}
    anglestart:=rheading;
    angle:=anglestart;
    for i:=1 to 36 do
    begin  {draw 10 degree marks}
      moveto(trunc(c.x+sin(angle)*len), trunc(c.y+cos(angle)*len));
      lineto(trunc(c.x+sin(angle)*r), trunc(c.y+cos(angle)*r));
      angle:=angle+angleinc;
    end;
    {and 5 degree marks at 5% of radius}
    len:=0.95*r;
    angle:=anglestart+angleinc/2.0;
    for i:= 1 to 36 do
    begin
      moveto(trunc(c.x+sin(angle)*len), trunc(c.y+cos(angle)*len));
      lineto(trunc(c.x+sin(angle)*r), trunc(c.y+cos(angle)*r));
      angle:=angle+angleinc;
    end;
    {Draw direction Letters}
    with PaintBox1.canvas.font do
    begin
      Name   := 'Arial';
      Size := 12;
      color:=clwhite;
    end;
    GetObject(PaintBox1.canvas.Font.Handle, SizeOf(LogRec),Addr(LogRec));
    pen.color:=clblack;
    brush.color:=clgray;
    jdist:=0.8*r;  {distance from center to top of letter}
    {  //for debugging
    }
    angle:=anglestart+pi;
    {3 character strings (' X ') here have more consistent height than single chars}
    {Could also add "NNE", "NE", ENE", etc.}
    drawchar(' N ',jdist, angle);
    angle:=anglestart+pi/2.0;
    drawchar(' E ',jdist,angle);
    angle:=anglestart;
    drawchar(' S ',jdist,angle);
    angle:=anglestart+3*pi/2.0;
    drawchar(' W ',jdist,angle);
    {Add  degree values from 30 to 330 at 30 degree increments}
    for i:=1 to 11 do
    begin
      if i mod 3>0 then {but not over the direction letters}
      begin
        angle:=rheading+pi*(6-i)/6;
        drawchar(' '+inttostr(30*i)+' ',jdist,angle);
      end;
    end;

    if typegrp.itemindex=1   {draw the compass needle}
    then drawhand(_Yaw*(pi/180)-pi/2)
    else  drawhand(-pi/2)
    (*
     {Draw lubber line}
    *)
  end;
end;

{*********** ForceRepaint ***********}
procedure TForm1.ForceRepaint(Sender: TObject);
{Called when display type or compass angle changes}
begin
  while _Yaw<0 do _Yaw:=_Yaw+360;
  while _Yaw>360 do _Yaw:=_Yaw-360;
  PaintBox1.Invalidate;
end;

end.

use Text_IO;

package body Mars.Rover.Display is
  PLAIN : constant String := ASCII.ESC & "[0m";

  function Crater (D2, R2 : Integer)  return Integer is (if D2 < R2 then D2 - R2 elsif D2 < 2 * R2 then 2 * R2 - D2 else 0);
  function Tail   (Item : String)     return String  is (Item (Item'First + 1..Item'Last));
  function Code   (R, G, B : Natural) return String  is
    (ASCII.ESC & "[48;2;" & Tail (R'Image) & ';' & Tail (G'Image) & ';' & Tail (B'Image) & 'm');

  function Hue (Command : Command_Kind) return String is
    (if Command in Turn_Kind then Code (255, 200, 90) else Code (90, 220, 255));

  function Height (X, Y : Integer) return Integer is
    (40 - Y + (X * Y) mod 3 + 900 / (12 + (X - 23)**2 + (Y - 19)**2) + Crater ((X - 16)**2 + (Y - 8)**2, 34)
     + Crater ((X - 7)**2 + (Y - 26)**2, 10) + Crater ((X - 21)**2 + (Y - 33)**2, 5));
  function Shade  (X, Y : Integer) return Natural is
    (Integer'Max (0, Integer'Min (100, 50 + 2 * (Height (X - 1, Y - 1) - Height (X + 1, Y + 1)))));

  function Paint (Kind : Cell_Kind; X, Y : Positive) return String is
    S : constant Natural := Shade (X, Y);
    begin
      return (case Kind is
                when Ground  => Code (70 + S * 3 / 2, 38 + S, 24 + S * 2 / 3),
                when Landing => Code (255, 255, 255),
                when Route   => Code (90, 220, 255),
                when Target  => Code (80, 230, 120)) & "  ";
    end;

  procedure Mark (Map : in out Map_State; X, Y : Positive) is
    begin
      if Map.Count = 0 then Map.Cells (HOME.X, HOME.Y) := Landing; end if;
      Map.Count                := Map.Count + 1;
      Map.Profile (Map.Count)  := Height (X, Y);
      Map.Cells (X, Y)         := Route;
      Map.X                    := X;
      Map.Y                    := Y;
    end;

  procedure Draw (Map : in out Map_State; Plan : Vector_Plan) is
    Cells : Array_Cell renames Map.Cells;
    begin
      Cells (Map.X, Map.Y) := Target;
      for Y in Cells'Range (2) loop
        for X in Cells'Range (1) loop Put (Paint (Cells (X, Y), X, Y)); end loop;
        Put_Line (PLAIN);
      end loop;
      Put ("PLAN ");
      for Command of Plan loop Put (Hue (Command) & ' '); end loop;
      Put_Line (PLAIN);
      for Level in reverse 1..6 loop
        Put (if Level = 6 then "ELEV " else "     ");
        for Frame in 1..Map.Count loop
          Put (if Map.Profile (Frame) >= Level * 11 then Code (90 + Level * 20, 150 + Level * 12, 255) & ' ' else PLAIN & ' ');
        end loop;
        Put_Line (PLAIN & (case Level is when 6 => " 66 M", when 1 => " 11 M", when others => ""));
      end loop;
    end;
end;

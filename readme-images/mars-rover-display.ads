package Mars.Rover.Display is
  type Cell_Kind  is (Ground, Landing, Route, Target);
  type Array_Cell is array (1..28, 1..40) of Cell_Kind;
  type Array_Rise is array (1..64) of Integer;
  type Map_State  is record
      Cells   : Array_Cell := (others => (others => Ground));
      Profile : Array_Rise := (others => 0);
      Count   : Natural    := 0;
      X, Y    : Positive   := 1;
    end record;
  procedure Mark  (Map : in out Map_State; X, Y : Positive);
  procedure Draw  (Map : in out Map_State; Plan : Vector_Plan);
  function  Climb (Map : Map_State) return String is (Integer'Image (Map.Profile (Map.Count) - Map.Profile (1)));
end;

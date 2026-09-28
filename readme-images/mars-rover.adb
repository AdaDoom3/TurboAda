use Text_IO;

package body Mars.Rover is

  ----------
  -- Plan --
  ----------

  function To_Plan (Text : String) return Vector_Plan is
    Plan : Vector_Plan;
    begin
      for Item of Text loop
        Plan.Count              := Plan.Count + 1;
        Plan.Steps (Plan.Count) := Command_Kind'Value (''' & Item & ''');
      end loop;
      return Plan;
    end;

  function Get (Plan : Vector_Plan; Pos : Positive) return Command_Kind is (Plan.Steps (Pos));
  function Has (Plan : Vector_Plan; Pos : Positive) return Boolean      is (Pos <= Plan.Count);

  -----------
  -- Drive --
  -----------

  DX : constant array (Int_Degrees) of Integer := (0 => 1, 180 => -1, others => 0);
  DY : constant array (Int_Degrees) of Integer := (90 => -1, 270 => 1, others => 0);

  procedure Step (Item : in out Rover_State; Command : Command_Kind) is
    begin
      case Command is
        when 'F'       => Item.X := Item.X + DX (Item.Facing); Item.Y := Item.Y + DY (Item.Facing);
        when Turn_Kind => Item.Facing := Item.Facing + Command;
      end case;
      Item.Charge := Item.Charge - Cost (Command);
    end;

  function Try_Step (Item : in out Rover_State; Command : Command_Kind) return Boolean is
    begin
      if Item.Charge < Cost (Command) then raise Low_Battery with "need" & Cost (Command)'Image & " V"; end if;
      Step (Item, Command);
      return True;
    end;

  procedure Upload (Plan : Vector_Plan) is null;

  --------------
  -- Hardware --
  --------------

  procedure Finalize (Box : in out Black_Box_State) is begin Radio.Send ("BLACK BOX" & Box.Frames'Image & " FRAMES SAVED"); end;

  protected body Radio is
    procedure Send (Line : String) is begin Queued := Queued + 1; Put_Line (Line); end;
    entry Flush when Queued > 0 is begin Queued := 0; end;
  end;

  task body Camera is
    begin
      select
        accept Shoot (Facing : Int_Degrees) do Radio.Send ("MASTCAM" & Resolution'Image & " PX AT" & Facing'Image); end;
      or
        terminate;
      end select;
    end;

  procedure Write (Stream : access Root_Stream_Type; Item : Frame_State) is
    begin
      Command_Kind'Write (Stream, Item.Command); Int_Degrees'Write (Stream, Item.Facing);
    end;

  package body Sampler is
    procedure Sample (Item : Sample_T) is begin Log (Item'Image); end;
  end;
end;

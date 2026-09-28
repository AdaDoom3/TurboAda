use Mars.Rover, Mars.Rover.Display;

procedure Mission is
  PLAN : constant Vector_Plan :=
    "FFFFFFFRFFFFFFLFFFFFFFFFFFFFFFFFLFFRFFFFFFF";

  Curiosity : Rover_State := HOME;
  Traverse  : Map_State;
  Box       : Black_Box_State;
  begin
    Radio.Send ("MSL CURIOSITY  SOL 4211  BUS"
                & Curiosity.Charge'Image & " V");
    Upload (PLAN);
    for Command of PLAN loop
      continue when not Try_Step (Curiosity, Command);
      Box.Frames := Box.Frames + 1;
      Traverse.Mark (Curiosity.X, Curiosity.Y);
    end loop;
    Traverse.Draw (PLAN);
    Radio.Send ("TARGET REACHED AT" & Image (Curiosity)
                & "  CLIMB" & Climb (Traverse) & " M"
                & "  BUS" & Curiosity.Charge'Image & " V");
  exception when Fault: Low_Battery =>
    Radio.Send ("FAULT " & Exception_Message (Fault));
  end;

with Unchecked_Conversion;

package Mars.Rover is

  -----------
  -- Types --
  -----------

  type Int_Degrees     is mod 360;
  type Int_32_Unsigned is mod 2**32;
  type Fixed_Volts     is delta 0.01 range 0.0..36.0; for Fixed_Volts'Small use 0.01;
  type Real_Kelvin     is digits 6 range 0.0..1.0E4;
  type Command_Kind    is ('F', 'L', 'R'); for Command_Kind use ('F' => 70, 'L' => 76, 'R' => 82);
  subtype Turn_Kind    is Command_Kind with Predicate => Turn_Kind in 'L' | 'R';

  type Rover_State is record
      X, Y   : Integer;
      Facing : Int_Degrees;
      Charge : Fixed_Volts;
    end record;

  type Ptr_Rover   is access all Rover_State;
  type Ptr_Handler is access procedure (Item : in out Rover_State);
  HOME        : constant Rover_State;
  Low_Battery : exception;
  Watchdog    : aliased Boolean := False with Atomic;

  ----------
  -- Plan --
  ----------

  type Vector_Plan (<>) is private
    with String_Literal    => To_Plan,
         Constant_Indexing => Get,
         Iterable          => (First => First, Next => Next, Has_Element => Has, Element => Get);

  function To_Plan (Text : String)                      return Vector_Plan;
  function Get     (Plan : Vector_Plan; Pos : Positive) return Command_Kind;
  function Has     (Plan : Vector_Plan; Pos : Positive) return Boolean;
  function First   (Plan : Vector_Plan)                 return Positive is (1);
  function Next    (Plan : Vector_Plan; Pos : Positive) return Positive is (Pos + 1);

  -----------
  -- Drive --
  -----------

  function "+" (Left : Int_Degrees; Right : Turn_Kind) return Int_Degrees is
    (if Right = 'L' then Left + 90 else Left - 90);

  function Cost (Item : Command_Kind) return Fixed_Volts is
    (case Item is when 'F' => 0.12, when Turn_Kind => 0.04);

  procedure Step (Item : in out Rover_State; Command : Command_Kind)
    with Pre  => Item.Charge >= Cost (Command),
         Post => Item.Charge = Item.Charge'Old - Cost (Command);

  procedure Upload (Plan : Vector_Plan)
    with Pre => (for all Item of Plan => Cost (Item) <= HOME.Charge);

  function Image (Item : Rover_State) return String is
    (Item.X'Image & ',' & Item.Y'Image);

  function  Try_Step (Item : in out Rover_State; Command : Command_Kind) return Boolean;
  procedure Sleep    (Item : in out Rover_State) is null;

  --------------
  -- Hardware --
  --------------

  type Black_Box_State is new Limited_Controlled with record Frames : Natural := 0; end record;
  procedure Finalize (Box : in out Black_Box_State);

  protected Radio is
      procedure Send (Line : String);
      entry Flush;
    private
      Queued : Natural := 0;
    end;

  task type Camera (Resolution : Positive) is entry Shoot (Facing : Int_Degrees); end;

  type Sensor_State (Host : not null access Rover_State) is limited record
      Kelvin : Real_Kelvin;
    end record;

  ---------------
  -- Telemetry --
  ---------------

  type Frame_State is record Command : Command_Kind; Facing : Int_Degrees; end record;
  for Frame_State use record
      Command at 0 range 0..7;
      Facing  at 2 range 0..15;
    end record;

  procedure Write (Stream : access Root_Stream_Type; Item : Frame_State);
  for Frame_State'Write use Write;
  function To_Word is new Unchecked_Conversion (Frame_State, Int_32_Unsigned);

  generic
    type Sample_T is range <> or use Integer;
    with procedure Log (Line : String) is null;
  package Sampler is procedure Sample (Item : Sample_T); end;

private
  type Array_Command is array (1..64) of Command_Kind;
  type Vector_Plan   is record Steps : Array_Command; Count : Natural := 0; end record;
  HOME : constant Rover_State := (X => 6, Y => 38, Facing => 90, Charge => 6.00);
end;

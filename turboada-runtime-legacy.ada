package Ada.Characters is
  pragma Pure;
end;
package Ada.Characters.Latin_1 is
  pragma Pure;
  NUL                  : constant Character := Character'Val (0);
  SOH                  : constant Character := Character'Val (1);
  STX                  : constant Character := Character'Val (2);
  ETX                  : constant Character := Character'Val (3);
  EOT                  : constant Character := Character'Val (4);
  ENQ                  : constant Character := Character'Val (5);
  ACK                  : constant Character := Character'Val (6);
  BEL                  : constant Character := Character'Val (7);
  BS                   : constant Character := Character'Val (8);
  HT                   : constant Character := Character'Val (9);
  LF                   : constant Character := Character'Val (10);
  VT                   : constant Character := Character'Val (11);
  FF                   : constant Character := Character'Val (12);
  CR                   : constant Character := Character'Val (13);
  SO                   : constant Character := Character'Val (14);
  SI                   : constant Character := Character'Val (15);
  DLE                  : constant Character := Character'Val (16);
  DC1                  : constant Character := Character'Val (17);
  DC2                  : constant Character := Character'Val (18);
  DC3                  : constant Character := Character'Val (19);
  DC4                  : constant Character := Character'Val (20);
  NAK                  : constant Character := Character'Val (21);
  SYN                  : constant Character := Character'Val (22);
  ETB                  : constant Character := Character'Val (23);
  CAN                  : constant Character := Character'Val (24);
  EM                   : constant Character := Character'Val (25);
  SUB                  : constant Character := Character'Val (26);
  ESC                  : constant Character := Character'Val (27);
  FS                   : constant Character := Character'Val (28);
  GS                   : constant Character := Character'Val (29);
  RS                   : constant Character := Character'Val (30);
  US                   : constant Character := Character'Val (31);
  Space                : constant Character := ' ';
  Exclamation          : constant Character := '!';
  Quotation            : constant Character := '"';
  Number_Sign          : constant Character := '#';
  Dollar_Sign          : constant Character := '$';
  Percent_Sign         : constant Character := '%';
  Ampersand            : constant Character := '&';
  Apostrophe           : constant Character := ''';
  Left_Parenthesis     : constant Character := '(';
  Right_Parenthesis    : constant Character := ')';
  Asterisk             : constant Character := '*';
  Plus_Sign            : constant Character := '+';
  Comma                : constant Character := ',';
  Hyphen               : constant Character := '-';
  Minus_Sign           : Character renames Hyphen;
  Full_Stop            : constant Character := '.';
  Solidus              : constant Character := '/';
  Colon                : constant Character := ':';
  Semicolon            : constant Character := ';';
  Less_Than_Sign       : constant Character := '<';
  Equals_Sign          : constant Character := '=';
  Greater_Than_Sign    : constant Character := '>';
  Question             : constant Character := '?';
  Commercial_At        : constant Character := '@';
  Left_Square_Bracket  : constant Character := '[';
  Reverse_Solidus      : constant Character := '\';
  Right_Square_Bracket : constant Character := ']';
  Circumflex           : constant Character := '^';
  Low_Line             : constant Character := '_';
  Grave                : constant Character := '`';
  LC_A                 : constant Character := 'a';
  LC_B                 : constant Character := 'b';
  LC_C                 : constant Character := 'c';
  LC_D                 : constant Character := 'd';
  LC_E                 : constant Character := 'e';
  LC_F                 : constant Character := 'f';
  LC_G                 : constant Character := 'g';
  LC_H                 : constant Character := 'h';
  LC_I                 : constant Character := 'i';
  LC_J                 : constant Character := 'j';
  LC_K                 : constant Character := 'k';
  LC_L                 : constant Character := 'l';
  LC_M                 : constant Character := 'm';
  LC_N                 : constant Character := 'n';
  LC_O                 : constant Character := 'o';
  LC_P                 : constant Character := 'p';
  LC_Q                 : constant Character := 'q';
  LC_R                 : constant Character := 'r';
  LC_S                 : constant Character := 's';
  LC_T                 : constant Character := 't';
  LC_U                 : constant Character := 'u';
  LC_V                 : constant Character := 'v';
  LC_W                 : constant Character := 'w';
  LC_X                 : constant Character := 'x';
  LC_Y                 : constant Character := 'y';
  LC_Z                 : constant Character := 'z';
  Left_Curly_Bracket   : constant Character := '{';
  Vertical_Line        : constant Character := '|';
  Right_Curly_Bracket  : constant Character := '}';
  Tilde                : constant Character := '~';
  DEL                  : constant Character := Character'Val (127);
end;
package Ada.Characters.Handling is
  function Character_Set_Version return String;
  function Is_Control (Item : Character) return Boolean;
  function Is_Graphic (Item : Character) return Boolean;
  function Is_Letter (Item : Character) return Boolean;
  function Is_Lower (Item : Character) return Boolean;
  function Is_Upper (Item : Character) return Boolean;
  function Is_Basic (Item : Character) return Boolean;
  function Is_Digit (Item : Character) return Boolean;
  function Is_Decimal_Digit (Item : Character) return Boolean renames Is_Digit;
  function Is_Hexadecimal_Digit (Item : Character) return Boolean;
  function Is_Alphanumeric (Item : Character) return Boolean;
  function Is_Special (Item : Character) return Boolean;
  function Is_Line_Terminator (Item : Character) return Boolean;
  function Is_Mark (Item : Character) return Boolean;
  function Is_Other_Format (Item : Character) return Boolean;
  function Is_Punctuation_Connector (Item : Character) return Boolean;
  function Is_Space (Item : Character) return Boolean;
  function Is_NFKC (Item : Character) return Boolean;
  function To_Lower (Item : Character) return Character;
  function To_Upper (Item : Character) return Character;
  function To_Basic (Item : Character) return Character;
  function To_Lower (Item : String) return String;
  function To_Upper (Item : String) return String;
  function To_Basic (Item : String) return String;
  subtype ISO_646 is Character range Character'Val (0) .. Character'Val (127);
  function Is_ISO_646 (Item : Character) return Boolean;
  function Is_ISO_646 (Item : String) return Boolean;
  function To_ISO_646 (Item : Character; Substitute : ISO_646 := ' ') return ISO_646;
  function To_ISO_646 (Item : String; Substitute : ISO_646 := ' ') return String;
end;
package body Ada.Characters.Handling is
  function Character_Set_Version return String is
    begin
      return "ISO/IEC 646:1991";
    end;
  function Is_Control (Item : Character) return Boolean is
    begin
      return Character'Pos (Item) < 32 or else Character'Pos (Item) = 127;
    end;
  function Is_Graphic (Item : Character) return Boolean is
    begin
      return not Is_Control (Item);
    end;
  function Is_Letter (Item : Character) return Boolean is
    begin
      return Item in 'A' .. 'Z' or else Item in 'a' .. 'z';
    end;
  function Is_Lower (Item : Character) return Boolean is
    begin
      return Item in 'a' .. 'z';
    end;
  function Is_Upper (Item : Character) return Boolean is
    begin
      return Item in 'A' .. 'Z';
    end;
  function Is_Basic (Item : Character) return Boolean is
    begin
      return Is_Letter (Item);
    end;
  function Is_Digit (Item : Character) return Boolean is
    begin
      return Item in '0' .. '9';
    end;
  function Is_Hexadecimal_Digit (Item : Character) return Boolean is
    begin
      return Item in '0' .. '9' or else Item in 'A' .. 'F' or else Item in 'a' .. 'f';
    end;
  function Is_Alphanumeric (Item : Character) return Boolean is
    begin
      return Is_Letter (Item) or else Is_Digit (Item);
    end;
  function Is_Special (Item : Character) return Boolean is
    begin
      return Is_Graphic (Item) and then not Is_Alphanumeric (Item);
    end;
  function Is_Line_Terminator (Item : Character) return Boolean is
    begin
      return Character'Pos (Item) in 10 .. 13;
    end;
  function Is_Mark (Item : Character) return Boolean is
    begin
      return False;
    end;
  function Is_Other_Format (Item : Character) return Boolean is
    begin
      return False;
    end;
  function Is_Punctuation_Connector (Item : Character) return Boolean is
    begin
      return Item = '_';
    end;
  function Is_Space (Item : Character) return Boolean is
    begin
      return Item = ' ';
    end;
  function Is_NFKC (Item : Character) return Boolean is
    begin
      return True;
    end;
  function To_Lower (Item : Character) return Character is
    begin
      if Is_Upper (Item) then
        return Character'Val (Character'Pos (Item) + 32);
      end if;
      return Item;
    end;
  function To_Upper (Item : Character) return Character is
    begin
      if Is_Lower (Item) then
        return Character'Val (Character'Pos (Item) - 32);
      end if;
      return Item;
    end;
  function To_Basic (Item : Character) return Character is
    begin
      return Item;
    end;
  function To_Lower (Item : String) return String is
    Result : String (1 .. Item'Length);
    begin
      for I in Item'Range loop
        Result (I - Item'First + 1) := To_Lower (Item (I));
      end loop;
      return Result;
    end;
  function To_Upper (Item : String) return String is
    Result : String (1 .. Item'Length);
    begin
      for I in Item'Range loop
        Result (I - Item'First + 1) := To_Upper (Item (I));
      end loop;
      return Result;
    end;
  function To_Basic (Item : String) return String is
    Result : constant String (1 .. Item'Length) := Item;
    begin
      return Result;
    end;
  function Is_ISO_646 (Item : Character) return Boolean is
    begin
      return True;
    end;
  function Is_ISO_646 (Item : String) return Boolean is
    begin
      return True;
    end;
  function To_ISO_646 (Item : Character; Substitute : ISO_646 := ' ') return ISO_646 is
    begin
      return Item;
    end;
  function To_ISO_646 (Item : String; Substitute : ISO_646 := ' ') return String is
    Result : constant String (1 .. Item'Length) := Item;
    begin
      return Result;
    end;
end;
package Ada.Strings is
  pragma Pure;
  Space             : constant Character := ' ';
  Length_Error      : exception;
  Pattern_Error     : exception;
  Index_Error       : exception;
  Translation_Error : exception;
  type Alignment is (Left, Right, Center);
  type Truncation is (Left, Right, Error);
  type Membership is (Inside, Outside);
  type Direction is (Forward, Backward);
  type Trim_End is (Left, Right, Both);
end;
package Ada.Strings.Maps is
  type Character_Set is private;
  Null_Set : constant Character_Set;
  type Character_Range is record
    Low  : Character;
    High : Character;
  end record;
  type Character_Ranges is array (Positive range <>) of Character_Range;
  function To_Set (Ranges : Character_Ranges) return Character_Set;
  function To_Set (Span : Character_Range) return Character_Set;
  function To_Ranges (Set : Character_Set) return Character_Ranges;
  function "=" (Left, Right : Character_Set) return Boolean;
  function "not" (Right : Character_Set) return Character_Set;
  function "and" (Left, Right : Character_Set) return Character_Set;
  function "or" (Left, Right : Character_Set) return Character_Set;
  function "xor" (Left, Right : Character_Set) return Character_Set;
  function "-" (Left, Right : Character_Set) return Character_Set;
  function Is_In (Element : Character; Set : Character_Set) return Boolean;
  function Is_Subset (Elements : Character_Set; Set : Character_Set) return Boolean;
  function "<=" (Left : Character_Set; Right : Character_Set) return Boolean renames Is_Subset;
  subtype Character_Sequence is String;
  function To_Set (Sequence : Character_Sequence) return Character_Set;
  function To_Set (Singleton : Character) return Character_Set;
  function To_Sequence (Set : Character_Set) return Character_Sequence;
  type Character_Mapping is private;
  function Value (Map : Character_Mapping; Element : Character) return Character;
  Identity : constant Character_Mapping;
  function To_Mapping (From, To : Character_Sequence) return Character_Mapping;
  function To_Domain (Map : Character_Mapping) return Character_Sequence;
  function To_Range (Map : Character_Mapping) return Character_Sequence;
  type Character_Mapping_Function is access function (From : Character) return Character;
private
  type Membership_Table is array (Character) of Boolean;
  type Character_Set is record
    Members : Membership_Table;
  end record;
  type Displacement_Table is array (Character) of Integer;
  type Character_Mapping is record
    Displacement : Displacement_Table;
  end record;
  Null_Set : constant Character_Set := (Members => (others => False));
  Identity : constant Character_Mapping := (Displacement => (others => 0));
end;
package body Ada.Strings.Maps is
  function To_Set (Ranges : Character_Ranges) return Character_Set is
    Result : Character_Set := Null_Set;
    begin
      for R in Ranges'Range loop
        for C in Ranges (R).Low .. Ranges (R).High loop
          Result.Members (C) := True;
        end loop;
      end loop;
      return Result;
    end;
  function To_Set (Span : Character_Range) return Character_Set is
    Result : Character_Set := Null_Set;
    begin
      for C in Span.Low .. Span.High loop
        Result.Members (C) := True;
      end loop;
      return Result;
    end;
  function Range_Count (Set : Character_Set) return Natural is
    Count  : Natural := 0;
    Inside : Boolean := False;
    begin
      for C in Character loop
        if Set.Members (C) and then not Inside then
          Count := Count + 1;
        end if;
        Inside := Set.Members (C);
      end loop;
      return Count;
    end;
  function To_Ranges (Set : Character_Set) return Character_Ranges is
    Result : Character_Ranges (1 .. Range_Count (Set));
    Last   : Natural := 0;
    Inside : Boolean := False;
    begin
      for C in Character loop
        if Set.Members (C) then
          if not Inside then
            Last := Last + 1;
            Result (Last).Low := C;
          end if;
          Result (Last).High := C;
        end if;
        Inside := Set.Members (C);
      end loop;
      return Result;
    end;
  function "=" (Left, Right : Character_Set) return Boolean is
    begin
      return Left.Members = Right.Members;
    end;
  function "not" (Right : Character_Set) return Character_Set is
    Result : Character_Set;
    begin
      for C in Character loop
        Result.Members (C) := not Right.Members (C);
      end loop;
      return Result;
    end;
  function "and" (Left, Right : Character_Set) return Character_Set is
    Result : Character_Set;
    begin
      for C in Character loop
        Result.Members (C) := Left.Members (C) and Right.Members (C);
      end loop;
      return Result;
    end;
  function "or" (Left, Right : Character_Set) return Character_Set is
    Result : Character_Set;
    begin
      for C in Character loop
        Result.Members (C) := Left.Members (C) or Right.Members (C);
      end loop;
      return Result;
    end;
  function "xor" (Left, Right : Character_Set) return Character_Set is
    Result : Character_Set;
    begin
      for C in Character loop
        Result.Members (C) := Left.Members (C) xor Right.Members (C);
      end loop;
      return Result;
    end;
  function "-" (Left, Right : Character_Set) return Character_Set is
    Result : Character_Set;
    begin
      for C in Character loop
        Result.Members (C) := Left.Members (C) and not Right.Members (C);
      end loop;
      return Result;
    end;
  function Is_In (Element : Character; Set : Character_Set) return Boolean is
    begin
      return Set.Members (Element);
    end;
  function Is_Subset (Elements : Character_Set; Set : Character_Set) return Boolean is
    begin
      for C in Character loop
        if Elements.Members (C) and then not Set.Members (C) then
          return False;
        end if;
      end loop;
      return True;
    end;
  function To_Set (Sequence : Character_Sequence) return Character_Set is
    Result : Character_Set := Null_Set;
    begin
      for I in Sequence'Range loop
        Result.Members (Sequence (I)) := True;
      end loop;
      return Result;
    end;
  function To_Set (Singleton : Character) return Character_Set is
    Result : Character_Set := Null_Set;
    begin
      Result.Members (Singleton) := True;
      return Result;
    end;
  function Member_Count (Set : Character_Set) return Natural is
    Count : Natural := 0;
    begin
      for C in Character loop
        if Set.Members (C) then
          Count := Count + 1;
        end if;
      end loop;
      return Count;
    end;
  function To_Sequence (Set : Character_Set) return Character_Sequence is
    Result : String (1 .. Member_Count (Set));
    Last   : Natural := 0;
    begin
      for C in Character loop
        if Set.Members (C) then
          Last := Last + 1;
          Result (Last) := C;
        end if;
      end loop;
      return Result;
    end;
  function Value (Map : Character_Mapping; Element : Character) return Character is
    begin
      return Character'Val (Character'Pos (Element) + Map.Displacement (Element));
    end;
  function To_Mapping (From, To : Character_Sequence) return Character_Mapping is
    Result : Character_Mapping := Identity;
    Seen   : Membership_Table := (others => False);
    begin
      if From'Length /= To'Length then
        raise Translation_Error;
      end if;
      for I in From'Range loop
        if Seen (From (I)) then
          raise Translation_Error;
        end if;
        Seen (From (I)) := True;
        Result.Displacement (From (I)) :=
          Character'Pos (To (I - From'First + To'First)) - Character'Pos (From (I));
      end loop;
      return Result;
    end;
  function Domain_Count (Map : Character_Mapping) return Natural is
    Count : Natural := 0;
    begin
      for C in Character loop
        if Map.Displacement (C) /= 0 then
          Count := Count + 1;
        end if;
      end loop;
      return Count;
    end;
  function To_Domain (Map : Character_Mapping) return Character_Sequence is
    Result : String (1 .. Domain_Count (Map));
    Last   : Natural := 0;
    begin
      for C in Character loop
        if Map.Displacement (C) /= 0 then
          Last := Last + 1;
          Result (Last) := C;
        end if;
      end loop;
      return Result;
    end;
  function To_Range (Map : Character_Mapping) return Character_Sequence is
    Result : String (1 .. Domain_Count (Map));
    Last   : Natural := 0;
    begin
      for C in Character loop
        if Map.Displacement (C) /= 0 then
          Last := Last + 1;
          Result (Last) := Value (Map, C);
        end if;
      end loop;
      return Result;
    end;
end;
package Ada.Strings.Maps.Constants is
  Control_Set           : constant Character_Set;
  Graphic_Set           : constant Character_Set;
  Letter_Set            : constant Character_Set;
  Lower_Set             : constant Character_Set;
  Upper_Set             : constant Character_Set;
  Basic_Set             : constant Character_Set;
  Decimal_Digit_Set     : constant Character_Set;
  Hexadecimal_Digit_Set : constant Character_Set;
  Alphanumeric_Set      : constant Character_Set;
  Special_Set           : constant Character_Set;
  ISO_646_Set           : constant Character_Set;
  Lower_Case_Map        : constant Character_Mapping;
  Upper_Case_Map        : constant Character_Mapping;
  Basic_Map             : constant Character_Mapping;
private
  Control_Set           : constant Character_Set := (Members => (Character'Val (0) .. Character'Val (31) | Character'Val (127) => True, others => False));
  Graphic_Set           : constant Character_Set := (Members => (' ' .. '~' => True, others => False));
  Letter_Set            : constant Character_Set := (Members => ('A' .. 'Z' | 'a' .. 'z' => True, others => False));
  Lower_Set             : constant Character_Set := (Members => ('a' .. 'z' => True, others => False));
  Upper_Set             : constant Character_Set := (Members => ('A' .. 'Z' => True, others => False));
  Basic_Set             : constant Character_Set := (Members => ('A' .. 'Z' | 'a' .. 'z' => True, others => False));
  Decimal_Digit_Set     : constant Character_Set := (Members => ('0' .. '9' => True, others => False));
  Hexadecimal_Digit_Set : constant Character_Set := (Members => ('0' .. '9' | 'A' .. 'F' | 'a' .. 'f' => True, others => False));
  Alphanumeric_Set      : constant Character_Set := (Members => ('0' .. '9' | 'A' .. 'Z' | 'a' .. 'z' => True, others => False));
  Special_Set           : constant Character_Set := (Members => (' ' .. '/' | ':' .. '@' | '[' .. '`' | '{' .. '~' => True, others => False));
  ISO_646_Set           : constant Character_Set := (Members => (others => True));
  Lower_Case_Map        : constant Character_Mapping := (Displacement => ('A' .. 'Z' => 32, others => 0));
  Upper_Case_Map        : constant Character_Mapping := (Displacement => ('a' .. 'z' => -32, others => 0));
  Basic_Map             : constant Character_Mapping := (Displacement => (others => 0));
end;
with Ada.Strings.Maps;
package Ada.Strings.Fixed is
  procedure Move (Source  : String;
                  Target  : out String;
                  Drop    : Truncation := Error;
                  Justify : Alignment := Left;
                  Pad     : Character := Space);
  function Index (Source  : String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source  : String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source  : String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source  : String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source : String;
                  Set    : Maps.Character_Set;
                  From   : Positive;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural;
  function Index (Source : String;
                  Set    : Maps.Character_Set;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : String;
                            From   : Positive;
                            Going  : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : String;
                            Going  : Direction := Forward) return Natural;
  function Count (Source  : String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Count (Source  : String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Count (Source : String;
                  Set    : Maps.Character_Set) return Natural;
  procedure Find_Token (Source : String;
                        Set    : Maps.Character_Set;
                        From   : Positive;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural);
  procedure Find_Token (Source : String;
                        Set    : Maps.Character_Set;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural);
  function Translate (Source  : String;
                      Mapping : Maps.Character_Mapping) return String;
  procedure Translate (Source  : in out String;
                       Mapping : Maps.Character_Mapping);
  function Translate (Source  : String;
                      Mapping : Maps.Character_Mapping_Function) return String;
  procedure Translate (Source  : in out String;
                       Mapping : Maps.Character_Mapping_Function);
  function Replace_Slice (Source : String;
                          Low    : Positive;
                          High   : Natural;
                          By     : String) return String;
  procedure Replace_Slice (Source  : in out String;
                           Low     : Positive;
                           High    : Natural;
                           By      : String;
                           Drop    : Truncation := Error;
                           Justify : Alignment := Left;
                           Pad     : Character := Space);
  function Insert (Source   : String;
                   Before   : Positive;
                   New_Item : String) return String;
  procedure Insert (Source   : in out String;
                    Before   : Positive;
                    New_Item : String;
                    Drop     : Truncation := Error);
  function Overwrite (Source   : String;
                      Position : Positive;
                      New_Item : String) return String;
  procedure Overwrite (Source   : in out String;
                       Position : Positive;
                       New_Item : String;
                       Drop     : Truncation := Right);
  function Delete (Source  : String;
                   From    : Positive;
                   Through : Natural) return String;
  procedure Delete (Source  : in out String;
                    From    : Positive;
                    Through : Natural;
                    Justify : Alignment := Left;
                    Pad     : Character := Space);
  function Trim (Source : String;
                 Side   : Trim_End) return String;
  procedure Trim (Source  : in out String;
                  Side    : Trim_End;
                  Justify : Alignment := Left;
                  Pad     : Character := Space);
  function Trim (Source : String;
                 Left   : Maps.Character_Set;
                 Right  : Maps.Character_Set) return String;
  procedure Trim (Source  : in out String;
                  Left    : Maps.Character_Set;
                  Right   : Maps.Character_Set;
                  Justify : Alignment := Strings.Left;
                  Pad     : Character := Space);
  function Head (Source : String;
                 Count  : Natural;
                 Pad    : Character := Space) return String;
  procedure Head (Source  : in out String;
                  Count   : Natural;
                  Justify : Alignment := Left;
                  Pad     : Character := Space);
  function Tail (Source : String;
                 Count  : Natural;
                 Pad    : Character := Space) return String;
  procedure Tail (Source  : in out String;
                  Count   : Natural;
                  Justify : Alignment := Left;
                  Pad     : Character := Space);
  function "*" (Left : Natural; Right : Character) return String;
  function "*" (Left : Natural; Right : String) return String;
end;
package body Ada.Strings.Fixed is
  procedure Move (Source  : String;
                  Target  : out String;
                  Drop    : Truncation := Error;
                  Justify : Alignment := Left;
                  Pad     : Character := Space) is
    Surplus : constant Integer := Source'Length - Target'Length;
    Front   : Natural;
    begin
      if Surplus = 0 then
        Target := Source;
      elsif Surplus > 0 then
        case Drop is
          when Left =>
            Target := Source (Source'Last - Target'Length + 1 .. Source'Last);
          when Right =>
            Target := Source (Source'First .. Source'First + Target'Length - 1);
          when Error =>
            case Justify is
              when Left =>
                for I in Source'First + Target'Length .. Source'Last loop
                  if Source (I) /= Pad then
                    raise Length_Error;
                  end if;
                end loop;
                Target := Source (Source'First .. Source'First + Target'Length - 1);
              when Right =>
                for I in Source'First .. Source'Last - Target'Length loop
                  if Source (I) /= Pad then
                    raise Length_Error;
                  end if;
                end loop;
                Target := Source (Source'Last - Target'Length + 1 .. Source'Last);
              when Center =>
                raise Length_Error;
            end case;
        end case;
      else
        case Justify is
          when Left =>
            Front := 0;
          when Right =>
            Front := -Surplus;
          when Center =>
            Front := -Surplus / 2;
        end case;
        for I in Target'Range loop
          Target (I) := Pad;
        end loop;
        Target (Target'First + Front .. Target'First + Front + Source'Length - 1) := Source;
      end if;
    end;
  function Matches (Source  : String;
                    At_Index : Positive;
                    Pattern : String;
                    Mapping : Maps.Character_Mapping) return Boolean is
    begin
      for K in Pattern'Range loop
        if Pattern (K) /= Maps.Value (Mapping, Source (At_Index + (K - Pattern'First))) then
          return False;
        end if;
      end loop;
      return True;
    end;
  function Matches (Source   : String;
                    At_Index : Positive;
                    Pattern  : String;
                    Mapping  : Maps.Character_Mapping_Function) return Boolean is
    begin
      for K in Pattern'Range loop
        if Pattern (K) /= Mapping (Source (At_Index + (K - Pattern'First))) then
          return False;
        end if;
      end loop;
      return True;
    end;
  function Index (Source  : String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    begin
      if Pattern'Length = 0 then
        raise Pattern_Error;
      end if;
      if Source'Length = 0 then
        return 0;
      end if;
      if From not in Source'Range then
        raise Index_Error;
      end if;
      if Going = Forward then
        for I in From .. Source'Last - Pattern'Length + 1 loop
          if Matches (Source, I, Pattern, Mapping) then
            return I;
          end if;
        end loop;
      else
        for I in reverse Source'First .. Integer'Min (From, Source'Last) - Pattern'Length + 1 loop
          if Matches (Source, I, Pattern, Mapping) then
            return I;
          end if;
        end loop;
      end if;
      return 0;
    end;
  function Index (Source  : String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    begin
      if Pattern'Length = 0 then
        raise Pattern_Error;
      end if;
      if Source'Length = 0 then
        return 0;
      end if;
      if From not in Source'Range then
        raise Index_Error;
      end if;
      if Going = Forward then
        for I in From .. Source'Last - Pattern'Length + 1 loop
          if Matches (Source, I, Pattern, Mapping) then
            return I;
          end if;
        end loop;
      else
        for I in reverse Source'First .. Integer'Min (From, Source'Last) - Pattern'Length + 1 loop
          if Matches (Source, I, Pattern, Mapping) then
            return I;
          end if;
        end loop;
      end if;
      return 0;
    end;
  function Index (Source  : String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    begin
      if Going = Forward then
        return Index (Source, Pattern, Source'First, Forward, Mapping);
      end if;
      return Index (Source, Pattern, Source'Last, Backward, Mapping);
    end;
  function Index (Source  : String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    begin
      if Going = Forward then
        return Index (Source, Pattern, Source'First, Forward, Mapping);
      end if;
      return Index (Source, Pattern, Source'Last, Backward, Mapping);
    end;
  function Index (Source : String;
                  Set    : Maps.Character_Set;
                  From   : Positive;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural is
    begin
      if Source'Length = 0 then
        return 0;
      end if;
      if From not in Source'Range then
        raise Index_Error;
      end if;
      if Going = Forward then
        for I in From .. Source'Last loop
          if Maps.Is_In (Source (I), Set) = (Test = Inside) then
            return I;
          end if;
        end loop;
      else
        for I in reverse Source'First .. From loop
          if Maps.Is_In (Source (I), Set) = (Test = Inside) then
            return I;
          end if;
        end loop;
      end if;
      return 0;
    end;
  function Index (Source : String;
                  Set    : Maps.Character_Set;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural is
    begin
      if Going = Forward then
        return Index (Source, Set, Source'First, Test, Forward);
      end if;
      return Index (Source, Set, Source'Last, Test, Backward);
    end;
  function Index_Non_Blank (Source : String;
                            From   : Positive;
                            Going  : Direction := Forward) return Natural is
    begin
      return Index (Source, Maps.To_Set (Space), From, Outside, Going);
    end;
  function Index_Non_Blank (Source : String;
                            Going  : Direction := Forward) return Natural is
    begin
      return Index (Source, Maps.To_Set (Space), Outside, Going);
    end;
  function Count (Source  : String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    Result : Natural := 0;
    I      : Integer := Source'First;
    begin
      if Pattern'Length = 0 then
        raise Pattern_Error;
      end if;
      while I <= Source'Last - Pattern'Length + 1 loop
        if Matches (Source, I, Pattern, Mapping) then
          Result := Result + 1;
          I := I + Pattern'Length;
        else
          I := I + 1;
        end if;
      end loop;
      return Result;
    end;
  function Count (Source  : String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    Result : Natural := 0;
    I      : Integer := Source'First;
    begin
      if Pattern'Length = 0 then
        raise Pattern_Error;
      end if;
      while I <= Source'Last - Pattern'Length + 1 loop
        if Matches (Source, I, Pattern, Mapping) then
          Result := Result + 1;
          I := I + Pattern'Length;
        else
          I := I + 1;
        end if;
      end loop;
      return Result;
    end;
  function Count (Source : String;
                  Set    : Maps.Character_Set) return Natural is
    Result : Natural := 0;
    begin
      for I in Source'Range loop
        if Maps.Is_In (Source (I), Set) then
          Result := Result + 1;
        end if;
      end loop;
      return Result;
    end;
  procedure Find_Token (Source : String;
                        Set    : Maps.Character_Set;
                        From   : Positive;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural) is
    begin
      if Source'Length /= 0 and then From not in Source'Range then
        raise Index_Error;
      end if;
      for I in From .. Source'Last loop
        if Maps.Is_In (Source (I), Set) = (Test = Inside) then
          First := I;
          Last := I;
          while Last < Source'Last and then Maps.Is_In (Source (Last + 1), Set) = (Test = Inside) loop
            Last := Last + 1;
          end loop;
          return;
        end if;
      end loop;
      First := From;
      Last := 0;
    end;
  procedure Find_Token (Source : String;
                        Set    : Maps.Character_Set;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural) is
    begin
      if Source'Length = 0 then
        First := Source'First;
        Last := 0;
        return;
      end if;
      Find_Token (Source, Set, Source'First, Test, First, Last);
    end;
  function Translate (Source  : String;
                      Mapping : Maps.Character_Mapping) return String is
    Result : String (1 .. Source'Length);
    begin
      for I in Source'Range loop
        Result (I - Source'First + 1) := Maps.Value (Mapping, Source (I));
      end loop;
      return Result;
    end;
  procedure Translate (Source  : in out String;
                       Mapping : Maps.Character_Mapping) is
    begin
      for I in Source'Range loop
        Source (I) := Maps.Value (Mapping, Source (I));
      end loop;
    end;
  function Translate (Source  : String;
                      Mapping : Maps.Character_Mapping_Function) return String is
    Result : String (1 .. Source'Length);
    begin
      for I in Source'Range loop
        Result (I - Source'First + 1) := Mapping (Source (I));
      end loop;
      return Result;
    end;
  procedure Translate (Source  : in out String;
                       Mapping : Maps.Character_Mapping_Function) is
    begin
      for I in Source'Range loop
        Source (I) := Mapping (Source (I));
      end loop;
    end;
  function Replace_Slice (Source : String;
                          Low    : Positive;
                          High   : Natural;
                          By     : String) return String is
    begin
      if Low > Source'Last + 1 or else High < Source'First - 1 then
        raise Index_Error;
      end if;
      if High < Low then
        return Insert (Source, Low, By);
      end if;
      declare
        Front  : constant Natural := Low - Source'First;
        Back   : constant Natural := Integer'Max (0, Source'Last - High);
        Result : String (1 .. Front + By'Length + Back);
        begin
          Result (1 .. Front) := Source (Source'First .. Low - 1);
          Result (Front + 1 .. Front + By'Length) := By;
          Result (Front + By'Length + 1 .. Result'Last) := Source (Source'Last - Back + 1 .. Source'Last);
          return Result;
        end;
    end;
  procedure Replace_Slice (Source  : in out String;
                           Low     : Positive;
                           High    : Natural;
                           By      : String;
                           Drop    : Truncation := Error;
                           Justify : Alignment := Left;
                           Pad     : Character := Space) is
    begin
      Move (Replace_Slice (Source, Low, High, By), Source, Drop, Justify, Pad);
    end;
  function Insert (Source   : String;
                   Before   : Positive;
                   New_Item : String) return String is
    Front  : constant Integer := Before - Source'First;
    Result : String (1 .. Source'Length + New_Item'Length);
    begin
      if Before not in Source'First .. Source'Last + 1 then
        raise Index_Error;
      end if;
      Result (1 .. Front) := Source (Source'First .. Before - 1);
      Result (Front + 1 .. Front + New_Item'Length) := New_Item;
      Result (Front + New_Item'Length + 1 .. Result'Last) := Source (Before .. Source'Last);
      return Result;
    end;
  procedure Insert (Source   : in out String;
                    Before   : Positive;
                    New_Item : String;
                    Drop     : Truncation := Error) is
    begin
      Move (Insert (Source, Before, New_Item), Source, Drop);
    end;
  function Overwrite (Source   : String;
                      Position : Positive;
                      New_Item : String) return String is
    begin
      if Position not in Source'First .. Source'Last + 1 then
        raise Index_Error;
      end if;
      declare
        Front  : constant Natural := Position - Source'First;
        Result : String (1 .. Integer'Max (Source'Length, Front + New_Item'Length));
        begin
          Result (1 .. Source'Length) := Source;
          Result (Front + 1 .. Front + New_Item'Length) := New_Item;
          return Result;
        end;
    end;
  procedure Overwrite (Source   : in out String;
                       Position : Positive;
                       New_Item : String;
                       Drop     : Truncation := Right) is
    begin
      Move (Overwrite (Source, Position, New_Item), Source, Drop);
    end;
  function Delete (Source  : String;
                   From    : Positive;
                   Through : Natural) return String is
    begin
      if From > Through then
        declare
          Result : constant String (1 .. Source'Length) := Source;
          begin
            return Result;
          end;
      end if;
      if From not in Source'Range or else Through > Source'Last then
        raise Index_Error;
      end if;
      return Replace_Slice (Source, From, Through, "");
    end;
  procedure Delete (Source  : in out String;
                    From    : Positive;
                    Through : Natural;
                    Justify : Alignment := Left;
                    Pad     : Character := Space) is
    begin
      Move (Delete (Source, From, Through), Source, Justify => Justify, Pad => Pad);
    end;
  function Trim (Source : String;
                 Side   : Trim_End) return String is
    First : Integer := Source'First;
    Last  : Integer := Source'Last;
    begin
      if Side = Left or else Side = Both then
        while First <= Last and then Source (First) = Space loop
          First := First + 1;
        end loop;
      end if;
      if Side = Right or else Side = Both then
        while Last >= First and then Source (Last) = Space loop
          Last := Last - 1;
        end loop;
      end if;
      declare
        Result : constant String (1 .. Last - First + 1) := Source (First .. Last);
        begin
          return Result;
        end;
    end;
  procedure Trim (Source  : in out String;
                  Side    : Trim_End;
                  Justify : Alignment := Left;
                  Pad     : Character := Space) is
    begin
      Move (Trim (Source, Side), Source, Justify => Justify, Pad => Pad);
    end;
  function Trim (Source : String;
                 Left   : Maps.Character_Set;
                 Right  : Maps.Character_Set) return String is
    First : Integer := Source'First;
    Last  : Integer := Source'Last;
    begin
      while First <= Last and then Maps.Is_In (Source (First), Left) loop
        First := First + 1;
      end loop;
      while Last >= First and then Maps.Is_In (Source (Last), Right) loop
        Last := Last - 1;
      end loop;
      declare
        Result : constant String (1 .. Last - First + 1) := Source (First .. Last);
        begin
          return Result;
        end;
    end;
  procedure Trim (Source  : in out String;
                  Left    : Maps.Character_Set;
                  Right   : Maps.Character_Set;
                  Justify : Alignment := Strings.Left;
                  Pad     : Character := Space) is
    begin
      Move (Trim (Source, Left, Right), Source, Justify => Justify, Pad => Pad);
    end;
  function Head (Source : String;
                 Count  : Natural;
                 Pad    : Character := Space) return String is
    Result : String (1 .. Count);
    begin
      if Count <= Source'Length then
        Result := Source (Source'First .. Source'First + Count - 1);
      else
        Result (1 .. Source'Length) := Source;
        for I in Source'Length + 1 .. Count loop
          Result (I) := Pad;
        end loop;
      end if;
      return Result;
    end;
  procedure Head (Source  : in out String;
                  Count   : Natural;
                  Justify : Alignment := Left;
                  Pad     : Character := Space) is
    begin
      Move (Head (Source, Count, Pad), Source, Error, Justify, Pad);
    end;
  function Tail (Source : String;
                 Count  : Natural;
                 Pad    : Character := Space) return String is
    Result : String (1 .. Count);
    begin
      if Count <= Source'Length then
        Result := Source (Source'Last - Count + 1 .. Source'Last);
      else
        for I in 1 .. Count - Source'Length loop
          Result (I) := Pad;
        end loop;
        Result (Count - Source'Length + 1 .. Count) := Source;
      end if;
      return Result;
    end;
  procedure Tail (Source  : in out String;
                  Count   : Natural;
                  Justify : Alignment := Left;
                  Pad     : Character := Space) is
    begin
      Move (Tail (Source, Count, Pad), Source, Error, Justify, Pad);
    end;
  function "*" (Left : Natural; Right : Character) return String is
    Result : String (1 .. Left);
    begin
      for I in Result'Range loop
        Result (I) := Right;
      end loop;
      return Result;
    end;
  function "*" (Left : Natural; Right : String) return String is
    Result : String (1 .. Left * Right'Length);
    Last   : Natural := 0;
    begin
      for I in 1 .. Left loop
        Result (Last + 1 .. Last + Right'Length) := Right;
        Last := Last + Right'Length;
      end loop;
      return Result;
    end;
end;
with Ada.Containers;
function Ada.Strings.Hash (Key : String) return Ada.Containers.Hash_Type;
function Ada.Strings.Hash (Key : String) return Ada.Containers.Hash_Type is
  use type Ada.Containers.Hash_Type;
  Result : Ada.Containers.Hash_Type := 2166136261;
  begin
    for I in Key'Range loop
      Result := (Result xor Character'Pos (Key (I))) * 16777619;
    end loop;
    return Result;
  end;
with Ada.Containers;
function Ada.Strings.Hash_Case_Insensitive (Key : String) return Ada.Containers.Hash_Type;
with Ada.Characters.Handling;
with Ada.Strings.Hash;
function Ada.Strings.Hash_Case_Insensitive (Key : String) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash (Ada.Characters.Handling.To_Lower (Key));
  end;
function Ada.Strings.Equal_Case_Insensitive (Left, Right : String) return Boolean;
with Ada.Characters.Handling;
function Ada.Strings.Equal_Case_Insensitive (Left, Right : String) return Boolean is
  use Ada.Characters.Handling;
  begin
    return To_Lower (Left) = To_Lower (Right);
  end;
function Ada.Strings.Less_Case_Insensitive (Left, Right : String) return Boolean;
with Ada.Characters.Handling;
function Ada.Strings.Less_Case_Insensitive (Left, Right : String) return Boolean is
  use Ada.Characters.Handling;
  begin
    return To_Lower (Left) < To_Lower (Right);
  end;
with Ada.Containers;
function Ada.Strings.Fixed.Hash (Key : String) return Ada.Containers.Hash_Type;
with Ada.Strings.Hash;
function Ada.Strings.Fixed.Hash (Key : String) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash (Key);
  end;
with Ada.Containers;
function Ada.Strings.Fixed.Hash_Case_Insensitive (Key : String) return Ada.Containers.Hash_Type;
with Ada.Strings.Hash_Case_Insensitive;
function Ada.Strings.Fixed.Hash_Case_Insensitive (Key : String) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash_Case_Insensitive (Key);
  end;
function Ada.Strings.Fixed.Equal_Case_Insensitive (Left, Right : String) return Boolean;
with Ada.Strings.Equal_Case_Insensitive;
function Ada.Strings.Fixed.Equal_Case_Insensitive (Left, Right : String) return Boolean is
  begin
    return Ada.Strings.Equal_Case_Insensitive (Left, Right);
  end;
function Ada.Strings.Fixed.Less_Case_Insensitive (Left, Right : String) return Boolean;
with Ada.Strings.Less_Case_Insensitive;
function Ada.Strings.Fixed.Less_Case_Insensitive (Left, Right : String) return Boolean is
  begin
    return Ada.Strings.Less_Case_Insensitive (Left, Right);
  end;
with Ada.Strings.Maps;
with Ada.Containers;
package Ada.Strings.Bounded is
  generic
    Max : Positive;
  package Generic_Bounded_Length is
    Max_Length : constant Positive := Max;
    type Bounded_String is private;
    Null_Bounded_String : constant Bounded_String;
    subtype Length_Range is Natural range 0 .. Max_Length;
    function Length (Source : Bounded_String) return Length_Range;
    function To_Bounded_String (Source : String;
                                Drop   : Truncation := Error) return Bounded_String;
    function To_String (Source : Bounded_String) return String;
    procedure Set_Bounded_String (Target : out Bounded_String;
                                  Source : String;
                                  Drop   : Truncation := Error);
    function Append (Left, Right : Bounded_String;
                     Drop        : Truncation := Error) return Bounded_String;
    function Append (Left  : Bounded_String;
                     Right : String;
                     Drop  : Truncation := Error) return Bounded_String;
    function Append (Left  : String;
                     Right : Bounded_String;
                     Drop  : Truncation := Error) return Bounded_String;
    function Append (Left  : Bounded_String;
                     Right : Character;
                     Drop  : Truncation := Error) return Bounded_String;
    function Append (Left  : Character;
                     Right : Bounded_String;
                     Drop  : Truncation := Error) return Bounded_String;
    procedure Append (Source   : in out Bounded_String;
                      New_Item : Bounded_String;
                      Drop     : Truncation := Error);
    procedure Append (Source   : in out Bounded_String;
                      New_Item : String;
                      Drop     : Truncation := Error);
    procedure Append (Source   : in out Bounded_String;
                      New_Item : Character;
                      Drop     : Truncation := Error);
    function "&" (Left, Right : Bounded_String) return Bounded_String;
    function "&" (Left : Bounded_String; Right : String) return Bounded_String;
    function "&" (Left : String; Right : Bounded_String) return Bounded_String;
    function "&" (Left : Bounded_String; Right : Character) return Bounded_String;
    function "&" (Left : Character; Right : Bounded_String) return Bounded_String;
    function Element (Source : Bounded_String;
                      Index  : Positive) return Character;
    procedure Replace_Element (Source : in out Bounded_String;
                               Index  : Positive;
                               By     : Character);
    function Slice (Source : Bounded_String;
                    Low    : Positive;
                    High   : Natural) return String;
    function Bounded_Slice (Source : Bounded_String;
                            Low    : Positive;
                            High   : Natural) return Bounded_String;
    procedure Bounded_Slice (Source : Bounded_String;
                             Target : out Bounded_String;
                             Low    : Positive;
                             High   : Natural);
    function "=" (Left, Right : Bounded_String) return Boolean;
    function "=" (Left : Bounded_String; Right : String) return Boolean;
    function "=" (Left : String; Right : Bounded_String) return Boolean;
    function "<" (Left, Right : Bounded_String) return Boolean;
    function "<" (Left : Bounded_String; Right : String) return Boolean;
    function "<" (Left : String; Right : Bounded_String) return Boolean;
    function "<=" (Left, Right : Bounded_String) return Boolean;
    function "<=" (Left : Bounded_String; Right : String) return Boolean;
    function "<=" (Left : String; Right : Bounded_String) return Boolean;
    function ">" (Left, Right : Bounded_String) return Boolean;
    function ">" (Left : Bounded_String; Right : String) return Boolean;
    function ">" (Left : String; Right : Bounded_String) return Boolean;
    function ">=" (Left, Right : Bounded_String) return Boolean;
    function ">=" (Left : Bounded_String; Right : String) return Boolean;
    function ">=" (Left : String; Right : Bounded_String) return Boolean;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    From    : Positive;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    From    : Positive;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural;
    function Index (Source : Bounded_String;
                    Set    : Maps.Character_Set;
                    From   : Positive;
                    Test   : Membership := Inside;
                    Going  : Direction := Forward) return Natural;
    function Index (Source : Bounded_String;
                    Set    : Maps.Character_Set;
                    Test   : Membership := Inside;
                    Going  : Direction := Forward) return Natural;
    function Index_Non_Blank (Source : Bounded_String;
                              From   : Positive;
                              Going  : Direction := Forward) return Natural;
    function Index_Non_Blank (Source : Bounded_String;
                              Going  : Direction := Forward) return Natural;
    function Count (Source  : Bounded_String;
                    Pattern : String;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
    function Count (Source  : Bounded_String;
                    Pattern : String;
                    Mapping : Maps.Character_Mapping_Function) return Natural;
    function Count (Source : Bounded_String;
                    Set    : Maps.Character_Set) return Natural;
    procedure Find_Token (Source : Bounded_String;
                          Set    : Maps.Character_Set;
                          From   : Positive;
                          Test   : Membership;
                          First  : out Positive;
                          Last   : out Natural);
    procedure Find_Token (Source : Bounded_String;
                          Set    : Maps.Character_Set;
                          Test   : Membership;
                          First  : out Positive;
                          Last   : out Natural);
    function Translate (Source  : Bounded_String;
                        Mapping : Maps.Character_Mapping) return Bounded_String;
    procedure Translate (Source  : in out Bounded_String;
                         Mapping : Maps.Character_Mapping);
    function Translate (Source  : Bounded_String;
                        Mapping : Maps.Character_Mapping_Function) return Bounded_String;
    procedure Translate (Source  : in out Bounded_String;
                         Mapping : Maps.Character_Mapping_Function);
    function Replace_Slice (Source : Bounded_String;
                            Low    : Positive;
                            High   : Natural;
                            By     : String;
                            Drop   : Truncation := Error) return Bounded_String;
    procedure Replace_Slice (Source : in out Bounded_String;
                             Low    : Positive;
                             High   : Natural;
                             By     : String;
                             Drop   : Truncation := Error);
    function Insert (Source   : Bounded_String;
                     Before   : Positive;
                     New_Item : String;
                     Drop     : Truncation := Error) return Bounded_String;
    procedure Insert (Source   : in out Bounded_String;
                      Before   : Positive;
                      New_Item : String;
                      Drop     : Truncation := Error);
    function Overwrite (Source   : Bounded_String;
                        Position : Positive;
                        New_Item : String;
                        Drop     : Truncation := Error) return Bounded_String;
    procedure Overwrite (Source   : in out Bounded_String;
                         Position : Positive;
                         New_Item : String;
                         Drop     : Truncation := Error);
    function Delete (Source  : Bounded_String;
                     From    : Positive;
                     Through : Natural) return Bounded_String;
    procedure Delete (Source  : in out Bounded_String;
                      From    : Positive;
                      Through : Natural);
    function Trim (Source : Bounded_String;
                   Side   : Trim_End) return Bounded_String;
    procedure Trim (Source : in out Bounded_String;
                    Side   : Trim_End);
    function Trim (Source : Bounded_String;
                   Left   : Maps.Character_Set;
                   Right  : Maps.Character_Set) return Bounded_String;
    procedure Trim (Source : in out Bounded_String;
                    Left   : Maps.Character_Set;
                    Right  : Maps.Character_Set);
    function Head (Source : Bounded_String;
                   Count  : Natural;
                   Pad    : Character := Space;
                   Drop   : Truncation := Error) return Bounded_String;
    procedure Head (Source : in out Bounded_String;
                    Count  : Natural;
                    Pad    : Character := Space;
                    Drop   : Truncation := Error);
    function Tail (Source : Bounded_String;
                   Count  : Natural;
                   Pad    : Character := Space;
                   Drop   : Truncation := Error) return Bounded_String;
    procedure Tail (Source : in out Bounded_String;
                    Count  : Natural;
                    Pad    : Character := Space;
                    Drop   : Truncation := Error);
    function "*" (Left  : Natural;
                  Right : Character) return Bounded_String;
    function "*" (Left  : Natural;
                  Right : String) return Bounded_String;
    function "*" (Left  : Natural;
                  Right : Bounded_String) return Bounded_String;
    function Replicate (Count : Natural;
                        Item  : Character;
                        Drop  : Truncation := Error) return Bounded_String;
    function Replicate (Count : Natural;
                        Item  : String;
                        Drop  : Truncation := Error) return Bounded_String;
    function Replicate (Count : Natural;
                        Item  : Bounded_String;
                        Drop  : Truncation := Error) return Bounded_String;
  private
    type Bounded_String is record
      Length : Length_Range := 0;
      Data   : String (1 .. Max_Length) := (others => Character'Val (0));
    end record;
    Null_Bounded_String : constant Bounded_String := (Length => 0, Data => (others => Character'Val (0)));
  end;
  generic
    with package Bounded is new Generic_Bounded_Length (<>);
  function Hash (Key : Bounded.Bounded_String) return Ada.Containers.Hash_Type;
  generic
    with package Bounded is new Generic_Bounded_Length (<>);
  function Hash_Case_Insensitive (Key : Bounded.Bounded_String) return Ada.Containers.Hash_Type;
  generic
    with package Bounded is new Generic_Bounded_Length (<>);
  function Equal_Case_Insensitive (Left, Right : Bounded.Bounded_String) return Boolean;
  generic
    with package Bounded is new Generic_Bounded_Length (<>);
  function Less_Case_Insensitive (Left, Right : Bounded.Bounded_String) return Boolean;
end;
with Ada.Strings.Fixed;
with Ada.Strings.Hash;
with Ada.Strings.Hash_Case_Insensitive;
with Ada.Strings.Equal_Case_Insensitive;
with Ada.Strings.Less_Case_Insensitive;
package body Ada.Strings.Bounded is
  package body Generic_Bounded_Length is
    function Length (Source : Bounded_String) return Length_Range is
      begin
        return Source.Length;
      end;
    function To_Bounded_String (Source : String;
                                Drop   : Truncation := Error) return Bounded_String is
      Result : Bounded_String := Null_Bounded_String;
      begin
        if Source'Length <= Max_Length then
          Result.Length := Source'Length;
          Result.Data (1 .. Source'Length) := Source;
        else
          case Drop is
            when Left =>
              Result.Data := Source (Source'Last - Max_Length + 1 .. Source'Last);
            when Right =>
              Result.Data := Source (Source'First .. Source'First + Max_Length - 1);
            when Error =>
              raise Length_Error;
          end case;
          Result.Length := Max_Length;
        end if;
        return Result;
      end;
    function To_String (Source : Bounded_String) return String is
      begin
        return Source.Data (1 .. Source.Length);
      end;
    procedure Set_Bounded_String (Target : out Bounded_String;
                                  Source : String;
                                  Drop   : Truncation := Error) is
      begin
        Target := To_Bounded_String (Source, Drop);
      end;
    function Append (Left, Right : Bounded_String;
                     Drop        : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (To_String (Left) & To_String (Right), Drop);
      end;
    function Append (Left  : Bounded_String;
                     Right : String;
                     Drop  : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (To_String (Left) & Right, Drop);
      end;
    function Append (Left  : String;
                     Right : Bounded_String;
                     Drop  : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (Left & To_String (Right), Drop);
      end;
    function Append (Left  : Bounded_String;
                     Right : Character;
                     Drop  : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (To_String (Left) & Right, Drop);
      end;
    function Append (Left  : Character;
                     Right : Bounded_String;
                     Drop  : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (Left & To_String (Right), Drop);
      end;
    procedure Append (Source   : in out Bounded_String;
                      New_Item : Bounded_String;
                      Drop     : Truncation := Error) is
      begin
        Source := Append (Source, New_Item, Drop);
      end;
    procedure Append (Source   : in out Bounded_String;
                      New_Item : String;
                      Drop     : Truncation := Error) is
      begin
        Source := Append (Source, New_Item, Drop);
      end;
    procedure Append (Source   : in out Bounded_String;
                      New_Item : Character;
                      Drop     : Truncation := Error) is
      begin
        Source := Append (Source, New_Item, Drop);
      end;
    function "&" (Left, Right : Bounded_String) return Bounded_String is
      begin
        return Append (Left, Right);
      end;
    function "&" (Left : Bounded_String; Right : String) return Bounded_String is
      begin
        return Append (Left, Right);
      end;
    function "&" (Left : String; Right : Bounded_String) return Bounded_String is
      begin
        return Append (Left, Right);
      end;
    function "&" (Left : Bounded_String; Right : Character) return Bounded_String is
      begin
        return Append (Left, Right);
      end;
    function "&" (Left : Character; Right : Bounded_String) return Bounded_String is
      begin
        return Append (Left, Right);
      end;
    function Element (Source : Bounded_String;
                      Index  : Positive) return Character is
      begin
        if Index > Source.Length then
          raise Index_Error;
        end if;
        return Source.Data (Index);
      end;
    procedure Replace_Element (Source : in out Bounded_String;
                               Index  : Positive;
                               By     : Character) is
      begin
        if Index > Source.Length then
          raise Index_Error;
        end if;
        Source.Data (Index) := By;
      end;
    function Slice (Source : Bounded_String;
                    Low    : Positive;
                    High   : Natural) return String is
      begin
        if Low > Source.Length + 1 or else High > Source.Length then
          raise Index_Error;
        end if;
        return Source.Data (Low .. High);
      end;
    function Bounded_Slice (Source : Bounded_String;
                            Low    : Positive;
                            High   : Natural) return Bounded_String is
      begin
        return To_Bounded_String (Slice (Source, Low, High));
      end;
    procedure Bounded_Slice (Source : Bounded_String;
                             Target : out Bounded_String;
                             Low    : Positive;
                             High   : Natural) is
      begin
        Target := To_Bounded_String (Slice (Source, Low, High));
      end;
    function "=" (Left, Right : Bounded_String) return Boolean is
      begin
        return To_String (Left) = To_String (Right);
      end;
    function "=" (Left : Bounded_String; Right : String) return Boolean is
      begin
        return To_String (Left) = Right;
      end;
    function "=" (Left : String; Right : Bounded_String) return Boolean is
      begin
        return Left = To_String (Right);
      end;
    function "<" (Left, Right : Bounded_String) return Boolean is
      begin
        return To_String (Left) < To_String (Right);
      end;
    function "<" (Left : Bounded_String; Right : String) return Boolean is
      begin
        return To_String (Left) < Right;
      end;
    function "<" (Left : String; Right : Bounded_String) return Boolean is
      begin
        return Left < To_String (Right);
      end;
    function "<=" (Left, Right : Bounded_String) return Boolean is
      begin
        return To_String (Left) <= To_String (Right);
      end;
    function "<=" (Left : Bounded_String; Right : String) return Boolean is
      begin
        return To_String (Left) <= Right;
      end;
    function "<=" (Left : String; Right : Bounded_String) return Boolean is
      begin
        return Left <= To_String (Right);
      end;
    function ">" (Left, Right : Bounded_String) return Boolean is
      begin
        return To_String (Left) > To_String (Right);
      end;
    function ">" (Left : Bounded_String; Right : String) return Boolean is
      begin
        return To_String (Left) > Right;
      end;
    function ">" (Left : String; Right : Bounded_String) return Boolean is
      begin
        return Left > To_String (Right);
      end;
    function ">=" (Left, Right : Bounded_String) return Boolean is
      begin
        return To_String (Left) >= To_String (Right);
      end;
    function ">=" (Left : Bounded_String; Right : String) return Boolean is
      begin
        return To_String (Left) >= Right;
      end;
    function ">=" (Left : String; Right : Bounded_String) return Boolean is
      begin
        return Left >= To_String (Right);
      end;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    From    : Positive;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
      begin
        return Fixed.Index (To_String (Source), Pattern, From, Going, Mapping);
      end;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    From    : Positive;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural is
      begin
        return Fixed.Index (To_String (Source), Pattern, From, Going, Mapping);
      end;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
      begin
        return Fixed.Index (To_String (Source), Pattern, Going, Mapping);
      end;
    function Index (Source  : Bounded_String;
                    Pattern : String;
                    Going   : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural is
      begin
        return Fixed.Index (To_String (Source), Pattern, Going, Mapping);
      end;
    function Index (Source : Bounded_String;
                    Set    : Maps.Character_Set;
                    From   : Positive;
                    Test   : Membership := Inside;
                    Going  : Direction := Forward) return Natural is
      begin
        return Fixed.Index (To_String (Source), Set, From, Test, Going);
      end;
    function Index (Source : Bounded_String;
                    Set    : Maps.Character_Set;
                    Test   : Membership := Inside;
                    Going  : Direction := Forward) return Natural is
      begin
        return Fixed.Index (To_String (Source), Set, Test, Going);
      end;
    function Index_Non_Blank (Source : Bounded_String;
                              From   : Positive;
                              Going  : Direction := Forward) return Natural is
      begin
        return Fixed.Index_Non_Blank (To_String (Source), From, Going);
      end;
    function Index_Non_Blank (Source : Bounded_String;
                              Going  : Direction := Forward) return Natural is
      begin
        return Fixed.Index_Non_Blank (To_String (Source), Going);
      end;
    function Count (Source  : Bounded_String;
                    Pattern : String;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
      begin
        return Fixed.Count (To_String (Source), Pattern, Mapping);
      end;
    function Count (Source  : Bounded_String;
                    Pattern : String;
                    Mapping : Maps.Character_Mapping_Function) return Natural is
      begin
        return Fixed.Count (To_String (Source), Pattern, Mapping);
      end;
    function Count (Source : Bounded_String;
                    Set    : Maps.Character_Set) return Natural is
      begin
        return Fixed.Count (To_String (Source), Set);
      end;
    procedure Find_Token (Source : Bounded_String;
                          Set    : Maps.Character_Set;
                          From   : Positive;
                          Test   : Membership;
                          First  : out Positive;
                          Last   : out Natural) is
      begin
        Fixed.Find_Token (To_String (Source), Set, From, Test, First, Last);
      end;
    procedure Find_Token (Source : Bounded_String;
                          Set    : Maps.Character_Set;
                          Test   : Membership;
                          First  : out Positive;
                          Last   : out Natural) is
      begin
        Fixed.Find_Token (To_String (Source), Set, Test, First, Last);
      end;
    function Translate (Source  : Bounded_String;
                        Mapping : Maps.Character_Mapping) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Translate (To_String (Source), Mapping));
      end;
    procedure Translate (Source  : in out Bounded_String;
                         Mapping : Maps.Character_Mapping) is
      begin
        Fixed.Translate (Source.Data (1 .. Source.Length), Mapping);
      end;
    function Translate (Source  : Bounded_String;
                        Mapping : Maps.Character_Mapping_Function) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Translate (To_String (Source), Mapping));
      end;
    procedure Translate (Source  : in out Bounded_String;
                         Mapping : Maps.Character_Mapping_Function) is
      begin
        Fixed.Translate (Source.Data (1 .. Source.Length), Mapping);
      end;
    function Replace_Slice (Source : Bounded_String;
                            Low    : Positive;
                            High   : Natural;
                            By     : String;
                            Drop   : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Replace_Slice (To_String (Source), Low, High, By), Drop);
      end;
    procedure Replace_Slice (Source : in out Bounded_String;
                             Low    : Positive;
                             High   : Natural;
                             By     : String;
                             Drop   : Truncation := Error) is
      begin
        Source := Replace_Slice (Source, Low, High, By, Drop);
      end;
    function Insert (Source   : Bounded_String;
                     Before   : Positive;
                     New_Item : String;
                     Drop     : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Insert (To_String (Source), Before, New_Item), Drop);
      end;
    procedure Insert (Source   : in out Bounded_String;
                      Before   : Positive;
                      New_Item : String;
                      Drop     : Truncation := Error) is
      begin
        Source := Insert (Source, Before, New_Item, Drop);
      end;
    function Overwrite (Source   : Bounded_String;
                        Position : Positive;
                        New_Item : String;
                        Drop     : Truncation := Error) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Overwrite (To_String (Source), Position, New_Item), Drop);
      end;
    procedure Overwrite (Source   : in out Bounded_String;
                         Position : Positive;
                         New_Item : String;
                         Drop     : Truncation := Error) is
      begin
        Source := Overwrite (Source, Position, New_Item, Drop);
      end;
    function Delete (Source  : Bounded_String;
                     From    : Positive;
                     Through : Natural) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Delete (To_String (Source), From, Through));
      end;
    procedure Delete (Source  : in out Bounded_String;
                      From    : Positive;
                      Through : Natural) is
      begin
        Source := Delete (Source, From, Through);
      end;
    function Trim (Source : Bounded_String;
                   Side   : Trim_End) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Trim (To_String (Source), Side));
      end;
    procedure Trim (Source : in out Bounded_String;
                    Side   : Trim_End) is
      begin
        Source := Trim (Source, Side);
      end;
    function Trim (Source : Bounded_String;
                   Left   : Maps.Character_Set;
                   Right  : Maps.Character_Set) return Bounded_String is
      begin
        return To_Bounded_String (Fixed.Trim (To_String (Source), Left, Right));
      end;
    procedure Trim (Source : in out Bounded_String;
                    Left   : Maps.Character_Set;
                    Right  : Maps.Character_Set) is
      begin
        Source := Trim (Source, Left, Right);
      end;
    function Head (Source : Bounded_String;
                   Count  : Natural;
                   Pad    : Character := Space;
                   Drop   : Truncation := Error) return Bounded_String is
      begin
        if Count > Max_Length and then Drop = Error then
          raise Length_Error;
        end if;
        return To_Bounded_String (Fixed.Head (To_String (Source), Integer'Min (Count, 2 * Max_Length), Pad), Drop);
      end;
    procedure Head (Source : in out Bounded_String;
                    Count  : Natural;
                    Pad    : Character := Space;
                    Drop   : Truncation := Error) is
      begin
        Source := Head (Source, Count, Pad, Drop);
      end;
    function Tail (Source : Bounded_String;
                   Count  : Natural;
                   Pad    : Character := Space;
                   Drop   : Truncation := Error) return Bounded_String is
      begin
        if Count > Max_Length and then Drop = Error then
          raise Length_Error;
        end if;
        return To_Bounded_String (Fixed.Tail (To_String (Source), Integer'Min (Count, 2 * Max_Length), Pad), Drop);
      end;
    procedure Tail (Source : in out Bounded_String;
                    Count  : Natural;
                    Pad    : Character := Space;
                    Drop   : Truncation := Error) is
      begin
        Source := Tail (Source, Count, Pad, Drop);
      end;
    function Replicate (Count : Natural;
                        Item  : Character;
                        Drop  : Truncation := Error) return Bounded_String is
      Result : Bounded_String := Null_Bounded_String;
      begin
        if Count > Max_Length and then Drop = Error then
          raise Length_Error;
        end if;
        Result.Length := Integer'Min (Count, Max_Length);
        for I in 1 .. Result.Length loop
          Result.Data (I) := Item;
        end loop;
        return Result;
      end;
    function Replicate (Count : Natural;
                        Item  : String;
                        Drop  : Truncation := Error) return Bounded_String is
      Result : Bounded_String := Null_Bounded_String;
      Total  : constant Natural := Count * Item'Length;
      begin
        if Total > Max_Length and then Drop = Error then
          raise Length_Error;
        end if;
        Result.Length := Integer'Min (Total, Max_Length);
        for I in 1 .. Result.Length loop
          if Drop = Left then
            Result.Data (I) := Item (Item'First + (I - 1 + Total - Result.Length) mod Item'Length);
          else
            Result.Data (I) := Item (Item'First + (I - 1) mod Item'Length);
          end if;
        end loop;
        return Result;
      end;
    function Replicate (Count : Natural;
                        Item  : Bounded_String;
                        Drop  : Truncation := Error) return Bounded_String is
      begin
        return Replicate (Count, To_String (Item), Drop);
      end;
    function "*" (Left  : Natural;
                  Right : Character) return Bounded_String is
      begin
        return Replicate (Left, Right);
      end;
    function "*" (Left  : Natural;
                  Right : String) return Bounded_String is
      begin
        return Replicate (Left, Right);
      end;
    function "*" (Left  : Natural;
                  Right : Bounded_String) return Bounded_String is
      begin
        return Replicate (Left, Right);
      end;
  end;
  function Hash (Key : Bounded.Bounded_String) return Ada.Containers.Hash_Type is
    begin
      return Ada.Strings.Hash (Bounded.To_String (Key));
    end;
  function Hash_Case_Insensitive (Key : Bounded.Bounded_String) return Ada.Containers.Hash_Type is
    begin
      return Ada.Strings.Hash_Case_Insensitive (Bounded.To_String (Key));
    end;
  function Equal_Case_Insensitive (Left, Right : Bounded.Bounded_String) return Boolean is
    begin
      return Ada.Strings.Equal_Case_Insensitive (Bounded.To_String (Left), Bounded.To_String (Right));
    end;
  function Less_Case_Insensitive (Left, Right : Bounded.Bounded_String) return Boolean is
    begin
      return Ada.Strings.Less_Case_Insensitive (Bounded.To_String (Left), Bounded.To_String (Right));
    end;
end;
with Ada.Strings.Maps;
package Ada.Strings.Unbounded is
  type Unbounded_String is private;
  Null_Unbounded_String : constant Unbounded_String;
  function Length (Source : Unbounded_String) return Natural;
  type String_Access is access all String;
  procedure Free (X : in out String_Access);
  function To_Unbounded_String (Source : String) return Unbounded_String;
  function To_Unbounded_String (Length : Natural) return Unbounded_String;
  function To_String (Source : Unbounded_String) return String;
  procedure Set_Unbounded_String (Target : out Unbounded_String; Source : String);
  procedure Append (Source : in out Unbounded_String; New_Item : Unbounded_String);
  procedure Append (Source : in out Unbounded_String; New_Item : String);
  procedure Append (Source : in out Unbounded_String; New_Item : Character);
  function "&" (Left, Right : Unbounded_String) return Unbounded_String;
  function "&" (Left : Unbounded_String; Right : String) return Unbounded_String;
  function "&" (Left : String; Right : Unbounded_String) return Unbounded_String;
  function "&" (Left : Unbounded_String; Right : Character) return Unbounded_String;
  function "&" (Left : Character; Right : Unbounded_String) return Unbounded_String;
  function Element (Source : Unbounded_String; Index : Positive) return Character;
  procedure Replace_Element (Source : in out Unbounded_String; Index : Positive; By : Character);
  function Slice (Source : Unbounded_String; Low : Positive; High : Natural) return String;
  function Unbounded_Slice (Source : Unbounded_String; Low : Positive; High : Natural) return Unbounded_String;
  procedure Unbounded_Slice (Source : Unbounded_String; Target : out Unbounded_String; Low : Positive; High : Natural);
  function "=" (Left, Right : Unbounded_String) return Boolean;
  function "=" (Left : Unbounded_String; Right : String) return Boolean;
  function "=" (Left : String; Right : Unbounded_String) return Boolean;
  function "<" (Left, Right : Unbounded_String) return Boolean;
  function "<" (Left : Unbounded_String; Right : String) return Boolean;
  function "<" (Left : String; Right : Unbounded_String) return Boolean;
  function "<=" (Left, Right : Unbounded_String) return Boolean;
  function "<=" (Left : Unbounded_String; Right : String) return Boolean;
  function "<=" (Left : String; Right : Unbounded_String) return Boolean;
  function ">" (Left, Right : Unbounded_String) return Boolean;
  function ">" (Left : Unbounded_String; Right : String) return Boolean;
  function ">" (Left : String; Right : Unbounded_String) return Boolean;
  function ">=" (Left, Right : Unbounded_String) return Boolean;
  function ">=" (Left : Unbounded_String; Right : String) return Boolean;
  function ">=" (Left : String; Right : Unbounded_String) return Boolean;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source : Unbounded_String;
                  Set    : Maps.Character_Set;
                  From   : Positive;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural;
  function Index (Source : Unbounded_String;
                  Set    : Maps.Character_Set;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : Unbounded_String;
                            From   : Positive;
                            Going  : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : Unbounded_String;
                            Going  : Direction := Forward) return Natural;
  function Count (Source  : Unbounded_String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Count (Source  : Unbounded_String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Count (Source : Unbounded_String;
                  Set    : Maps.Character_Set) return Natural;
  procedure Find_Token (Source : Unbounded_String;
                        Set    : Maps.Character_Set;
                        From   : Positive;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural);
  procedure Find_Token (Source : Unbounded_String;
                        Set    : Maps.Character_Set;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural);
  function Translate (Source  : Unbounded_String;
                      Mapping : Maps.Character_Mapping) return Unbounded_String;
  procedure Translate (Source  : in out Unbounded_String;
                       Mapping : Maps.Character_Mapping);
  function Translate (Source  : Unbounded_String;
                      Mapping : Maps.Character_Mapping_Function) return Unbounded_String;
  procedure Translate (Source  : in out Unbounded_String;
                       Mapping : Maps.Character_Mapping_Function);
  function Replace_Slice (Source : Unbounded_String;
                          Low    : Positive;
                          High   : Natural;
                          By     : String) return Unbounded_String;
  procedure Replace_Slice (Source : in out Unbounded_String;
                           Low    : Positive;
                           High   : Natural;
                           By     : String);
  function Insert (Source   : Unbounded_String;
                   Before   : Positive;
                   New_Item : String) return Unbounded_String;
  procedure Insert (Source   : in out Unbounded_String;
                    Before   : Positive;
                    New_Item : String);
  function Overwrite (Source   : Unbounded_String;
                      Position : Positive;
                      New_Item : String) return Unbounded_String;
  procedure Overwrite (Source   : in out Unbounded_String;
                       Position : Positive;
                       New_Item : String);
  function Delete (Source  : Unbounded_String;
                   From    : Positive;
                   Through : Natural) return Unbounded_String;
  procedure Delete (Source  : in out Unbounded_String;
                    From    : Positive;
                    Through : Natural);
  function Trim (Source : Unbounded_String;
                 Side   : Trim_End) return Unbounded_String;
  procedure Trim (Source : in out Unbounded_String;
                  Side   : Trim_End);
  function Trim (Source : Unbounded_String;
                 Left   : Maps.Character_Set;
                 Right  : Maps.Character_Set) return Unbounded_String;
  procedure Trim (Source : in out Unbounded_String;
                  Left   : Maps.Character_Set;
                  Right  : Maps.Character_Set);
  function Head (Source : Unbounded_String;
                 Count  : Natural;
                 Pad    : Character := Space) return Unbounded_String;
  procedure Head (Source : in out Unbounded_String;
                  Count  : Natural;
                  Pad    : Character := Space);
  function Tail (Source : Unbounded_String;
                 Count  : Natural;
                 Pad    : Character := Space) return Unbounded_String;
  procedure Tail (Source : in out Unbounded_String;
                  Count  : Natural;
                  Pad    : Character := Space);
  function "*" (Left : Natural; Right : Character) return Unbounded_String;
  function "*" (Left : Natural; Right : String) return Unbounded_String;
  function "*" (Left : Natural; Right : Unbounded_String) return Unbounded_String;
private
  type Buffer_Access is access String;
  type Unbounded_String is new Controlled with record
    Buffer : Buffer_Access;
    Last   : Natural := 0;
  end record;
  procedure Adjust (Object : in out Unbounded_String);
  procedure Finalize (Object : in out Unbounded_String);
  Null_Unbounded_String : constant Unbounded_String := (Buffer => null, Last => 0);
end;
with Unchecked_Deallocation;
with Ada.Strings.Fixed;
package body Ada.Strings.Unbounded is
  procedure Release is new Unchecked_Deallocation (String, Buffer_Access);
  procedure Release is new Unchecked_Deallocation (String, String_Access);
  procedure Free (X : in out String_Access) is
    begin
      Release (X);
    end;
  procedure Adjust (Object : in out Unbounded_String) is
    begin
      if Object.Buffer /= null then
        Object.Buffer := new String'(Object.Buffer (1 .. Object.Last));
      end if;
    end;
  procedure Finalize (Object : in out Unbounded_String) is
    begin
      Release (Object.Buffer);
      Object.Last := 0;
    end;
  function Length (Source : Unbounded_String) return Natural is
    begin
      return Source.Last;
    end;
  function To_String (Source : Unbounded_String) return String is
    begin
      if Source.Buffer = null then
        return "";
      end if;
      return Source.Buffer (1 .. Source.Last);
    end;
  procedure Reserve (Source : in out Unbounded_String; Capacity : Natural) is
    Grown : Buffer_Access;
    begin
      if Source.Buffer = null then
        if Capacity > 0 then
          Source.Buffer := new String (1 .. Capacity);
        end if;
      elsif Capacity > Source.Buffer'Length then
        Grown := new String (1 .. Integer'Max (Capacity, 2 * Source.Buffer'Length));
        Grown (1 .. Source.Last) := Source.Buffer (1 .. Source.Last);
        Release (Source.Buffer);
        Source.Buffer := Grown;
      end if;
    end;
  procedure Assign (Target : in out Unbounded_String; Source : String) is
    begin
      if Target.Buffer = null or else Target.Buffer'Length < Source'Length then
        Release (Target.Buffer);
        Target.Last := 0;
        Reserve (Target, Source'Length);
      end if;
      if Source'Length > 0 then
        Target.Buffer (1 .. Source'Length) := Source;
      end if;
      Target.Last := Source'Length;
    end;
  function To_Unbounded_String (Source : String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Assign (Result, Source);
      return Result;
    end;
  function To_Unbounded_String (Length : Natural) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Length);
      if Length > 0 then
        for I in 1 .. Length loop
          Result.Buffer (I) := ' ';
        end loop;
      end if;
      Result.Last := Length;
      return Result;
    end;
  procedure Set_Unbounded_String (Target : out Unbounded_String; Source : String) is
    begin
      Target := To_Unbounded_String (Source);
    end;
  procedure Append (Source : in out Unbounded_String; New_Item : String) is
    Last : constant Natural := Source.Last + New_Item'Length;
    begin
      if New_Item'Length = 0 then
        return;
      end if;
      Reserve (Source, Last);
      Source.Buffer (Source.Last + 1 .. Last) := New_Item;
      Source.Last := Last;
    end;
  procedure Append (Source : in out Unbounded_String; New_Item : Unbounded_String) is
    begin
      if New_Item.Last > 0 then
        Append (Source, New_Item.Buffer (1 .. New_Item.Last));
      end if;
    end;
  procedure Append (Source : in out Unbounded_String; New_Item : Character) is
    begin
      Reserve (Source, Source.Last + 1);
      Source.Last := Source.Last + 1;
      Source.Buffer (Source.Last) := New_Item;
    end;
  function "&" (Left, Right : Unbounded_String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left.Last + Right.Last);
      Append (Result, Left);
      Append (Result, Right);
      return Result;
    end;
  function "&" (Left : Unbounded_String; Right : String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left.Last + Right'Length);
      Append (Result, Left);
      Append (Result, Right);
      return Result;
    end;
  function "&" (Left : String; Right : Unbounded_String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left'Length + Right.Last);
      Append (Result, Left);
      Append (Result, Right);
      return Result;
    end;
  function "&" (Left : Unbounded_String; Right : Character) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left.Last + 1);
      Append (Result, Left);
      Append (Result, Right);
      return Result;
    end;
  function "&" (Left : Character; Right : Unbounded_String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Right.Last + 1);
      Append (Result, Left);
      Append (Result, Right);
      return Result;
    end;
  function Element (Source : Unbounded_String; Index : Positive) return Character is
    begin
      if Index > Source.Last then
        raise Index_Error;
      end if;
      return Source.Buffer (Index);
    end;
  procedure Replace_Element (Source : in out Unbounded_String; Index : Positive; By : Character) is
    begin
      if Index > Source.Last then
        raise Index_Error;
      end if;
      Source.Buffer (Index) := By;
    end;
  function Slice (Source : Unbounded_String; Low : Positive; High : Natural) return String is
    begin
      if Low > Source.Last + 1 or else High > Source.Last then
        raise Index_Error;
      end if;
      if High < Low then
        return "";
      end if;
      return Source.Buffer (Low .. High);
    end;
  function Unbounded_Slice (Source : Unbounded_String; Low : Positive; High : Natural) return Unbounded_String is
    begin
      return To_Unbounded_String (Slice (Source, Low, High));
    end;
  procedure Unbounded_Slice (Source : Unbounded_String; Target : out Unbounded_String; Low : Positive; High : Natural) is
    begin
      Target := To_Unbounded_String (Slice (Source, Low, High));
    end;
  function "=" (Left, Right : Unbounded_String) return Boolean is
    begin
      return To_String (Left) = To_String (Right);
    end;
  function "=" (Left : Unbounded_String; Right : String) return Boolean is
    begin
      return To_String (Left) = Right;
    end;
  function "=" (Left : String; Right : Unbounded_String) return Boolean is
    begin
      return Left = To_String (Right);
    end;
  function "<" (Left, Right : Unbounded_String) return Boolean is
    begin
      return To_String (Left) < To_String (Right);
    end;
  function "<" (Left : Unbounded_String; Right : String) return Boolean is
    begin
      return To_String (Left) < Right;
    end;
  function "<" (Left : String; Right : Unbounded_String) return Boolean is
    begin
      return Left < To_String (Right);
    end;
  function "<=" (Left, Right : Unbounded_String) return Boolean is
    begin
      return To_String (Left) <= To_String (Right);
    end;
  function "<=" (Left : Unbounded_String; Right : String) return Boolean is
    begin
      return To_String (Left) <= Right;
    end;
  function "<=" (Left : String; Right : Unbounded_String) return Boolean is
    begin
      return Left <= To_String (Right);
    end;
  function ">" (Left, Right : Unbounded_String) return Boolean is
    begin
      return To_String (Left) > To_String (Right);
    end;
  function ">" (Left : Unbounded_String; Right : String) return Boolean is
    begin
      return To_String (Left) > Right;
    end;
  function ">" (Left : String; Right : Unbounded_String) return Boolean is
    begin
      return Left > To_String (Right);
    end;
  function ">=" (Left, Right : Unbounded_String) return Boolean is
    begin
      return To_String (Left) >= To_String (Right);
    end;
  function ">=" (Left : Unbounded_String; Right : String) return Boolean is
    begin
      return To_String (Left) >= Right;
    end;
  function ">=" (Left : String; Right : Unbounded_String) return Boolean is
    begin
      return Left >= To_String (Right);
    end;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    begin
      return Fixed.Index (To_String (Source), Pattern, From, Going, Mapping);
    end;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  From    : Positive;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    begin
      return Fixed.Index (To_String (Source), Pattern, From, Going, Mapping);
    end;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    begin
      return Fixed.Index (To_String (Source), Pattern, Going, Mapping);
    end;
  function Index (Source  : Unbounded_String;
                  Pattern : String;
                  Going   : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    begin
      return Fixed.Index (To_String (Source), Pattern, Going, Mapping);
    end;
  function Index (Source : Unbounded_String;
                  Set    : Maps.Character_Set;
                  From   : Positive;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural is
    begin
      return Fixed.Index (To_String (Source), Set, From, Test, Going);
    end;
  function Index (Source : Unbounded_String;
                  Set    : Maps.Character_Set;
                  Test   : Membership := Inside;
                  Going  : Direction := Forward) return Natural is
    begin
      return Fixed.Index (To_String (Source), Set, Test, Going);
    end;
  function Index_Non_Blank (Source : Unbounded_String;
                            From   : Positive;
                            Going  : Direction := Forward) return Natural is
    begin
      return Fixed.Index_Non_Blank (To_String (Source), From, Going);
    end;
  function Index_Non_Blank (Source : Unbounded_String;
                            Going  : Direction := Forward) return Natural is
    begin
      return Fixed.Index_Non_Blank (To_String (Source), Going);
    end;
  function Count (Source  : Unbounded_String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    begin
      return Fixed.Count (To_String (Source), Pattern, Mapping);
    end;
  function Count (Source  : Unbounded_String;
                  Pattern : String;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    begin
      return Fixed.Count (To_String (Source), Pattern, Mapping);
    end;
  function Count (Source : Unbounded_String;
                  Set    : Maps.Character_Set) return Natural is
    begin
      return Fixed.Count (To_String (Source), Set);
    end;
  procedure Find_Token (Source : Unbounded_String;
                        Set    : Maps.Character_Set;
                        From   : Positive;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural) is
    begin
      Fixed.Find_Token (To_String (Source), Set, From, Test, First, Last);
    end;
  procedure Find_Token (Source : Unbounded_String;
                        Set    : Maps.Character_Set;
                        Test   : Membership;
                        First  : out Positive;
                        Last   : out Natural) is
    begin
      Fixed.Find_Token (To_String (Source), Set, Test, First, Last);
    end;
  function Translate (Source  : Unbounded_String;
                      Mapping : Maps.Character_Mapping) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Translate (To_String (Source), Mapping));
    end;
  procedure Translate (Source  : in out Unbounded_String;
                       Mapping : Maps.Character_Mapping) is
    begin
      if Source.Last > 0 then
        Fixed.Translate (Source.Buffer (1 .. Source.Last), Mapping);
      end if;
    end;
  function Translate (Source  : Unbounded_String;
                      Mapping : Maps.Character_Mapping_Function) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Translate (To_String (Source), Mapping));
    end;
  procedure Translate (Source  : in out Unbounded_String;
                       Mapping : Maps.Character_Mapping_Function) is
    begin
      if Source.Last > 0 then
        Fixed.Translate (Source.Buffer (1 .. Source.Last), Mapping);
      end if;
    end;
  function Replace_Slice (Source : Unbounded_String;
                          Low    : Positive;
                          High   : Natural;
                          By     : String) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Replace_Slice (To_String (Source), Low, High, By));
    end;
  procedure Replace_Slice (Source : in out Unbounded_String;
                           Low    : Positive;
                           High   : Natural;
                           By     : String) is
    begin
      Assign (Source, Fixed.Replace_Slice (To_String (Source), Low, High, By));
    end;
  function Insert (Source   : Unbounded_String;
                   Before   : Positive;
                   New_Item : String) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Insert (To_String (Source), Before, New_Item));
    end;
  procedure Insert (Source   : in out Unbounded_String;
                    Before   : Positive;
                    New_Item : String) is
    begin
      Assign (Source, Fixed.Insert (To_String (Source), Before, New_Item));
    end;
  function Overwrite (Source   : Unbounded_String;
                      Position : Positive;
                      New_Item : String) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Overwrite (To_String (Source), Position, New_Item));
    end;
  procedure Overwrite (Source   : in out Unbounded_String;
                       Position : Positive;
                       New_Item : String) is
    begin
      Assign (Source, Fixed.Overwrite (To_String (Source), Position, New_Item));
    end;
  function Delete (Source  : Unbounded_String;
                   From    : Positive;
                   Through : Natural) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Delete (To_String (Source), From, Through));
    end;
  procedure Delete (Source  : in out Unbounded_String;
                    From    : Positive;
                    Through : Natural) is
    begin
      Assign (Source, Fixed.Delete (To_String (Source), From, Through));
    end;
  function Trim (Source : Unbounded_String;
                 Side   : Trim_End) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Trim (To_String (Source), Side));
    end;
  procedure Trim (Source : in out Unbounded_String;
                  Side   : Trim_End) is
    begin
      Assign (Source, Fixed.Trim (To_String (Source), Side));
    end;
  function Trim (Source : Unbounded_String;
                 Left   : Maps.Character_Set;
                 Right  : Maps.Character_Set) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Trim (To_String (Source), Left, Right));
    end;
  procedure Trim (Source : in out Unbounded_String;
                  Left   : Maps.Character_Set;
                  Right  : Maps.Character_Set) is
    begin
      Assign (Source, Fixed.Trim (To_String (Source), Left, Right));
    end;
  function Head (Source : Unbounded_String;
                 Count  : Natural;
                 Pad    : Character := Space) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Head (To_String (Source), Count, Pad));
    end;
  procedure Head (Source : in out Unbounded_String;
                  Count  : Natural;
                  Pad    : Character := Space) is
    begin
      Assign (Source, Fixed.Head (To_String (Source), Count, Pad));
    end;
  function Tail (Source : Unbounded_String;
                 Count  : Natural;
                 Pad    : Character := Space) return Unbounded_String is
    begin
      return To_Unbounded_String (Fixed.Tail (To_String (Source), Count, Pad));
    end;
  procedure Tail (Source : in out Unbounded_String;
                  Count  : Natural;
                  Pad    : Character := Space) is
    begin
      Assign (Source, Fixed.Tail (To_String (Source), Count, Pad));
    end;
  function "*" (Left : Natural; Right : Character) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left);
      for I in 1 .. Left loop
        Result.Buffer (I) := Right;
      end loop;
      Result.Last := Left;
      return Result;
    end;
  function "*" (Left : Natural; Right : String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left * Right'Length);
      for I in 1 .. Left loop
        Append (Result, Right);
      end loop;
      return Result;
    end;
  function "*" (Left : Natural; Right : Unbounded_String) return Unbounded_String is
    begin
      return Left * To_String (Right);
    end;
end;
with Ada.Containers;
function Ada.Strings.Unbounded.Hash (Key : Unbounded_String) return Ada.Containers.Hash_Type;
with Ada.Strings.Hash;
function Ada.Strings.Unbounded.Hash (Key : Unbounded_String) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash (To_String (Key));
  end;
with Ada.Containers;
function Ada.Strings.Unbounded.Hash_Case_Insensitive (Key : Unbounded_String) return Ada.Containers.Hash_Type;
with Ada.Strings.Hash_Case_Insensitive;
function Ada.Strings.Unbounded.Hash_Case_Insensitive (Key : Unbounded_String) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash_Case_Insensitive (To_String (Key));
  end;
function Ada.Strings.Unbounded.Equal_Case_Insensitive (Left, Right : Unbounded_String) return Boolean;
with Ada.Strings.Equal_Case_Insensitive;
function Ada.Strings.Unbounded.Equal_Case_Insensitive (Left, Right : Unbounded_String) return Boolean is
  begin
    return Ada.Strings.Equal_Case_Insensitive (To_String (Left), To_String (Right));
  end;
function Ada.Strings.Unbounded.Less_Case_Insensitive (Left, Right : Unbounded_String) return Boolean;
with Ada.Strings.Less_Case_Insensitive;
function Ada.Strings.Unbounded.Less_Case_Insensitive (Left, Right : Unbounded_String) return Boolean is
  begin
    return Ada.Strings.Less_Case_Insensitive (To_String (Left), To_String (Right));
  end;
with Ada.Iterator_Interfaces;
with System;
package Ada.Containers is
  type Hash_Type is mod 2**32;
  type Count_Type is range 0 .. 2**31 - 1;
  Capacity_Error : exception;
  generic
    type Index_Type is (<>);
    type Element_Type is private;
    type Array_Type is array (Index_Type range <>) of Element_Type;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
  procedure Generic_Array_Sort (Container : in out Array_Type);
  generic
    type Index_Type is (<>);
    type Element_Type is private;
    type Array_Type is array (Index_Type) of Element_Type;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
  procedure Generic_Constrained_Array_Sort (Container : in out Array_Type);
  generic
    type Index_Type is (<>);
    with function Before (Left, Right : Index_Type) return Boolean;
    with procedure Swap (Left, Right : Index_Type);
  procedure Generic_Sort (First, Last : Index_Type'Base);
  generic
    type Index_Type is range <>;
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Vectors is
    subtype Extended_Index is Index_Type'Base range Index_Type'First - 1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
    No_Index : constant Extended_Index := Extended_Index'First;
    type Vector is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Vector : constant Vector;
    No_Element   : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean;
    package Vector_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Vector_Iterator is new Vector_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Vector) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean;
    function Maximum_Length return Count_Type;
    function Empty (Capacity : Count_Type := 10) return Vector;
    function To_Vector (Length : Count_Type) return Vector;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector;
    function "&" (Left, Right : Vector) return Vector;
    function "&" (Left : Vector; Right : Element_Type) return Vector;
    function "&" (Left : Element_Type; Right : Vector) return Vector;
    function "&" (Left, Right : Element_Type) return Vector;
    function Capacity (Container : Vector) return Count_Type;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type);
    function Length (Container : Vector) return Count_Type;
    procedure Set_Length (Container : in out Vector; Length : Count_Type);
    function Is_Empty (Container : Vector) return Boolean;
    procedure Clear (Container : in out Vector);
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor;
    function To_Index (Position : Cursor) return Extended_Index;
    function Element (Container : Vector; Index : Index_Type) return Element_Type;
    function Element (Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type);
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type));
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type));
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type;
    procedure Assign (Target : in out Vector; Source : Vector);
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector;
    procedure Move (Target : in out Vector; Source : in out Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor);
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector);
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector);
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor);
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append_Vector (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out Vector; New_Item : Element_Type);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1);
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1);
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1);
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1);
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1);
    procedure Reverse_Elements (Container : in out Vector);
    procedure Swap (Container : in out Vector; I, J : Index_Type);
    procedure Swap (Container : in out Vector; I, J : Cursor);
    function First_Index (Container : Vector) return Index_Type;
    function First (Container : Vector) return Cursor;
    function First_Element (Container : Vector) return Element_Type;
    function Last_Index (Container : Vector) return Extended_Index;
    function Last (Container : Vector) return Cursor;
    function Last_Element (Container : Vector) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Vector; Position : Cursor) return Cursor;
    procedure Next (Container : Vector; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Vector; Position : Cursor) return Cursor;
    procedure Previous (Container : Vector; Position : in out Cursor);
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Contains (Container : Vector; Item : Element_Type) return Boolean;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Vector) return Vector_Iterator;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      function Is_Sorted (Container : Vector) return Boolean;
      procedure Sort (Container : in out Vector);
      procedure Merge (Target : in out Vector; Source : in out Vector);
    end;
  private
    type Elements_Array is array (Index_Type range <>) of aliased Element_Type;
    type Elements_Access is access Elements_Array;
    type Shared is record
      Elements : Elements_Access;
      Last     : Extended_Index := No_Index;
      Busy     : Natural := 0;
      Lock     : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type Vector is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out Vector);
    procedure Finalize (Container : in out Vector);
    type Cursor is record
      Data  : Shared_Access;
      Index : Extended_Index := No_Index;
    end record;
    type Vector_Iterator is new Vector_Iterator_Interfaces.Reversible_Iterator with record
      Data  : Shared_Access;
      Start : Extended_Index := No_Index;
    end record;
    function First (Object : Vector_Iterator) return Cursor;
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Vector_Iterator) return Cursor;
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Vector : constant Vector := (Data => null);
    No_Element   : constant Cursor := (Data => null, Index => No_Index);
  end;
  generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Doubly_Linked_Lists is
    type List is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_List : constant List;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : List; Position : Cursor) return Boolean;
    package List_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type List_Iterator is new List_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : List) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean;
    function Empty return List;
    function Length (Container : List) return Count_Type;
    function Is_Empty (Container : List) return Boolean;
    procedure Clear (Container : in out List);
    function Element (Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type;
    procedure Assign (Target : in out List; Source : List);
    function Copy (Source : List) return List;
    procedure Move (Target : in out List; Source : in out List);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out List; New_Item : Element_Type);
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1);
    procedure Delete_First (Container : in out List; Count : Count_Type := 1);
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1);
    procedure Reverse_Elements (Container : in out List);
    procedure Swap (Container : in out List; I, J : Cursor);
    procedure Swap_Links (Container : in out List; I, J : Cursor);
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List);
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor);
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor);
    function First (Container : List) return Cursor;
    function First_Element (Container : List) return Element_Type;
    function Last (Container : List) return Cursor;
    function Last_Element (Container : List) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    function Previous (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    procedure Previous (Position : in out Cursor);
    function Next (Container : List; Position : Cursor) return Cursor;
    function Previous (Container : List; Position : Cursor) return Cursor;
    procedure Next (Container : List; Position : in out Cursor);
    procedure Previous (Container : List; Position : in out Cursor);
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Contains (Container : List; Item : Element_Type) return Boolean;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : List) return List_Iterator;
    function Iterate (Container : List; Start : Cursor) return List_Iterator;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      function Is_Sorted (Container : List) return Boolean;
      procedure Sort (Container : in out List);
      procedure Merge (Target, Source : in out List);
    end;
  private
    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
      Element  : aliased Element_Type;
      Next     : Node_Access;
      Previous : Node_Access;
    end record;
    type Shared is record
      First  : Node_Access;
      Last   : Node_Access;
      Length : Count_Type := 0;
      Busy   : Natural := 0;
      Lock   : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type List is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out List);
    procedure Finalize (Container : in out List);
    type Cursor is record
      Data : Shared_Access;
      Node : Node_Access;
    end record;
    type List_Iterator is new List_Iterator_Interfaces.Reversible_Iterator with record
      Data  : Shared_Access;
      Start : Node_Access;
    end record;
    function First (Object : List_Iterator) return Cursor;
    function Next (Object : List_Iterator; Position : Cursor) return Cursor;
    function Last (Object : List_Iterator) return Cursor;
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_List : constant List := (Data => null);
    No_Element : constant Cursor := (Data => null, Node => null);
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function "<" (Left, Right : Key_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Ordered_Maps is
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    type Map is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Map  : constant Map;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Map; Position : Cursor) return Boolean;
    package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Map) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
    function Empty return Map;
    function Length (Container : Map) return Count_Type;
    function Is_Empty (Container : Map) return Boolean;
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type;
    function Key (Container : Map; Position : Cursor) return Key_Type;
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Map; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map) return Map;
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type);
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    procedure Delete_First (Container : in out Map);
    procedure Delete_Last (Container : in out Map);
    function First (Container : Map) return Cursor;
    function First_Element (Container : Map) return Element_Type;
    function First_Key (Container : Map) return Key_Type;
    function Last (Container : Map) return Cursor;
    function Last_Element (Container : Map) return Element_Type;
    function Last_Key (Container : Map) return Key_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor;
    procedure Next (Container : Map; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Map; Position : Cursor) return Cursor;
    procedure Previous (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor;
    function Element (Container : Map; Key : Key_Type) return Element_Type;
    function Floor (Container : Map; Key : Key_Type) return Cursor;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor;
    function Contains (Container : Map; Key : Key_Type) return Boolean;
    function "<" (Left, Right : Cursor) return Boolean;
    function ">" (Left, Right : Cursor) return Boolean;
    function "<" (Left : Cursor; Right : Key_Type) return Boolean;
    function ">" (Left : Cursor; Right : Key_Type) return Boolean;
    function "<" (Left : Key_Type; Right : Cursor) return Boolean;
    function ">" (Left : Key_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator;
  private
    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
      Parent  : Node_Access;
      Left    : Node_Access;
      Right   : Node_Access;
      Height  : Integer := 1;
      Key     : Key_Type;
      Element : aliased Element_Type;
    end record;
    type Shared is record
      Root   : Node_Access;
      Length : Count_Type := 0;
      Busy   : Natural := 0;
      Lock   : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type Map is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out Map);
    procedure Finalize (Container : in out Map);
    type Cursor is record
      Data : Shared_Access;
      Node : Node_Access;
    end record;
    type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with record
      Data  : Shared_Access;
      Start : Node_Access;
    end record;
    function First (Object : Map_Iterator) return Cursor;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Map_Iterator) return Cursor;
    function Previous (Object : Map_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Map  : constant Map := (Data => null);
    No_Element : constant Cursor := (Data => null, Node => null);
  end;
  generic
    type Element_Type is private;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Ordered_Sets is
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean;
    type Set is private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Set  : constant Set;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Set; Position : Cursor) return Boolean;
    package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Set) return Boolean;
    function Equivalent_Sets (Left, Right : Set) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
    function Empty return Set;
    function To_Set (New_Item : Element_Type) return Set;
    function Length (Container : Set) return Count_Type;
    function Is_Empty (Container : Set) return Boolean;
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Set; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set) return Set;
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Delete_First (Container : in out Set);
    procedure Delete_Last (Container : in out Set);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean;
    function First (Container : Set) return Cursor;
    function First_Element (Container : Set) return Element_Type;
    function Last (Container : Set) return Cursor;
    function Last_Element (Container : Set) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor;
    procedure Next (Container : Set; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Set; Position : Cursor) return Cursor;
    procedure Previous (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor;
    function Floor (Container : Set; Item : Element_Type) return Cursor;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor;
    function Contains (Container : Set; Item : Element_Type) return Boolean;
    function "<" (Left, Right : Cursor) return Boolean;
    function ">" (Left, Right : Cursor) return Boolean;
    function "<" (Left : Cursor; Right : Element_Type) return Boolean;
    function ">" (Left : Cursor; Right : Element_Type) return Boolean;
    function "<" (Left : Element_Type; Right : Cursor) return Boolean;
    function ">" (Left : Element_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function "<" (Left, Right : Key_Type) return Boolean is <>;
    package Generic_Keys is
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
      function Key (Position : Cursor) return Key_Type;
      function Element (Container : Set; Key : Key_Type) return Element_Type;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor;
      function Floor (Container : Set; Key : Key_Type) return Cursor;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor;
      function Contains (Container : Set; Key : Key_Type) return Boolean;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type));
      type Reference_Type (Element : not null access Element_Type) is private
        with Implicit_Dereference => Element;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
    private
      type Reference_Type (Element : not null access Element_Type) is null record;
    end;
  private
    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
      Parent  : Node_Access;
      Left    : Node_Access;
      Right   : Node_Access;
      Height  : Integer := 1;
      Element : aliased Element_Type;
    end record;
    type Shared is record
      Root   : Node_Access;
      Length : Count_Type := 0;
      Busy   : Natural := 0;
      Lock   : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type Set is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out Set);
    procedure Finalize (Container : in out Set);
    type Cursor is record
      Data : Shared_Access;
      Node : Node_Access;
    end record;
    type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with record
      Data  : Shared_Access;
      Start : Node_Access;
    end record;
    function First (Object : Set_Iterator) return Cursor;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Set_Iterator) return Cursor;
    function Previous (Object : Set_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    Empty_Set  : constant Set := (Data => null);
    No_Element : constant Cursor := (Data => null, Node => null);
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function Hash (Key : Key_Type) return Hash_Type;
    with function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Hashed_Maps is
    type Map is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Map  : constant Map;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Map; Position : Cursor) return Boolean;
    package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Map_Iterator is new Map_Iterator_Interfaces.Forward_Iterator with private;
    function "=" (Left, Right : Map) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Map;
    function Capacity (Container : Map) return Count_Type;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type);
    function Length (Container : Map) return Count_Type;
    function Is_Empty (Container : Map) return Boolean;
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type;
    function Key (Container : Map; Position : Cursor) return Key_Type;
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Map; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map;
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type);
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    function First (Container : Map) return Cursor;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor;
    procedure Next (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor;
    function Element (Container : Map; Key : Key_Type) return Element_Type;
    function Contains (Container : Map; Key : Key_Type) return Boolean;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator;
  private
    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
      Next    : Node_Access;
      Hash    : Hash_Type := 0;
      Key     : Key_Type;
      Element : aliased Element_Type;
    end record;
    type Bucket_Array is array (Hash_Type range <>) of Node_Access;
    type Bucket_Access is access Bucket_Array;
    type Shared is record
      Buckets : Bucket_Access;
      Length  : Count_Type := 0;
      Busy    : Natural := 0;
      Lock    : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type Map is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out Map);
    procedure Finalize (Container : in out Map);
    type Cursor is record
      Data : Shared_Access;
      Node : Node_Access;
    end record;
    type Map_Iterator is new Map_Iterator_Interfaces.Forward_Iterator with record
      Data : Shared_Access;
    end record;
    function First (Object : Map_Iterator) return Cursor;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Map  : constant Map := (Data => null);
    No_Element : constant Cursor := (Data => null, Node => null);
  end;
  generic
    type Element_Type is private;
    with function Hash (Element : Element_Type) return Hash_Type;
    with function Equivalent_Elements (Left, Right : Element_Type) return Boolean;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Hashed_Sets is
    type Set is private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Set  : constant Set;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Set; Position : Cursor) return Boolean;
    package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Set_Iterator is new Set_Iterator_Interfaces.Forward_Iterator with private;
    function "=" (Left, Right : Set) return Boolean;
    function Equivalent_Sets (Left, Right : Set) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Set;
    function To_Set (New_Item : Element_Type) return Set;
    function Capacity (Container : Set) return Count_Type;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type);
    function Length (Container : Set) return Count_Type;
    function Is_Empty (Container : Set) return Boolean;
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Set; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set;
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean;
    function First (Container : Set) return Cursor;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor;
    procedure Next (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor;
    function Contains (Container : Set; Item : Element_Type) return Boolean;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type;
      with function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    package Generic_Keys is
      function Key (Position : Cursor) return Key_Type;
      function Element (Container : Set; Key : Key_Type) return Element_Type;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor;
      function Contains (Container : Set; Key : Key_Type) return Boolean;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type));
      type Reference_Type (Element : not null access Element_Type) is private
        with Implicit_Dereference => Element;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
    private
      type Reference_Type (Element : not null access Element_Type) is null record;
    end;
  private
    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
      Next    : Node_Access;
      Hash    : Hash_Type := 0;
      Element : aliased Element_Type;
    end record;
    type Bucket_Array is array (Hash_Type range <>) of Node_Access;
    type Bucket_Access is access Bucket_Array;
    type Shared is record
      Buckets : Bucket_Access;
      Length  : Count_Type := 0;
      Busy    : Natural := 0;
      Lock    : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type Set is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out Set);
    procedure Finalize (Container : in out Set);
    type Cursor is record
      Data : Shared_Access;
      Node : Node_Access;
    end record;
    type Set_Iterator is new Set_Iterator_Interfaces.Forward_Iterator with record
      Data : Shared_Access;
    end record;
    function First (Object : Set_Iterator) return Cursor;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    Empty_Set  : constant Set := (Data => null);
    No_Element : constant Cursor := (Data => null, Node => null);
  end;
  generic
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Holders is
    type Holder is private;
    Empty_Holder : constant Holder;
    function "=" (Left, Right : Holder) return Boolean;
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean;
    function Empty return Holder;
    function To_Holder (New_Item : Element_Type) return Holder;
    function Is_Empty (Container : Holder) return Boolean;
    procedure Clear (Container : in out Holder);
    function Element (Container : Holder) return Element_Type;
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type);
    procedure Query_Element (Container : Holder;
                             Process   : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out Holder;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type;
    function Reference (Container : in out Holder) return Reference_Type;
    procedure Assign (Target : in out Holder; Source : Holder);
    function Copy (Source : Holder) return Holder;
    procedure Move (Target : in out Holder; Source : in out Holder);
    procedure Swap (Left, Right : in out Holder);
  private
    type Element_Access is access Element_Type;
    type Shared is record
      Element : Element_Access;
      Busy    : Natural := 0;
    end record;
    type Shared_Access is access Shared;
    type Holder is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Adjust (Container : in out Holder);
    procedure Finalize (Container : in out Holder);
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Holder : constant Holder := (Data => null);
  end;
  generic
    type Index_Type is range <>;
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Vectors is
    subtype Extended_Index is Index_Type'Base range Index_Type'First - 1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
    No_Index : constant Extended_Index := Extended_Index'First;
    type Vector is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Vector : constant Vector;
    No_Element   : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean;
    package Vector_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Vector_Iterator is new Vector_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Vector) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean;
    function Maximum_Length return Count_Type;
    function Empty (Capacity : Count_Type := 10) return Vector;
    function To_Vector (Length : Count_Type) return Vector;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector;
    function "&" (Left, Right : Vector) return Vector;
    function "&" (Left : Vector; Right : Element_Type) return Vector;
    function "&" (Left : Element_Type; Right : Vector) return Vector;
    function "&" (Left, Right : Element_Type) return Vector;
    function Capacity (Container : Vector) return Count_Type;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type);
    function Length (Container : Vector) return Count_Type;
    procedure Set_Length (Container : in out Vector; Length : Count_Type);
    function Is_Empty (Container : Vector) return Boolean;
    procedure Clear (Container : in out Vector);
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor;
    function To_Index (Position : Cursor) return Extended_Index;
    function Element (Container : Vector; Index : Index_Type) return Element_Type;
    function Element (Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type);
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type));
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type));
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type;
    procedure Assign (Target : in out Vector; Source : Vector);
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector;
    procedure Move (Target : in out Vector; Source : in out Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor);
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector);
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector);
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor);
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append_Vector (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out Vector; New_Item : Element_Type);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1);
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1);
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1);
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1);
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1);
    procedure Reverse_Elements (Container : in out Vector);
    procedure Swap (Container : in out Vector; I, J : Index_Type);
    procedure Swap (Container : in out Vector; I, J : Cursor);
    function First_Index (Container : Vector) return Index_Type;
    function First (Container : Vector) return Cursor;
    function First_Element (Container : Vector) return Element_Type;
    function Last_Index (Container : Vector) return Extended_Index;
    function Last (Container : Vector) return Cursor;
    function Last_Element (Container : Vector) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Vector; Position : Cursor) return Cursor;
    procedure Next (Container : Vector; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Vector; Position : Cursor) return Cursor;
    procedure Previous (Container : Vector; Position : in out Cursor);
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Contains (Container : Vector; Item : Element_Type) return Boolean;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Vector) return Vector_Iterator;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      function Is_Sorted (Container : Vector) return Boolean;
      procedure Sort (Container : in out Vector);
      procedure Merge (Target : in out Vector; Source : in out Vector);
    end;
  private
    type Element_Access is access Element_Type;
    type Element_Holder is new Controlled with record
      Element : Element_Access;
    end record;
    procedure Adjust (Object : in out Element_Holder);
    procedure Finalize (Object : in out Element_Holder);
    function "=" (Left, Right : Element_Holder) return Boolean;
    package Implementation is new Vectors (Index_Type, Element_Holder, "=");
    type Vector is record
      Items : Implementation.Vector;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Vector_Iterator is new Vector_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : Vector_Iterator) return Cursor;
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Vector_Iterator) return Cursor;
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Vector : constant Vector := (Items => Implementation.Empty_Vector);
    No_Element   : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Doubly_Linked_Lists is
    type List is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_List : constant List;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : List; Position : Cursor) return Boolean;
    package List_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type List_Iterator is new List_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : List) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean;
    function Empty return List;
    function Length (Container : List) return Count_Type;
    function Is_Empty (Container : List) return Boolean;
    procedure Clear (Container : in out List);
    function Element (Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type;
    procedure Assign (Target : in out List; Source : List);
    function Copy (Source : List) return List;
    procedure Move (Target : in out List; Source : in out List);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out List; New_Item : Element_Type);
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1);
    procedure Delete_First (Container : in out List; Count : Count_Type := 1);
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1);
    procedure Reverse_Elements (Container : in out List);
    procedure Swap (Container : in out List; I, J : Cursor);
    procedure Swap_Links (Container : in out List; I, J : Cursor);
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List);
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor);
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor);
    function First (Container : List) return Cursor;
    function First_Element (Container : List) return Element_Type;
    function Last (Container : List) return Cursor;
    function Last_Element (Container : List) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    function Previous (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    procedure Previous (Position : in out Cursor);
    function Next (Container : List; Position : Cursor) return Cursor;
    function Previous (Container : List; Position : Cursor) return Cursor;
    procedure Next (Container : List; Position : in out Cursor);
    procedure Previous (Container : List; Position : in out Cursor);
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Contains (Container : List; Item : Element_Type) return Boolean;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : List) return List_Iterator;
    function Iterate (Container : List; Start : Cursor) return List_Iterator;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      function Is_Sorted (Container : List) return Boolean;
      procedure Sort (Container : in out List);
      procedure Merge (Target, Source : in out List);
    end;
  private
    type Element_Access is access Element_Type;
    type Element_Holder is new Controlled with record
      Element : Element_Access;
    end record;
    procedure Adjust (Object : in out Element_Holder);
    procedure Finalize (Object : in out Element_Holder);
    function "=" (Left, Right : Element_Holder) return Boolean;
    package Implementation is new Doubly_Linked_Lists (Element_Holder, "=");
    type List is record
      Items : Implementation.List;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type List_Iterator is new List_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : List_Iterator) return Cursor;
    function Next (Object : List_Iterator; Position : Cursor) return Cursor;
    function Last (Object : List_Iterator) return Cursor;
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_List : constant List := (Items => Implementation.Empty_List);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Key_Type (<>) is private;
    type Element_Type (<>) is private;
    with function "<" (Left, Right : Key_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Ordered_Maps is
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    type Map is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Map  : constant Map;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Map; Position : Cursor) return Boolean;
    package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Map) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
    function Empty return Map;
    function Length (Container : Map) return Count_Type;
    function Is_Empty (Container : Map) return Boolean;
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type;
    function Key (Container : Map; Position : Cursor) return Key_Type;
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Map; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map) return Map;
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type);
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    procedure Delete_First (Container : in out Map);
    procedure Delete_Last (Container : in out Map);
    function First (Container : Map) return Cursor;
    function First_Element (Container : Map) return Element_Type;
    function First_Key (Container : Map) return Key_Type;
    function Last (Container : Map) return Cursor;
    function Last_Element (Container : Map) return Element_Type;
    function Last_Key (Container : Map) return Key_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor;
    procedure Next (Container : Map; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Map; Position : Cursor) return Cursor;
    procedure Previous (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor;
    function Element (Container : Map; Key : Key_Type) return Element_Type;
    function Floor (Container : Map; Key : Key_Type) return Cursor;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor;
    function Contains (Container : Map; Key : Key_Type) return Boolean;
    function "<" (Left, Right : Cursor) return Boolean;
    function ">" (Left, Right : Cursor) return Boolean;
    function "<" (Left : Cursor; Right : Key_Type) return Boolean;
    function ">" (Left : Cursor; Right : Key_Type) return Boolean;
    function "<" (Left : Key_Type; Right : Cursor) return Boolean;
    function ">" (Left : Key_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator;
  private
    type Element_Access is access Element_Type;
    type Element_Holder is new Controlled with record
      Element : Element_Access;
    end record;
    procedure Adjust (Object : in out Element_Holder);
    procedure Finalize (Object : in out Element_Holder);
    function "=" (Left, Right : Element_Holder) return Boolean;
    type Key_Access is access Key_Type;
    type Key_Holder is new Controlled with record
      Key : Key_Access;
    end record;
    procedure Adjust (Object : in out Key_Holder);
    procedure Finalize (Object : in out Key_Holder);
    function "<" (Left, Right : Key_Holder) return Boolean;
    package Implementation is new Ordered_Maps (Key_Holder, Element_Holder, "<", "=");
    type Map is record
      Items : Implementation.Map;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : Map_Iterator) return Cursor;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Map_Iterator) return Cursor;
    function Previous (Object : Map_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Map  : constant Map := (Items => Implementation.Empty_Map);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Key_Type (<>) is private;
    type Element_Type (<>) is private;
    with function Hash (Key : Key_Type) return Hash_Type;
    with function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Hashed_Maps is
    type Map is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Map  : constant Map;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Map; Position : Cursor) return Boolean;
    package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Map_Iterator is new Map_Iterator_Interfaces.Forward_Iterator with private;
    function "=" (Left, Right : Map) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Map;
    function Capacity (Container : Map) return Count_Type;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type);
    function Length (Container : Map) return Count_Type;
    function Is_Empty (Container : Map) return Boolean;
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type;
    function Key (Container : Map; Position : Cursor) return Key_Type;
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Map; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map;
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type);
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    function First (Container : Map) return Cursor;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor;
    procedure Next (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor;
    function Element (Container : Map; Key : Key_Type) return Element_Type;
    function Contains (Container : Map; Key : Key_Type) return Boolean;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator;
  private
    type Element_Access is access Element_Type;
    type Element_Holder is new Controlled with record
      Element : Element_Access;
    end record;
    procedure Adjust (Object : in out Element_Holder);
    procedure Finalize (Object : in out Element_Holder);
    function "=" (Left, Right : Element_Holder) return Boolean;
    type Key_Access is access Key_Type;
    type Key_Holder is new Controlled with record
      Key : Key_Access;
    end record;
    procedure Adjust (Object : in out Key_Holder);
    procedure Finalize (Object : in out Key_Holder);
    function Hash_Key (Key : Key_Holder) return Hash_Type;
    function Equivalent_Key_Holders (Left, Right : Key_Holder) return Boolean;
    package Implementation is new Hashed_Maps (Key_Holder, Element_Holder, Hash_Key, Equivalent_Key_Holders, "=");
    type Map is record
      Items : Implementation.Map;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Map_Iterator is new Map_Iterator_Interfaces.Forward_Iterator with record
      First_Item : Implementation.Cursor;
    end record;
    function First (Object : Map_Iterator) return Cursor;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Map  : constant Map := (Items => Implementation.Empty_Map);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type (<>) is private;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Ordered_Sets is
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean;
    type Set is private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Set  : constant Set;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Set; Position : Cursor) return Boolean;
    package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Set) return Boolean;
    function Equivalent_Sets (Left, Right : Set) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
    function Empty return Set;
    function To_Set (New_Item : Element_Type) return Set;
    function Length (Container : Set) return Count_Type;
    function Is_Empty (Container : Set) return Boolean;
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Set; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set) return Set;
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Delete_First (Container : in out Set);
    procedure Delete_Last (Container : in out Set);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean;
    function First (Container : Set) return Cursor;
    function First_Element (Container : Set) return Element_Type;
    function Last (Container : Set) return Cursor;
    function Last_Element (Container : Set) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor;
    procedure Next (Container : Set; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Set; Position : Cursor) return Cursor;
    procedure Previous (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor;
    function Floor (Container : Set; Item : Element_Type) return Cursor;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor;
    function Contains (Container : Set; Item : Element_Type) return Boolean;
    function "<" (Left, Right : Cursor) return Boolean;
    function ">" (Left, Right : Cursor) return Boolean;
    function "<" (Left : Cursor; Right : Element_Type) return Boolean;
    function ">" (Left : Cursor; Right : Element_Type) return Boolean;
    function "<" (Left : Element_Type; Right : Cursor) return Boolean;
    function ">" (Left : Element_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function "<" (Left, Right : Key_Type) return Boolean is <>;
    package Generic_Keys is
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
      function Key (Position : Cursor) return Key_Type;
      function Element (Container : Set; Key : Key_Type) return Element_Type;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor;
      function Floor (Container : Set; Key : Key_Type) return Cursor;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor;
      function Contains (Container : Set; Key : Key_Type) return Boolean;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type));
      type Reference_Type (Element : not null access Element_Type) is private
        with Implicit_Dereference => Element;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
    private
      type Reference_Type (Element : not null access Element_Type) is null record;
    end;
  private
    type Element_Access is access Element_Type;
    type Element_Holder is new Controlled with record
      Element : Element_Access;
    end record;
    procedure Adjust (Object : in out Element_Holder);
    procedure Finalize (Object : in out Element_Holder);
    function "=" (Left, Right : Element_Holder) return Boolean;
    function "<" (Left, Right : Element_Holder) return Boolean;
    package Implementation is new Ordered_Sets (Element_Holder, "<", "=");
    type Set is record
      Items : Implementation.Set;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : Set_Iterator) return Cursor;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Set_Iterator) return Cursor;
    function Previous (Object : Set_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    Empty_Set  : constant Set := (Items => Implementation.Empty_Set);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type (<>) is private;
    with function Hash (Element : Element_Type) return Hash_Type;
    with function Equivalent_Elements (Left, Right : Element_Type) return Boolean;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indefinite_Hashed_Sets is
    type Set is private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Set  : constant Set;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Set; Position : Cursor) return Boolean;
    package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Set_Iterator is new Set_Iterator_Interfaces.Forward_Iterator with private;
    function "=" (Left, Right : Set) return Boolean;
    function Equivalent_Sets (Left, Right : Set) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Set;
    function To_Set (New_Item : Element_Type) return Set;
    function Capacity (Container : Set) return Count_Type;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type);
    function Length (Container : Set) return Count_Type;
    function Is_Empty (Container : Set) return Boolean;
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Set; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set;
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean;
    function First (Container : Set) return Cursor;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor;
    procedure Next (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor;
    function Contains (Container : Set; Item : Element_Type) return Boolean;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type;
      with function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    package Generic_Keys is
      function Key (Position : Cursor) return Key_Type;
      function Element (Container : Set; Key : Key_Type) return Element_Type;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor;
      function Contains (Container : Set; Key : Key_Type) return Boolean;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type));
      type Reference_Type (Element : not null access Element_Type) is private
        with Implicit_Dereference => Element;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
    private
      type Reference_Type (Element : not null access Element_Type) is null record;
    end;
  private
    type Element_Access is access Element_Type;
    type Element_Holder is new Controlled with record
      Element : Element_Access;
    end record;
    procedure Adjust (Object : in out Element_Holder);
    procedure Finalize (Object : in out Element_Holder);
    function "=" (Left, Right : Element_Holder) return Boolean;
    function Hash_Holder (Item : Element_Holder) return Hash_Type;
    function Equivalent_Holders (Left, Right : Element_Holder) return Boolean;
    package Implementation is new Hashed_Sets (Element_Holder, Hash_Holder, Equivalent_Holders, "=");
    type Set is record
      Items : Implementation.Set;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Set_Iterator is new Set_Iterator_Interfaces.Forward_Iterator with record
      First_Item : Implementation.Cursor;
    end record;
    function First (Object : Set_Iterator) return Cursor;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    Empty_Set  : constant Set := (Items => Implementation.Empty_Set);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Index_Type is range <>;
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Vectors is
    subtype Extended_Index is Index_Type'Base range Index_Type'First - 1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
    No_Index : constant Extended_Index := Extended_Index'First;
    type Vector (Capacity : Count_Type) is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Vector : constant Vector;
    No_Element   : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean;
    package Vector_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Vector_Iterator is new Vector_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Vector) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean;
    function Maximum_Length return Count_Type;
    function Empty (Capacity : Count_Type := 10) return Vector;
    function To_Vector (Length : Count_Type) return Vector;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector;
    function "&" (Left, Right : Vector) return Vector;
    function "&" (Left : Vector; Right : Element_Type) return Vector;
    function "&" (Left : Element_Type; Right : Vector) return Vector;
    function "&" (Left, Right : Element_Type) return Vector;
    function Capacity (Container : Vector) return Count_Type;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type);
    function Length (Container : Vector) return Count_Type;
    procedure Set_Length (Container : in out Vector; Length : Count_Type);
    function Is_Empty (Container : Vector) return Boolean;
    procedure Clear (Container : in out Vector);
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor;
    function To_Index (Position : Cursor) return Extended_Index;
    function Element (Container : Vector; Index : Index_Type) return Element_Type;
    function Element (Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type);
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type));
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type));
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type;
    procedure Assign (Target : in out Vector; Source : Vector);
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector;
    procedure Move (Target : in out Vector; Source : in out Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector);
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor);
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector);
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector);
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor);
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append_Vector (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out Vector; New_Item : Element_Type);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1);
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1);
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1);
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1);
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1);
    procedure Reverse_Elements (Container : in out Vector);
    procedure Swap (Container : in out Vector; I, J : Index_Type);
    procedure Swap (Container : in out Vector; I, J : Cursor);
    function First_Index (Container : Vector) return Index_Type;
    function First (Container : Vector) return Cursor;
    function First_Element (Container : Vector) return Element_Type;
    function Last_Index (Container : Vector) return Extended_Index;
    function Last (Container : Vector) return Cursor;
    function Last_Element (Container : Vector) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Vector; Position : Cursor) return Cursor;
    procedure Next (Container : Vector; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Vector; Position : Cursor) return Cursor;
    procedure Previous (Container : Vector; Position : in out Cursor);
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Contains (Container : Vector; Item : Element_Type) return Boolean;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Vector) return Vector_Iterator;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      function Is_Sorted (Container : Vector) return Boolean;
      procedure Sort (Container : in out Vector);
      procedure Merge (Target : in out Vector; Source : in out Vector);
    end;
  private
    package Implementation is new Vectors (Index_Type, Element_Type, "=");
    type Vector (Capacity : Count_Type) is record
      Items : Implementation.Vector;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Vector_Iterator is new Vector_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : Vector_Iterator) return Cursor;
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Vector_Iterator) return Cursor;
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Vector : constant Vector := (Capacity => 0, Items => Implementation.Empty_Vector);
    No_Element   : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Doubly_Linked_Lists is
    type List (Capacity : Count_Type) is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_List : constant List;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : List; Position : Cursor) return Boolean;
    package List_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type List_Iterator is new List_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : List) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean;
    function Empty (Capacity : Count_Type := 10) return List;
    function Length (Container : List) return Count_Type;
    function Is_Empty (Container : List) return Boolean;
    procedure Clear (Container : in out List);
    function Element (Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type;
    procedure Assign (Target : in out List; Source : List);
    function Copy (Source : List; Capacity : Count_Type := 0) return List;
    procedure Move (Target : in out List; Source : in out List);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1);
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out List; New_Item : Element_Type);
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1);
    procedure Delete_First (Container : in out List; Count : Count_Type := 1);
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1);
    procedure Reverse_Elements (Container : in out List);
    procedure Swap (Container : in out List; I, J : Cursor);
    procedure Swap_Links (Container : in out List; I, J : Cursor);
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List);
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor);
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor);
    function First (Container : List) return Cursor;
    function First_Element (Container : List) return Element_Type;
    function Last (Container : List) return Cursor;
    function Last_Element (Container : List) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    function Previous (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    procedure Previous (Position : in out Cursor);
    function Next (Container : List; Position : Cursor) return Cursor;
    function Previous (Container : List; Position : Cursor) return Cursor;
    procedure Next (Container : List; Position : in out Cursor);
    procedure Previous (Container : List; Position : in out Cursor);
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor;
    function Contains (Container : List; Item : Element_Type) return Boolean;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : List) return List_Iterator;
    function Iterate (Container : List; Start : Cursor) return List_Iterator;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      function Is_Sorted (Container : List) return Boolean;
      procedure Sort (Container : in out List);
      procedure Merge (Target, Source : in out List);
    end;
  private
    package Implementation is new Doubly_Linked_Lists (Element_Type, "=");
    type List (Capacity : Count_Type) is record
      Items : Implementation.List;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type List_Iterator is new List_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : List_Iterator) return Cursor;
    function Next (Object : List_Iterator; Position : Cursor) return Cursor;
    function Last (Object : List_Iterator) return Cursor;
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_List : constant List := (Capacity => 0, Items => Implementation.Empty_List);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function "<" (Left, Right : Key_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Ordered_Maps is
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    type Map (Capacity : Count_Type) is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Map  : constant Map;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Map; Position : Cursor) return Boolean;
    package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Map) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Map;
    function Length (Container : Map) return Count_Type;
    function Is_Empty (Container : Map) return Boolean;
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type;
    function Key (Container : Map; Position : Cursor) return Key_Type;
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Map; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map;
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type);
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    procedure Delete_First (Container : in out Map);
    procedure Delete_Last (Container : in out Map);
    function First (Container : Map) return Cursor;
    function First_Element (Container : Map) return Element_Type;
    function First_Key (Container : Map) return Key_Type;
    function Last (Container : Map) return Cursor;
    function Last_Element (Container : Map) return Element_Type;
    function Last_Key (Container : Map) return Key_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor;
    procedure Next (Container : Map; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Map; Position : Cursor) return Cursor;
    procedure Previous (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor;
    function Element (Container : Map; Key : Key_Type) return Element_Type;
    function Floor (Container : Map; Key : Key_Type) return Cursor;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor;
    function Contains (Container : Map; Key : Key_Type) return Boolean;
    function "<" (Left, Right : Cursor) return Boolean;
    function ">" (Left, Right : Cursor) return Boolean;
    function "<" (Left : Cursor; Right : Key_Type) return Boolean;
    function ">" (Left : Cursor; Right : Key_Type) return Boolean;
    function "<" (Left : Key_Type; Right : Cursor) return Boolean;
    function ">" (Left : Key_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator;
  private
    package Implementation is new Ordered_Maps (Key_Type, Element_Type, "<", "=");
    type Map (Capacity : Count_Type) is record
      Items : Implementation.Map;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : Map_Iterator) return Cursor;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Map_Iterator) return Cursor;
    function Previous (Object : Map_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Map : constant Map := (Capacity => 0, Items => Implementation.Empty_Map);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function Hash (Key : Key_Type) return Hash_Type;
    with function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Hashed_Maps is
    type Map (Capacity : Count_Type; Modulus : Hash_Type) is private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Map  : constant Map;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Map; Position : Cursor) return Boolean;
    function Default_Modulus (Capacity : Count_Type) return Hash_Type;
    package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Map_Iterator is new Map_Iterator_Interfaces.Forward_Iterator with private;
    function "=" (Left, Right : Map) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Map;
    function Capacity (Container : Map) return Count_Type;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type);
    function Length (Container : Map) return Count_Type;
    function Is_Empty (Container : Map) return Boolean;
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type;
    function Key (Container : Map; Position : Cursor) return Key_Type;
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Map; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map; Capacity : Count_Type := 0; Modulus : Hash_Type := 0) return Map;
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type);
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    function First (Container : Map) return Cursor;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor;
    procedure Next (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor;
    function Element (Container : Map; Key : Key_Type) return Element_Type;
    function Contains (Container : Map; Key : Key_Type) return Boolean;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator;
  private
    package Implementation is new Hashed_Maps (Key_Type, Element_Type, Hash, Equivalent_Keys, "=");
    type Map (Capacity : Count_Type; Modulus : Hash_Type) is record
      Items : Implementation.Map;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Map_Iterator is new Map_Iterator_Interfaces.Forward_Iterator with record
      First_Item : Implementation.Cursor;
    end record;
    function First (Object : Map_Iterator) return Cursor;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Map : constant Map := (Capacity => 0, Modulus => 1, Items => Implementation.Empty_Map);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type is private;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Ordered_Sets is
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean;
    type Set (Capacity : Count_Type) is private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Set  : constant Set;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Set; Position : Cursor) return Boolean;
    package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with private;
    function "=" (Left, Right : Set) return Boolean;
    function Equivalent_Sets (Left, Right : Set) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Set;
    function To_Set (New_Item : Element_Type) return Set;
    function Length (Container : Set) return Count_Type;
    function Is_Empty (Container : Set) return Boolean;
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Set; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set;
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Delete_First (Container : in out Set);
    procedure Delete_Last (Container : in out Set);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean;
    function First (Container : Set) return Cursor;
    function First_Element (Container : Set) return Element_Type;
    function Last (Container : Set) return Cursor;
    function Last_Element (Container : Set) return Element_Type;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor;
    procedure Next (Container : Set; Position : in out Cursor);
    function Previous (Position : Cursor) return Cursor;
    procedure Previous (Position : in out Cursor);
    function Previous (Container : Set; Position : Cursor) return Cursor;
    procedure Previous (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor;
    function Floor (Container : Set; Item : Element_Type) return Cursor;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor;
    function Contains (Container : Set; Item : Element_Type) return Boolean;
    function "<" (Left, Right : Cursor) return Boolean;
    function ">" (Left, Right : Cursor) return Boolean;
    function "<" (Left : Cursor; Right : Element_Type) return Boolean;
    function ">" (Left : Cursor; Right : Element_Type) return Boolean;
    function "<" (Left : Element_Type; Right : Cursor) return Boolean;
    function ">" (Left : Element_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function "<" (Left, Right : Key_Type) return Boolean is <>;
    package Generic_Keys is
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
      function Key (Position : Cursor) return Key_Type;
      function Element (Container : Set; Key : Key_Type) return Element_Type;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor;
      function Floor (Container : Set; Key : Key_Type) return Cursor;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor;
      function Contains (Container : Set; Key : Key_Type) return Boolean;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type));
      type Reference_Type (Element : not null access Element_Type) is private
        with Implicit_Dereference => Element;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
    private
      type Reference_Type (Element : not null access Element_Type) is null record;
    end;
  private
    package Implementation is new Ordered_Sets (Element_Type, "<", "=");
    type Set (Capacity : Count_Type) is record
      Items : Implementation.Set;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with record
      First_Item : Implementation.Cursor;
      Last_Item  : Implementation.Cursor;
    end record;
    function First (Object : Set_Iterator) return Cursor;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor;
    function Last (Object : Set_Iterator) return Cursor;
    function Previous (Object : Set_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    Empty_Set : constant Set := (Capacity => 0, Items => Implementation.Empty_Set);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type is private;
    with function Hash (Element : Element_Type) return Hash_Type;
    with function Equivalent_Elements (Left, Right : Element_Type) return Boolean;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Hashed_Sets is
    type Set (Capacity : Count_Type; Modulus : Hash_Type) is private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    type Cursor is private;
    Empty_Set  : constant Set;
    No_Element : constant Cursor;
    function Has_Element (Position : Cursor) return Boolean;
    function Has_Element (Container : Set; Position : Cursor) return Boolean;
    function Default_Modulus (Capacity : Count_Type) return Hash_Type;
    package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
    type Set_Iterator is new Set_Iterator_Interfaces.Forward_Iterator with private;
    function "=" (Left, Right : Set) return Boolean;
    function Equivalent_Sets (Left, Right : Set) return Boolean;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
    function Empty (Capacity : Count_Type := 10) return Set;
    function To_Set (New_Item : Element_Type) return Set;
    function Capacity (Container : Set) return Count_Type;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type);
    function Length (Container : Set) return Count_Type;
    function Is_Empty (Container : Set) return Boolean;
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type;
    function Element (Container : Set; Position : Cursor) return Element_Type;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set; Capacity : Count_Type := 0; Modulus : Hash_Type := 0) return Set;
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean;
    function First (Container : Set) return Cursor;
    function Next (Position : Cursor) return Cursor;
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor;
    procedure Next (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor;
    function Contains (Container : Set; Item : Element_Type) return Boolean;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type;
      with function Equivalent_Keys (Left, Right : Key_Type) return Boolean;
    package Generic_Keys is
      function Key (Position : Cursor) return Key_Type;
      function Element (Container : Set; Key : Key_Type) return Element_Type;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor;
      function Contains (Container : Set; Key : Key_Type) return Boolean;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type));
      type Reference_Type (Element : not null access Element_Type) is private
        with Implicit_Dereference => Element;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
    private
      type Reference_Type (Element : not null access Element_Type) is null record;
    end;
  private
    package Implementation is new Hashed_Sets (Element_Type, Hash, Equivalent_Elements, "=");
    type Set (Capacity : Count_Type; Modulus : Hash_Type) is record
      Items : Implementation.Set;
    end record;
    type Cursor is record
      Item : Implementation.Cursor;
    end record;
    type Set_Iterator is new Set_Iterator_Interfaces.Forward_Iterator with record
      First_Item : Implementation.Cursor;
    end record;
    function First (Object : Set_Iterator) return Cursor;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    Empty_Set : constant Set := (Capacity => 0, Modulus => 1, Items => Implementation.Empty_Set);
    No_Element : constant Cursor := (Item => Implementation.No_Element);
  end;
  generic
    type Element_Type (<>) is private;
    Max_Element_Size_in_Storage_Elements : Count_Type;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Bounded_Indefinite_Holders is
    type Holder is private;
    Empty_Holder : constant Holder;
    function "=" (Left, Right : Holder) return Boolean;
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean;
    function Empty return Holder;
    function To_Holder (New_Item : Element_Type) return Holder;
    function Is_Empty (Container : Holder) return Boolean;
    procedure Clear (Container : in out Holder);
    function Element (Container : Holder) return Element_Type;
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type);
    procedure Query_Element (Container : Holder;
                             Process   : not null access procedure (Element : Element_Type));
    procedure Update_Element (Container : in out Holder;
                              Process   : not null access procedure (Element : in out Element_Type));
    type Constant_Reference_Type (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;
    type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type;
    function Reference (Container : in out Holder) return Reference_Type;
    procedure Assign (Target : in out Holder; Source : Holder);
    function Copy (Source : Holder) return Holder;
    procedure Move (Target : in out Holder; Source : in out Holder);
    procedure Swap (Left, Right : in out Holder);
  private
    package Implementation is new Indefinite_Holders (Element_Type, "=");
    type Holder is record
      Items : Implementation.Holder;
    end record;
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Holder : constant Holder := (Items => Implementation.Empty_Holder);
  end;
end;
with Unchecked_Deallocation;
package body Ada.Containers is
  procedure Generic_Array_Sort (Container : in out Array_Type) is
    Count : constant Integer := Container'Length;
    function Index_Of (Position : Integer) return Index_Type is
      begin
        return Index_Type'Val (Index_Type'Pos (Container'First) + Position - 1);
      end;
    procedure Exchange (Left, Right : Integer) is
      Held : constant Element_Type := Container (Index_Of (Left));
      begin
        Container (Index_Of (Left)) := Container (Index_Of (Right));
        Container (Index_Of (Right)) := Held;
      end;
    function Precedes (Left, Right : Integer) return Boolean is
      begin
        return Container (Index_Of (Left)) < Container (Index_Of (Right));
      end;
    procedure Sift (Root, Size : Integer) is
      Parent : Integer := Root;
      Child  : Integer;
      begin
        loop
          Child := 2 * Parent;
          exit when Child > Size;
          if Child < Size and then Precedes (Child, Child + 1) then
            Child := Child + 1;
          end if;
          exit when not Precedes (Parent, Child);
          Exchange (Parent, Child);
          Parent := Child;
        end loop;
      end;
    begin
      for Root in reverse 1 .. Count / 2 loop
        Sift (Root, Count);
      end loop;
      for Size in reverse 2 .. Count loop
        Exchange (1, Size);
        Sift (1, Size - 1);
      end loop;
    end;
  procedure Generic_Constrained_Array_Sort (Container : in out Array_Type) is
    type Open_Array is array (Index_Type range <>) of Element_Type;
    procedure Sort is new Generic_Array_Sort (Index_Type, Element_Type, Open_Array, "<");
    Work : Open_Array (Container'Range);
    begin
      for I in Container'Range loop
        Work (I) := Container (I);
      end loop;
      Sort (Work);
      for I in Container'Range loop
        Container (I) := Work (I);
      end loop;
    end;
  procedure Generic_Sort (First, Last : Index_Type'Base) is
    function Index_Of (Position : Integer) return Index_Type is
      begin
        return Index_Type'Val (Index_Type'Pos (First) + Position - 1);
      end;
    procedure Sift (Root, Size : Integer) is
      Parent : Integer := Root;
      Child  : Integer;
      begin
        loop
          Child := 2 * Parent;
          exit when Child > Size;
          if Child < Size and then Before (Index_Of (Child), Index_Of (Child + 1)) then
            Child := Child + 1;
          end if;
          exit when not Before (Index_Of (Parent), Index_Of (Child));
          Swap (Index_Of (Parent), Index_Of (Child));
          Parent := Child;
        end loop;
      end;
    Count : Integer;
    begin
      if Last < First then
        return;
      end if;
      Count := Index_Type'Pos (Last) - Index_Type'Pos (First) + 1;
      for Root in reverse 1 .. Count / 2 loop
        Sift (Root, Count);
      end loop;
      for Size in reverse 2 .. Count loop
        Swap (Index_Of (1), Index_Of (Size));
        Sift (1, Size - 1);
      end loop;
    end;
  generic
    type Node_Type is limited private;
    type Node_Access is access Node_Type;
    with function Parent (Node : Node_Access) return Node_Access;
    with function Left (Node : Node_Access) return Node_Access;
    with function Right (Node : Node_Access) return Node_Access;
    with function Height (Node : Node_Access) return Integer;
    with procedure Set_Parent (Node : Node_Access; To : Node_Access);
    with procedure Set_Left (Node : Node_Access; To : Node_Access);
    with procedure Set_Right (Node : Node_Access; To : Node_Access);
    with procedure Set_Height (Node : Node_Access; To : Integer);
  package Balanced_Trees is
    function Leftmost (Node : Node_Access) return Node_Access;
    function Rightmost (Node : Node_Access) return Node_Access;
    function Next (Node : Node_Access) return Node_Access;
    function Previous (Node : Node_Access) return Node_Access;
    procedure Attach (Root : in out Node_Access; Node, Above : Node_Access; To_Left : Boolean);
    procedure Detach (Root : in out Node_Access; Node : Node_Access);
  end;
  package body Balanced_Trees is
    function Tall (Node : Node_Access) return Integer is
      begin
        if Node = null then
          return 0;
        end if;
        return Height (Node);
      end;
    procedure Measure (Node : Node_Access) is
      begin
        Set_Height (Node, 1 + Integer'Max (Tall (Left (Node)), Tall (Right (Node))));
      end;
    procedure Replace_Child (Root : in out Node_Access; Above, Old_Child, New_Child : Node_Access) is
      begin
        if Above = null then
          Root := New_Child;
        elsif Left (Above) = Old_Child then
          Set_Left (Above, New_Child);
        else
          Set_Right (Above, New_Child);
        end if;
        if New_Child /= null then
          Set_Parent (New_Child, Above);
        end if;
      end;
    procedure Rotate_Left (Root : in out Node_Access; Node : Node_Access) is
      Pivot : constant Node_Access := Right (Node);
      begin
        Set_Right (Node, Left (Pivot));
        if Left (Pivot) /= null then
          Set_Parent (Left (Pivot), Node);
        end if;
        Replace_Child (Root, Parent (Node), Node, Pivot);
        Set_Left (Pivot, Node);
        Set_Parent (Node, Pivot);
        Measure (Node);
        Measure (Pivot);
      end;
    procedure Rotate_Right (Root : in out Node_Access; Node : Node_Access) is
      Pivot : constant Node_Access := Left (Node);
      begin
        Set_Left (Node, Right (Pivot));
        if Right (Pivot) /= null then
          Set_Parent (Right (Pivot), Node);
        end if;
        Replace_Child (Root, Parent (Node), Node, Pivot);
        Set_Right (Pivot, Node);
        Set_Parent (Node, Pivot);
        Measure (Node);
        Measure (Pivot);
      end;
    procedure Rebalance (Root : in out Node_Access; From : Node_Access) is
      Node    : Node_Access := From;
      Balance : Integer;
      begin
        while Node /= null loop
          Measure (Node);
          Balance := Tall (Left (Node)) - Tall (Right (Node));
          if Balance > 1 then
            if Tall (Left (Left (Node))) < Tall (Right (Left (Node))) then
              Rotate_Left (Root, Left (Node));
            end if;
            Rotate_Right (Root, Node);
            Node := Parent (Node);
          elsif Balance < -1 then
            if Tall (Right (Right (Node))) < Tall (Left (Right (Node))) then
              Rotate_Right (Root, Right (Node));
            end if;
            Rotate_Left (Root, Node);
            Node := Parent (Node);
          end if;
          Node := Parent (Node);
        end loop;
      end;
    function Leftmost (Node : Node_Access) return Node_Access is
      Result : Node_Access := Node;
      begin
        if Result = null then
          return null;
        end if;
        while Left (Result) /= null loop
          Result := Left (Result);
        end loop;
        return Result;
      end;
    function Rightmost (Node : Node_Access) return Node_Access is
      Result : Node_Access := Node;
      begin
        if Result = null then
          return null;
        end if;
        while Right (Result) /= null loop
          Result := Right (Result);
        end loop;
        return Result;
      end;
    function Next (Node : Node_Access) return Node_Access is
      Child : Node_Access := Node;
      Above : Node_Access;
      begin
        if Right (Node) /= null then
          return Leftmost (Right (Node));
        end if;
        Above := Parent (Node);
        while Above /= null and then Right (Above) = Child loop
          Child := Above;
          Above := Parent (Above);
        end loop;
        return Above;
      end;
    function Previous (Node : Node_Access) return Node_Access is
      Child : Node_Access := Node;
      Above : Node_Access;
      begin
        if Left (Node) /= null then
          return Rightmost (Left (Node));
        end if;
        Above := Parent (Node);
        while Above /= null and then Left (Above) = Child loop
          Child := Above;
          Above := Parent (Above);
        end loop;
        return Above;
      end;
    procedure Attach (Root : in out Node_Access; Node, Above : Node_Access; To_Left : Boolean) is
      begin
        Set_Parent (Node, Above);
        Set_Left (Node, null);
        Set_Right (Node, null);
        Set_Height (Node, 1);
        if Above = null then
          Root := Node;
        elsif To_Left then
          Set_Left (Above, Node);
        else
          Set_Right (Above, Node);
        end if;
        Rebalance (Root, Above);
      end;
    procedure Detach (Root : in out Node_Access; Node : Node_Access) is
      Above : constant Node_Access := Parent (Node);
      Heir  : Node_Access;
      Start : Node_Access;
      begin
        if Left (Node) /= null and then Right (Node) /= null then
          Heir := Leftmost (Right (Node));
          if Parent (Heir) /= Node then
            Start := Parent (Heir);
            Set_Left (Start, Right (Heir));
            if Right (Heir) /= null then
              Set_Parent (Right (Heir), Start);
            end if;
            Set_Right (Heir, Right (Node));
            Set_Parent (Right (Node), Heir);
          else
            Start := Heir;
          end if;
          Set_Left (Heir, Left (Node));
          Set_Parent (Left (Node), Heir);
          Replace_Child (Root, Above, Node, Heir);
          Set_Height (Heir, Height (Node));
          Rebalance (Root, Start);
        else
          if Left (Node) /= null then
            Replace_Child (Root, Above, Node, Left (Node));
          else
            Replace_Child (Root, Above, Node, Right (Node));
          end if;
          Rebalance (Root, Above);
        end if;
        Set_Parent (Node, null);
        Set_Left (Node, null);
        Set_Right (Node, null);
        Set_Height (Node, 1);
      end;
  end;
  package body Vectors is
    procedure Free is new Unchecked_Deallocation (Elements_Array, Elements_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    function Last_Of (Container : Vector) return Extended_Index is
      begin
        if Container.Data = null then
          return No_Index;
        end if;
        return Container.Data.Last;
      end;
    function Index_After (Count : Count_Type) return Extended_Index is
      begin
        return Index_Type'Base (Count_Type'Pos (Count) + Index_Type'Pos (No_Index));
      end;
    function Count_Before (Index : Extended_Index) return Count_Type is
      begin
        return Count_Type (Index_Type'Pos (Index) - Index_Type'Pos (No_Index));
      end;
    procedure Check_Cursors (Container : Vector) is
      begin
        if Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0) then
          raise Program_Error;
        end if;
      end;
    procedure Check_Elements (Container : Vector) is
      begin
        if Container.Data /= null and then Container.Data.Lock > 0 then
          raise Program_Error;
        end if;
      end;
    procedure Adjust (Container : in out Vector) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Last >= Index_Type'First then
          Container.Data := new Shared;
          Container.Data.Elements := new Elements_Array'(Source.Elements (Index_Type'First .. Source.Last));
          Container.Data.Last := Source.Last;
        end if;
      end;
    procedure Finalize (Container : in out Vector) is
      begin
        if Container.Data /= null then
          Free (Container.Data.Elements);
          Free (Container.Data);
        end if;
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Position.Data /= null and then Position.Index in Index_Type'First .. Position.Data.Last;
      end;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean is
      begin
        return Has_Element (Position) and then Position.Data = Container.Data;
      end;
    function "=" (Left, Right : Vector) return Boolean is
      Last : constant Extended_Index := Last_Of (Left);
      begin
        if Last /= Last_Of (Right) then
          return False;
        end if;
        for I in Index_Type'First .. Last loop
          if not (Left.Data.Elements (I) = Right.Data.Elements (I)) then
            return False;
          end if;
        end loop;
        return True;
      end;
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean is
      begin
        return Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0);
      end;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean is
      begin
        return Container.Data /= null and then Container.Data.Lock > 0;
      end;
    function Maximum_Length return Count_Type is
      begin
        if Index_Type'Pos (Index_Type'Last) - Index_Type'Pos (Index_Type'First) >= Count_Type'Pos (Count_Type'Last) then
          return Count_Type'Last;
        end if;
        return Count_Type (Index_Type'Pos (Index_Type'Last) - Index_Type'Pos (Index_Type'First) + 1);
      end;
    function Capacity (Container : Vector) return Count_Type is
      begin
        if Container.Data = null or else Container.Data.Elements = null then
          return 0;
        end if;
        return Container.Data.Elements'Length;
      end;
    procedure Grow (Container : in out Vector; Wanted : Count_Type) is
      Grown : Elements_Access;
      Size  : Count_Type := Capacity (Container);
      Last  : constant Extended_Index := Last_Of (Container);
      begin
        if Wanted <= Size then
          return;
        end if;
        if Wanted > Maximum_Length then
          raise Constraint_Error;
        end if;
        if Size < Maximum_Length / 2 then
          Size := Count_Type'Max (Wanted, Count_Type'Max (2 * Size, 4));
        else
          Size := Maximum_Length;
        end if;
        Grown := new Elements_Array (Index_Type'First .. Index_After (Size));
        if Container.Data = null then
          Container.Data := new Shared;
        elsif Container.Data.Elements /= null then
          Grown (Index_Type'First .. Last) := Container.Data.Elements (Index_Type'First .. Last);
          Free (Container.Data.Elements);
        end if;
        Container.Data.Elements := Grown;
      end;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) is
      begin
        if Capacity > Vectors.Capacity (Container) then
          Check_Cursors (Container);
          Grow (Container, Capacity);
        end if;
      end;
    function Empty (Capacity : Count_Type := 10) return Vector is
      Result : Vector;
      begin
        Reserve_Capacity (Result, Capacity);
        return Result;
      end;
    function Length (Container : Vector) return Count_Type is
      begin
        return Count_Before (Last_Of (Container));
      end;
    function Is_Empty (Container : Vector) return Boolean is
      begin
        return Last_Of (Container) = No_Index;
      end;
    procedure Clear (Container : in out Vector) is
      begin
        Check_Cursors (Container);
        if Container.Data /= null then
          Container.Data.Last := No_Index;
        end if;
      end;
    procedure Set_Length (Container : in out Vector; Length : Count_Type) is
      begin
        Check_Cursors (Container);
        Grow (Container, Length);
        if Container.Data /= null then
          Container.Data.Last := Index_After (Length);
        end if;
      end;
    function To_Vector (Length : Count_Type) return Vector is
      Result : Vector;
      begin
        Set_Length (Result, Length);
        return Result;
      end;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector is
      Result : Vector;
      begin
        Append (Result, New_Item, Length);
        return Result;
      end;
    function "&" (Left, Right : Vector) return Vector is
      Result : Vector;
      begin
        Reserve_Capacity (Result, Length (Left) + Length (Right));
        Append_Vector (Result, Left);
        Append_Vector (Result, Right);
        return Result;
      end;
    function "&" (Left : Vector; Right : Element_Type) return Vector is
      Result : Vector;
      begin
        Reserve_Capacity (Result, Length (Left) + 1);
        Append_Vector (Result, Left);
        Append (Result, Right);
        return Result;
      end;
    function "&" (Left : Element_Type; Right : Vector) return Vector is
      Result : Vector;
      begin
        Reserve_Capacity (Result, Length (Right) + 1);
        Append (Result, Left);
        Append_Vector (Result, Right);
        return Result;
      end;
    function "&" (Left, Right : Element_Type) return Vector is
      Result : Vector;
      begin
        Reserve_Capacity (Result, 2);
        Append (Result, Left);
        Append (Result, Right);
        return Result;
      end;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor is
      begin
        if Index not in Index_Type'First .. Last_Of (Container) then
          return No_Element;
        end if;
        return (Container.Data, Index);
      end;
    function To_Index (Position : Cursor) return Extended_Index is
      begin
        if not Has_Element (Position) then
          return No_Index;
        end if;
        return Position.Index;
      end;
    procedure Check_Index (Container : Vector; Index : Index_Type) is
      begin
        if Index > Last_Of (Container) then
          raise Constraint_Error;
        end if;
      end;
    procedure Check_Position (Container : Vector; Position : Cursor) is
      begin
        if Position.Data = null then
          raise Constraint_Error;
        end if;
        if Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        if Position.Index > Position.Data.Last then
          raise Constraint_Error;
        end if;
      end;
    function Element (Container : Vector; Index : Index_Type) return Element_Type is
      begin
        Check_Index (Container, Index);
        return Container.Data.Elements (Index);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        if not Has_Element (Position) then
          raise Constraint_Error;
        end if;
        return Position.Data.Elements (Position.Index);
      end;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) is
      begin
        Check_Index (Container, Index);
        Check_Elements (Container);
        Container.Data.Elements (Index) := New_Item;
      end;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) is
      begin
        Check_Position (Container, Position);
        Replace_Element (Container, Position.Index, New_Item);
      end;
    procedure Query (Data    : Shared_Access;
                     Index   : Index_Type;
                     Process : not null access procedure (Element : Element_Type)) is
      begin
        Data.Lock := Data.Lock + 1;
        begin
          Process (Data.Elements (Index));
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type)) is
      begin
        Check_Index (Container, Index);
        Query (Container.Data, Index, Process);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      begin
        if not Has_Element (Position) then
          raise Constraint_Error;
        end if;
        Query (Position.Data, Position.Index, Process);
      end;
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      Data : Shared_Access;
      begin
        Check_Index (Container, Index);
        Data := Container.Data;
        Data.Lock := Data.Lock + 1;
        begin
          Process (Data.Elements (Index));
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      begin
        Check_Position (Container, Position);
        Update_Element (Container, Position.Index, Process);
      end;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type is
      begin
        Check_Index (Container, Index);
        return (Element => Container.Data.Elements (Index)'Access);
      end;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type is
      begin
        Check_Index (Container, Index);
        return (Element => Container.Data.Elements (Index)'Access);
      end;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type is
      begin
        Check_Position (Container, Position);
        return Constant_Reference (Container, Position.Index);
      end;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type is
      begin
        Check_Position (Container, Position);
        return Reference (Container, Position.Index);
      end;
    procedure Assign (Target : in out Vector; Source : Vector) is
      Last : constant Extended_Index := Last_Of (Source);
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Clear (Target);
        Grow (Target, Length (Source));
        if Last >= Index_Type'First then
          Target.Data.Elements (Index_Type'First .. Last) := Source.Data.Elements (Index_Type'First .. Last);
          Target.Data.Last := Last;
        end if;
      end;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector is
      Result : Vector;
      begin
        if Capacity /= 0 and then Capacity < Length (Source) then
          raise Capacity_Error;
        end if;
        Reserve_Capacity (Result, Count_Type'Max (Capacity, Length (Source)));
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out Vector; Source : in out Vector) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Cursors (Target);
        Check_Cursors (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Open_Space (Container : in out Vector; Before : Extended_Index; Count : Count_Type) is
      Last : constant Extended_Index := Last_Of (Container);
      begin
        if Before not in Index_Type'First .. Last + 1 then
          raise Constraint_Error;
        end if;
        Check_Cursors (Container);
        if Count = 0 then
          return;
        end if;
        if Length (Container) > Maximum_Length - Count then
          raise Constraint_Error;
        end if;
        Grow (Container, Length (Container) + Count);
        declare
          Shift : constant Index_Type'Base := Index_After (Count) - No_Index;
          Elements : Elements_Access renames Container.Data.Elements;
          begin
            Elements (Before + Shift .. Last + Shift) := Elements (Before .. Last);
            Container.Data.Last := Last + Shift;
          end;
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      Source : constant Vector := New_Item;
      Count  : constant Count_Type := Length (Source);
      begin
        Open_Space (Container, Before, Count);
        if Count > 0 then
          Container.Data.Elements (Before .. Before + (Index_After (Count) - Index_Type'First)) :=
            Source.Data.Elements (Index_Type'First .. Source.Data.Last);
        end if;
      end;
    function Before_Index (Container : Vector; Before : Cursor) return Extended_Index is
      begin
        if Before.Data = null then
          return Last_Of (Container) + 1;
        end if;
        if Before.Data /= Container.Data then
          raise Program_Error;
        end if;
        if Before.Index > Container.Data.Last then
          return Container.Data.Last + 1;
        end if;
        return Before.Index;
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        Insert_Vector (Container, Before_Index (Container, Before), New_Item);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      Index : constant Extended_Index := Before_Index (Container, Before);
      begin
        Insert_Vector (Container, Index, New_Item);
        if Is_Empty (New_Item) then
          Position := Before;
        else
          Position := (Container.Data, Index);
        end if;
      end;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      begin
        Insert_Vector (Container, Before, New_Item);
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        Insert_Vector (Container, Before, New_Item);
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      begin
        Insert_Vector (Container, Before, New_Item, Position);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      Item : constant Element_Type := New_Item;
      begin
        Open_Space (Container, Before, Count);
        for I in 0 .. Count_Type'Pos (Count) - 1 loop
          Container.Data.Elements (Index_Type'Val (Index_Type'Pos (Before) + I)) := Item;
        end loop;
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        Insert (Container, Before_Index (Container, Before), New_Item, Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      Index : constant Extended_Index := Before_Index (Container, Before);
      begin
        Insert (Container, Index, New_Item, Count);
        if Count = 0 then
          Position := Before;
        else
          Position := (Container.Data, Index);
        end if;
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1) is
      Item : Element_Type;
      begin
        Open_Space (Container, Before, Count);
        for I in 0 .. Count_Type'Pos (Count) - 1 loop
          Container.Data.Elements (Index_Type'Val (Index_Type'Pos (Before) + I)) := Item;
        end loop;
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      Index : constant Extended_Index := Before_Index (Container, Before);
      begin
        Insert (Container, Index, Count);
        if Count = 0 then
          Position := Before;
        else
          Position := (Container.Data, Index);
        end if;
      end;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        Insert_Vector (Container, Index_Type'First, New_Item);
      end;
    procedure Prepend (Container : in out Vector; New_Item : Vector) is
      begin
        Insert_Vector (Container, Index_Type'First, New_Item);
      end;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        Insert (Container, Index_Type'First, New_Item, Count);
      end;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        Insert_Vector (Container, Last_Of (Container) + 1, New_Item);
      end;
    procedure Append (Container : in out Vector; New_Item : Vector) is
      begin
        Insert_Vector (Container, Last_Of (Container) + 1, New_Item);
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) is
      begin
        Insert (Container, Last_Of (Container) + 1, New_Item, Count);
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type) is
      Last : constant Extended_Index := Last_Of (Container);
      begin
        Check_Cursors (Container);
        if Container.Data = null or else Container.Data.Elements = null or else Last = Container.Data.Elements'Last then
          declare
            Item : constant Element_Type := New_Item;
            begin
              Grow (Container, Length (Container) + 1);
              Container.Data.Elements (Last + 1) := Item;
            end;
        else
          Container.Data.Elements (Last + 1) := New_Item;
        end if;
        Container.Data.Last := Last + 1;
      end;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1) is
      begin
        Open_Space (Container, Before, Count);
      end;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1) is
      Index : constant Extended_Index := Before_Index (Container, Before);
      begin
        Open_Space (Container, Index, Count);
        if Count = 0 then
          Position := Before;
        else
          Position := (Container.Data, Index);
        end if;
      end;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) is
      Last : constant Extended_Index := Last_Of (Container);
      begin
        if Index not in Index_Type'First .. Last + 1 then
          raise Constraint_Error;
        end if;
        if Count = 0 or else Index > Last then
          return;
        end if;
        Check_Cursors (Container);
        if Count >= Count_Before (Last) - Count_Before (Index - 1) then
          Container.Data.Last := Index - 1;
          return;
        end if;
        declare
          Shift : constant Index_Type'Base := Index_After (Count) - No_Index;
          Elements : Elements_Access renames Container.Data.Elements;
          begin
            Elements (Index .. Last - Shift) := Elements (Index + Shift .. Last);
            Container.Data.Last := Last - Shift;
          end;
      end;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        Check_Position (Container, Position);
        Delete (Container, Position.Index, Count);
        Position := No_Element;
      end;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) is
      begin
        if Count >= Length (Container) then
          Clear (Container);
        elsif Count > 0 then
          Delete (Container, Index_Type'First, Count);
        end if;
      end;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) is
      begin
        if Count >= Length (Container) then
          Clear (Container);
        elsif Count > 0 then
          Check_Cursors (Container);
          Container.Data.Last := Index_After (Length (Container) - Count);
        end if;
      end;
    procedure Reverse_Elements (Container : in out Vector) is
      Low  : Extended_Index := Index_Type'First;
      High : Extended_Index := Last_Of (Container);
      begin
        Check_Elements (Container);
        while Low < High loop
          declare
            Held : constant Element_Type := Container.Data.Elements (Low);
            begin
              Container.Data.Elements (Low) := Container.Data.Elements (High);
              Container.Data.Elements (High) := Held;
            end;
          Low := Low + 1;
          High := High - 1;
        end loop;
      end;
    procedure Swap (Container : in out Vector; I, J : Index_Type) is
      begin
        Check_Index (Container, I);
        Check_Index (Container, J);
        Check_Elements (Container);
        if I /= J then
          declare
            Held : constant Element_Type := Container.Data.Elements (I);
            begin
              Container.Data.Elements (I) := Container.Data.Elements (J);
              Container.Data.Elements (J) := Held;
            end;
        end if;
      end;
    procedure Swap (Container : in out Vector; I, J : Cursor) is
      begin
        Check_Position (Container, I);
        Check_Position (Container, J);
        Swap (Container, I.Index, J.Index);
      end;
    function First_Index (Container : Vector) return Index_Type is
      begin
        return Index_Type'First;
      end;
    function First (Container : Vector) return Cursor is
      begin
        return To_Cursor (Container, Index_Type'First);
      end;
    function First_Element (Container : Vector) return Element_Type is
      begin
        return Element (Container, Index_Type'First);
      end;
    function Last_Index (Container : Vector) return Extended_Index is
      begin
        return Last_Of (Container);
      end;
    function Last (Container : Vector) return Cursor is
      begin
        return To_Cursor (Container, Last_Of (Container));
      end;
    function Last_Element (Container : Vector) return Element_Type is
      Last : constant Extended_Index := Last_Of (Container);
      begin
        if Last = No_Index then
          raise Constraint_Error;
        end if;
        return Container.Data.Elements (Last);
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        if not Has_Element (Position) or else Position.Index >= Position.Data.Last then
          return No_Element;
        end if;
        return (Position.Data, Position.Index + 1);
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Position := Next (Position);
      end;
    function Next (Container : Vector; Position : Cursor) return Cursor is
      begin
        if Position.Data /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    procedure Next (Container : Vector; Position : in out Cursor) is
      begin
        Position := Next (Container, Position);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        if not Has_Element (Position) or else Position.Index <= Index_Type'First then
          return No_Element;
        end if;
        return (Position.Data, Position.Index - 1);
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Position := Previous (Position);
      end;
    function Previous (Container : Vector; Position : Cursor) return Cursor is
      begin
        if Position.Data /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    procedure Previous (Container : Vector; Position : in out Cursor) is
      begin
        Position := Previous (Container, Position);
      end;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index is
      begin
        for I in Index .. Last_Of (Container) loop
          if Container.Data.Elements (I) = Item then
            return I;
          end if;
        end loop;
        return No_Index;
      end;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      Start : Index_Type := Index_Type'First;
      begin
        if Position.Data /= null then
          Check_Position (Container, Position);
          Start := Position.Index;
        end if;
        return To_Cursor (Container, Find_Index (Container, Item, Start));
      end;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index is
      begin
        for I in reverse Index_Type'First .. Extended_Index'Min (Index, Last_Of (Container)) loop
          if Container.Data.Elements (I) = Item then
            return I;
          end if;
        end loop;
        return No_Index;
      end;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      Start : Index_Type := Index_Type'Last;
      begin
        if Position.Data /= null then
          Check_Position (Container, Position);
          Start := Position.Index;
        end if;
        return To_Cursor (Container, Reverse_Find_Index (Container, Item, Start));
      end;
    function Contains (Container : Vector; Item : Element_Type) return Boolean is
      begin
        return Find_Index (Container, Item) /= No_Index;
      end;
    procedure Walk (Container : Vector;
                    Process   : not null access procedure (Position : Cursor);
                    Backward  : Boolean) is
      Data  : constant Shared_Access := Container.Data;
      Index : Extended_Index;
      begin
        if Data = null then
          return;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          if Backward then
            Index := Data.Last;
            while Index >= Index_Type'First loop
              Process ((Data, Index));
              Index := Index - 1;
            end loop;
          else
            Index := Index_Type'First;
            while Index <= Data.Last loop
              Process ((Data, Index));
              Index := Index + 1;
            end loop;
          end if;
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, False);
      end;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, True);
      end;
    function Iterate (Container : Vector) return Vector_Iterator is
      begin
        return (Data => Container.Data, Start => No_Index);
      end;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator is
      begin
        if Start.Data = null then
          raise Constraint_Error;
        end if;
        Check_Position (Container, Start);
        return (Data => Container.Data, Start => Start.Index);
      end;
    function First (Object : Vector_Iterator) return Cursor is
      begin
        if Object.Data = null or else Object.Data.Last < Index_Type'First then
          return No_Element;
        end if;
        if Object.Start /= No_Index then
          return (Object.Data, Object.Start);
        end if;
        return (Object.Data, Index_Type'First);
      end;
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Data /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    function Last (Object : Vector_Iterator) return Cursor is
      begin
        if Object.Data = null or else Object.Data.Last < Index_Type'First then
          return No_Element;
        end if;
        if Object.Start /= No_Index then
          return (Object.Data, Object.Start);
        end if;
        return (Object.Data, Object.Data.Last);
      end;
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Data /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    package body Generic_Sorting is
      function Is_Sorted (Container : Vector) return Boolean is
        begin
          for I in Index_Type'First .. Last_Of (Container) - 1 loop
            if Container.Data.Elements (I + 1) < Container.Data.Elements (I) then
              return False;
            end if;
          end loop;
          return True;
        end;
      procedure Sort (Container : in out Vector) is
        procedure Sort_Slice is new Generic_Array_Sort (Index_Type, Element_Type, Elements_Array, "<");
        Last : constant Extended_Index := Last_Of (Container);
        begin
          Check_Cursors (Container);
          if Last > Index_Type'First then
            Sort_Slice (Container.Data.Elements (Index_Type'First .. Last));
          end if;
        end;
      procedure Merge (Target : in out Vector; Source : in out Vector) is
        Result : Vector;
        I      : Extended_Index := Index_Type'First;
        J      : Extended_Index := Index_Type'First;
        Left   : constant Extended_Index := Last_Of (Target);
        Right  : constant Extended_Index := Last_Of (Source);
        begin
          if Target.Data = Source.Data then
            return;
          end if;
          Check_Cursors (Target);
          Check_Cursors (Source);
          Reserve_Capacity (Result, Length (Target) + Length (Source));
          while I <= Left or else J <= Right loop
            if J > Right or else (I <= Left and then not (Source.Data.Elements (J) < Target.Data.Elements (I))) then
              Append (Result, Target.Data.Elements (I));
              I := I + 1;
            else
              Append (Result, Source.Data.Elements (J));
              J := J + 1;
            end if;
          end loop;
          Move (Target, Result);
          Clear (Source);
        end;
    end;
  end;
  package body Doubly_Linked_Lists is
    procedure Free is new Unchecked_Deallocation (Node_Type, Node_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    procedure Ensure (Container : in out List) is
      begin
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
      end;
    procedure Check_Cursors (Container : List) is
      begin
        if Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0) then
          raise Program_Error;
        end if;
      end;
    procedure Check_Elements (Container : List) is
      begin
        if Container.Data /= null and then Container.Data.Lock > 0 then
          raise Program_Error;
        end if;
      end;
    procedure Check_Position (Container : List; Position : Cursor) is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        if Position.Data /= Container.Data then
          raise Program_Error;
        end if;
      end;
    procedure Check_Before (Container : List; Before : Cursor) is
      begin
        if Before.Node /= null and then Before.Data /= Container.Data then
          raise Program_Error;
        end if;
      end;
    procedure Link (Data : Shared_Access; Before : Node_Access; Node : Node_Access) is
      begin
        Node.Next := Before;
        if Before = null then
          Node.Previous := Data.Last;
          Data.Last := Node;
        else
          Node.Previous := Before.Previous;
          Before.Previous := Node;
        end if;
        if Node.Previous = null then
          Data.First := Node;
        else
          Node.Previous.Next := Node;
        end if;
        Data.Length := Data.Length + 1;
      end;
    procedure Unlink (Data : Shared_Access; Node : Node_Access) is
      begin
        if Node.Previous = null then
          Data.First := Node.Next;
        else
          Node.Previous.Next := Node.Next;
        end if;
        if Node.Next = null then
          Data.Last := Node.Previous;
        else
          Node.Next.Previous := Node.Previous;
        end if;
        Node.Next := null;
        Node.Previous := null;
        Data.Length := Data.Length - 1;
      end;
    function New_Node (Element : Element_Type) return Node_Access is
      Node : constant Node_Access := new Node_Type'(Element => Element, Next => null, Previous => null);
      begin
        return Node;
      end;
    procedure Release_Nodes (Data : Shared_Access) is
      Node : Node_Access := Data.First;
      Next : Node_Access;
      begin
        while Node /= null loop
          Next := Node.Next;
          Free (Node);
          Node := Next;
        end loop;
        Data.First := null;
        Data.Last := null;
        Data.Length := 0;
      end;
    procedure Adjust (Container : in out List) is
      Source : constant Shared_Access := Container.Data;
      Node   : Node_Access;
      begin
        Container.Data := null;
        if Source /= null and then Source.Length > 0 then
          Container.Data := new Shared;
          Node := Source.First;
          while Node /= null loop
            Link (Container.Data, null, New_Node (Node.Element));
            Node := Node.Next;
          end loop;
        end if;
      end;
    procedure Finalize (Container : in out List) is
      begin
        if Container.Data /= null then
          Release_Nodes (Container.Data);
          Free (Container.Data);
        end if;
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Position.Node /= null;
      end;
    function Has_Element (Container : List; Position : Cursor) return Boolean is
      begin
        return Position.Node /= null and then Position.Data = Container.Data;
      end;
    function "=" (Left, Right : List) return Boolean is
      L, R : Node_Access;
      begin
        if Length (Left) /= Length (Right) then
          return False;
        end if;
        if Length (Left) = 0 then
          return True;
        end if;
        L := Left.Data.First;
        R := Right.Data.First;
        while L /= null loop
          if not (L.Element = R.Element) then
            return False;
          end if;
          L := L.Next;
          R := R.Next;
        end loop;
        return True;
      end;
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean is
      begin
        return Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0);
      end;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean is
      begin
        return Container.Data /= null and then Container.Data.Lock > 0;
      end;
    function Empty return List is
      begin
        return Empty_List;
      end;
    function Length (Container : List) return Count_Type is
      begin
        if Container.Data = null then
          return 0;
        end if;
        return Container.Data.Length;
      end;
    function Is_Empty (Container : List) return Boolean is
      begin
        return Length (Container) = 0;
      end;
    procedure Clear (Container : in out List) is
      begin
        Check_Cursors (Container);
        if Container.Data /= null then
          Release_Nodes (Container.Data);
        end if;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Element;
      end;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) is
      begin
        Check_Position (Container, Position);
        Check_Elements (Container);
        Position.Node.Element := New_Item;
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        Check_Position (Container, Position);
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    procedure Assign (Target : in out List; Source : List) is
      Node : Node_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Clear (Target);
        if Length (Source) = 0 then
          return;
        end if;
        Ensure (Target);
        Node := Source.Data.First;
        while Node /= null loop
          Link (Target.Data, null, New_Node (Node.Element));
          Node := Node.Next;
        end loop;
      end;
    function Copy (Source : List) return List is
      Result : List;
      begin
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out List; Source : in out List) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Cursors (Target);
        Check_Cursors (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      Node : Node_Access;
      begin
        Check_Before (Container, Before);
        Check_Cursors (Container);
        Position := Before;
        if Count = 0 then
          return;
        end if;
        Ensure (Container);
        for I in 1 .. Count loop
          Node := New_Node (New_Item);
          Link (Container.Data, Before.Node, Node);
          if I = 1 then
            Position := (Container.Data, Node);
          end if;
        end loop;
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      Position : Cursor;
      begin
        Insert (Container, Before, New_Item, Position, Count);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      Node : Node_Access;
      begin
        Check_Before (Container, Before);
        Check_Cursors (Container);
        Position := Before;
        if Count = 0 then
          return;
        end if;
        Ensure (Container);
        for I in 1 .. Count loop
          Node := new Node_Type;
          Link (Container.Data, Before.Node, Node);
          if I = 1 then
            Position := (Container.Data, Node);
          end if;
        end loop;
      end;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        Insert (Container, First (Container), New_Item, Count);
      end;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) is
      begin
        Insert (Container, No_Element, New_Item, Count);
      end;
    procedure Append (Container : in out List; New_Item : Element_Type) is
      begin
        Check_Cursors (Container);
        Ensure (Container);
        Link (Container.Data, null, New_Node (New_Item));
      end;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) is
      Node : Node_Access;
      Next : Node_Access;
      begin
        Check_Position (Container, Position);
        Check_Cursors (Container);
        Node := Position.Node;
        for I in 1 .. Count loop
          exit when Node = null;
          Next := Node.Next;
          Unlink (Container.Data, Node);
          Free (Node);
          Node := Next;
        end loop;
        Position := No_Element;
      end;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) is
      Position : Cursor := First (Container);
      begin
        if Count > 0 and then Position.Node /= null then
          Delete (Container, Position, Count);
        end if;
      end;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) is
      Node : Node_Access;
      begin
        if Count = 0 or else Length (Container) = 0 then
          return;
        end if;
        Check_Cursors (Container);
        for I in 1 .. Count loop
          Node := Container.Data.Last;
          exit when Node = null;
          Unlink (Container.Data, Node);
          Free (Node);
        end loop;
      end;
    procedure Reverse_Elements (Container : in out List) is
      Node : Node_Access;
      Next : Node_Access;
      begin
        if Length (Container) < 2 then
          return;
        end if;
        Check_Cursors (Container);
        Node := Container.Data.First;
        while Node /= null loop
          Next := Node.Next;
          Node.Next := Node.Previous;
          Node.Previous := Next;
          Node := Next;
        end loop;
        Node := Container.Data.First;
        Container.Data.First := Container.Data.Last;
        Container.Data.Last := Node;
      end;
    procedure Swap (Container : in out List; I, J : Cursor) is
      begin
        Check_Position (Container, I);
        Check_Position (Container, J);
        Check_Elements (Container);
        if I.Node /= J.Node then
          declare
            Held : constant Element_Type := I.Node.Element;
            begin
              I.Node.Element := J.Node.Element;
              J.Node.Element := Held;
            end;
        end if;
      end;
    procedure Swap_Links (Container : in out List; I, J : Cursor) is
      After_I : Node_Access;
      After_J : Node_Access;
      begin
        Check_Position (Container, I);
        Check_Position (Container, J);
        Check_Cursors (Container);
        if I.Node = J.Node then
          return;
        end if;
        After_I := I.Node.Next;
        After_J := J.Node.Next;
        if After_I = J.Node then
          Unlink (Container.Data, J.Node);
          Link (Container.Data, I.Node, J.Node);
        elsif After_J = I.Node then
          Unlink (Container.Data, I.Node);
          Link (Container.Data, J.Node, I.Node);
        else
          Unlink (Container.Data, I.Node);
          Link (Container.Data, After_J, I.Node);
          Unlink (Container.Data, J.Node);
          Link (Container.Data, After_I, J.Node);
        end if;
      end;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) is
      Node : Node_Access;
      begin
        if Target.Data = Source.Data or else Length (Source) = 0 then
          return;
        end if;
        Check_Before (Target, Before);
        Check_Cursors (Target);
        Check_Cursors (Source);
        Ensure (Target);
        loop
          Node := Source.Data.First;
          exit when Node = null;
          Unlink (Source.Data, Node);
          Link (Target.Data, Before.Node, Node);
        end loop;
      end;
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor) is
      begin
        if Target.Data = Source.Data then
          Splice (Target, Before, Position);
          return;
        end if;
        Check_Before (Target, Before);
        Check_Position (Source, Position);
        Check_Cursors (Target);
        Check_Cursors (Source);
        Ensure (Target);
        Unlink (Source.Data, Position.Node);
        Link (Target.Data, Before.Node, Position.Node);
        Position := (Target.Data, Position.Node);
      end;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) is
      begin
        Check_Before (Container, Before);
        Check_Position (Container, Position);
        if Before.Node = Position.Node or else Position.Node.Next = Before.Node then
          return;
        end if;
        Check_Cursors (Container);
        Unlink (Container.Data, Position.Node);
        Link (Container.Data, Before.Node, Position.Node);
      end;
    function First (Container : List) return Cursor is
      begin
        if Length (Container) = 0 then
          return No_Element;
        end if;
        return (Container.Data, Container.Data.First);
      end;
    function First_Element (Container : List) return Element_Type is
      begin
        return Element (First (Container));
      end;
    function Last (Container : List) return Cursor is
      begin
        if Length (Container) = 0 then
          return No_Element;
        end if;
        return (Container.Data, Container.Data.Last);
      end;
    function Last_Element (Container : List) return Element_Type is
      begin
        return Element (Last (Container));
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        if Position.Node = null or else Position.Node.Next = null then
          return No_Element;
        end if;
        return (Position.Data, Position.Node.Next);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        if Position.Node = null or else Position.Node.Previous = null then
          return No_Element;
        end if;
        return (Position.Data, Position.Node.Previous);
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Position := Next (Position);
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Position := Previous (Position);
      end;
    function Next (Container : List; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    function Previous (Container : List; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    procedure Next (Container : List; Position : in out Cursor) is
      begin
        Position := Next (Container, Position);
      end;
    procedure Previous (Container : List; Position : in out Cursor) is
      begin
        Position := Previous (Container, Position);
      end;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      Node : Node_Access := Position.Node;
      begin
        if Node = null then
          if Length (Container) = 0 then
            return No_Element;
          end if;
          Node := Container.Data.First;
        elsif Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        while Node /= null loop
          if Node.Element = Item then
            return (Container.Data, Node);
          end if;
          Node := Node.Next;
        end loop;
        return No_Element;
      end;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      Node : Node_Access := Position.Node;
      begin
        if Node = null then
          if Length (Container) = 0 then
            return No_Element;
          end if;
          Node := Container.Data.Last;
        elsif Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        while Node /= null loop
          if Node.Element = Item then
            return (Container.Data, Node);
          end if;
          Node := Node.Previous;
        end loop;
        return No_Element;
      end;
    function Contains (Container : List; Item : Element_Type) return Boolean is
      begin
        return Find (Container, Item) /= No_Element;
      end;
    procedure Walk (Container : List;
                    Process   : not null access procedure (Position : Cursor);
                    Backward  : Boolean) is
      Data : constant Shared_Access := Container.Data;
      Node : Node_Access;
      begin
        if Data = null then
          return;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          if Backward then
            Node := Data.Last;
          else
            Node := Data.First;
          end if;
          while Node /= null loop
            Process ((Data, Node));
            if Backward then
              Node := Node.Previous;
            else
              Node := Node.Next;
            end if;
          end loop;
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, False);
      end;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, True);
      end;
    function Iterate (Container : List) return List_Iterator is
      begin
        return (Data => Container.Data, Start => null);
      end;
    function Iterate (Container : List; Start : Cursor) return List_Iterator is
      begin
        Check_Position (Container, Start);
        return (Data => Container.Data, Start => Start.Node);
      end;
    function First (Object : List_Iterator) return Cursor is
      begin
        if Object.Start /= null then
          return (Object.Data, Object.Start);
        end if;
        if Object.Data = null or else Object.Data.First = null then
          return No_Element;
        end if;
        return (Object.Data, Object.Data.First);
      end;
    function Next (Object : List_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    function Last (Object : List_Iterator) return Cursor is
      begin
        if Object.Start /= null then
          return (Object.Data, Object.Start);
        end if;
        if Object.Data = null or else Object.Data.Last = null then
          return No_Element;
        end if;
        return (Object.Data, Object.Data.Last);
      end;
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    package body Generic_Sorting is
      function Is_Sorted (Container : List) return Boolean is
        Node : Node_Access;
        begin
          if Length (Container) < 2 then
            return True;
          end if;
          Node := Container.Data.First;
          while Node.Next /= null loop
            if Node.Next.Element < Node.Element then
              return False;
            end if;
            Node := Node.Next;
          end loop;
          return True;
        end;
      function Merge_Chains (Left, Right : Node_Access) return Node_Access is
        Head : Node_Access;
        Tail : Node_Access;
        L    : Node_Access := Left;
        R    : Node_Access := Right;
        Take : Node_Access;
        begin
          while L /= null or else R /= null loop
            if R = null or else (L /= null and then not (R.Element < L.Element)) then
              Take := L;
              L := L.Next;
            else
              Take := R;
              R := R.Next;
            end if;
            if Tail = null then
              Head := Take;
            else
              Tail.Next := Take;
            end if;
            Tail := Take;
          end loop;
          if Tail /= null then
            Tail.Next := null;
          end if;
          return Head;
        end;
      function Sort_Chain (Head : Node_Access; Count : Count_Type) return Node_Access is
        Middle : Node_Access := Head;
        Second : Node_Access;
        begin
          if Count < 2 then
            if Head /= null then
              Head.Next := null;
            end if;
            return Head;
          end if;
          for I in 2 .. Count / 2 loop
            Middle := Middle.Next;
          end loop;
          Second := Middle.Next;
          Middle.Next := null;
          return Merge_Chains (Sort_Chain (Head, Count / 2), Sort_Chain (Second, Count - Count / 2));
        end;
      procedure Relink (Data : Shared_Access; Head : Node_Access) is
        Node : Node_Access := Head;
        Back : Node_Access;
        begin
          Data.First := Head;
          while Node /= null loop
            Node.Previous := Back;
            Back := Node;
            Node := Node.Next;
          end loop;
          Data.Last := Back;
        end;
      procedure Sort (Container : in out List) is
        begin
          if Length (Container) < 2 then
            return;
          end if;
          Check_Cursors (Container);
          Relink (Container.Data, Sort_Chain (Container.Data.First, Container.Data.Length));
        end;
      procedure Merge (Target, Source : in out List) is
        Count : Count_Type;
        begin
          if Target.Data = Source.Data or else Length (Source) = 0 then
            return;
          end if;
          Check_Cursors (Target);
          Check_Cursors (Source);
          Ensure (Target);
          Count := Target.Data.Length + Source.Data.Length;
          Relink (Target.Data, Merge_Chains (Target.Data.First, Source.Data.First));
          Target.Data.Length := Count;
          Source.Data.First := null;
          Source.Data.Last := null;
          Source.Data.Length := 0;
        end;
    end;
  end;
  package body Ordered_Maps is
    procedure Free is new Unchecked_Deallocation (Node_Type, Node_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    function Parent (Node : Node_Access) return Node_Access is
      begin
        return Node.Parent;
      end;
    function Left (Node : Node_Access) return Node_Access is
      begin
        return Node.Left;
      end;
    function Right (Node : Node_Access) return Node_Access is
      begin
        return Node.Right;
      end;
    function Height (Node : Node_Access) return Integer is
      begin
        return Node.Height;
      end;
    procedure Set_Parent (Node : Node_Access; To : Node_Access) is
      begin
        Node.Parent := To;
      end;
    procedure Set_Left (Node : Node_Access; To : Node_Access) is
      begin
        Node.Left := To;
      end;
    procedure Set_Right (Node : Node_Access; To : Node_Access) is
      begin
        Node.Right := To;
      end;
    procedure Set_Height (Node : Node_Access; To : Integer) is
      begin
        Node.Height := To;
      end;
    package Trees is new Balanced_Trees (Node_Type, Node_Access, Parent, Left, Right, Height,
                                         Set_Parent, Set_Left, Set_Right, Set_Height);
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean is
      begin
        return not (Left < Right) and then not (Right < Left);
      end;
    procedure Check_Cursors (Container : Map) is
      begin
        if Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0) then
          raise Program_Error;
        end if;
      end;
    procedure Check_Elements (Container : Map) is
      begin
        if Container.Data /= null and then Container.Data.Lock > 0 then
          raise Program_Error;
        end if;
      end;
    procedure Check_Position (Container : Map; Position : Cursor) is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        if Position.Data /= Container.Data then
          raise Program_Error;
        end if;
      end;
    function Clone (Node : Node_Access; Above : Node_Access) return Node_Access is
      Result : Node_Access;
      begin
        if Node = null then
          return null;
        end if;
        Result := new Node_Type'(Parent  => Above,
                                 Left    => null,
                                 Right   => null,
                                 Height  => Node.Height,
                                 Key     => Node.Key,
                                 Element => Node.Element);
        Result.Left := Clone (Node.Left, Result);
        Result.Right := Clone (Node.Right, Result);
        return Result;
      end;
    procedure Release (Node : in out Node_Access) is
      begin
        if Node /= null then
          Release (Node.Left);
          Release (Node.Right);
          Free (Node);
        end if;
      end;
    procedure Adjust (Container : in out Map) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Length > 0 then
          Container.Data := new Shared;
          Container.Data.Root := Clone (Source.Root, null);
          Container.Data.Length := Source.Length;
        end if;
      end;
    procedure Finalize (Container : in out Map) is
      begin
        if Container.Data /= null then
          Release (Container.Data.Root);
          Free (Container.Data);
        end if;
      end;
    function Root_Of (Container : Map) return Node_Access is
      begin
        if Container.Data = null then
          return null;
        end if;
        return Container.Data.Root;
      end;
    function Find_Node (Container : Map; Key : Key_Type) return Node_Access is
      Node : Node_Access := Root_Of (Container);
      begin
        while Node /= null loop
          if Key < Node.Key then
            Node := Node.Left;
          elsif Node.Key < Key then
            Node := Node.Right;
          else
            return Node;
          end if;
        end loop;
        return null;
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Position.Node /= null;
      end;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is
      begin
        return Position.Node /= null and then Position.Data = Container.Data;
      end;
    function "=" (Left, Right : Map) return Boolean is
      L : Node_Access;
      R : Node_Access;
      begin
        if Length (Left) /= Length (Right) then
          return False;
        end if;
        L := Trees.Leftmost (Root_Of (Left));
        R := Trees.Leftmost (Root_Of (Right));
        while L /= null loop
          if not Equivalent_Keys (L.Key, R.Key) or else not (L.Element = R.Element) then
            return False;
          end if;
          L := Trees.Next (L);
          R := Trees.Next (R);
        end loop;
        return True;
      end;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is
      begin
        return Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0);
      end;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is
      begin
        return Container.Data /= null and then Container.Data.Lock > 0;
      end;
    function Empty return Map is
      begin
        return Empty_Map;
      end;
    function Length (Container : Map) return Count_Type is
      begin
        if Container.Data = null then
          return 0;
        end if;
        return Container.Data.Length;
      end;
    function Is_Empty (Container : Map) return Boolean is
      begin
        return Length (Container) = 0;
      end;
    procedure Clear (Container : in out Map) is
      begin
        Check_Cursors (Container);
        if Container.Data /= null then
          Release (Container.Data.Root);
          Container.Data.Length := 0;
        end if;
      end;
    function Key (Position : Cursor) return Key_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Key;
      end;
    function Key (Container : Map; Position : Cursor) return Key_Type is
      begin
        Check_Position (Container, Position);
        return Position.Node.Key;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Element;
      end;
    function Element (Container : Map; Position : Cursor) return Element_Type is
      begin
        Check_Position (Container, Position);
        return Position.Node.Element;
      end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin
        Check_Position (Container, Position);
        Check_Elements (Container);
        Position.Node.Element := New_Item;
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Key, Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        Check_Position (Container, Position);
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Key, Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        return (Element => Node.Element'Access);
      end;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        return (Element => Node.Element'Access);
      end;
    procedure Assign (Target : in out Map; Source : Map) is
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Clear (Target);
        if Length (Source) > 0 then
          if Target.Data = null then
            Target.Data := new Shared;
          end if;
          Target.Data.Root := Clone (Source.Data.Root, null);
          Target.Data.Length := Source.Data.Length;
        end if;
      end;
    function Copy (Source : Map) return Map is
      Result : Map;
      begin
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out Map; Source : in out Map) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Cursors (Target);
        Check_Cursors (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Locate (Container : in out Map;
                      Key       : Key_Type;
                      Node      : out Node_Access;
                      Above     : out Node_Access;
                      To_Left   : out Boolean) is
      begin
        Node := Root_Of (Container);
        Above := null;
        To_Left := False;
        while Node /= null loop
          if Key < Node.Key then
            Above := Node;
            To_Left := True;
            Node := Node.Left;
          elsif Node.Key < Key then
            Above := Node;
            To_Left := False;
            Node := Node.Right;
          else
            return;
          end if;
        end loop;
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      Node    : Node_Access;
      Above   : Node_Access;
      To_Left : Boolean;
      begin
        Locate (Container, Key, Node, Above, To_Left);
        if Node /= null then
          Position := (Container.Data, Node);
          Inserted := False;
          return;
        end if;
        Check_Cursors (Container);
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
        Node := new Node_Type'(Parent  => null,
                               Left    => null,
                               Right   => null,
                               Height  => 1,
                               Key     => Key,
                               Element => New_Item);
        Trees.Attach (Container.Data.Root, Node, Above, To_Left);
        Container.Data.Length := Container.Data.Length + 1;
        Position := (Container.Data, Node);
        Inserted := True;
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      Node    : Node_Access;
      Above   : Node_Access;
      To_Left : Boolean;
      begin
        Locate (Container, Key, Node, Above, To_Left);
        if Node /= null then
          Position := (Container.Data, Node);
          Inserted := False;
          return;
        end if;
        Check_Cursors (Container);
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
        Node := new Node_Type;
        Node.Key := Key;
        Trees.Attach (Container.Data.Root, Node, Above, To_Left);
        Container.Data.Length := Container.Data.Length + 1;
        Position := (Container.Data, Node);
        Inserted := True;
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, Key, New_Item, Position, Inserted);
        if not Inserted then
          raise Constraint_Error;
        end if;
      end;
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, Key, New_Item, Position, Inserted);
        if not Inserted then
          Check_Elements (Container);
          Position.Node.Key := Key;
          Position.Node.Element := New_Item;
        end if;
      end;
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        Check_Elements (Container);
        Node.Key := Key;
        Node.Element := New_Item;
      end;
    procedure Remove (Container : in out Map; Node : in out Node_Access) is
      begin
        Check_Cursors (Container);
        Trees.Detach (Container.Data.Root, Node);
        Container.Data.Length := Container.Data.Length - 1;
        Free (Node);
      end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is
      Node : Node_Access := Find_Node (Container, Key);
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Delete (Container : in out Map; Key : Key_Type) is
      Node : Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        Remove (Container, Node);
      end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is
      Node : Node_Access := Position.Node;
      begin
        Check_Position (Container, Position);
        Remove (Container, Node);
        Position := No_Element;
      end;
    procedure Delete_First (Container : in out Map) is
      Node : Node_Access := Trees.Leftmost (Root_Of (Container));
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Delete_Last (Container : in out Map) is
      Node : Node_Access := Trees.Rightmost (Root_Of (Container));
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    function To_Cursor (Container : Map; Node : Node_Access) return Cursor is
      begin
        if Node = null then
          return No_Element;
        end if;
        return (Container.Data, Node);
      end;
    function First (Container : Map) return Cursor is
      begin
        return To_Cursor (Container, Trees.Leftmost (Root_Of (Container)));
      end;
    function First_Element (Container : Map) return Element_Type is
      begin
        return Element (First (Container));
      end;
    function First_Key (Container : Map) return Key_Type is
      begin
        return Key (First (Container));
      end;
    function Last (Container : Map) return Cursor is
      begin
        return To_Cursor (Container, Trees.Rightmost (Root_Of (Container)));
      end;
    function Last_Element (Container : Map) return Element_Type is
      begin
        return Element (Last (Container));
      end;
    function Last_Key (Container : Map) return Key_Type is
      begin
        return Key (Last (Container));
      end;
    function Next (Position : Cursor) return Cursor is
      Node : Node_Access;
      begin
        if Position.Node = null then
          return No_Element;
        end if;
        Node := Trees.Next (Position.Node);
        if Node = null then
          return No_Element;
        end if;
        return (Position.Data, Node);
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Position := Next (Position);
      end;
    function Next (Container : Map; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    procedure Next (Container : Map; Position : in out Cursor) is
      begin
        Position := Next (Container, Position);
      end;
    function Previous (Position : Cursor) return Cursor is
      Node : Node_Access;
      begin
        if Position.Node = null then
          return No_Element;
        end if;
        Node := Trees.Previous (Position.Node);
        if Node = null then
          return No_Element;
        end if;
        return (Position.Data, Node);
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Position := Previous (Position);
      end;
    function Previous (Container : Map; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    procedure Previous (Container : Map; Position : in out Cursor) is
      begin
        Position := Previous (Container, Position);
      end;
    function Find (Container : Map; Key : Key_Type) return Cursor is
      begin
        return To_Cursor (Container, Find_Node (Container, Key));
      end;
    function Element (Container : Map; Key : Key_Type) return Element_Type is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        return Node.Element;
      end;
    function Floor (Container : Map; Key : Key_Type) return Cursor is
      Node   : Node_Access := Root_Of (Container);
      Result : Node_Access;
      begin
        while Node /= null loop
          if Key < Node.Key then
            Node := Node.Left;
          else
            Result := Node;
            Node := Node.Right;
          end if;
        end loop;
        return To_Cursor (Container, Result);
      end;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor is
      Node   : Node_Access := Root_Of (Container);
      Result : Node_Access;
      begin
        while Node /= null loop
          if Node.Key < Key then
            Node := Node.Right;
          else
            Result := Node;
            Node := Node.Left;
          end if;
        end loop;
        return To_Cursor (Container, Result);
      end;
    function Contains (Container : Map; Key : Key_Type) return Boolean is
      begin
        return Find_Node (Container, Key) /= null;
      end;
    function "<" (Left, Right : Cursor) return Boolean is
      begin
        return Ordered_Maps.Key (Left) < Ordered_Maps.Key (Right);
      end;
    function ">" (Left, Right : Cursor) return Boolean is
      begin
        return Ordered_Maps.Key (Right) < Ordered_Maps.Key (Left);
      end;
    function "<" (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Key (Left) < Right;
      end;
    function ">" (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Right < Key (Left);
      end;
    function "<" (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Left < Key (Right);
      end;
    function ">" (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Key (Right) < Left;
      end;
    procedure Walk (Container : Map;
                    Process   : not null access procedure (Position : Cursor);
                    Backward  : Boolean) is
      Data : constant Shared_Access := Container.Data;
      Node : Node_Access;
      begin
        if Data = null then
          return;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          if Backward then
            Node := Trees.Rightmost (Data.Root);
          else
            Node := Trees.Leftmost (Data.Root);
          end if;
          while Node /= null loop
            Process ((Data, Node));
            if Backward then
              Node := Trees.Previous (Node);
            else
              Node := Trees.Next (Node);
            end if;
          end loop;
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, False);
      end;
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, True);
      end;
    function Iterate (Container : Map) return Map_Iterator is
      begin
        return (Data => Container.Data, Start => null);
      end;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator is
      begin
        Check_Position (Container, Start);
        return (Data => Container.Data, Start => Start.Node);
      end;
    function First (Object : Map_Iterator) return Cursor is
      begin
        if Object.Start /= null then
          return (Object.Data, Object.Start);
        end if;
        if Object.Data = null or else Object.Data.Root = null then
          return No_Element;
        end if;
        return (Object.Data, Trees.Leftmost (Object.Data.Root));
      end;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    function Last (Object : Map_Iterator) return Cursor is
      begin
        if Object.Start /= null then
          return (Object.Data, Object.Start);
        end if;
        if Object.Data = null or else Object.Data.Root = null then
          return No_Element;
        end if;
        return (Object.Data, Trees.Rightmost (Object.Data.Root));
      end;
    function Previous (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
  end;
  package body Ordered_Sets is
    procedure Free is new Unchecked_Deallocation (Node_Type, Node_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    function Parent (Node : Node_Access) return Node_Access is
      begin
        return Node.Parent;
      end;
    function Left (Node : Node_Access) return Node_Access is
      begin
        return Node.Left;
      end;
    function Right (Node : Node_Access) return Node_Access is
      begin
        return Node.Right;
      end;
    function Height (Node : Node_Access) return Integer is
      begin
        return Node.Height;
      end;
    procedure Set_Parent (Node : Node_Access; To : Node_Access) is
      begin
        Node.Parent := To;
      end;
    procedure Set_Left (Node : Node_Access; To : Node_Access) is
      begin
        Node.Left := To;
      end;
    procedure Set_Right (Node : Node_Access; To : Node_Access) is
      begin
        Node.Right := To;
      end;
    procedure Set_Height (Node : Node_Access; To : Integer) is
      begin
        Node.Height := To;
      end;
    package Trees is new Balanced_Trees (Node_Type, Node_Access, Parent, Left, Right, Height,
                                         Set_Parent, Set_Left, Set_Right, Set_Height);
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean is
      begin
        return not (Left < Right) and then not (Right < Left);
      end;
    procedure Check_Cursors (Container : Set) is
      begin
        if Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0) then
          raise Program_Error;
        end if;
      end;
    procedure Check_Position (Container : Set; Position : Cursor) is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        if Position.Data /= Container.Data then
          raise Program_Error;
        end if;
      end;
    function Clone (Node : Node_Access; Above : Node_Access) return Node_Access is
      Result : Node_Access;
      begin
        if Node = null then
          return null;
        end if;
        Result := new Node_Type'(Parent  => Above,
                                 Left    => null,
                                 Right   => null,
                                 Height  => Node.Height,
                                 Element => Node.Element);
        Result.Left := Clone (Node.Left, Result);
        Result.Right := Clone (Node.Right, Result);
        return Result;
      end;
    procedure Release (Node : in out Node_Access) is
      begin
        if Node /= null then
          Release (Node.Left);
          Release (Node.Right);
          Free (Node);
        end if;
      end;
    procedure Adjust (Container : in out Set) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Length > 0 then
          Container.Data := new Shared;
          Container.Data.Root := Clone (Source.Root, null);
          Container.Data.Length := Source.Length;
        end if;
      end;
    procedure Finalize (Container : in out Set) is
      begin
        if Container.Data /= null then
          Release (Container.Data.Root);
          Free (Container.Data);
        end if;
      end;
    function Root_Of (Container : Set) return Node_Access is
      begin
        if Container.Data = null then
          return null;
        end if;
        return Container.Data.Root;
      end;
    function Find_Node (Container : Set; Item : Element_Type) return Node_Access is
      Node : Node_Access := Root_Of (Container);
      begin
        while Node /= null loop
          if Item < Node.Element then
            Node := Node.Left;
          elsif Node.Element < Item then
            Node := Node.Right;
          else
            return Node;
          end if;
        end loop;
        return null;
      end;
    function To_Cursor (Container : Set; Node : Node_Access) return Cursor is
      begin
        if Node = null then
          return No_Element;
        end if;
        return (Container.Data, Node);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Position.Node /= null;
      end;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is
      begin
        return Position.Node /= null and then Position.Data = Container.Data;
      end;
    function "=" (Left, Right : Set) return Boolean is
      L : Node_Access;
      R : Node_Access;
      begin
        if Length (Left) /= Length (Right) then
          return False;
        end if;
        L := Trees.Leftmost (Root_Of (Left));
        R := Trees.Leftmost (Root_Of (Right));
        while L /= null loop
          if not (L.Element = R.Element) then
            return False;
          end if;
          L := Trees.Next (L);
          R := Trees.Next (R);
        end loop;
        return True;
      end;
    function Equivalent_Sets (Left, Right : Set) return Boolean is
      L : Node_Access;
      R : Node_Access;
      begin
        if Length (Left) /= Length (Right) then
          return False;
        end if;
        L := Trees.Leftmost (Root_Of (Left));
        R := Trees.Leftmost (Root_Of (Right));
        while L /= null loop
          if not Equivalent_Elements (L.Element, R.Element) then
            return False;
          end if;
          L := Trees.Next (L);
          R := Trees.Next (R);
        end loop;
        return True;
      end;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is
      begin
        return Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0);
      end;
    function Empty return Set is
      begin
        return Empty_Set;
      end;
    function To_Set (New_Item : Element_Type) return Set is
      Result : Set;
      begin
        Insert (Result, New_Item);
        return Result;
      end;
    function Length (Container : Set) return Count_Type is
      begin
        if Container.Data = null then
          return 0;
        end if;
        return Container.Data.Length;
      end;
    function Is_Empty (Container : Set) return Boolean is
      begin
        return Length (Container) = 0;
      end;
    procedure Clear (Container : in out Set) is
      begin
        Check_Cursors (Container);
        if Container.Data /= null then
          Release (Container.Data.Root);
          Container.Data.Length := 0;
        end if;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Element;
      end;
    function Element (Container : Set; Position : Cursor) return Element_Type is
      begin
        Check_Position (Container, Position);
        return Position.Node.Element;
      end;
    procedure Locate (Container : Set;
                      Item      : Element_Type;
                      Node      : out Node_Access;
                      Above     : out Node_Access;
                      To_Left   : out Boolean) is
      begin
        Node := Root_Of (Container);
        Above := null;
        To_Left := False;
        while Node /= null loop
          if Item < Node.Element then
            Above := Node;
            To_Left := True;
            Node := Node.Left;
          elsif Node.Element < Item then
            Above := Node;
            To_Left := False;
            Node := Node.Right;
          else
            return;
          end if;
        end loop;
      end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      Node    : Node_Access;
      Found   : Node_Access;
      Above   : Node_Access;
      To_Left : Boolean;
      begin
        Check_Position (Container, Position);
        Node := Position.Node;
        if Equivalent_Elements (New_Item, Node.Element) then
          if Container.Data.Lock > 0 then
            raise Program_Error;
          end if;
          Node.Element := New_Item;
          return;
        end if;
        if Find_Node (Container, New_Item) /= null then
          raise Program_Error;
        end if;
        Check_Cursors (Container);
        Trees.Detach (Container.Data.Root, Node);
        Node.Element := New_Item;
        Locate (Container, New_Item, Found, Above, To_Left);
        Trees.Attach (Container.Data.Root, Node, Above, To_Left);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    procedure Assign (Target : in out Set; Source : Set) is
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Clear (Target);
        if Length (Source) > 0 then
          if Target.Data = null then
            Target.Data := new Shared;
          end if;
          Target.Data.Root := Clone (Source.Data.Root, null);
          Target.Data.Length := Source.Data.Length;
        end if;
      end;
    function Copy (Source : Set) return Set is
      Result : Set;
      begin
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out Set; Source : in out Set) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Cursors (Target);
        Check_Cursors (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      Node    : Node_Access;
      Above   : Node_Access;
      To_Left : Boolean;
      begin
        Locate (Container, New_Item, Node, Above, To_Left);
        if Node /= null then
          Position := (Container.Data, Node);
          Inserted := False;
          return;
        end if;
        Check_Cursors (Container);
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
        Node := new Node_Type'(Parent  => null,
                               Left    => null,
                               Right   => null,
                               Height  => 1,
                               Element => New_Item);
        Trees.Attach (Container.Data.Root, Node, Above, To_Left);
        Container.Data.Length := Container.Data.Length + 1;
        Position := (Container.Data, Node);
        Inserted := True;
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, New_Item, Position, Inserted);
        if not Inserted then
          raise Constraint_Error;
        end if;
      end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, New_Item, Position, Inserted);
        if not Inserted then
          if Container.Data.Lock > 0 then
            raise Program_Error;
          end if;
          Position.Node.Element := New_Item;
        end if;
      end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is
      Node : constant Node_Access := Find_Node (Container, New_Item);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        if Container.Data.Lock > 0 then
          raise Program_Error;
        end if;
        Node.Element := New_Item;
      end;
    procedure Remove (Container : in out Set; Node : in out Node_Access) is
      begin
        Check_Cursors (Container);
        Trees.Detach (Container.Data.Root, Node);
        Container.Data.Length := Container.Data.Length - 1;
        Free (Node);
      end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is
      Node : Node_Access := Find_Node (Container, Item);
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Delete (Container : in out Set; Item : Element_Type) is
      Node : Node_Access := Find_Node (Container, Item);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        Remove (Container, Node);
      end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is
      Node : Node_Access := Position.Node;
      begin
        Check_Position (Container, Position);
        Remove (Container, Node);
        Position := No_Element;
      end;
    procedure Delete_First (Container : in out Set) is
      Node : Node_Access := Trees.Leftmost (Root_Of (Container));
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Delete_Last (Container : in out Set) is
      Node : Node_Access := Trees.Rightmost (Root_Of (Container));
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Union (Target : in out Set; Source : Set) is
      Node     : Node_Access;
      Position : Cursor;
      Inserted : Boolean;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Node := Trees.Leftmost (Root_Of (Source));
        while Node /= null loop
          Insert (Target, Node.Element, Position, Inserted);
          Node := Trees.Next (Node);
        end loop;
      end;
    function Union (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Union (Result, Right);
        return Result;
      end;
    procedure Intersection (Target : in out Set; Source : Set) is
      Node : Node_Access;
      Next : Node_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Node := Trees.Leftmost (Root_Of (Target));
        while Node /= null loop
          Next := Trees.Next (Node);
          if Find_Node (Source, Node.Element) = null then
            Remove (Target, Node);
          end if;
          Node := Next;
        end loop;
      end;
    function Intersection (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Intersection (Result, Right);
        return Result;
      end;
    procedure Difference (Target : in out Set; Source : Set) is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        if Target.Data = Source.Data then
          Clear (Target);
          return;
        end if;
        Node := Trees.Leftmost (Root_Of (Source));
        while Node /= null loop
          Found := Find_Node (Target, Node.Element);
          if Found /= null then
            Remove (Target, Found);
          end if;
          Node := Trees.Next (Node);
        end loop;
      end;
    function Difference (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Difference (Result, Right);
        return Result;
      end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        if Target.Data = Source.Data then
          Clear (Target);
          return;
        end if;
        Node := Trees.Leftmost (Root_Of (Source));
        while Node /= null loop
          Found := Find_Node (Target, Node.Element);
          if Found /= null then
            Remove (Target, Found);
          else
            Insert (Target, Node.Element);
          end if;
          Node := Trees.Next (Node);
        end loop;
      end;
    function Symmetric_Difference (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Symmetric_Difference (Result, Right);
        return Result;
      end;
    function Overlap (Left, Right : Set) return Boolean is
      Node : Node_Access := Trees.Leftmost (Root_Of (Left));
      begin
        while Node /= null loop
          if Find_Node (Right, Node.Element) /= null then
            return True;
          end if;
          Node := Trees.Next (Node);
        end loop;
        return False;
      end;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is
      Node : Node_Access := Trees.Leftmost (Root_Of (Subset));
      begin
        while Node /= null loop
          if Find_Node (Of_Set, Node.Element) = null then
            return False;
          end if;
          Node := Trees.Next (Node);
        end loop;
        return True;
      end;
    function First (Container : Set) return Cursor is
      begin
        return To_Cursor (Container, Trees.Leftmost (Root_Of (Container)));
      end;
    function First_Element (Container : Set) return Element_Type is
      begin
        return Element (First (Container));
      end;
    function Last (Container : Set) return Cursor is
      begin
        return To_Cursor (Container, Trees.Rightmost (Root_Of (Container)));
      end;
    function Last_Element (Container : Set) return Element_Type is
      begin
        return Element (Last (Container));
      end;
    function Next (Position : Cursor) return Cursor is
      Node : Node_Access;
      begin
        if Position.Node = null then
          return No_Element;
        end if;
        Node := Trees.Next (Position.Node);
        if Node = null then
          return No_Element;
        end if;
        return (Position.Data, Node);
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Position := Next (Position);
      end;
    function Next (Container : Set; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    procedure Next (Container : Set; Position : in out Cursor) is
      begin
        Position := Next (Container, Position);
      end;
    function Previous (Position : Cursor) return Cursor is
      Node : Node_Access;
      begin
        if Position.Node = null then
          return No_Element;
        end if;
        Node := Trees.Previous (Position.Node);
        if Node = null then
          return No_Element;
        end if;
        return (Position.Data, Node);
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Position := Previous (Position);
      end;
    function Previous (Container : Set; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    procedure Previous (Container : Set; Position : in out Cursor) is
      begin
        Position := Previous (Container, Position);
      end;
    function Find (Container : Set; Item : Element_Type) return Cursor is
      begin
        return To_Cursor (Container, Find_Node (Container, Item));
      end;
    function Floor (Container : Set; Item : Element_Type) return Cursor is
      Node   : Node_Access := Root_Of (Container);
      Result : Node_Access;
      begin
        while Node /= null loop
          if Item < Node.Element then
            Node := Node.Left;
          else
            Result := Node;
            Node := Node.Right;
          end if;
        end loop;
        return To_Cursor (Container, Result);
      end;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor is
      Node   : Node_Access := Root_Of (Container);
      Result : Node_Access;
      begin
        while Node /= null loop
          if Node.Element < Item then
            Node := Node.Right;
          else
            Result := Node;
            Node := Node.Left;
          end if;
        end loop;
        return To_Cursor (Container, Result);
      end;
    function Contains (Container : Set; Item : Element_Type) return Boolean is
      begin
        return Find_Node (Container, Item) /= null;
      end;
    function "<" (Left, Right : Cursor) return Boolean is
      begin
        return Element (Left) < Element (Right);
      end;
    function ">" (Left, Right : Cursor) return Boolean is
      begin
        return Element (Right) < Element (Left);
      end;
    function "<" (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Element (Left) < Right;
      end;
    function ">" (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Right < Element (Left);
      end;
    function "<" (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Left < Element (Right);
      end;
    function ">" (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Element (Right) < Left;
      end;
    procedure Walk (Container : Set;
                    Process   : not null access procedure (Position : Cursor);
                    Backward  : Boolean) is
      Data : constant Shared_Access := Container.Data;
      Node : Node_Access;
      begin
        if Data = null then
          return;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          if Backward then
            Node := Trees.Rightmost (Data.Root);
          else
            Node := Trees.Leftmost (Data.Root);
          end if;
          while Node /= null loop
            Process ((Data, Node));
            if Backward then
              Node := Trees.Previous (Node);
            else
              Node := Trees.Next (Node);
            end if;
          end loop;
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, False);
      end;
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      begin
        Walk (Container, Process, True);
      end;
    function Iterate (Container : Set) return Set_Iterator is
      begin
        return (Data => Container.Data, Start => null);
      end;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator is
      begin
        Check_Position (Container, Start);
        return (Data => Container.Data, Start => Start.Node);
      end;
    function First (Object : Set_Iterator) return Cursor is
      begin
        if Object.Start /= null then
          return (Object.Data, Object.Start);
        end if;
        if Object.Data = null or else Object.Data.Root = null then
          return No_Element;
        end if;
        return (Object.Data, Trees.Leftmost (Object.Data.Root));
      end;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    function Last (Object : Set_Iterator) return Cursor is
      begin
        if Object.Start /= null then
          return (Object.Data, Object.Start);
        end if;
        if Object.Data = null or else Object.Data.Root = null then
          return No_Element;
        end if;
        return (Object.Data, Trees.Rightmost (Object.Data.Root));
      end;
    function Previous (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Previous (Position);
      end;
    package body Generic_Keys is
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean is
        begin
          return not (Left < Right) and then not (Right < Left);
        end;
      function Find_Key (Container : Set; Key : Key_Type) return Node_Access is
        Node : Node_Access := Root_Of (Container);
        begin
          while Node /= null loop
            if Key < Generic_Keys.Key (Node.Element) then
              Node := Node.Left;
            elsif Generic_Keys.Key (Node.Element) < Key then
              Node := Node.Right;
            else
              return Node;
            end if;
          end loop;
          return null;
        end;
      function Key (Position : Cursor) return Key_Type is
        begin
          if Position.Node = null then
            raise Constraint_Error;
          end if;
          return Key (Position.Node.Element);
        end;
      function Element (Container : Set; Key : Key_Type) return Element_Type is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          return Node.Element;
        end;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          Replace_Element (Container, (Container.Data, Node), New_Item);
        end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is
        Node : Node_Access := Find_Key (Container, Key);
        begin
          if Node /= null then
            Remove (Container, Node);
          end if;
        end;
      procedure Delete (Container : in out Set; Key : Key_Type) is
        Node : Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          Remove (Container, Node);
        end;
      function Find (Container : Set; Key : Key_Type) return Cursor is
        begin
          return To_Cursor (Container, Find_Key (Container, Key));
        end;
      function Floor (Container : Set; Key : Key_Type) return Cursor is
        Node   : Node_Access := Root_Of (Container);
        Result : Node_Access;
        begin
          while Node /= null loop
            if Key < Generic_Keys.Key (Node.Element) then
              Node := Node.Left;
            else
              Result := Node;
              Node := Node.Right;
            end if;
          end loop;
          return To_Cursor (Container, Result);
        end;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor is
        Node   : Node_Access := Root_Of (Container);
        Result : Node_Access;
        begin
          while Node /= null loop
            if Generic_Keys.Key (Node.Element) < Key then
              Node := Node.Right;
            else
              Result := Node;
              Node := Node.Left;
            end if;
          end loop;
          return To_Cursor (Container, Result);
        end;
      function Contains (Container : Set; Key : Key_Type) return Boolean is
        begin
          return Find_Key (Container, Key) /= null;
        end;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type)) is
        Node : Node_Access;
        begin
          Check_Position (Container, Position);
          Node := Position.Node;
          declare
            Before : constant Key_Type := Key (Node.Element);
            Data   : constant Shared_Access := Container.Data;
            begin
              Data.Lock := Data.Lock + 1;
              begin
                Process (Node.Element);
              exception
                when others =>
                  Data.Lock := Data.Lock - 1;
                  raise;
              end;
              Data.Lock := Data.Lock - 1;
              if not Equivalent_Keys (Before, Key (Node.Element)) then
                Remove (Container, Node);
                raise Program_Error;
              end if;
            end;
        end;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        begin
          Check_Position (Container, Position);
          return (Element => Position.Node.Element'Access);
        end;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          return (Element => Node.Element'Access);
        end;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          return (Element => Node.Element'Access);
        end;
    end;
  end;
  package body Hashed_Maps is
    procedure Free is new Unchecked_Deallocation (Node_Type, Node_Access);
    procedure Free is new Unchecked_Deallocation (Bucket_Array, Bucket_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    procedure Check_Cursors (Container : Map) is
      begin
        if Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0) then
          raise Program_Error;
        end if;
      end;
    procedure Check_Elements (Container : Map) is
      begin
        if Container.Data /= null and then Container.Data.Lock > 0 then
          raise Program_Error;
        end if;
      end;
    procedure Check_Position (Container : Map; Position : Cursor) is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        if Position.Data /= Container.Data then
          raise Program_Error;
        end if;
      end;
    function Slot (Data : Shared_Access; Code : Hash_Type) return Hash_Type is
      begin
        return Code mod Hash_Type (Data.Buckets'Length);
      end;
    procedure Resize (Data : Shared_Access; Size : Count_Type) is
      Grown : constant Bucket_Access := new Bucket_Array'(0 .. Hash_Type (Size) - 1 => null);
      Node  : Node_Access;
      Next  : Node_Access;
      Index : Hash_Type;
      begin
        if Data.Buckets /= null then
          for B in Data.Buckets'Range loop
            Node := Data.Buckets (B);
            while Node /= null loop
              Next := Node.Next;
              Index := Node.Hash mod Hash_Type (Size);
              Node.Next := Grown (Index);
              Grown (Index) := Node;
              Node := Next;
            end loop;
          end loop;
          Free (Data.Buckets);
        end if;
        Data.Buckets := Grown;
      end;
    function Clone (Source : Shared_Access) return Shared_Access is
      Result : constant Shared_Access := new Shared;
      Node   : Node_Access;
      begin
        Result.Buckets := new Bucket_Array'(Source.Buckets'Range => null);
        for B in Source.Buckets'Range loop
          Node := Source.Buckets (B);
          while Node /= null loop
            Result.Buckets (B) := new Node_Type'(Next    => Result.Buckets (B),
                                                 Hash    => Node.Hash,
                                                 Key     => Node.Key,
                                                 Element => Node.Element);
            Node := Node.Next;
          end loop;
        end loop;
        Result.Length := Source.Length;
        return Result;
      end;
    procedure Release_Nodes (Data : Shared_Access) is
      Node : Node_Access;
      Next : Node_Access;
      begin
        if Data.Buckets = null then
          return;
        end if;
        for B in Data.Buckets'Range loop
          Node := Data.Buckets (B);
          while Node /= null loop
            Next := Node.Next;
            Free (Node);
            Node := Next;
          end loop;
          Data.Buckets (B) := null;
        end loop;
        Data.Length := 0;
      end;
    procedure Adjust (Container : in out Map) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Length > 0 then
          Container.Data := Clone (Source);
        end if;
      end;
    procedure Finalize (Container : in out Map) is
      begin
        if Container.Data /= null then
          Release_Nodes (Container.Data);
          Free (Container.Data.Buckets);
          Free (Container.Data);
        end if;
      end;
    function Find_Node (Container : Map; Key : Key_Type) return Node_Access is
      Code : Hash_Type;
      Node : Node_Access;
      begin
        if Container.Data = null or else Container.Data.Length = 0 then
          return null;
        end if;
        Code := Hash (Key);
        Node := Container.Data.Buckets (Slot (Container.Data, Code));
        while Node /= null loop
          if Node.Hash = Code and then Equivalent_Keys (Node.Key, Key) then
            return Node;
          end if;
          Node := Node.Next;
        end loop;
        return null;
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Position.Node /= null;
      end;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is
      begin
        return Position.Node /= null and then Position.Data = Container.Data;
      end;
    function "=" (Left, Right : Map) return Boolean is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        if Length (Left) /= Length (Right) then
          return False;
        end if;
        if Length (Left) = 0 then
          return True;
        end if;
        for B in Left.Data.Buckets'Range loop
          Node := Left.Data.Buckets (B);
          while Node /= null loop
            Found := Find_Node (Right, Node.Key);
            if Found = null or else not (Found.Element = Node.Element) then
              return False;
            end if;
            Node := Node.Next;
          end loop;
        end loop;
        return True;
      end;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is
      begin
        return Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0);
      end;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is
      begin
        return Container.Data /= null and then Container.Data.Lock > 0;
      end;
    function Capacity (Container : Map) return Count_Type is
      begin
        if Container.Data = null or else Container.Data.Buckets = null then
          return 0;
        end if;
        return Container.Data.Buckets'Length;
      end;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) is
      begin
        if Capacity > Hashed_Maps.Capacity (Container) then
          Check_Cursors (Container);
          if Container.Data = null then
            Container.Data := new Shared;
          end if;
          Resize (Container.Data, Capacity);
        end if;
      end;
    function Empty (Capacity : Count_Type := 10) return Map is
      Result : Map;
      begin
        Reserve_Capacity (Result, Capacity);
        return Result;
      end;
    function Length (Container : Map) return Count_Type is
      begin
        if Container.Data = null then
          return 0;
        end if;
        return Container.Data.Length;
      end;
    function Is_Empty (Container : Map) return Boolean is
      begin
        return Length (Container) = 0;
      end;
    procedure Clear (Container : in out Map) is
      begin
        Check_Cursors (Container);
        if Container.Data /= null then
          Release_Nodes (Container.Data);
        end if;
      end;
    function Key (Position : Cursor) return Key_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Key;
      end;
    function Key (Container : Map; Position : Cursor) return Key_Type is
      begin
        Check_Position (Container, Position);
        return Position.Node.Key;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Element;
      end;
    function Element (Container : Map; Position : Cursor) return Element_Type is
      begin
        Check_Position (Container, Position);
        return Position.Node.Element;
      end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin
        Check_Position (Container, Position);
        Check_Elements (Container);
        Position.Node.Element := New_Item;
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Key, Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        Check_Position (Container, Position);
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Key, Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        return (Element => Node.Element'Access);
      end;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        return (Element => Node.Element'Access);
      end;
    procedure Assign (Target : in out Map; Source : Map) is
      Node     : Node_Access;
      Position : Cursor;
      Inserted : Boolean;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Clear (Target);
        if Length (Source) = 0 then
          return;
        end if;
        Reserve_Capacity (Target, Length (Source));
        for B in Source.Data.Buckets'Range loop
          Node := Source.Data.Buckets (B);
          while Node /= null loop
            Insert (Target, Node.Key, Node.Element, Position, Inserted);
            Node := Node.Next;
          end loop;
        end loop;
      end;
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map is
      Result : Map;
      begin
        if Capacity /= 0 and then Capacity < Length (Source) then
          raise Capacity_Error;
        end if;
        Reserve_Capacity (Result, Count_Type'Max (Capacity, Length (Source)));
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out Map; Source : in out Map) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Cursors (Target);
        Check_Cursors (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Link (Container : in out Map; Node : Node_Access) is
      Index : Hash_Type;
      begin
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
        if Container.Data.Buckets = null then
          Resize (Container.Data, 31);
        elsif Container.Data.Length >= Container.Data.Buckets'Length then
          Resize (Container.Data, 2 * Container.Data.Buckets'Length + 1);
        end if;
        Index := Slot (Container.Data, Node.Hash);
        Node.Next := Container.Data.Buckets (Index);
        Container.Data.Buckets (Index) := Node;
        Container.Data.Length := Container.Data.Length + 1;
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      Node : Node_Access := Find_Node (Container, Key);
      begin
        if Node /= null then
          Position := (Container.Data, Node);
          Inserted := False;
          return;
        end if;
        Check_Cursors (Container);
        Node := new Node_Type'(Next => null, Hash => Hash (Key), Key => Key, Element => New_Item);
        Link (Container, Node);
        Position := (Container.Data, Node);
        Inserted := True;
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      Node : Node_Access := Find_Node (Container, Key);
      begin
        if Node /= null then
          Position := (Container.Data, Node);
          Inserted := False;
          return;
        end if;
        Check_Cursors (Container);
        Node := new Node_Type;
        Node.Hash := Hash (Key);
        Node.Key := Key;
        Link (Container, Node);
        Position := (Container.Data, Node);
        Inserted := True;
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, Key, New_Item, Position, Inserted);
        if not Inserted then
          raise Constraint_Error;
        end if;
      end;
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, Key, New_Item, Position, Inserted);
        if not Inserted then
          Check_Elements (Container);
          Position.Node.Key := Key;
          Position.Node.Element := New_Item;
        end if;
      end;
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        Check_Elements (Container);
        Node.Key := Key;
        Node.Element := New_Item;
      end;
    procedure Remove (Container : in out Map; Node : in out Node_Access) is
      Index : Hash_Type;
      Prior : Node_Access;
      begin
        Check_Cursors (Container);
        Index := Slot (Container.Data, Node.Hash);
        if Container.Data.Buckets (Index) = Node then
          Container.Data.Buckets (Index) := Node.Next;
        else
          Prior := Container.Data.Buckets (Index);
          while Prior.Next /= Node loop
            Prior := Prior.Next;
          end loop;
          Prior.Next := Node.Next;
        end if;
        Container.Data.Length := Container.Data.Length - 1;
        Free (Node);
      end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is
      Node : Node_Access := Find_Node (Container, Key);
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Delete (Container : in out Map; Key : Key_Type) is
      Node : Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        Remove (Container, Node);
      end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is
      Node : Node_Access := Position.Node;
      begin
        Check_Position (Container, Position);
        Remove (Container, Node);
        Position := No_Element;
      end;
    function First_From (Data : Shared_Access; Index : Hash_Type) return Cursor is
      begin
        if Data = null or else Data.Buckets = null then
          return No_Element;
        end if;
        for B in Index .. Data.Buckets'Last loop
          if Data.Buckets (B) /= null then
            return (Data, Data.Buckets (B));
          end if;
        end loop;
        return No_Element;
      end;
    function First (Container : Map) return Cursor is
      begin
        if Length (Container) = 0 then
          return No_Element;
        end if;
        return First_From (Container.Data, 0);
      end;
    function Next (Position : Cursor) return Cursor is
      Index : Hash_Type;
      begin
        if Position.Node = null then
          return No_Element;
        end if;
        if Position.Node.Next /= null then
          return (Position.Data, Position.Node.Next);
        end if;
        Index := Slot (Position.Data, Position.Node.Hash);
        if Index = Position.Data.Buckets'Last then
          return No_Element;
        end if;
        return First_From (Position.Data, Index + 1);
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Position := Next (Position);
      end;
    function Next (Container : Map; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    procedure Next (Container : Map; Position : in out Cursor) is
      begin
        Position := Next (Container, Position);
      end;
    function Find (Container : Map; Key : Key_Type) return Cursor is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          return No_Element;
        end if;
        return (Container.Data, Node);
      end;
    function Element (Container : Map; Key : Key_Type) return Element_Type is
      Node : constant Node_Access := Find_Node (Container, Key);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        return Node.Element;
      end;
    function Contains (Container : Map; Key : Key_Type) return Boolean is
      begin
        return Find_Node (Container, Key) /= null;
      end;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean is
      begin
        return Equivalent_Keys (Key (Left), Key (Right));
      end;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Equivalent_Keys (Key (Left), Right);
      end;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Equivalent_Keys (Left, Key (Right));
      end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      Data     : constant Shared_Access := Container.Data;
      Position : Cursor;
      begin
        if Data = null then
          return;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          Position := First (Container);
          while Position.Node /= null loop
            Process (Position);
            Position := Next (Position);
          end loop;
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    function Iterate (Container : Map) return Map_Iterator is
      begin
        return (Data => Container.Data);
      end;
    function First (Object : Map_Iterator) return Cursor is
      begin
        if Object.Data = null or else Object.Data.Length = 0 then
          return No_Element;
        end if;
        return First_From (Object.Data, 0);
      end;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
  end;
  package body Hashed_Sets is
    procedure Free is new Unchecked_Deallocation (Node_Type, Node_Access);
    procedure Free is new Unchecked_Deallocation (Bucket_Array, Bucket_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    procedure Check_Cursors (Container : Set) is
      begin
        if Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0) then
          raise Program_Error;
        end if;
      end;
    procedure Check_Position (Container : Set; Position : Cursor) is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        if Position.Data /= Container.Data then
          raise Program_Error;
        end if;
      end;
    function Slot (Data : Shared_Access; Code : Hash_Type) return Hash_Type is
      begin
        return Code mod Hash_Type (Data.Buckets'Length);
      end;
    procedure Resize (Data : Shared_Access; Size : Count_Type) is
      Grown : constant Bucket_Access := new Bucket_Array'(0 .. Hash_Type (Size) - 1 => null);
      Node  : Node_Access;
      Next  : Node_Access;
      Index : Hash_Type;
      begin
        if Data.Buckets /= null then
          for B in Data.Buckets'Range loop
            Node := Data.Buckets (B);
            while Node /= null loop
              Next := Node.Next;
              Index := Node.Hash mod Hash_Type (Size);
              Node.Next := Grown (Index);
              Grown (Index) := Node;
              Node := Next;
            end loop;
          end loop;
          Free (Data.Buckets);
        end if;
        Data.Buckets := Grown;
      end;
    function Clone (Source : Shared_Access) return Shared_Access is
      Result : constant Shared_Access := new Shared;
      Node   : Node_Access;
      begin
        Result.Buckets := new Bucket_Array'(Source.Buckets'Range => null);
        for B in Source.Buckets'Range loop
          Node := Source.Buckets (B);
          while Node /= null loop
            Result.Buckets (B) := new Node_Type'(Next    => Result.Buckets (B),
                                                 Hash    => Node.Hash,
                                                 Element => Node.Element);
            Node := Node.Next;
          end loop;
        end loop;
        Result.Length := Source.Length;
        return Result;
      end;
    procedure Release_Nodes (Data : Shared_Access) is
      Node : Node_Access;
      Next : Node_Access;
      begin
        if Data.Buckets = null then
          return;
        end if;
        for B in Data.Buckets'Range loop
          Node := Data.Buckets (B);
          while Node /= null loop
            Next := Node.Next;
            Free (Node);
            Node := Next;
          end loop;
          Data.Buckets (B) := null;
        end loop;
        Data.Length := 0;
      end;
    procedure Adjust (Container : in out Set) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Length > 0 then
          Container.Data := Clone (Source);
        end if;
      end;
    procedure Finalize (Container : in out Set) is
      begin
        if Container.Data /= null then
          Release_Nodes (Container.Data);
          Free (Container.Data.Buckets);
          Free (Container.Data);
        end if;
      end;
    function Find_Node (Container : Set; Item : Element_Type) return Node_Access is
      Code : Hash_Type;
      Node : Node_Access;
      begin
        if Container.Data = null or else Container.Data.Length = 0 then
          return null;
        end if;
        Code := Hash (Item);
        Node := Container.Data.Buckets (Slot (Container.Data, Code));
        while Node /= null loop
          if Node.Hash = Code and then Equivalent_Elements (Node.Element, Item) then
            return Node;
          end if;
          Node := Node.Next;
        end loop;
        return null;
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Position.Node /= null;
      end;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is
      begin
        return Position.Node /= null and then Position.Data = Container.Data;
      end;
    function "=" (Left, Right : Set) return Boolean is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        if Length (Left) /= Length (Right) then
          return False;
        end if;
        if Length (Left) = 0 then
          return True;
        end if;
        for B in Left.Data.Buckets'Range loop
          Node := Left.Data.Buckets (B);
          while Node /= null loop
            Found := Find_Node (Right, Node.Element);
            if Found = null or else not (Found.Element = Node.Element) then
              return False;
            end if;
            Node := Node.Next;
          end loop;
        end loop;
        return True;
      end;
    function Equivalent_Sets (Left, Right : Set) return Boolean is
      begin
        return Length (Left) = Length (Right) and then Is_Subset (Left, Right);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is
      begin
        return Container.Data /= null and then (Container.Data.Busy > 0 or else Container.Data.Lock > 0);
      end;
    function Capacity (Container : Set) return Count_Type is
      begin
        if Container.Data = null or else Container.Data.Buckets = null then
          return 0;
        end if;
        return Container.Data.Buckets'Length;
      end;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) is
      begin
        if Capacity > Hashed_Sets.Capacity (Container) then
          Check_Cursors (Container);
          if Container.Data = null then
            Container.Data := new Shared;
          end if;
          Resize (Container.Data, Capacity);
        end if;
      end;
    function Empty (Capacity : Count_Type := 10) return Set is
      Result : Set;
      begin
        Reserve_Capacity (Result, Capacity);
        return Result;
      end;
    function To_Set (New_Item : Element_Type) return Set is
      Result : Set;
      begin
        Insert (Result, New_Item);
        return Result;
      end;
    function Length (Container : Set) return Count_Type is
      begin
        if Container.Data = null then
          return 0;
        end if;
        return Container.Data.Length;
      end;
    function Is_Empty (Container : Set) return Boolean is
      begin
        return Length (Container) = 0;
      end;
    procedure Clear (Container : in out Set) is
      begin
        Check_Cursors (Container);
        if Container.Data /= null then
          Release_Nodes (Container.Data);
        end if;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        return Position.Node.Element;
      end;
    function Element (Container : Set; Position : Cursor) return Element_Type is
      begin
        Check_Position (Container, Position);
        return Position.Node.Element;
      end;
    procedure Link (Container : in out Set; Node : Node_Access) is
      Index : Hash_Type;
      begin
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
        if Container.Data.Buckets = null then
          Resize (Container.Data, 31);
        elsif Container.Data.Length >= Container.Data.Buckets'Length then
          Resize (Container.Data, 2 * Container.Data.Buckets'Length + 1);
        end if;
        Index := Slot (Container.Data, Node.Hash);
        Node.Next := Container.Data.Buckets (Index);
        Container.Data.Buckets (Index) := Node;
        Container.Data.Length := Container.Data.Length + 1;
      end;
    procedure Unlink (Container : in out Set; Node : Node_Access) is
      Index : constant Hash_Type := Slot (Container.Data, Node.Hash);
      Prior : Node_Access;
      begin
        if Container.Data.Buckets (Index) = Node then
          Container.Data.Buckets (Index) := Node.Next;
        else
          Prior := Container.Data.Buckets (Index);
          while Prior.Next /= Node loop
            Prior := Prior.Next;
          end loop;
          Prior.Next := Node.Next;
        end if;
        Node.Next := null;
        Container.Data.Length := Container.Data.Length - 1;
      end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        Check_Position (Container, Position);
        Node := Position.Node;
        Found := Find_Node (Container, New_Item);
        if Found = Node then
          if Container.Data.Lock > 0 then
            raise Program_Error;
          end if;
          Node.Element := New_Item;
          return;
        end if;
        if Found /= null then
          raise Program_Error;
        end if;
        Check_Cursors (Container);
        Unlink (Container, Node);
        Node.Element := New_Item;
        Node.Hash := Hash (New_Item);
        Link (Container, Node);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      Data : constant Shared_Access := Position.Data;
      begin
        if Position.Node = null then
          raise Constraint_Error;
        end if;
        Data.Lock := Data.Lock + 1;
        begin
          Process (Position.Node.Element);
        exception
          when others =>
            Data.Lock := Data.Lock - 1;
            raise;
        end;
        Data.Lock := Data.Lock - 1;
      end;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      begin
        Check_Position (Container, Position);
        return (Element => Position.Node.Element'Access);
      end;
    procedure Assign (Target : in out Set; Source : Set) is
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Clear (Target);
        Reserve_Capacity (Target, Length (Source));
        Union (Target, Source);
      end;
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set is
      Result : Set;
      begin
        if Capacity /= 0 and then Capacity < Length (Source) then
          raise Capacity_Error;
        end if;
        Reserve_Capacity (Result, Count_Type'Max (Capacity, Length (Source)));
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out Set; Source : in out Set) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Cursors (Target);
        Check_Cursors (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      Node : Node_Access := Find_Node (Container, New_Item);
      begin
        if Node /= null then
          Position := (Container.Data, Node);
          Inserted := False;
          return;
        end if;
        Check_Cursors (Container);
        Node := new Node_Type'(Next => null, Hash => Hash (New_Item), Element => New_Item);
        Link (Container, Node);
        Position := (Container.Data, Node);
        Inserted := True;
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, New_Item, Position, Inserted);
        if not Inserted then
          raise Constraint_Error;
        end if;
      end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is
      Position : Cursor;
      Inserted : Boolean;
      begin
        Insert (Container, New_Item, Position, Inserted);
        if not Inserted then
          if Container.Data.Lock > 0 then
            raise Program_Error;
          end if;
          Position.Node.Element := New_Item;
        end if;
      end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is
      Node : constant Node_Access := Find_Node (Container, New_Item);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        if Container.Data.Lock > 0 then
          raise Program_Error;
        end if;
        Node.Element := New_Item;
      end;
    procedure Remove (Container : in out Set; Node : in out Node_Access) is
      begin
        Check_Cursors (Container);
        Unlink (Container, Node);
        Free (Node);
      end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is
      Node : Node_Access := Find_Node (Container, Item);
      begin
        if Node /= null then
          Remove (Container, Node);
        end if;
      end;
    procedure Delete (Container : in out Set; Item : Element_Type) is
      Node : Node_Access := Find_Node (Container, Item);
      begin
        if Node = null then
          raise Constraint_Error;
        end if;
        Remove (Container, Node);
      end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is
      Node : Node_Access := Position.Node;
      begin
        Check_Position (Container, Position);
        Remove (Container, Node);
        Position := No_Element;
      end;
    procedure Union (Target : in out Set; Source : Set) is
      Node     : Node_Access;
      Position : Cursor;
      Inserted : Boolean;
      begin
        if Target.Data = Source.Data or else Length (Source) = 0 then
          return;
        end if;
        for B in Source.Data.Buckets'Range loop
          Node := Source.Data.Buckets (B);
          while Node /= null loop
            Insert (Target, Node.Element, Position, Inserted);
            Node := Node.Next;
          end loop;
        end loop;
      end;
    function Union (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Union (Result, Right);
        return Result;
      end;
    procedure Intersection (Target : in out Set; Source : Set) is
      Node : Node_Access;
      Next : Node_Access;
      begin
        if Target.Data = Source.Data or else Length (Target) = 0 then
          return;
        end if;
        for B in Target.Data.Buckets'Range loop
          Node := Target.Data.Buckets (B);
          while Node /= null loop
            Next := Node.Next;
            if Find_Node (Source, Node.Element) = null then
              Remove (Target, Node);
            end if;
            Node := Next;
          end loop;
        end loop;
      end;
    function Intersection (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Intersection (Result, Right);
        return Result;
      end;
    procedure Difference (Target : in out Set; Source : Set) is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        if Target.Data = Source.Data then
          Clear (Target);
          return;
        end if;
        if Length (Source) = 0 then
          return;
        end if;
        for B in Source.Data.Buckets'Range loop
          Node := Source.Data.Buckets (B);
          while Node /= null loop
            Found := Find_Node (Target, Node.Element);
            if Found /= null then
              Remove (Target, Found);
            end if;
            Node := Node.Next;
          end loop;
        end loop;
      end;
    function Difference (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Difference (Result, Right);
        return Result;
      end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is
      Node  : Node_Access;
      Found : Node_Access;
      begin
        if Target.Data = Source.Data then
          Clear (Target);
          return;
        end if;
        if Length (Source) = 0 then
          return;
        end if;
        for B in Source.Data.Buckets'Range loop
          Node := Source.Data.Buckets (B);
          while Node /= null loop
            Found := Find_Node (Target, Node.Element);
            if Found /= null then
              Remove (Target, Found);
            else
              Insert (Target, Node.Element);
            end if;
            Node := Node.Next;
          end loop;
        end loop;
      end;
    function Symmetric_Difference (Left, Right : Set) return Set is
      Result : Set := Left;
      begin
        Symmetric_Difference (Result, Right);
        return Result;
      end;
    function Overlap (Left, Right : Set) return Boolean is
      Node : Node_Access;
      begin
        if Length (Left) = 0 then
          return False;
        end if;
        for B in Left.Data.Buckets'Range loop
          Node := Left.Data.Buckets (B);
          while Node /= null loop
            if Find_Node (Right, Node.Element) /= null then
              return True;
            end if;
            Node := Node.Next;
          end loop;
        end loop;
        return False;
      end;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is
      Node : Node_Access;
      begin
        if Length (Subset) = 0 then
          return True;
        end if;
        for B in Subset.Data.Buckets'Range loop
          Node := Subset.Data.Buckets (B);
          while Node /= null loop
            if Find_Node (Of_Set, Node.Element) = null then
              return False;
            end if;
            Node := Node.Next;
          end loop;
        end loop;
        return True;
      end;
    function First_From (Data : Shared_Access; Index : Hash_Type) return Cursor is
      begin
        if Data = null or else Data.Buckets = null then
          return No_Element;
        end if;
        for B in Index .. Data.Buckets'Last loop
          if Data.Buckets (B) /= null then
            return (Data, Data.Buckets (B));
          end if;
        end loop;
        return No_Element;
      end;
    function First (Container : Set) return Cursor is
      begin
        if Length (Container) = 0 then
          return No_Element;
        end if;
        return First_From (Container.Data, 0);
      end;
    function Next (Position : Cursor) return Cursor is
      Index : Hash_Type;
      begin
        if Position.Node = null then
          return No_Element;
        end if;
        if Position.Node.Next /= null then
          return (Position.Data, Position.Node.Next);
        end if;
        Index := Slot (Position.Data, Position.Node.Hash);
        if Index = Position.Data.Buckets'Last then
          return No_Element;
        end if;
        return First_From (Position.Data, Index + 1);
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Position := Next (Position);
      end;
    function Next (Container : Set; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Container.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    procedure Next (Container : Set; Position : in out Cursor) is
      begin
        Position := Next (Container, Position);
      end;
    function Find (Container : Set; Item : Element_Type) return Cursor is
      Node : constant Node_Access := Find_Node (Container, Item);
      begin
        if Node = null then
          return No_Element;
        end if;
        return (Container.Data, Node);
      end;
    function Contains (Container : Set; Item : Element_Type) return Boolean is
      begin
        return Find_Node (Container, Item) /= null;
      end;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean is
      begin
        return Equivalent_Elements (Element (Left), Element (Right));
      end;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Equivalent_Elements (Element (Left), Right);
      end;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Equivalent_Elements (Left, Element (Right));
      end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      Data     : constant Shared_Access := Container.Data;
      Position : Cursor;
      begin
        if Data = null then
          return;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          Position := First (Container);
          while Position.Node /= null loop
            Process (Position);
            Position := Next (Position);
          end loop;
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    function Iterate (Container : Set) return Set_Iterator is
      begin
        return (Data => Container.Data);
      end;
    function First (Object : Set_Iterator) return Cursor is
      begin
        if Object.Data = null or else Object.Data.Length = 0 then
          return No_Element;
        end if;
        return First_From (Object.Data, 0);
      end;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        if Position.Node /= null and then Position.Data /= Object.Data then
          raise Program_Error;
        end if;
        return Next (Position);
      end;
    package body Generic_Keys is
      function Find_Key (Container : Set; Key : Key_Type) return Node_Access is
        Code : Hash_Type;
        Node : Node_Access;
        begin
          if Container.Data = null or else Container.Data.Length = 0 then
            return null;
          end if;
          Code := Hash (Key);
          Node := Container.Data.Buckets (Slot (Container.Data, Code));
          while Node /= null loop
            if Equivalent_Keys (Generic_Keys.Key (Node.Element), Key) then
              return Node;
            end if;
            Node := Node.Next;
          end loop;
          return null;
        end;
      function Key (Position : Cursor) return Key_Type is
        begin
          if Position.Node = null then
            raise Constraint_Error;
          end if;
          return Key (Position.Node.Element);
        end;
      function Element (Container : Set; Key : Key_Type) return Element_Type is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          return Node.Element;
        end;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          Replace_Element (Container, (Container.Data, Node), New_Item);
        end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is
        Node : Node_Access := Find_Key (Container, Key);
        begin
          if Node /= null then
            Remove (Container, Node);
          end if;
        end;
      procedure Delete (Container : in out Set; Key : Key_Type) is
        Node : Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          Remove (Container, Node);
        end;
      function Find (Container : Set; Key : Key_Type) return Cursor is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            return No_Element;
          end if;
          return (Container.Data, Node);
        end;
      function Contains (Container : Set; Key : Key_Type) return Boolean is
        begin
          return Find_Key (Container, Key) /= null;
        end;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type)) is
        Node : Node_Access;
        begin
          Check_Position (Container, Position);
          Node := Position.Node;
          declare
            Before : constant Key_Type := Key (Node.Element);
            Data   : constant Shared_Access := Container.Data;
            begin
              Data.Lock := Data.Lock + 1;
              begin
                Process (Node.Element);
              exception
                when others =>
                  Data.Lock := Data.Lock - 1;
                  raise;
              end;
              Data.Lock := Data.Lock - 1;
              if not Equivalent_Keys (Before, Key (Node.Element)) then
                Remove (Container, Node);
                raise Program_Error;
              end if;
            end;
        end;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        begin
          Check_Position (Container, Position);
          return (Element => Position.Node.Element'Access);
        end;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          return (Element => Node.Element'Access);
        end;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        Node : constant Node_Access := Find_Key (Container, Key);
        begin
          if Node = null then
            raise Constraint_Error;
          end if;
          return (Element => Node.Element'Access);
        end;
    end;
  end;
  package body Indefinite_Holders is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    procedure Check_Element (Container : Holder) is
      begin
        if Container.Data /= null and then Container.Data.Busy > 0 then
          raise Program_Error;
        end if;
      end;
    procedure Adjust (Container : in out Holder) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Element /= null then
          Container.Data := new Shared;
          Container.Data.Element := new Element_Type'(Source.Element.all);
        end if;
      end;
    procedure Finalize (Container : in out Holder) is
      begin
        if Container.Data /= null then
          Free (Container.Data.Element);
          Free (Container.Data);
        end if;
      end;
    function Is_Empty (Container : Holder) return Boolean is
      begin
        return Container.Data = null or else Container.Data.Element = null;
      end;
    function "=" (Left, Right : Holder) return Boolean is
      begin
        if Is_Empty (Left) or else Is_Empty (Right) then
          return Is_Empty (Left) and then Is_Empty (Right);
        end if;
        return Left.Data.Element.all = Right.Data.Element.all;
      end;
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean is
      begin
        return Container.Data /= null and then Container.Data.Busy > 0;
      end;
    function Empty return Holder is
      begin
        return Empty_Holder;
      end;
    function To_Holder (New_Item : Element_Type) return Holder is
      Result : Holder;
      begin
        Replace_Element (Result, New_Item);
        return Result;
      end;
    procedure Clear (Container : in out Holder) is
      begin
        Check_Element (Container);
        if Container.Data /= null then
          Free (Container.Data.Element);
        end if;
      end;
    function Element (Container : Holder) return Element_Type is
      begin
        if Is_Empty (Container) then
          raise Constraint_Error;
        end if;
        return Container.Data.Element.all;
      end;
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) is
      Fresh : constant Element_Access := new Element_Type'(New_Item);
      begin
        Check_Element (Container);
        if Container.Data = null then
          Container.Data := new Shared;
        end if;
        Free (Container.Data.Element);
        Container.Data.Element := Fresh;
      end;
    procedure Query_Element (Container : Holder;
                             Process   : not null access procedure (Element : Element_Type)) is
      Data : constant Shared_Access := Container.Data;
      begin
        if Is_Empty (Container) then
          raise Constraint_Error;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          Process (Data.Element.all);
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    procedure Update_Element (Container : in out Holder;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      Data : constant Shared_Access := Container.Data;
      begin
        if Is_Empty (Container) then
          raise Constraint_Error;
        end if;
        Data.Busy := Data.Busy + 1;
        begin
          Process (Data.Element.all);
        exception
          when others =>
            Data.Busy := Data.Busy - 1;
            raise;
        end;
        Data.Busy := Data.Busy - 1;
      end;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type is
      begin
        if Is_Empty (Container) then
          raise Constraint_Error;
        end if;
        return (Element => Container.Data.Element);
      end;
    function Reference (Container : in out Holder) return Reference_Type is
      begin
        if Is_Empty (Container) then
          raise Constraint_Error;
        end if;
        return (Element => Container.Data.Element);
      end;
    procedure Assign (Target : in out Holder; Source : Holder) is
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        if Is_Empty (Source) then
          Clear (Target);
        else
          Replace_Element (Target, Source.Data.Element.all);
        end if;
      end;
    function Copy (Source : Holder) return Holder is
      Result : Holder;
      begin
        Assign (Result, Source);
        return Result;
      end;
    procedure Move (Target : in out Holder; Source : in out Holder) is
      Held : Shared_Access;
      begin
        if Target.Data = Source.Data then
          return;
        end if;
        Check_Element (Target);
        Check_Element (Source);
        Held := Target.Data;
        Target.Data := Source.Data;
        Source.Data := Held;
        Clear (Source);
      end;
    procedure Swap (Left, Right : in out Holder) is
      Held : Shared_Access;
      begin
        Check_Element (Left);
        Check_Element (Right);
        Held := Left.Data;
        Left.Data := Right.Data;
        Right.Data := Held;
      end;
  end;
  package body Indefinite_Vectors is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Adjust (Object : in out Element_Holder) is
      begin
        if Object.Element /= null then
          Object.Element := new Element_Type'(Object.Element.all);
        end if;
      end;
    procedure Finalize (Object : in out Element_Holder) is
      begin
        Free (Object.Element);
      end;
    function "=" (Left, Right : Element_Holder) return Boolean is
      begin
        if Left.Element = null or else Right.Element = null then
          return Left.Element = null and then Right.Element = null;
        end if;
        return Left.Element.all = Right.Element.all;
      end;
    function To_Holder (New_Item : Element_Type) return Element_Holder is
      begin
        return (Element => new Element_Type'(New_Item));
      end;
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Vector) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Maximum_Length return Count_Type is
      begin
        return Implementation.Maximum_Length;
      end;
    function Empty (Capacity : Count_Type := 10) return Vector is
      begin
        return (Items => Implementation.Empty (Capacity));
      end;
    function To_Vector (Length : Count_Type) return Vector is
      begin
        return (Items => Implementation.To_Vector (Length));
      end;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector is
      begin
        return (Items => Implementation.To_Vector (To_Holder (New_Item), Length));
      end;
    function "&" (Left, Right : Vector) return Vector is
      begin
        return (Items => Implementation."&" (Left.Items, Right.Items));
      end;
    function "&" (Left : Vector; Right : Element_Type) return Vector is
      begin
        return (Items => Implementation."&" (Left.Items, To_Holder (Right)));
      end;
    function "&" (Left : Element_Type; Right : Vector) return Vector is
      begin
        return (Items => Implementation."&" (To_Holder (Left), Right.Items));
      end;
    function "&" (Left, Right : Element_Type) return Vector is
      begin
        return (Items => Implementation."&" (To_Holder (Left), To_Holder (Right)));
      end;
    function Capacity (Container : Vector) return Count_Type is
      begin
        return Implementation.Capacity (Container.Items);
      end;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) is
      begin
        Implementation.Reserve_Capacity (Container.Items, Capacity);
      end;
    function Length (Container : Vector) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    procedure Set_Length (Container : in out Vector; Length : Count_Type) is
      begin
        Implementation.Set_Length (Container.Items, Length);
      end;
    function Is_Empty (Container : Vector) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Vector) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor is
      begin
        return Wrap (Implementation.To_Cursor (Container.Items, Index));
      end;
    function To_Index (Position : Cursor) return Extended_Index is
      begin
        return Implementation.To_Index (Position.Item);
      end;
    function Element (Container : Vector; Index : Index_Type) return Element_Type is
      begin
        return Implementation.Constant_Reference (Container.Items, Index).Element.Element.all;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item).Element.all;
      end;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Index, To_Holder (New_Item));
      end;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, To_Holder (New_Item));
      end;
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type)) is
      procedure Visit (Item : Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Query_Element (Container.Items, Index, Visit'Access);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      procedure Visit (Item : Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Query_Element (Position.Item, Visit'Access);
      end;
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      procedure Visit (Item : in out Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Update_Element (Container.Items, Index, Visit'Access);
      end;
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      procedure Visit (Item : in out Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Visit'Access);
      end;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Index).Element.Element);
      end;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Index).Element.Element);
      end;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.Element);
      end;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.Element);
      end;
    procedure Assign (Target : in out Vector; Source : Vector) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector is
      begin
        return (Items => Implementation.Copy (Source.Items, Capacity));
      end;
    procedure Move (Target : in out Vector; Source : in out Vector) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      begin
        Implementation.Insert_Vector (Container.Items, Before, New_Item.Items);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        Implementation.Insert_Vector (Container.Items, Before.Item, New_Item.Items);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      begin
        Implementation.Insert_Vector (Container.Items, Before.Item, New_Item.Items, Position.Item);
      end;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      begin
        Implementation.Insert_Vector (Container.Items, Before, New_Item.Items);
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        Implementation.Insert_Vector (Container.Items, Before.Item, New_Item.Items);
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      begin
        Implementation.Insert_Vector (Container.Items, Before.Item, New_Item.Items, Position.Item);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        Implementation.Insert (Container.Items, Before, To_Holder (New_Item), Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        Implementation.Insert (Container.Items, Before.Item, To_Holder (New_Item), Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      begin
        Implementation.Insert (Container.Items, Before.Item, To_Holder (New_Item), Position.Item, Count);
      end;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        Implementation.Prepend_Vector (Container.Items, New_Item.Items);
      end;
    procedure Prepend (Container : in out Vector; New_Item : Vector) is
      begin
        Implementation.Prepend_Vector (Container.Items, New_Item.Items);
      end;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        Implementation.Prepend (Container.Items, To_Holder (New_Item), Count);
      end;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        Implementation.Append_Vector (Container.Items, New_Item.Items);
      end;
    procedure Append (Container : in out Vector; New_Item : Vector) is
      begin
        Implementation.Append_Vector (Container.Items, New_Item.Items);
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) is
      begin
        Implementation.Append (Container.Items, To_Holder (New_Item), Count);
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type) is
      begin
        Implementation.Append (Container.Items, To_Holder (New_Item));
      end;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1) is
      begin
        Implementation.Insert_Space (Container.Items, Before, Count);
      end;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1) is
      begin
        Implementation.Insert_Space (Container.Items, Before.Item, Position.Item, Count);
      end;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) is
      begin
        Implementation.Delete (Container.Items, Index, Count);
      end;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        Implementation.Delete (Container.Items, Position.Item, Count);
      end;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) is
      begin
        Implementation.Delete_First (Container.Items, Count);
      end;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) is
      begin
        Implementation.Delete_Last (Container.Items, Count);
      end;
    procedure Reverse_Elements (Container : in out Vector) is
      begin
        Implementation.Reverse_Elements (Container.Items);
      end;
    procedure Swap (Container : in out Vector; I, J : Index_Type) is
      begin
        Implementation.Swap (Container.Items, I, J);
      end;
    procedure Swap (Container : in out Vector; I, J : Cursor) is
      begin
        Implementation.Swap (Container.Items, I.Item, J.Item);
      end;
    function First_Index (Container : Vector) return Index_Type is
      begin
        return Implementation.First_Index (Container.Items);
      end;
    function First (Container : Vector) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : Vector) return Element_Type is
      begin
        return Element (Container, Index_Type'First);
      end;
    function Last_Index (Container : Vector) return Extended_Index is
      begin
        return Implementation.Last_Index (Container.Items);
      end;
    function Last (Container : Vector) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : Vector) return Element_Type is
      Last : constant Extended_Index := Last_Index (Container);
      begin
        if Last = No_Index then
          raise Constraint_Error;
        end if;
        return Element (Container, Last);
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Vector; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Vector; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Previous (Container : Vector; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Previous (Container : Vector; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index is
      begin
        return Implementation.Find_Index (Container.Items, To_Holder (Item), Index);
      end;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, To_Holder (Item), Position.Item));
      end;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index is
      begin
        return Implementation.Reverse_Find_Index (Container.Items, To_Holder (Item), Index);
      end;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Reverse_Find (Container.Items, To_Holder (Item), Position.Item));
      end;
    function Contains (Container : Vector; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, To_Holder (Item));
      end;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Vector) return Vector_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : Vector_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : Vector_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    package body Generic_Sorting is
      function Less (Left, Right : Element_Holder) return Boolean is
        begin
          return Left.Element.all < Right.Element.all;
        end;
      package Sorting is new Implementation.Generic_Sorting (Less);
      function Is_Sorted (Container : Vector) return Boolean is
        begin
          return Sorting.Is_Sorted (Container.Items);
        end;
      procedure Sort (Container : in out Vector) is
        begin
          Sorting.Sort (Container.Items);
        end;
      procedure Merge (Target : in out Vector; Source : in out Vector) is
        begin
          Sorting.Merge (Target.Items, Source.Items);
        end;
    end;
  end;
  package body Indefinite_Doubly_Linked_Lists is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Adjust (Object : in out Element_Holder) is
      begin
        if Object.Element /= null then
          Object.Element := new Element_Type'(Object.Element.all);
        end if;
      end;
    procedure Finalize (Object : in out Element_Holder) is
      begin
        Free (Object.Element);
      end;
    function "=" (Left, Right : Element_Holder) return Boolean is
      begin
        if Left.Element = null or else Right.Element = null then
          return Left.Element = null and then Right.Element = null;
        end if;
        return Left.Element.all = Right.Element.all;
      end;
    function To_Holder (New_Item : Element_Type) return Element_Holder is
      begin
        return (Element => new Element_Type'(New_Item));
      end;
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : List; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : List) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Empty return List is
      begin
        return (Items => Implementation.Empty);
      end;
    function Length (Container : List) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : List) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out List) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item).Element.all;
      end;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, To_Holder (New_Item));
      end;
    procedure Assign (Target : in out List; Source : List) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : List) return List is
      begin
        return (Items => Implementation.Copy (Source.Items));
      end;
    procedure Move (Target : in out List; Source : in out List) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        Implementation.Insert (Container.Items, Before.Item, To_Holder (New_Item), Count);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      begin
        Implementation.Insert (Container.Items, Before.Item, To_Holder (New_Item), Position.Item, Count);
      end;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        Implementation.Prepend (Container.Items, To_Holder (New_Item), Count);
      end;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) is
      begin
        Implementation.Append (Container.Items, To_Holder (New_Item), Count);
      end;
    procedure Append (Container : in out List; New_Item : Element_Type) is
      begin
        Implementation.Append (Container.Items, To_Holder (New_Item));
      end;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        Implementation.Delete (Container.Items, Position.Item, Count);
      end;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) is
      begin
        Implementation.Delete_First (Container.Items, Count);
      end;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) is
      begin
        Implementation.Delete_Last (Container.Items, Count);
      end;
    procedure Reverse_Elements (Container : in out List) is
      begin
        Implementation.Reverse_Elements (Container.Items);
      end;
    procedure Swap (Container : in out List; I, J : Cursor) is
      begin
        Implementation.Swap (Container.Items, I.Item, J.Item);
      end;
    procedure Swap_Links (Container : in out List; I, J : Cursor) is
      begin
        Implementation.Swap_Links (Container.Items, I.Item, J.Item);
      end;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) is
      begin
        Implementation.Splice (Target.Items, Before.Item, Source.Items);
      end;
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor) is
      begin
        Implementation.Splice (Target.Items, Before.Item, Source.Items, Position.Item);
      end;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) is
      begin
        Implementation.Splice (Container.Items, Before.Item, Position.Item);
      end;
    function First (Container : List) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : List) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items).Element.all;
      end;
    function Last (Container : List) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : List) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items).Element.all;
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Next (Container : List; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    function Previous (Container : List; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Next (Container : List; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    procedure Previous (Container : List; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, To_Holder (Item), Position.Item));
      end;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Reverse_Find (Container.Items, To_Holder (Item), Position.Item));
      end;
    function Contains (Container : List; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, To_Holder (Item));
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      procedure Visit (Item : Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Query_Element (Position.Item, Visit'Access);
      end;
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      procedure Visit (Item : in out Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Visit'Access);
      end;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.Element);
      end;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.Element);
      end;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : List) return List_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : List; Start : Cursor) return List_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : List_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : List_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : List_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    package body Generic_Sorting is
      function Less (Left, Right : Element_Holder) return Boolean is
        begin
          return Left.Element.all < Right.Element.all;
        end;
      package Sorting is new Implementation.Generic_Sorting (Less);
      function Is_Sorted (Container : List) return Boolean is
        begin
          return Sorting.Is_Sorted (Container.Items);
        end;
      procedure Sort (Container : in out List) is
        begin
          Sorting.Sort (Container.Items);
        end;
      procedure Merge (Target, Source : in out List) is
        begin
          Sorting.Merge (Target.Items, Source.Items);
        end;
    end;
  end;
  package body Indefinite_Ordered_Maps is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Adjust (Object : in out Element_Holder) is
      begin
        if Object.Element /= null then
          Object.Element := new Element_Type'(Object.Element.all);
        end if;
      end;
    procedure Finalize (Object : in out Element_Holder) is
      begin
        Free (Object.Element);
      end;
    function "=" (Left, Right : Element_Holder) return Boolean is
      begin
        if Left.Element = null or else Right.Element = null then
          return Left.Element = null and then Right.Element = null;
        end if;
        return Left.Element.all = Right.Element.all;
      end;
    function To_Holder (New_Item : Element_Type) return Element_Holder is
      begin
        return (Element => new Element_Type'(New_Item));
      end;
    procedure Free is new Unchecked_Deallocation (Key_Type, Key_Access);
    procedure Adjust (Object : in out Key_Holder) is
      begin
        if Object.Key /= null then
          Object.Key := new Key_Type'(Object.Key.all);
        end if;
      end;
    procedure Finalize (Object : in out Key_Holder) is
      begin
        Free (Object.Key);
      end;
    function To_Key (Key : Key_Type) return Key_Holder is
      begin
        return (Key => new Key_Type'(Key));
      end;
    function "<" (Left, Right : Key_Holder) return Boolean is
      begin
        return Left.Key.all < Right.Key.all;
      end;
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean is
      begin
        return not (Left < Right) and then not (Right < Left);
      end;
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Map) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Empty return Map is
      begin
        return (Items => Implementation.Empty);
      end;
    function Length (Container : Map) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Map) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Map) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Key (Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Position.Item).Key.all;
      end;
    function Key (Container : Map; Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Container.Items, Position.Item).Key.all;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item).Element.all;
      end;
    function Element (Container : Map; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item).Element.all;
      end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, To_Holder (New_Item));
      end;
    procedure Assign (Target : in out Map; Source : Map) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : Map) return Map is
      begin
        return (Items => Implementation.Copy (Source.Items));
      end;
    procedure Move (Target : in out Map; Source : in out Map) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        Implementation.Insert (Container.Items, To_Key (Key), To_Holder (New_Item), Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type) is
      begin
        Implementation.Insert (Container.Items, To_Key (Key), To_Holder (New_Item));
      end;
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        Implementation.Include (Container.Items, To_Key (Key), To_Holder (New_Item));
      end;
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        Implementation.Replace (Container.Items, To_Key (Key), To_Holder (New_Item));
      end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Exclude (Container.Items, To_Key (Key));
      end;
    procedure Delete (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Delete (Container.Items, To_Key (Key));
      end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    procedure Delete_First (Container : in out Map) is
      begin
        Implementation.Delete_First (Container.Items);
      end;
    procedure Delete_Last (Container : in out Map) is
      begin
        Implementation.Delete_Last (Container.Items);
      end;
    function First (Container : Map) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : Map) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items).Element.all;
      end;
    function First_Key (Container : Map) return Key_Type is
      begin
        return Implementation.First_Key (Container.Items).Key.all;
      end;
    function Last (Container : Map) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : Map) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items).Element.all;
      end;
    function Last_Key (Container : Map) return Key_Type is
      begin
        return Implementation.Last_Key (Container.Items).Key.all;
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Map; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Map; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Previous (Container : Map; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Previous (Container : Map; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, To_Key (Key)));
      end;
    function Element (Container : Map; Key : Key_Type) return Element_Type is
      begin
        return Implementation.Element (Container.Items, To_Key (Key)).Element.all;
      end;
    function Floor (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Floor (Container.Items, To_Key (Key)));
      end;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Ceiling (Container.Items, To_Key (Key)));
      end;
    function Contains (Container : Map; Key : Key_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, To_Key (Key));
      end;
    function "<" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation."<" (Left.Item, Right.Item);
      end;
    function ">" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.">" (Left.Item, Right.Item);
      end;
    function "<" (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Implementation."<" (Left.Item, To_Key (Right));
      end;
    function ">" (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Implementation.">" (Left.Item, To_Key (Right));
      end;
    function "<" (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Implementation."<" (To_Key (Left), Right.Item);
      end;
    function ">" (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.">" (To_Key (Left), Right.Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      procedure Visit (Key : Key_Holder; Element : Element_Holder) is
        begin
          Process (Key.Key.all, Element.Element.all);
        end;
      begin
        Implementation.Query_Element (Position.Item, Visit'Access);
      end;
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      procedure Visit (Key : Key_Holder; Element : in out Element_Holder) is
        begin
          Process (Key.Key.all, Element.Element.all);
        end;
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Visit'Access);
      end;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.Element);
      end;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.Element);
      end;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, To_Key (Key)).Element.Element);
      end;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, To_Key (Key)).Element.Element);
      end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Map) return Map_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : Map_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : Map_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
  end;
  package body Indefinite_Hashed_Maps is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Adjust (Object : in out Element_Holder) is
      begin
        if Object.Element /= null then
          Object.Element := new Element_Type'(Object.Element.all);
        end if;
      end;
    procedure Finalize (Object : in out Element_Holder) is
      begin
        Free (Object.Element);
      end;
    function "=" (Left, Right : Element_Holder) return Boolean is
      begin
        if Left.Element = null or else Right.Element = null then
          return Left.Element = null and then Right.Element = null;
        end if;
        return Left.Element.all = Right.Element.all;
      end;
    function To_Holder (New_Item : Element_Type) return Element_Holder is
      begin
        return (Element => new Element_Type'(New_Item));
      end;
    procedure Free is new Unchecked_Deallocation (Key_Type, Key_Access);
    procedure Adjust (Object : in out Key_Holder) is
      begin
        if Object.Key /= null then
          Object.Key := new Key_Type'(Object.Key.all);
        end if;
      end;
    procedure Finalize (Object : in out Key_Holder) is
      begin
        Free (Object.Key);
      end;
    function To_Key (Key : Key_Type) return Key_Holder is
      begin
        return (Key => new Key_Type'(Key));
      end;
    function Hash_Key (Key : Key_Holder) return Hash_Type is
      begin
        return Hash (Key.Key.all);
      end;
    function Equivalent_Key_Holders (Left, Right : Key_Holder) return Boolean is
      begin
        return Equivalent_Keys (Left.Key.all, Right.Key.all);
      end;
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Map) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Empty (Capacity : Count_Type := 10) return Map is
      begin
        return (Items => Implementation.Empty (Capacity));
      end;
    function Capacity (Container : Map) return Count_Type is
      begin
        return Implementation.Capacity (Container.Items);
      end;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) is
      begin
        Implementation.Reserve_Capacity (Container.Items, Capacity);
      end;
    function Length (Container : Map) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Map) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Map) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Key (Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Position.Item).Key.all;
      end;
    function Key (Container : Map; Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Container.Items, Position.Item).Key.all;
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item).Element.all;
      end;
    function Element (Container : Map; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item).Element.all;
      end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, To_Holder (New_Item));
      end;
    procedure Assign (Target : in out Map; Source : Map) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map is
      begin
        return (Items => Implementation.Copy (Source.Items, Capacity));
      end;
    procedure Move (Target : in out Map; Source : in out Map) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        Implementation.Insert (Container.Items, To_Key (Key), To_Holder (New_Item), Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type) is
      begin
        Implementation.Insert (Container.Items, To_Key (Key), To_Holder (New_Item));
      end;
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        Implementation.Include (Container.Items, To_Key (Key), To_Holder (New_Item));
      end;
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        Implementation.Replace (Container.Items, To_Key (Key), To_Holder (New_Item));
      end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Exclude (Container.Items, To_Key (Key));
      end;
    procedure Delete (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Delete (Container.Items, To_Key (Key));
      end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    function First (Container : Map) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Map; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Map; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Find (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, To_Key (Key)));
      end;
    function Element (Container : Map; Key : Key_Type) return Element_Type is
      begin
        return Implementation.Element (Container.Items, To_Key (Key)).Element.all;
      end;
    function Contains (Container : Map; Key : Key_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, To_Key (Key));
      end;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Keys (Left.Item, Right.Item);
      end;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Implementation.Equivalent_Keys (Left.Item, To_Key (Right));
      end;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Keys (To_Key (Left), Right.Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      procedure Visit (Key : Key_Holder; Element : Element_Holder) is
        begin
          Process (Key.Key.all, Element.Element.all);
        end;
      begin
        Implementation.Query_Element (Position.Item, Visit'Access);
      end;
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      procedure Visit (Key : Key_Holder; Element : in out Element_Holder) is
        begin
          Process (Key.Key.all, Element.Element.all);
        end;
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Visit'Access);
      end;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.Element);
      end;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.Element);
      end;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, To_Key (Key)).Element.Element);
      end;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, To_Key (Key)).Element.Element);
      end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Map) return Map_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items));
      end;
    function First (Object : Map_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
  end;
  package body Indefinite_Ordered_Sets is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Adjust (Object : in out Element_Holder) is
      begin
        if Object.Element /= null then
          Object.Element := new Element_Type'(Object.Element.all);
        end if;
      end;
    procedure Finalize (Object : in out Element_Holder) is
      begin
        Free (Object.Element);
      end;
    function "=" (Left, Right : Element_Holder) return Boolean is
      begin
        if Left.Element = null or else Right.Element = null then
          return Left.Element = null and then Right.Element = null;
        end if;
        return Left.Element.all = Right.Element.all;
      end;
    function To_Holder (New_Item : Element_Type) return Element_Holder is
      begin
        return (Element => new Element_Type'(New_Item));
      end;
    function "<" (Left, Right : Element_Holder) return Boolean is
      begin
        return Left.Element.all < Right.Element.all;
      end;
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean is
      begin
        return not (Left < Right) and then not (Right < Left);
      end;
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Set) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Equivalent_Sets (Left, Right : Set) return Boolean is
      begin
        return Implementation.Equivalent_Sets (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Empty return Set is
      begin
        return (Items => Implementation.Empty);
      end;
    function To_Set (New_Item : Element_Type) return Set is
      begin
        return (Items => Implementation.To_Set (To_Holder (New_Item)));
      end;
    function Length (Container : Set) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Set) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Set) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item).Element.all;
      end;
    function Element (Container : Set; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item).Element.all;
      end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, To_Holder (New_Item));
      end;
    procedure Assign (Target : in out Set; Source : Set) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : Set) return Set is
      begin
        return (Items => Implementation.Copy (Source.Items));
      end;
    procedure Move (Target : in out Set; Source : in out Set) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        Implementation.Insert (Container.Items, To_Holder (New_Item), Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Insert (Container.Items, To_Holder (New_Item));
      end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Include (Container.Items, To_Holder (New_Item));
      end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Replace (Container.Items, To_Holder (New_Item));
      end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Exclude (Container.Items, To_Holder (Item));
      end;
    procedure Delete (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Delete (Container.Items, To_Holder (Item));
      end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    procedure Delete_First (Container : in out Set) is
      begin
        Implementation.Delete_First (Container.Items);
      end;
    procedure Delete_Last (Container : in out Set) is
      begin
        Implementation.Delete_Last (Container.Items);
      end;
    procedure Union (Target : in out Set; Source : Set) is
      begin
        Implementation.Union (Target.Items, Source.Items);
      end;
    function Union (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Union (Left.Items, Right.Items));
      end;
    procedure Intersection (Target : in out Set; Source : Set) is
      begin
        Implementation.Intersection (Target.Items, Source.Items);
      end;
    function Intersection (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Intersection (Left.Items, Right.Items));
      end;
    procedure Difference (Target : in out Set; Source : Set) is
      begin
        Implementation.Difference (Target.Items, Source.Items);
      end;
    function Difference (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Difference (Left.Items, Right.Items));
      end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is
      begin
        Implementation.Symmetric_Difference (Target.Items, Source.Items);
      end;
    function Symmetric_Difference (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Symmetric_Difference (Left.Items, Right.Items));
      end;
    function Overlap (Left, Right : Set) return Boolean is
      begin
        return Implementation.Overlap (Left.Items, Right.Items);
      end;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is
      begin
        return Implementation.Is_Subset (Subset.Items, Of_Set.Items);
      end;
    function First (Container : Set) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : Set) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items).Element.all;
      end;
    function Last (Container : Set) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : Set) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items).Element.all;
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Set; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Set; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Previous (Container : Set; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Previous (Container : Set; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, To_Holder (Item)));
      end;
    function Floor (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Floor (Container.Items, To_Holder (Item)));
      end;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Ceiling (Container.Items, To_Holder (Item)));
      end;
    function Contains (Container : Set; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, To_Holder (Item));
      end;
    function "<" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation."<" (Left.Item, Right.Item);
      end;
    function ">" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.">" (Left.Item, Right.Item);
      end;
    function "<" (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Implementation."<" (Left.Item, To_Holder (Right));
      end;
    function ">" (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Implementation.">" (Left.Item, To_Holder (Right));
      end;
    function "<" (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Implementation."<" (To_Holder (Left), Right.Item);
      end;
    function ">" (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.">" (To_Holder (Left), Right.Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      procedure Visit (Item : Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Query_Element (Position.Item, Visit'Access);
      end;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.Element);
      end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Set) return Set_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : Set_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : Set_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    package body Generic_Keys is
      function Key_Of (Item : Element_Holder) return Key_Type is
        begin
          return Key (Item.Element.all);
        end;
      package Keys is new Implementation.Generic_Keys (Key_Type, Key_Of, "<");
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean is
        begin
          return not (Left < Right) and then not (Right < Left);
        end;
      function Key (Position : Cursor) return Key_Type is
        begin
          return Keys.Key (Position.Item);
        end;
      function Element (Container : Set; Key : Key_Type) return Element_Type is
        begin
          return Keys.Element (Container.Items, Key).Element.all;
        end;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
        begin
          Keys.Replace (Container.Items, Key, To_Holder (New_Item));
        end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Exclude (Container.Items, Key);
        end;
      procedure Delete (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Delete (Container.Items, Key);
        end;
      function Find (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Find (Container.Items, Key));
        end;
      function Contains (Container : Set; Key : Key_Type) return Boolean is
        begin
          return Keys.Contains (Container.Items, Key);
        end;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type)) is
        procedure Visit (Item : in out Element_Holder) is
          begin
            Process (Item.Element.all);
          end;
        begin
          Keys.Update_Element_Preserving_Key (Container.Items, Position.Item, Visit'Access);
        end;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Position.Item).Element.Element);
        end;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        begin
          return (Element => Keys.Constant_Reference (Container.Items, Key).Element.Element);
        end;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Key).Element.Element);
        end;
      function Floor (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Floor (Container.Items, Key));
        end;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Ceiling (Container.Items, Key));
        end;
    end;
  end;
  package body Indefinite_Hashed_Sets is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Adjust (Object : in out Element_Holder) is
      begin
        if Object.Element /= null then
          Object.Element := new Element_Type'(Object.Element.all);
        end if;
      end;
    procedure Finalize (Object : in out Element_Holder) is
      begin
        Free (Object.Element);
      end;
    function "=" (Left, Right : Element_Holder) return Boolean is
      begin
        if Left.Element = null or else Right.Element = null then
          return Left.Element = null and then Right.Element = null;
        end if;
        return Left.Element.all = Right.Element.all;
      end;
    function To_Holder (New_Item : Element_Type) return Element_Holder is
      begin
        return (Element => new Element_Type'(New_Item));
      end;
    function Hash_Holder (Item : Element_Holder) return Hash_Type is
      begin
        return Hash (Item.Element.all);
      end;
    function Equivalent_Holders (Left, Right : Element_Holder) return Boolean is
      begin
        return Equivalent_Elements (Left.Element.all, Right.Element.all);
      end;
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Set) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Equivalent_Sets (Left, Right : Set) return Boolean is
      begin
        return Implementation.Equivalent_Sets (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Empty (Capacity : Count_Type := 10) return Set is
      begin
        return (Items => Implementation.Empty (Capacity));
      end;
    function To_Set (New_Item : Element_Type) return Set is
      begin
        return (Items => Implementation.To_Set (To_Holder (New_Item)));
      end;
    function Capacity (Container : Set) return Count_Type is
      begin
        return Implementation.Capacity (Container.Items);
      end;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) is
      begin
        Implementation.Reserve_Capacity (Container.Items, Capacity);
      end;
    function Length (Container : Set) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Set) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Set) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item).Element.all;
      end;
    function Element (Container : Set; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item).Element.all;
      end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, To_Holder (New_Item));
      end;
    procedure Assign (Target : in out Set; Source : Set) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set is
      begin
        return (Items => Implementation.Copy (Source.Items, Capacity));
      end;
    procedure Move (Target : in out Set; Source : in out Set) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        Implementation.Insert (Container.Items, To_Holder (New_Item), Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Insert (Container.Items, To_Holder (New_Item));
      end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Include (Container.Items, To_Holder (New_Item));
      end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Replace (Container.Items, To_Holder (New_Item));
      end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Exclude (Container.Items, To_Holder (Item));
      end;
    procedure Delete (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Delete (Container.Items, To_Holder (Item));
      end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    procedure Union (Target : in out Set; Source : Set) is
      begin
        Implementation.Union (Target.Items, Source.Items);
      end;
    function Union (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Union (Left.Items, Right.Items));
      end;
    procedure Intersection (Target : in out Set; Source : Set) is
      begin
        Implementation.Intersection (Target.Items, Source.Items);
      end;
    function Intersection (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Intersection (Left.Items, Right.Items));
      end;
    procedure Difference (Target : in out Set; Source : Set) is
      begin
        Implementation.Difference (Target.Items, Source.Items);
      end;
    function Difference (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Difference (Left.Items, Right.Items));
      end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is
      begin
        Implementation.Symmetric_Difference (Target.Items, Source.Items);
      end;
    function Symmetric_Difference (Left, Right : Set) return Set is
      begin
        return (Items => Implementation.Symmetric_Difference (Left.Items, Right.Items));
      end;
    function Overlap (Left, Right : Set) return Boolean is
      begin
        return Implementation.Overlap (Left.Items, Right.Items);
      end;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is
      begin
        return Implementation.Is_Subset (Subset.Items, Of_Set.Items);
      end;
    function First (Container : Set) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Set; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Set; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Find (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, To_Holder (Item)));
      end;
    function Contains (Container : Set; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, To_Holder (Item));
      end;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Elements (Left.Item, Right.Item);
      end;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Implementation.Equivalent_Elements (Left.Item, To_Holder (Right));
      end;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Elements (To_Holder (Left), Right.Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      procedure Visit (Item : Element_Holder) is
        begin
          Process (Item.Element.all);
        end;
      begin
        Implementation.Query_Element (Position.Item, Visit'Access);
      end;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.Element);
      end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Set) return Set_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items));
      end;
    function First (Object : Set_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    package body Generic_Keys is
      function Key_Of (Item : Element_Holder) return Key_Type is
        begin
          return Key (Item.Element.all);
        end;
      package Keys is new Implementation.Generic_Keys (Key_Type, Key_Of, Hash, Equivalent_Keys);
      function Key (Position : Cursor) return Key_Type is
        begin
          return Keys.Key (Position.Item);
        end;
      function Element (Container : Set; Key : Key_Type) return Element_Type is
        begin
          return Keys.Element (Container.Items, Key).Element.all;
        end;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
        begin
          Keys.Replace (Container.Items, Key, To_Holder (New_Item));
        end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Exclude (Container.Items, Key);
        end;
      procedure Delete (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Delete (Container.Items, Key);
        end;
      function Find (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Find (Container.Items, Key));
        end;
      function Contains (Container : Set; Key : Key_Type) return Boolean is
        begin
          return Keys.Contains (Container.Items, Key);
        end;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type)) is
        procedure Visit (Item : in out Element_Holder) is
          begin
            Process (Item.Element.all);
          end;
        begin
          Keys.Update_Element_Preserving_Key (Container.Items, Position.Item, Visit'Access);
        end;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Position.Item).Element.Element);
        end;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        begin
          return (Element => Keys.Constant_Reference (Container.Items, Key).Element.Element);
        end;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Key).Element.Element);
        end;
    end;
  end;
  package body Bounded_Vectors is
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Vector) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Maximum_Length return Count_Type is
      begin
        return Implementation.Maximum_Length;
      end;
    function Length (Container : Vector) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Vector) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Vector) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor is
      begin
        return Wrap (Implementation.To_Cursor (Container.Items, Index));
      end;
    function To_Index (Position : Cursor) return Extended_Index is
      begin
        return Implementation.To_Index (Position.Item);
      end;
    function Element (Container : Vector; Index : Index_Type) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Index);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item);
      end;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Index, New_Item);
      end;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, New_Item);
      end;
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type)) is
      begin
        Implementation.Query_Element (Container.Items, Index, Process);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      begin
        Implementation.Query_Element (Position.Item, Process);
      end;
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      begin
        Implementation.Update_Element (Container.Items, Index, Process);
      end;
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Process);
      end;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) is
      begin
        Implementation.Delete (Container.Items, Index, Count);
      end;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        Implementation.Delete (Container.Items, Position.Item, Count);
      end;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) is
      begin
        Implementation.Delete_First (Container.Items, Count);
      end;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) is
      begin
        Implementation.Delete_Last (Container.Items, Count);
      end;
    procedure Reverse_Elements (Container : in out Vector) is
      begin
        Implementation.Reverse_Elements (Container.Items);
      end;
    procedure Swap (Container : in out Vector; I, J : Index_Type) is
      begin
        Implementation.Swap (Container.Items, I, J);
      end;
    procedure Swap (Container : in out Vector; I, J : Cursor) is
      begin
        Implementation.Swap (Container.Items, I.Item, J.Item);
      end;
    function First_Index (Container : Vector) return Index_Type is
      begin
        return Implementation.First_Index (Container.Items);
      end;
    function First (Container : Vector) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : Vector) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items);
      end;
    function Last_Index (Container : Vector) return Extended_Index is
      begin
        return Implementation.Last_Index (Container.Items);
      end;
    function Last (Container : Vector) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : Vector) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items);
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Vector; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Vector; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Previous (Container : Vector; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Previous (Container : Vector; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index is
      begin
        return Implementation.Find_Index (Container.Items, Item, Index);
      end;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, Item, Position.Item));
      end;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index is
      begin
        return Implementation.Reverse_Find_Index (Container.Items, Item, Index);
      end;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Reverse_Find (Container.Items, Item, Position.Item));
      end;
    function Contains (Container : Vector; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, Item);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert_Vector (Container.Items, Before, New_Item.Items);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert_Vector (Container.Items, Before.Item, New_Item.Items);
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert_Vector (Container.Items, Before.Item, New_Item.Items, Position.Item);
      end;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before, New_Item.Items);
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, New_Item.Items);
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, New_Item.Items, Position.Item);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before, New_Item, Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, New_Item, Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, New_Item, Position.Item, Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before, Count);
      end;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, Position.Item, Count);
      end;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Prepend_Vector (Container.Items, New_Item.Items);
      end;
    procedure Prepend (Container : in out Vector; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Prepend (Container.Items, New_Item.Items);
      end;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Prepend (Container.Items, New_Item, Count);
      end;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Append_Vector (Container.Items, New_Item.Items);
      end;
    procedure Append (Container : in out Vector; New_Item : Vector) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Length (New_Item)) then
          raise Capacity_Error;
        end if;
        Implementation.Append (Container.Items, New_Item.Items);
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Append (Container.Items, New_Item, Count);
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (1) then
          raise Capacity_Error;
        end if;
        Implementation.Append (Container.Items, New_Item);
      end;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert_Space (Container.Items, Before, Count);
      end;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert_Space (Container.Items, Before.Item, Position.Item, Count);
      end;
    function Capacity (Container : Vector) return Count_Type is
      begin
        return Container.Capacity;
      end;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) is
      begin
        if Capacity > Container.Capacity then
          raise Capacity_Error;
        end if;
      end;
    procedure Set_Length (Container : in out Vector; Length : Count_Type) is
      begin
        if Length > Container.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Set_Length (Container.Items, Length);
      end;
    function Empty (Capacity : Count_Type := 10) return Vector is
      begin
        return (Capacity => Capacity, Items => Implementation.Empty (Capacity));
      end;
    function To_Vector (Length : Count_Type) return Vector is
      begin
        return (Capacity => Length, Items => Implementation.To_Vector (Length));
      end;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector is
      begin
        return (Capacity => Length, Items => Implementation.To_Vector (New_Item, Length));
      end;
    function "&" (Left, Right : Vector) return Vector is
      begin
        return (Capacity => Length (Left) + Length (Right), Items => Implementation."&" (Left.Items, Right.Items));
      end;
    function "&" (Left : Vector; Right : Element_Type) return Vector is
      begin
        return (Capacity => Length (Left) + 1, Items => Implementation."&" (Left.Items, Right));
      end;
    function "&" (Left : Element_Type; Right : Vector) return Vector is
      begin
        return (Capacity => Length (Right) + 1, Items => Implementation."&" (Left, Right.Items));
      end;
    function "&" (Left, Right : Element_Type) return Vector is
      begin
        return (Capacity => 2, Items => Implementation."&" (Left, Right));
      end;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector is
      Wanted : Count_Type := Capacity;
      begin
        if Wanted = 0 then
          Wanted := Length (Source);
        elsif Wanted < Length (Source) then
          raise Capacity_Error;
        end if;
        return (Capacity => Wanted, Items => Implementation.Copy (Source.Items));
      end;
    procedure Assign (Target : in out Vector; Source : Vector) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Source.Items);
      end;
    procedure Move (Target : in out Vector; Source : in out Vector) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Move (Target.Items, Source.Items);
      end;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Index).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Index).Element.all'Unchecked_Access);
      end;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Vector) return Vector_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : Vector_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : Vector_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    package body Generic_Sorting is
      package Sorting is new Implementation.Generic_Sorting ("<");
      function Is_Sorted (Container : Vector) return Boolean is
        begin
          return Sorting.Is_Sorted (Container.Items);
        end;
      procedure Sort (Container : in out Vector) is
        begin
          Sorting.Sort (Container.Items);
        end;
      procedure Merge (Target : in out Vector; Source : in out Vector) is
        begin
          if Length (Target) > Target.Capacity - Length (Source) then
            raise Capacity_Error;
          end if;
          Sorting.Merge (Target.Items, Source.Items);
        end;
    end;
  end;
  package body Bounded_Doubly_Linked_Lists is
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : List; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : List) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Length (Container : List) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : List) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out List) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item);
      end;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, New_Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      begin
        Implementation.Query_Element (Position.Item, Process);
      end;
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Process);
      end;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        Implementation.Delete (Container.Items, Position.Item, Count);
      end;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) is
      begin
        Implementation.Delete_First (Container.Items, Count);
      end;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) is
      begin
        Implementation.Delete_Last (Container.Items, Count);
      end;
    procedure Reverse_Elements (Container : in out List) is
      begin
        Implementation.Reverse_Elements (Container.Items);
      end;
    procedure Swap (Container : in out List; I, J : Cursor) is
      begin
        Implementation.Swap (Container.Items, I.Item, J.Item);
      end;
    procedure Swap_Links (Container : in out List; I, J : Cursor) is
      begin
        Implementation.Swap_Links (Container.Items, I.Item, J.Item);
      end;
    function First (Container : List) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : List) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items);
      end;
    function Last (Container : List) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : List) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items);
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Next (Container : List; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    function Previous (Container : List; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Next (Container : List; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    procedure Previous (Container : List; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, Item, Position.Item));
      end;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      begin
        return Wrap (Implementation.Reverse_Find (Container.Items, Item, Position.Item));
      end;
    function Contains (Container : List; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, Item);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, New_Item, Count);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, New_Item, Position.Item, Count);
      end;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Before.Item, Position.Item, Count);
      end;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Prepend (Container.Items, New_Item, Count);
      end;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (Count) then
          raise Capacity_Error;
        end if;
        Implementation.Append (Container.Items, New_Item, Count);
      end;
    procedure Append (Container : in out List; New_Item : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - (1) then
          raise Capacity_Error;
        end if;
        Implementation.Append (Container.Items, New_Item);
      end;
    function Empty (Capacity : Count_Type := 10) return List is
      begin
        return (Capacity => Capacity, Items => Implementation.Empty);
      end;
    procedure Assign (Target : in out List; Source : List) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Source.Items);
      end;
    procedure Move (Target : in out List; Source : in out List) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Move (Target.Items, Source.Items);
      end;
    function Copy (Source : List; Capacity : Count_Type := 0) return List is
      Wanted : Count_Type := Capacity;
      begin
        if Wanted = 0 then
          Wanted := Length (Source);
        elsif Wanted < Length (Source) then
          raise Capacity_Error;
        end if;
        return (Capacity => Wanted, Items => Implementation.Copy (Source.Items));
      end;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    function Same_List (Target, Source : List) return Boolean is
      begin
        return Implementation.Length (Source.Items) > 0 and then
               Implementation.Has_Element (Target.Items, Implementation.First (Source.Items));
      end;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) is
      begin
        if not Same_List (Target, Source) and then
           Implementation.Length (Target.Items) > Target.Capacity - Implementation.Length (Source.Items) then
          raise Capacity_Error;
        end if;
        Implementation.Splice (Target.Items, Before.Item, Source.Items);
      end;
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor) is
      begin
        if not Same_List (Target, Source) and then
           Implementation.Length (Target.Items) >= Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Splice (Target.Items, Before.Item, Source.Items, Position.Item);
      end;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) is
      begin
        Implementation.Splice (Container.Items, Before.Item, Position.Item);
      end;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : List) return List_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : List; Start : Cursor) return List_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : List_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : List_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : List_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    package body Generic_Sorting is
      package Sorting is new Implementation.Generic_Sorting ("<");
      function Is_Sorted (Container : List) return Boolean is
        begin
          return Sorting.Is_Sorted (Container.Items);
        end;
      procedure Sort (Container : in out List) is
        begin
          Sorting.Sort (Container.Items);
        end;
      procedure Merge (Target, Source : in out List) is
        begin
          if not Same_List (Target, Source) and then
             Implementation.Length (Target.Items) > Target.Capacity - Implementation.Length (Source.Items) then
            raise Capacity_Error;
          end if;
          Sorting.Merge (Target.Items, Source.Items);
        end;
    end;
  end;
  package body Bounded_Ordered_Maps is
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Map) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Length (Container : Map) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Map) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Map) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Key (Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Position.Item);
      end;
    function Key (Container : Map; Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Container.Items, Position.Item);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item);
      end;
    function Element (Container : Map; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item);
      end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, New_Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      begin
        Implementation.Query_Element (Position.Item, Process);
      end;
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Process);
      end;
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        Implementation.Replace (Container.Items, Key, New_Item);
      end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Exclude (Container.Items, Key);
      end;
    procedure Delete (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Delete (Container.Items, Key);
      end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    procedure Delete_First (Container : in out Map) is
      begin
        Implementation.Delete_First (Container.Items);
      end;
    procedure Delete_Last (Container : in out Map) is
      begin
        Implementation.Delete_Last (Container.Items);
      end;
    function First (Container : Map) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : Map) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items);
      end;
    function First_Key (Container : Map) return Key_Type is
      begin
        return Implementation.First_Key (Container.Items);
      end;
    function Last (Container : Map) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : Map) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items);
      end;
    function Last_Key (Container : Map) return Key_Type is
      begin
        return Implementation.Last_Key (Container.Items);
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Map; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Map; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Previous (Container : Map; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Previous (Container : Map; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, Key));
      end;
    function Element (Container : Map; Key : Key_Type) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Key);
      end;
    function Floor (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Floor (Container.Items, Key));
      end;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Ceiling (Container.Items, Key));
      end;
    function Contains (Container : Map; Key : Key_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, Key);
      end;
    function "<" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation."<" (Left.Item, Right.Item);
      end;
    function ">" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.">" (Left.Item, Right.Item);
      end;
    function "<" (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Implementation."<" (Left.Item, Right);
      end;
    function ">" (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Implementation.">" (Left.Item, Right);
      end;
    function "<" (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Implementation."<" (Left, Right.Item);
      end;
    function ">" (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.">" (Left, Right.Item);
      end;
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean is
      begin
        return not (Left < Right) and then not (Right < Left);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Key, New_Item, Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Key, Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Key, New_Item);
      end;
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Include (Container.Items, Key, New_Item);
      end;
    function Empty (Capacity : Count_Type := 10) return Map is
      begin
        return (Capacity => Capacity, Items => Implementation.Empty);
      end;
    procedure Assign (Target : in out Map; Source : Map) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Source.Items);
      end;
    procedure Move (Target : in out Map; Source : in out Map) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Move (Target.Items, Source.Items);
      end;
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map is
      Wanted : Count_Type := Capacity;
      begin
        if Wanted = 0 then
          Wanted := Length (Source);
        elsif Wanted < Length (Source) then
          raise Capacity_Error;
        end if;
        return (Capacity => Wanted, Items => Implementation.Copy (Source.Items));
      end;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Key).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Key).Element.all'Unchecked_Access);
      end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Map) return Map_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : Map_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : Map_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
  end;
  package body Bounded_Hashed_Maps is
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Map) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is
      begin
        return Implementation.Tampering_With_Elements_Prohibited (Container.Items);
      end;
    function Length (Container : Map) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Map) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Map) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Key (Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Position.Item);
      end;
    function Key (Container : Map; Position : Cursor) return Key_Type is
      begin
        return Implementation.Key (Container.Items, Position.Item);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item);
      end;
    function Element (Container : Map; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item);
      end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, New_Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      begin
        Implementation.Query_Element (Position.Item, Process);
      end;
    procedure Update_Element (Container : in out Map;
                              Position  : Cursor;
                              Process   : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      begin
        Implementation.Update_Element (Container.Items, Position.Item, Process);
      end;
    procedure Replace (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        Implementation.Replace (Container.Items, Key, New_Item);
      end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Exclude (Container.Items, Key);
      end;
    procedure Delete (Container : in out Map; Key : Key_Type) is
      begin
        Implementation.Delete (Container.Items, Key);
      end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    function First (Container : Map) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Map; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Map; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Find (Container : Map; Key : Key_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, Key));
      end;
    function Element (Container : Map; Key : Key_Type) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Key);
      end;
    function Contains (Container : Map; Key : Key_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, Key);
      end;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Keys (Left.Item, Right.Item);
      end;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean is
      begin
        return Implementation.Equivalent_Keys (Left.Item, Right);
      end;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Keys (Left, Right.Item);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Key, New_Item, Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Key, Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Map;
                      Key       : Key_Type;
                      New_Item  : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, Key, New_Item);
      end;
    procedure Include (Container : in out Map;
                       Key       : Key_Type;
                       New_Item  : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, Key) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Include (Container.Items, Key, New_Item);
      end;
    function Empty (Capacity : Count_Type := 10) return Map is
      begin
        return (Capacity => Capacity, Modulus => Default_Modulus (Capacity), Items => Implementation.Empty (Capacity));
      end;
    procedure Assign (Target : in out Map; Source : Map) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Source.Items);
      end;
    procedure Move (Target : in out Map; Source : in out Map) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Move (Target.Items, Source.Items);
      end;
    function Default_Modulus (Capacity : Count_Type) return Hash_Type is
      begin
        return Hash_Type (Capacity) * 2 + 1;
      end;
    function Capacity (Container : Map) return Count_Type is
      begin
        return Container.Capacity;
      end;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) is
      begin
        if Capacity > Container.Capacity then
          raise Capacity_Error;
        end if;
      end;
    function Copy (Source : Map; Capacity : Count_Type := 0; Modulus : Hash_Type := 0) return Map is
      Wanted : Count_Type := Capacity;
      Buckets : Hash_Type := Modulus;
      begin
        if Wanted = 0 then
          Wanted := Length (Source);
        elsif Wanted < Length (Source) then
          raise Capacity_Error;
        end if;
        if Buckets = 0 then
          Buckets := Default_Modulus (Wanted);
        end if;
        return (Capacity => Wanted, Modulus => Buckets, Items => Implementation.Copy (Source.Items));
      end;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Key).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items, Key).Element.all'Unchecked_Access);
      end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Map) return Map_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items));
      end;
    function First (Object : Map_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
  end;
  package body Bounded_Ordered_Sets is
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Set) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Equivalent_Sets (Left, Right : Set) return Boolean is
      begin
        return Implementation.Equivalent_Sets (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Length (Container : Set) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Set) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Set) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item);
      end;
    function Element (Container : Set; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item);
      end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, New_Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      begin
        Implementation.Query_Element (Position.Item, Process);
      end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Replace (Container.Items, New_Item);
      end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Exclude (Container.Items, Item);
      end;
    procedure Delete (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Delete (Container.Items, Item);
      end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    procedure Delete_First (Container : in out Set) is
      begin
        Implementation.Delete_First (Container.Items);
      end;
    procedure Delete_Last (Container : in out Set) is
      begin
        Implementation.Delete_Last (Container.Items);
      end;
    function Overlap (Left, Right : Set) return Boolean is
      begin
        return Implementation.Overlap (Left.Items, Right.Items);
      end;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is
      begin
        return Implementation.Is_Subset (Subset.Items, Of_Set.Items);
      end;
    function First (Container : Set) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function First_Element (Container : Set) return Element_Type is
      begin
        return Implementation.First_Element (Container.Items);
      end;
    function Last (Container : Set) return Cursor is
      begin
        return Wrap (Implementation.Last (Container.Items));
      end;
    function Last_Element (Container : Set) return Element_Type is
      begin
        return Implementation.Last_Element (Container.Items);
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Set; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Set; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Previous (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        Implementation.Previous (Position.Item);
      end;
    function Previous (Container : Set; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Container.Items, Position.Item));
      end;
    procedure Previous (Container : Set; Position : in out Cursor) is
      begin
        Implementation.Previous (Container.Items, Position.Item);
      end;
    function Find (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, Item));
      end;
    function Floor (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Floor (Container.Items, Item));
      end;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Ceiling (Container.Items, Item));
      end;
    function Contains (Container : Set; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, Item);
      end;
    function "<" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation."<" (Left.Item, Right.Item);
      end;
    function ">" (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.">" (Left.Item, Right.Item);
      end;
    function "<" (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Implementation."<" (Left.Item, Right);
      end;
    function ">" (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Implementation.">" (Left.Item, Right);
      end;
    function "<" (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Implementation."<" (Left, Right.Item);
      end;
    function ">" (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.">" (Left, Right.Item);
      end;
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean is
      begin
        return not (Left < Right) and then not (Right < Left);
      end;
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, New_Item) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, New_Item, Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, New_Item) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, New_Item);
      end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, New_Item) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Include (Container.Items, New_Item);
      end;
    function Empty (Capacity : Count_Type := 10) return Set is
      begin
        return (Capacity => Capacity, Items => Implementation.Empty);
      end;
    procedure Assign (Target : in out Set; Source : Set) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Source.Items);
      end;
    procedure Move (Target : in out Set; Source : in out Set) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Move (Target.Items, Source.Items);
      end;
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set is
      Wanted : Count_Type := Capacity;
      begin
        if Wanted = 0 then
          Wanted := Length (Source);
        elsif Wanted < Length (Source) then
          raise Capacity_Error;
        end if;
        return (Capacity => Wanted, Items => Implementation.Copy (Source.Items));
      end;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    function Sized (Items : Implementation.Set) return Set is
      begin
        return (Capacity => Implementation.Length (Items), Items => Items);
      end;
    procedure Replace_Items (Target : in out Set; Items : Implementation.Set) is
      begin
        if Implementation.Length (Items) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Items);
      end;
    function To_Set (New_Item : Element_Type) return Set is
      begin
        return Sized (Implementation.To_Set (New_Item));
      end;
    procedure Union (Target : in out Set; Source : Set) is
      begin
        Replace_Items (Target, Implementation.Union (Target.Items, Source.Items));
      end;
    function Union (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Union (Left.Items, Right.Items));
      end;
    procedure Intersection (Target : in out Set; Source : Set) is
      begin
        Implementation.Intersection (Target.Items, Source.Items);
      end;
    function Intersection (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Intersection (Left.Items, Right.Items));
      end;
    procedure Difference (Target : in out Set; Source : Set) is
      begin
        Implementation.Difference (Target.Items, Source.Items);
      end;
    function Difference (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Difference (Left.Items, Right.Items));
      end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is
      begin
        Replace_Items (Target, Implementation.Symmetric_Difference (Target.Items, Source.Items));
      end;
    function Symmetric_Difference (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Symmetric_Difference (Left.Items, Right.Items));
      end;
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Reverse_Iterate (Container.Items, Visit'Access);
      end;
    function Iterate (Container : Set) return Set_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items),
                Last_Item  => Implementation.Last (Container.Items));
      end;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator is
      begin
        if not Implementation.Has_Element (Start.Item) then
          raise Constraint_Error;
        end if;
        if not Implementation.Has_Element (Container.Items, Start.Item) then
          raise Program_Error;
        end if;
        return (First_Item => Start.Item, Last_Item => Start.Item);
      end;
    function First (Object : Set_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    function Last (Object : Set_Iterator) return Cursor is
      begin
        return Wrap (Object.Last_Item);
      end;
    function Previous (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Previous (Position.Item));
      end;
    package body Generic_Keys is
      package Keys is new Implementation.Generic_Keys (Key_Type, Key, "<");
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean is
        begin
          return not (Left < Right) and then not (Right < Left);
        end;
      function Floor (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Floor (Container.Items, Key));
        end;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Ceiling (Container.Items, Key));
        end;
      function Key (Position : Cursor) return Key_Type is
        begin
          return Keys.Key (Position.Item);
        end;
      function Element (Container : Set; Key : Key_Type) return Element_Type is
        begin
          return Keys.Element (Container.Items, Key);
        end;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
        begin
          Keys.Replace (Container.Items, Key, New_Item);
        end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Exclude (Container.Items, Key);
        end;
      procedure Delete (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Delete (Container.Items, Key);
        end;
      function Find (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Find (Container.Items, Key));
        end;
      function Contains (Container : Set; Key : Key_Type) return Boolean is
        begin
          return Keys.Contains (Container.Items, Key);
        end;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type)) is
        begin
          Keys.Update_Element_Preserving_Key (Container.Items, Position.Item, Process);
        end;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Position.Item).Element.all'Unchecked_Access);
        end;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        begin
          return (Element => Keys.Constant_Reference (Container.Items, Key).Element.all'Unchecked_Access);
        end;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Key).Element.all'Unchecked_Access);
        end;
    end;
  end;
  package body Bounded_Hashed_Sets is
    function Wrap (Item : Implementation.Cursor) return Cursor is
      begin
        return (Item => Item);
      end;
    function Has_Element (Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Position.Item);
      end;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is
      begin
        return Implementation.Has_Element (Container.Items, Position.Item);
      end;
    function "=" (Left, Right : Set) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Equivalent_Sets (Left, Right : Set) return Boolean is
      begin
        return Implementation.Equivalent_Sets (Left.Items, Right.Items);
      end;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is
      begin
        return Implementation.Tampering_With_Cursors_Prohibited (Container.Items);
      end;
    function Length (Container : Set) return Count_Type is
      begin
        return Implementation.Length (Container.Items);
      end;
    function Is_Empty (Container : Set) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Set) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Position.Item);
      end;
    function Element (Container : Set; Position : Cursor) return Element_Type is
      begin
        return Implementation.Element (Container.Items, Position.Item);
      end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      begin
        Implementation.Replace_Element (Container.Items, Position.Item, New_Item);
      end;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) is
      begin
        Implementation.Query_Element (Position.Item, Process);
      end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is
      begin
        Implementation.Replace (Container.Items, New_Item);
      end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Exclude (Container.Items, Item);
      end;
    procedure Delete (Container : in out Set; Item : Element_Type) is
      begin
        Implementation.Delete (Container.Items, Item);
      end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is
      begin
        Implementation.Delete (Container.Items, Position.Item);
      end;
    function Overlap (Left, Right : Set) return Boolean is
      begin
        return Implementation.Overlap (Left.Items, Right.Items);
      end;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is
      begin
        return Implementation.Is_Subset (Subset.Items, Of_Set.Items);
      end;
    function First (Container : Set) return Cursor is
      begin
        return Wrap (Implementation.First (Container.Items));
      end;
    function Next (Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    procedure Next (Position : in out Cursor) is
      begin
        Implementation.Next (Position.Item);
      end;
    function Next (Container : Set; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Container.Items, Position.Item));
      end;
    procedure Next (Container : Set; Position : in out Cursor) is
      begin
        Implementation.Next (Container.Items, Position.Item);
      end;
    function Find (Container : Set; Item : Element_Type) return Cursor is
      begin
        return Wrap (Implementation.Find (Container.Items, Item));
      end;
    function Contains (Container : Set; Item : Element_Type) return Boolean is
      begin
        return Implementation.Contains (Container.Items, Item);
      end;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Elements (Left.Item, Right.Item);
      end;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean is
      begin
        return Implementation.Equivalent_Elements (Left.Item, Right);
      end;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean is
      begin
        return Implementation.Equivalent_Elements (Left, Right.Item);
      end;
    procedure Insert (Container : in out Set;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Inserted  : out Boolean) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, New_Item) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, New_Item, Position.Item, Inserted);
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, New_Item) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Insert (Container.Items, New_Item);
      end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is
      begin
        if Implementation.Length (Container.Items) > Container.Capacity - ((if Implementation.Contains (Container.Items, New_Item) then 0 else 1)) then
          raise Capacity_Error;
        end if;
        Implementation.Include (Container.Items, New_Item);
      end;
    function Empty (Capacity : Count_Type := 10) return Set is
      begin
        return (Capacity => Capacity, Modulus => Default_Modulus (Capacity), Items => Implementation.Empty (Capacity));
      end;
    procedure Assign (Target : in out Set; Source : Set) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Source.Items);
      end;
    procedure Move (Target : in out Set; Source : in out Set) is
      begin
        if Length (Source) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Move (Target.Items, Source.Items);
      end;
    function Default_Modulus (Capacity : Count_Type) return Hash_Type is
      begin
        return Hash_Type (Capacity) * 2 + 1;
      end;
    function Capacity (Container : Set) return Count_Type is
      begin
        return Container.Capacity;
      end;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) is
      begin
        if Capacity > Container.Capacity then
          raise Capacity_Error;
        end if;
      end;
    function Copy (Source : Set; Capacity : Count_Type := 0; Modulus : Hash_Type := 0) return Set is
      Wanted : Count_Type := Capacity;
      Buckets : Hash_Type := Modulus;
      begin
        if Wanted = 0 then
          Wanted := Length (Source);
        elsif Wanted < Length (Source) then
          raise Capacity_Error;
        end if;
        if Buckets = 0 then
          Buckets := Default_Modulus (Wanted);
        end if;
        return (Capacity => Wanted, Modulus => Buckets, Items => Implementation.Copy (Source.Items));
      end;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items, Position.Item).Element.all'Unchecked_Access);
      end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
      procedure Visit (Position : Implementation.Cursor) is
        begin
          Process (Wrap (Position));
        end;
      begin
        Implementation.Iterate (Container.Items, Visit'Access);
      end;
    function Sized (Items : Implementation.Set) return Set is
      begin
        return (Capacity => Implementation.Length (Items), Modulus => Default_Modulus (Implementation.Length (Items)), Items => Items);
      end;
    procedure Replace_Items (Target : in out Set; Items : Implementation.Set) is
      begin
        if Implementation.Length (Items) > Target.Capacity then
          raise Capacity_Error;
        end if;
        Implementation.Assign (Target.Items, Items);
      end;
    function To_Set (New_Item : Element_Type) return Set is
      begin
        return Sized (Implementation.To_Set (New_Item));
      end;
    procedure Union (Target : in out Set; Source : Set) is
      begin
        Replace_Items (Target, Implementation.Union (Target.Items, Source.Items));
      end;
    function Union (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Union (Left.Items, Right.Items));
      end;
    procedure Intersection (Target : in out Set; Source : Set) is
      begin
        Implementation.Intersection (Target.Items, Source.Items);
      end;
    function Intersection (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Intersection (Left.Items, Right.Items));
      end;
    procedure Difference (Target : in out Set; Source : Set) is
      begin
        Implementation.Difference (Target.Items, Source.Items);
      end;
    function Difference (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Difference (Left.Items, Right.Items));
      end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is
      begin
        Replace_Items (Target, Implementation.Symmetric_Difference (Target.Items, Source.Items));
      end;
    function Symmetric_Difference (Left, Right : Set) return Set is
      begin
        return Sized (Implementation.Symmetric_Difference (Left.Items, Right.Items));
      end;
    function Iterate (Container : Set) return Set_Iterator is
      begin
        return (First_Item => Implementation.First (Container.Items));
      end;
    function First (Object : Set_Iterator) return Cursor is
      begin
        return Wrap (Object.First_Item);
      end;
    function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
      begin
        return Wrap (Implementation.Next (Position.Item));
      end;
    package body Generic_Keys is
      package Keys is new Implementation.Generic_Keys (Key_Type, Key, Hash, Equivalent_Keys);
      function Key (Position : Cursor) return Key_Type is
        begin
          return Keys.Key (Position.Item);
        end;
      function Element (Container : Set; Key : Key_Type) return Element_Type is
        begin
          return Keys.Element (Container.Items, Key);
        end;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
        begin
          Keys.Replace (Container.Items, Key, New_Item);
        end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Exclude (Container.Items, Key);
        end;
      procedure Delete (Container : in out Set; Key : Key_Type) is
        begin
          Keys.Delete (Container.Items, Key);
        end;
      function Find (Container : Set; Key : Key_Type) return Cursor is
        begin
          return Wrap (Keys.Find (Container.Items, Key));
        end;
      function Contains (Container : Set; Key : Key_Type) return Boolean is
        begin
          return Keys.Contains (Container.Items, Key);
        end;
      procedure Update_Element_Preserving_Key (Container : in out Set;
                                               Position  : Cursor;
                                               Process   : not null access procedure (Element : in out Element_Type)) is
        begin
          Keys.Update_Element_Preserving_Key (Container.Items, Position.Item, Process);
        end;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Position.Item).Element.all'Unchecked_Access);
        end;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        begin
          return (Element => Keys.Constant_Reference (Container.Items, Key).Element.all'Unchecked_Access);
        end;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        begin
          return (Element => Keys.Reference_Preserving_Key (Container.Items, Key).Element.all'Unchecked_Access);
        end;
    end;
  end;
  package body Bounded_Indefinite_Holders is
    function Checked (New_Item : Element_Type) return Implementation.Holder is
      begin
        if New_Item'Size > Max_Element_Size_in_Storage_Elements * System.Storage_Unit then
          raise Program_Error;
        end if;
        return Implementation.To_Holder (New_Item);
      end;
    function "=" (Left, Right : Holder) return Boolean is
      begin
        return Implementation."=" (Left.Items, Right.Items);
      end;
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean is
      begin
        return Implementation.Tampering_With_The_Element_Prohibited (Container.Items);
      end;
    function Empty return Holder is
      begin
        return Empty_Holder;
      end;
    function To_Holder (New_Item : Element_Type) return Holder is
      begin
        return (Items => Checked (New_Item));
      end;
    function Is_Empty (Container : Holder) return Boolean is
      begin
        return Implementation.Is_Empty (Container.Items);
      end;
    procedure Clear (Container : in out Holder) is
      begin
        Implementation.Clear (Container.Items);
      end;
    function Element (Container : Holder) return Element_Type is
      begin
        return Implementation.Element (Container.Items);
      end;
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) is
      begin
        if New_Item'Size > Max_Element_Size_in_Storage_Elements * System.Storage_Unit then
          raise Program_Error;
        end if;
        Implementation.Replace_Element (Container.Items, New_Item);
      end;
    procedure Query_Element (Container : Holder;
                             Process   : not null access procedure (Element : Element_Type)) is
      begin
        Implementation.Query_Element (Container.Items, Process);
      end;
    procedure Update_Element (Container : in out Holder;
                              Process   : not null access procedure (Element : in out Element_Type)) is
      begin
        Implementation.Update_Element (Container.Items, Process);
      end;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type is
      begin
        return (Element => Implementation.Constant_Reference (Container.Items).Element.all'Unchecked_Access);
      end;
    function Reference (Container : in out Holder) return Reference_Type is
      begin
        return (Element => Implementation.Reference (Container.Items).Element.all'Unchecked_Access);
      end;
    procedure Assign (Target : in out Holder; Source : Holder) is
      begin
        Implementation.Assign (Target.Items, Source.Items);
      end;
    function Copy (Source : Holder) return Holder is
      begin
        return (Items => Implementation.Copy (Source.Items));
      end;
    procedure Move (Target : in out Holder; Source : in out Holder) is
      begin
        Implementation.Move (Target.Items, Source.Items);
      end;
    procedure Swap (Left, Right : in out Holder) is
      begin
        Implementation.Swap (Left.Items, Right.Items);
      end;
  end;
end;

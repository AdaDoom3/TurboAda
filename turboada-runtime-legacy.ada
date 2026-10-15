package Interfaces is
  pragma Pure;
  type Integer_8 is range -2 ** 7 .. 2 ** 7 - 1;
  for Integer_8'Size use 8;
  type Integer_16 is range -2 ** 15 .. 2 ** 15 - 1;
  for Integer_16'Size use 16;
  type Integer_32 is range -2 ** 31 .. 2 ** 31 - 1;
  for Integer_32'Size use 32;
  type Integer_64 is range -2 ** 63 .. 2 ** 63 - 1;
  for Integer_64'Size use 64;
  type Unsigned_8 is mod 2 ** 8;
  for Unsigned_8'Size use 8;
  type Unsigned_16 is mod 2 ** 16;
  for Unsigned_16'Size use 16;
  type Unsigned_32 is mod 2 ** 32;
  for Unsigned_32'Size use 32;
  type Unsigned_64 is mod 2 ** 64;
  for Unsigned_64'Size use 64;
  function Shift_Left (Value : Unsigned_8; Amount : Natural) return Unsigned_8;
  function Shift_Right (Value : Unsigned_8; Amount : Natural) return Unsigned_8;
  function Shift_Right_Arithmetic (Value : Unsigned_8; Amount : Natural) return Unsigned_8;
  function Rotate_Left (Value : Unsigned_8; Amount : Natural) return Unsigned_8;
  function Rotate_Right (Value : Unsigned_8; Amount : Natural) return Unsigned_8;
  function Shift_Left (Value : Unsigned_16; Amount : Natural) return Unsigned_16;
  function Shift_Right (Value : Unsigned_16; Amount : Natural) return Unsigned_16;
  function Shift_Right_Arithmetic (Value : Unsigned_16; Amount : Natural) return Unsigned_16;
  function Rotate_Left (Value : Unsigned_16; Amount : Natural) return Unsigned_16;
  function Rotate_Right (Value : Unsigned_16; Amount : Natural) return Unsigned_16;
  function Shift_Left (Value : Unsigned_32; Amount : Natural) return Unsigned_32;
  function Shift_Right (Value : Unsigned_32; Amount : Natural) return Unsigned_32;
  function Shift_Right_Arithmetic (Value : Unsigned_32; Amount : Natural) return Unsigned_32;
  function Rotate_Left (Value : Unsigned_32; Amount : Natural) return Unsigned_32;
  function Rotate_Right (Value : Unsigned_32; Amount : Natural) return Unsigned_32;
  function Shift_Left (Value : Unsigned_64; Amount : Natural) return Unsigned_64;
  function Shift_Right (Value : Unsigned_64; Amount : Natural) return Unsigned_64;
  function Shift_Right_Arithmetic (Value : Unsigned_64; Amount : Natural) return Unsigned_64;
  function Rotate_Left (Value : Unsigned_64; Amount : Natural) return Unsigned_64;
  function Rotate_Right (Value : Unsigned_64; Amount : Natural) return Unsigned_64;
  type IEEE_Float_32 is digits 6;
  type IEEE_Float_64 is digits 15;
end;
package body Interfaces is
  function Shift_Left (Value : Unsigned_8; Amount : Natural) return Unsigned_8 is
    (if Amount >= 8 then 0 else Value * 2 ** Amount);
  function Shift_Right (Value : Unsigned_8; Amount : Natural) return Unsigned_8 is
    (if Amount >= 8 then 0 else Value / 2 ** Amount);
  function Shift_Right_Arithmetic (Value : Unsigned_8; Amount : Natural) return Unsigned_8 is
    (if Value < 2 ** 7 then Shift_Right (Value, Amount)
     else not Shift_Right (not Value, Amount));
  function Rotate_Left (Value : Unsigned_8; Amount : Natural) return Unsigned_8 is
    (Shift_Left (Value, Amount mod 8) or Shift_Right (Value, 8 - Amount mod 8));
  function Rotate_Right (Value : Unsigned_8; Amount : Natural) return Unsigned_8 is
    (Shift_Right (Value, Amount mod 8) or Shift_Left (Value, 8 - Amount mod 8));
  function Shift_Left (Value : Unsigned_16; Amount : Natural) return Unsigned_16 is
    (if Amount >= 16 then 0 else Value * 2 ** Amount);
  function Shift_Right (Value : Unsigned_16; Amount : Natural) return Unsigned_16 is
    (if Amount >= 16 then 0 else Value / 2 ** Amount);
  function Shift_Right_Arithmetic (Value : Unsigned_16; Amount : Natural) return Unsigned_16 is
    (if Value < 2 ** 15 then Shift_Right (Value, Amount)
     else not Shift_Right (not Value, Amount));
  function Rotate_Left (Value : Unsigned_16; Amount : Natural) return Unsigned_16 is
    (Shift_Left (Value, Amount mod 16) or Shift_Right (Value, 16 - Amount mod 16));
  function Rotate_Right (Value : Unsigned_16; Amount : Natural) return Unsigned_16 is
    (Shift_Right (Value, Amount mod 16) or Shift_Left (Value, 16 - Amount mod 16));
  function Shift_Left (Value : Unsigned_32; Amount : Natural) return Unsigned_32 is
    (if Amount >= 32 then 0 else Value * 2 ** Amount);
  function Shift_Right (Value : Unsigned_32; Amount : Natural) return Unsigned_32 is
    (if Amount >= 32 then 0 else Value / 2 ** Amount);
  function Shift_Right_Arithmetic (Value : Unsigned_32; Amount : Natural) return Unsigned_32 is
    (if Value < 2 ** 31 then Shift_Right (Value, Amount)
     else not Shift_Right (not Value, Amount));
  function Rotate_Left (Value : Unsigned_32; Amount : Natural) return Unsigned_32 is
    (Shift_Left (Value, Amount mod 32) or Shift_Right (Value, 32 - Amount mod 32));
  function Rotate_Right (Value : Unsigned_32; Amount : Natural) return Unsigned_32 is
    (Shift_Right (Value, Amount mod 32) or Shift_Left (Value, 32 - Amount mod 32));
  function Shift_Left (Value : Unsigned_64; Amount : Natural) return Unsigned_64 is
    (if Amount >= 64 then 0 else Value * 2 ** Amount);
  function Shift_Right (Value : Unsigned_64; Amount : Natural) return Unsigned_64 is
    (if Amount >= 64 then 0 else Value / 2 ** Amount);
  function Shift_Right_Arithmetic (Value : Unsigned_64; Amount : Natural) return Unsigned_64 is
    (if Value < 2 ** 63 then Shift_Right (Value, Amount)
     else not Shift_Right (not Value, Amount));
  function Rotate_Left (Value : Unsigned_64; Amount : Natural) return Unsigned_64 is
    (Shift_Left (Value, Amount mod 64) or Shift_Right (Value, 64 - Amount mod 64));
  function Rotate_Right (Value : Unsigned_64; Amount : Natural) return Unsigned_64 is
    (Shift_Right (Value, Amount mod 64) or Shift_Left (Value, 64 - Amount mod 64));
end;
with System;
package Interfaces.C is
  CHAR_BIT  : constant := 8;
  SCHAR_MIN : constant := -128;
  SCHAR_MAX : constant := 127;
  UCHAR_MAX : constant := 255;
  type int                is range -2 ** 31 .. 2 ** 31 - 1;
  type short              is range -2 ** 15 .. 2 ** 15 - 1;
  type long               is range -2 ** (System.C_Long_Bits - 1) .. 2 ** (System.C_Long_Bits - 1) - 1;
  type long_long          is range -2 ** 63 .. 2 ** 63 - 1;
  type signed_char        is range SCHAR_MIN .. SCHAR_MAX;
  for signed_char'Size use CHAR_BIT;
  type unsigned           is mod 2 ** 32;
  type unsigned_short     is mod 2 ** 16;
  type unsigned_long      is mod 2 ** System.C_Long_Bits;
  type unsigned_long_long is mod 2 ** 64;
  type unsigned_char      is mod UCHAR_MAX + 1;
  for unsigned_char'Size use CHAR_BIT;
  subtype plain_char is unsigned_char;
  type ptrdiff_t is range -2 ** 63 .. 2 ** 63 - 1;
  type size_t    is mod 2 ** 64;
  type C_float     is digits 6;
  type double      is digits 15;
  type long_double is digits 15;
  type C_bool is new Boolean;
  for C_bool'Size use 8;
  type char is new Character;
  nul : constant char := char'First;
  function To_C   (Item : Character) return char;
  function To_Ada (Item : char)      return Character;
  type char_array is array (size_t range <>) of aliased char;
  function Is_Nul_Terminated (Item : char_array) return Boolean;
  function To_C   (Item : String;     Append_Nul : Boolean := True) return char_array;
  function To_Ada (Item : char_array; Trim_Nul   : Boolean := True) return String;
  procedure To_C   (Item       : String;
                    Target     : out char_array;
                    Count      : out size_t;
                    Append_Nul : Boolean := True);
  procedure To_Ada (Item     : char_array;
                    Target   : out String;
                    Count    : out Natural;
                    Trim_Nul : Boolean := True);
  Terminator_Error : exception;
end;
package body Interfaces.C is
  function To_C (Item : Character) return char is (char'Val (Character'Pos (Item)));
  function To_Ada (Item : char) return Character is
    (if char'Pos (Item) > Character'Pos (Character'Last) then '?'
     else Character'Val (char'Pos (Item)));
  function Is_Nul_Terminated (Item : char_array) return Boolean is
  begin
    for Index in Item'Range loop
      if Item (Index) = nul then
        return True;
      end if;
    end loop;
    return False;
  end;
  function To_C (Item : String; Append_Nul : Boolean := True) return char_array is
  begin
    if Append_Nul then
      declare
        Result : char_array (0 .. size_t (Item'Length));
      begin
        for Index in Item'Range loop
          Result (size_t (Index - Item'First)) := To_C (Item (Index));
        end loop;
        Result (Result'Last) := nul;
        return Result;
      end;
    elsif Item'Length = 0 then
      raise Constraint_Error;
    else
      declare
        Result : char_array (0 .. size_t (Item'Length) - 1);
      begin
        for Index in Item'Range loop
          Result (size_t (Index - Item'First)) := To_C (Item (Index));
        end loop;
        return Result;
      end;
    end if;
  end;
  function Text_Length (Item : char_array; Trim_Nul : Boolean) return Natural is
  begin
    if not Trim_Nul then
      return Item'Length;
    end if;
    for Index in Item'Range loop
      if Item (Index) = nul then
        return Natural (Index - Item'First);
      end if;
    end loop;
    raise Terminator_Error;
  end;
  function To_Ada (Item : char_array; Trim_Nul : Boolean := True) return String is
    Result : String (1 .. Text_Length (Item, Trim_Nul));
  begin
    for Index in Result'Range loop
      Result (Index) := To_Ada (Item (Item'First + size_t (Index - 1)));
    end loop;
    return Result;
  end;
  procedure To_C (Item       : String;
                  Target     : out char_array;
                  Count      : out size_t;
                  Append_Nul : Boolean := True) is
    Needed : constant Natural := Item'Length + Boolean'Pos (Append_Nul);
  begin
    if Needed > Target'Length then
      raise Constraint_Error;
    end if;
    for Index in Item'Range loop
      Target (Target'First + size_t (Index - Item'First)) := To_C (Item (Index));
    end loop;
    if Append_Nul then
      Target (Target'First + size_t (Item'Length)) := nul;
    end if;
    Count := size_t (Needed);
  end;
  procedure To_Ada (Item     : char_array;
                    Target   : out String;
                    Count    : out Natural;
                    Trim_Nul : Boolean := True) is
    Length : constant Natural := Text_Length (Item, Trim_Nul);
  begin
    if Length > Target'Length then
      raise Constraint_Error;
    end if;
    for Index in 1 .. Length loop
      Target (Target'First + Index - 1) := To_Ada (Item (Item'First + size_t (Index - 1)));
    end loop;
    Count := Length;
  end;
end;
with System;
package Interfaces.C.Strings is
  type char_array_access is access all char_array;
  type chars_ptr is private;
  type chars_ptr_array is array (size_t range <>) of aliased chars_ptr;
  Null_Ptr : constant chars_ptr;
  function To_Chars_Ptr (Item      : char_array_access;
                         Nul_Check : Boolean := False) return chars_ptr;
  function New_Char_Array (Chars : char_array) return chars_ptr;
  function New_String (Str : String) return chars_ptr;
  procedure Free (Item : in out chars_ptr);
  Dereference_Error : exception;
  function Value (Item : chars_ptr) return char_array;
  function Value (Item : chars_ptr; Length : size_t) return char_array;
  function Value (Item : chars_ptr) return String;
  function Value (Item : chars_ptr; Length : size_t) return String;
  function Strlen (Item : chars_ptr) return size_t;
  procedure Update (Item   : chars_ptr;
                    Offset : size_t;
                    Chars  : char_array;
                    Check  : Boolean := True);
  procedure Update (Item   : chars_ptr;
                    Offset : size_t;
                    Str    : String;
                    Check  : Boolean := True);
  Update_Error : exception;
private
  type chars_ptr is new System.Address;
  Null_Ptr : constant chars_ptr := chars_ptr (System.Null_Address);
end;
with Unchecked_Conversion;
package body Interfaces.C.Strings is
  function Memory_Allocate (Size : size_t) return chars_ptr;
  pragma Import (C, Memory_Allocate, "malloc");
  procedure Memory_Free (Item : chars_ptr);
  pragma Import (C, Memory_Free, "free");
  function Memory_Copy_Raw (Target : System.Address; Source : System.Address; Size : size_t)
    return System.Address;
  pragma Import (C, Memory_Copy_Raw, "memcpy");
  function Memory_Find (Item : chars_ptr; Byte : int; Size : size_t) return chars_ptr;
  pragma Import (C, Memory_Find, "memchr");
  function C_Strlen (Item : chars_ptr) return size_t;
  pragma Import (C, C_Strlen, "strlen");
  function To_Word is new Unchecked_Conversion (chars_ptr, size_t);
  function To_Pointer is new Unchecked_Conversion (size_t, chars_ptr);
  procedure Memory_Copy (Target : System.Address; Source : System.Address; Size : size_t) is
    Copied_To : constant System.Address := Memory_Copy_Raw (Target, Source, Size);
  begin
    if System."/=" (Copied_To, Target) then raise Program_Error; end if;
  end Memory_Copy;
  function Offset_Of (Item : chars_ptr; Offset : size_t) return chars_ptr is
    (To_Pointer (To_Word (Item) + Offset));
  function Copied (Chars : char_array) return chars_ptr is
    Result : constant chars_ptr := Memory_Allocate (Chars'Length);
  begin
    if Result = Null_Ptr then
      raise Storage_Error;
    end if;
    if Chars'Length > 0 then
      Memory_Copy (System.Address (Result), Chars (Chars'First)'Address, Chars'Length);
    end if;
    return Result;
  end;
  function To_Chars_Ptr (Item      : char_array_access;
                         Nul_Check : Boolean := False) return chars_ptr is
  begin
    if Item = null or else Item.all'Length = 0 then
      return Null_Ptr;
    end if;
    if Nul_Check and then not Is_Nul_Terminated (Item.all) then
      raise Terminator_Error;
    end if;
    return chars_ptr (Item.all (Item.all'First)'Address);
  end;
  function New_Char_Array (Chars : char_array) return chars_ptr is
  begin
    for Index in Chars'Range loop
      if Chars (Index) = nul then
        return Copied (Chars (Chars'First .. Index));
      end if;
    end loop;
    declare
      Ended : char_array (0 .. Chars'Length);
    begin
      for Index in Chars'Range loop
        Ended (Index - Chars'First) := Chars (Index);
      end loop;
      Ended (Ended'Last) := nul;
      return Copied (Ended);
    end;
  end;
  function New_String (Str : String) return chars_ptr is
    (Copied (To_C (Str)));
  procedure Free (Item : in out chars_ptr) is
  begin
    if Item /= Null_Ptr then
      Memory_Free (Item);
      Item := Null_Ptr;
    end if;
  end;
  function Strlen (Item : chars_ptr) return size_t is
  begin
    if Item = Null_Ptr then
      raise Dereference_Error;
    end if;
    return C_Strlen (Item);
  end;
  function Value (Item : chars_ptr) return char_array is
    Length : constant size_t := Strlen (Item);
    Result : char_array (0 .. Length);
  begin
    Memory_Copy (Result (0)'Address, System.Address (Item), Length + 1);
    return Result;
  end;
  function Prefix_Length (Item : chars_ptr; Length : size_t) return size_t is
    Found : chars_ptr;
  begin
    if Item = Null_Ptr then
      raise Dereference_Error;
    end if;
    Found := Memory_Find (Item, 0, Length);
    if Found = Null_Ptr then
      return Length;
    end if;
    return To_Word (Found) - To_Word (Item);
  end;
  function Value (Item : chars_ptr; Length : size_t) return char_array is
    Count : size_t;
  begin
    if Item = Null_Ptr then
      raise Dereference_Error;
    elsif Length = 0 then
      raise Constraint_Error;
    end if;
    Count := Prefix_Length (Item, Length);
    if Count < Length then
      Count := Count + 1;
    end if;
    declare
      Result : char_array (0 .. Count - 1);
    begin
      Memory_Copy (Result (0)'Address, System.Address (Item), Count);
      return Result;
    end;
  end;
  function Value (Item : chars_ptr) return String is
    Length : constant size_t := Strlen (Item);
  begin
    if Length = 0 then
      return "";
    end if;
    declare
      Text : char_array (0 .. Length - 1);
    begin
      Memory_Copy (Text (0)'Address, System.Address (Item), Length);
      return To_Ada (Text, Trim_Nul => False);
    end;
  end;
  function Value (Item : chars_ptr; Length : size_t) return String is
    Count : constant size_t := Prefix_Length (Item, Length);
  begin
    if Count = 0 then
      return "";
    end if;
    declare
      Text : char_array (0 .. Count - 1);
    begin
      Memory_Copy (Text (0)'Address, System.Address (Item), Count);
      return To_Ada (Text, Trim_Nul => False);
    end;
  end;
  procedure Update (Item   : chars_ptr;
                    Offset : size_t;
                    Chars  : char_array;
                    Check  : Boolean := True) is
  begin
    if Item = Null_Ptr then
      raise Dereference_Error;
    end if;
    if Check and then Offset + Chars'Length > Strlen (Item) then
      raise Update_Error;
    end if;
    if Chars'Length > 0 then
      Memory_Copy (System.Address (Offset_Of (Item, Offset)), Chars (Chars'First)'Address,
                   Chars'Length);
    end if;
  end;
  procedure Update (Item   : chars_ptr;
                    Offset : size_t;
                    Str    : String;
                    Check  : Boolean := True) is
  begin
    Update (Item, Offset, To_C (Str, Append_Nul => False), Check);
  end;
end;
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
  function Character_Set_Version return String is ("ISO/IEC 646:1991");
  function Is_Control (Item : Character) return Boolean is (Item < ' ' or else Item = Character'Val (127));
  function Is_Graphic (Item : Character) return Boolean is (not Is_Control (Item));
  function Is_Letter (Item : Character) return Boolean is (Item in 'A' .. 'Z' or else Item in 'a' .. 'z');
  function Is_Lower (Item : Character) return Boolean is (Item in 'a' .. 'z');
  function Is_Upper (Item : Character) return Boolean is (Item in 'A' .. 'Z');
  function Is_Basic (Item : Character) return Boolean is (Is_Letter (Item));
  function Is_Digit (Item : Character) return Boolean is (Item in '0' .. '9');
  function Is_Decimal_Digit (Item : Character) return Boolean renames Is_Digit;
  function Is_Hexadecimal_Digit (Item : Character) return Boolean is
    (Is_Digit (Item) or else Item in 'A' .. 'F' or else Item in 'a' .. 'f');
  function Is_Alphanumeric (Item : Character) return Boolean is (Is_Letter (Item) or else Is_Digit (Item));
  function Is_Special (Item : Character) return Boolean is (Is_Graphic (Item) and then not Is_Alphanumeric (Item));
  function Is_Line_Terminator (Item : Character) return Boolean is (Item in Character'Val (10) .. Character'Val (13));
  function Is_Mark (Item : Character) return Boolean is (False);
  function Is_Other_Format (Item : Character) return Boolean is (False);
  function Is_Punctuation_Connector (Item : Character) return Boolean is (Item = '_');
  function Is_Space (Item : Character) return Boolean is (Item = ' ');
  function Is_NFKC (Item : Character) return Boolean is (True);
  function To_Lower (Item : Character) return Character is
    (if Is_Upper (Item) then Character'Val (Character'Pos (Item) + 32) else Item);
  function To_Upper (Item : Character) return Character is
    (if Is_Lower (Item) then Character'Val (Character'Pos (Item) - 32) else Item);
  function To_Basic (Item : Character) return Character is (Item);
  function To_Lower (Item : String) return String is (for I in 1 .. Item'Length => To_Lower (Item (Item'First + I - 1)));
  function To_Upper (Item : String) return String is (for I in 1 .. Item'Length => To_Upper (Item (Item'First + I - 1)));
  function To_Basic (Item : String) return String is (for I in 1 .. Item'Length => Item (Item'First + I - 1));
  subtype ISO_646 is Character range Character'Val (0) .. Character'Val (127);
  function Is_ISO_646 (Item : Character) return Boolean is (True);
  function Is_ISO_646 (Item : String) return Boolean is (True);
  function To_ISO_646 (Item : Character; Substitute : ISO_646 := ' ') return ISO_646 is (Item);
  function To_ISO_646 (Item : String; Substitute : ISO_646 := ' ') return String is (To_Basic (Item));
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
  type Character_Set is array (Character) of Boolean;
  type Character_Mapping is array (Character) of Character;
  Null_Set : constant Character_Set := (others => False);
  Identity : constant Character_Mapping := (for C in Character => C);
end;
package body Ada.Strings.Maps is
  Width : constant := Character'Pos (Character'Last) + 1;
  type Membership_Table is array (Character) of Boolean;
  function To_Set (Ranges : Character_Ranges) return Character_Set is
    (for C in Character => (for some Span of Ranges => C in Span.Low .. Span.High));
  function To_Set (Span : Character_Range) return Character_Set is (for C in Character => C in Span.Low .. Span.High);
  function To_Ranges (Set : Character_Set) return Character_Ranges is
    Result : Character_Ranges (1 .. Width / 2);
    Last   : Natural := 0;
    begin
      for C in Character loop
        if not Set (C) then
          null;
        elsif Last > 0 and then Result (Last).High = Character'Pred (C) then
          Result (Last).High := C;
        else
          Last := Last + 1;
          Result (Last) := (C, C);
        end if;
      end loop;
      return Result (1 .. Last);
    end;
  function "=" (Left, Right : Character_Set) return Boolean is (Membership_Table (Left) = Membership_Table (Right));
  function "not" (Right : Character_Set) return Character_Set is (Character_Set (not Membership_Table (Right)));
  function "and" (Left, Right : Character_Set) return Character_Set is
    (Character_Set (Membership_Table (Left) and Membership_Table (Right)));
  function "or" (Left, Right : Character_Set) return Character_Set is
    (Character_Set (Membership_Table (Left) or Membership_Table (Right)));
  function "xor" (Left, Right : Character_Set) return Character_Set is
    (Character_Set (Membership_Table (Left) xor Membership_Table (Right)));
  function "-" (Left, Right : Character_Set) return Character_Set is (Left and not Right);
  function Is_In (Element : Character; Set : Character_Set) return Boolean is (Set (Element));
  function Is_Subset (Elements : Character_Set; Set : Character_Set) return Boolean is ((Elements and Set) = Elements);
  function To_Set (Sequence : Character_Sequence) return Character_Set is
    Result : Character_Set := Null_Set;
    begin
      for C of Sequence loop
        Result (C) := True;
      end loop;
      return Result;
    end;
  function To_Set (Singleton : Character) return Character_Set is (for C in Character => C = Singleton);
  function To_Sequence (Set : Character_Set) return Character_Sequence is
    Result : String (1 .. Width);
    Last   : Natural := 0;
    begin
      for C in Character loop
        if Set (C) then
          Last := Last + 1;
          Result (Last) := C;
        end if;
      end loop;
      return Result (1 .. Last);
    end;
  function Value (Map : Character_Mapping; Element : Character) return Character is (Map (Element));
  function To_Mapping (From, To : Character_Sequence) return Character_Mapping is
    Result : Character_Mapping := Identity;
    Seen   : Character_Set := Null_Set;
    begin
      if From'Length /= To'Length then raise Translation_Error; end if;
      for I in From'Range loop
        if Seen (From (I)) then raise Translation_Error; end if;
        Seen (From (I)) := True;
        Result (From (I)) := To (I - From'First + To'First);
      end loop;
      return Result;
    end;
  function To_Domain (Map : Character_Mapping) return Character_Sequence is
    (To_Sequence (Character_Set'(for C in Character => Map (C) /= C)));
  function To_Range (Map : Character_Mapping) return Character_Sequence is
    (declare Domain : constant String := To_Domain (Map); begin (for I in Domain'Range => Map (Domain (I))));
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
  Control_Set           : constant Character_Set :=
    (Character'Val (0) .. Character'Val (31) | Character'Val (127) => True, others => False);
  Graphic_Set           : constant Character_Set := (' ' .. '~' => True, others => False);
  Letter_Set            : constant Character_Set := ('A' .. 'Z' | 'a' .. 'z' => True, others => False);
  Lower_Set             : constant Character_Set := ('a' .. 'z' => True, others => False);
  Upper_Set             : constant Character_Set := ('A' .. 'Z' => True, others => False);
  Basic_Set             : constant Character_Set := Letter_Set;
  Decimal_Digit_Set     : constant Character_Set := ('0' .. '9' => True, others => False);
  Hexadecimal_Digit_Set : constant Character_Set := ('0' .. '9' | 'A' .. 'F' | 'a' .. 'f' => True, others => False);
  Alphanumeric_Set      : constant Character_Set := ('0' .. '9' | 'A' .. 'Z' | 'a' .. 'z' => True, others => False);
  Special_Set           : constant Character_Set :=
    (' ' .. '/' | ':' .. '@' | '[' .. '`' | '{' .. '~' => True, others => False);
  ISO_646_Set           : constant Character_Set := (others => True);
  Lower_Case_Map        : constant Character_Mapping :=
    (for C in Character => (if C in 'A' .. 'Z' then Character'Val (Character'Pos (C) + 32) else C));
  Upper_Case_Map        : constant Character_Mapping :=
    (for C in Character => (if C in 'a' .. 'z' then Character'Val (Character'Pos (C) - 32) else C));
  Basic_Map             : constant Character_Mapping := Identity;
end;
with Ada.Strings.Maps;
package Ada.Strings.Fixed is
  procedure Move (Source : String; Target : out String; Drop : Truncation := Error; Justify : Alignment := Left;
                  Pad : Character := Space);
  function Index (Source, Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source, Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source, Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source, Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source : String; Set : Maps.Character_Set; From : Positive; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural;
  function Index (Source : String; Set : Maps.Character_Set; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : String; From : Positive; Going : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : String; Going : Direction := Forward) return Natural;
  function Count (Source, Pattern : String; Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Count (Source, Pattern : String; Mapping : Maps.Character_Mapping_Function) return Natural;
  function Count (Source : String; Set : Maps.Character_Set) return Natural;
  procedure Find_Token (Source : String; Set : Maps.Character_Set; From : Positive; Test : Membership; First : out Positive;
                        Last : out Natural);
  procedure Find_Token (Source : String; Set : Maps.Character_Set; Test : Membership; First : out Positive;
                        Last : out Natural);
  function Translate (Source : String; Mapping : Maps.Character_Mapping) return String;
  procedure Translate (Source : in out String; Mapping : Maps.Character_Mapping);
  function Translate (Source : String; Mapping : Maps.Character_Mapping_Function) return String;
  procedure Translate (Source : in out String; Mapping : Maps.Character_Mapping_Function);
  function Replace_Slice (Source : String; Low : Positive; High : Natural; By : String) return String;
  procedure Replace_Slice (Source : in out String; Low : Positive; High : Natural; By : String; Drop : Truncation := Error;
                           Justify : Alignment := Left; Pad : Character := Space);
  function Insert (Source : String; Before : Positive; New_Item : String) return String;
  procedure Insert (Source : in out String; Before : Positive; New_Item : String; Drop : Truncation := Error);
  function Overwrite (Source : String; Position : Positive; New_Item : String) return String;
  procedure Overwrite (Source : in out String; Position : Positive; New_Item : String; Drop : Truncation := Right);
  function Delete (Source : String; From : Positive; Through : Natural) return String;
  procedure Delete (Source : in out String; From : Positive; Through : Natural; Justify : Alignment := Left;
                    Pad : Character := Space);
  function Trim (Source : String; Side : Trim_End) return String;
  procedure Trim (Source : in out String; Side : Trim_End; Justify : Alignment := Left; Pad : Character := Space);
  function Trim (Source : String; Left : Maps.Character_Set; Right : Maps.Character_Set) return String;
  procedure Trim (Source : in out String; Left : Maps.Character_Set; Right : Maps.Character_Set;
                  Justify : Alignment := Strings.Left;
                  Pad : Character := Space);
  function Head (Source : String; Count : Natural; Pad : Character := Space) return String;
  procedure Head (Source : in out String; Count : Natural; Justify : Alignment := Left; Pad : Character := Space);
  function Tail (Source : String; Count : Natural; Pad : Character := Space) return String;
  procedure Tail (Source : in out String; Count : Natural; Justify : Alignment := Left; Pad : Character := Space);
  function "*" (Left : Natural; Right : Character) return String;
  function "*" (Left : Natural; Right : String) return String;
end;
package body Ada.Strings.Fixed is
  function Filled (Source : String; Pad : Character) return Boolean is (for all C of Source => C = Pad);
  procedure Join (Front, Middle, Back : String; Into : out String) is
    begin
      Into (1 .. Front'Length) := Front;
      Into (Front'Length + 1 .. Front'Length + Middle'Length) := Middle;
      Into (Front'Length + Middle'Length + 1 .. Into'Last) := Back;
    end;
  generic
    with function Hit (Position : Positive) return Boolean;
  function Search (Low, High : Integer; Going : Direction) return Natural;
  function Search (Low, High : Integer; Going : Direction) return Natural is
    begin
      if Going = Forward then
        for I in Low .. High loop
          if Hit (I) then return I; end if;
        end loop;
      else
        for I in reverse Low .. High loop
          if Hit (I) then return I; end if;
        end loop;
      end if;
      return 0;
    end;
  generic
    type Mapper is private;
    with function Map (Mapping : Mapper; Item : Character) return Character;
  package Mapped is
    function Index (Source, Pattern : String; From : Positive; Going : Direction; Mapping : Mapper) return Natural;
    function Count (Source, Pattern : String; Mapping : Mapper) return Natural;
    function Translate (Source : String; Mapping : Mapper) return String;
    procedure Translate (Source : in out String; Mapping : Mapper);
  end;
  package body Mapped is
    function Index (Source, Pattern : String; From : Positive; Going : Direction; Mapping : Mapper) return Natural is
      function Matches (Position : Positive) return Boolean is
        (for all K in Pattern'Range => Pattern (K) = Map (Mapping, Source (Position + K - Pattern'First)));
      function Find is new Search (Matches);
      begin
        if Pattern'Length = 0 then raise Pattern_Error; end if;
        if Source'Length = 0 then return 0; end if;
        if From not in Source'Range then raise Index_Error; end if;
        return (if Going = Forward then Find (From, Source'Last - Pattern'Length + 1, Forward)
                else Find (Source'First, From - Pattern'Length + 1, Backward));
      end;
    function Count (Source, Pattern : String; Mapping : Mapper) return Natural is
      Result : Natural := 0;
      I      : Natural := Source'First;
      begin
        loop
          I := Index (Source, Pattern, I, Forward, Mapping);
          exit when I = 0;
          Result := Result + 1;
          I := I + Pattern'Length;
          exit when I > Source'Last;
        end loop;
        return Result;
      end;
    function Translate (Source : String; Mapping : Mapper) return String is
      Result : String (1 .. Source'Length);
      begin
        for I in Result'Range loop
          Result (I) := Map (Mapping, Source (Source'First + I - 1));
        end loop;
        return Result;
      end;
    procedure Translate (Source : in out String; Mapping : Mapper) is
      begin
        for I in Source'Range loop
          Source (I) := Map (Mapping, Source (I));
        end loop;
      end;
  end;
  function Call (Mapping : Maps.Character_Mapping_Function; Item : Character) return Character is (Mapping (Item));
  package By_Table is new Mapped (Maps.Character_Mapping, Maps.Value);
  package By_Function is new Mapped (Maps.Character_Mapping_Function, Call);
  procedure Move (Source : String; Target : out String; Drop : Truncation := Error; Justify : Alignment := Left;
                  Pad : Character := Space) is
    Surplus : constant Integer := Source'Length - Target'Length;
    Front   : constant Natural :=
      (if Surplus >= 0 or else Justify = Left then 0 elsif Justify = Right then -Surplus else -Surplus / 2);
    begin
      if Surplus <= 0 then
        Target (Target'First .. Target'First + Front - 1) := (others => Pad);
        Target (Target'First + Front .. Target'First + Front + Source'Length - 1) := Source;
        Target (Target'First + Front + Source'Length .. Target'Last) := (others => Pad);
      elsif Drop = Left or else
        (Drop = Error and then Justify = Right and then Filled (Source (Source'First .. Source'First + Surplus - 1), Pad))
      then
        Target := Source (Source'Last - Target'Length + 1 .. Source'Last);
      elsif Drop = Right or else (Justify = Left and then Filled (Source (Source'Last - Surplus + 1 .. Source'Last), Pad)) then
        Target := Source (Source'First .. Source'First + Target'Length - 1);
      else
        raise Length_Error;
      end if;
    end;
  function Index (Source, Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    (By_Table.Index (Source, Pattern, From, Going, Mapping));
  function Index (Source, Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    (By_Function.Index (Source, Pattern, From, Going, Mapping));
  function Index (Source, Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    (if Going = Forward then Index (Source, Pattern, Source'First, Forward, Mapping)
     else Index (Source, Pattern, Integer'Max (Source'Last, 1), Backward, Mapping));
  function Index (Source, Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    (if Going = Forward then Index (Source, Pattern, Source'First, Forward, Mapping)
     else Index (Source, Pattern, Integer'Max (Source'Last, 1), Backward, Mapping));
  function Index (Source : String; Set : Maps.Character_Set; From : Positive; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural is
    function Member (Position : Positive) return Boolean is (Maps.Is_In (Source (Position), Set) = (Test = Inside));
    function Find is new Search (Member);
    begin
      if Source'Length = 0 then return 0; end if;
      if From not in Source'Range then raise Index_Error; end if;
      return (if Going = Forward then Find (From, Source'Last, Forward) else Find (Source'First, From, Backward));
    end;
  function Index (Source : String; Set : Maps.Character_Set; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural is
    (if Going = Forward then Index (Source, Set, Source'First, Test, Forward)
     else Index (Source, Set, Integer'Max (Source'Last, 1), Test, Backward));
  function Index_Non_Blank (Source : String; From : Positive; Going : Direction := Forward) return Natural is
    (Index (Source, Maps.To_Set (Space), From, Outside, Going));
  function Index_Non_Blank (Source : String; Going : Direction := Forward) return Natural is
    (Index (Source, Maps.To_Set (Space), Outside, Going));
  function Count (Source, Pattern : String; Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    (By_Table.Count (Source, Pattern, Mapping));
  function Count (Source, Pattern : String; Mapping : Maps.Character_Mapping_Function) return Natural is
    (By_Function.Count (Source, Pattern, Mapping));
  function Count (Source : String; Set : Maps.Character_Set) return Natural is
    Result : Natural := 0;
    begin
      for C of Source loop
        Result := Result + Boolean'Pos (Maps.Is_In (C, Set));
      end loop;
      return Result;
    end;
  procedure Find_Token (Source : String; Set : Maps.Character_Set; From : Positive; Test : Membership; First : out Positive;
                        Last : out Natural) is
    Start : constant Natural := (if Source'Length = 0 then 0 else Index (Source, Set, From, Test));
    Stop  : constant Natural :=
      (if Start not in 1 .. Source'Last - 1 then 0
       else Index (Source, Set, Start + 1, (if Test = Inside then Outside else Inside)));
    begin
      First := (if Start = 0 then From else Start);
      Last := (if Start = 0 then 0 elsif Stop = 0 then Source'Last else Stop - 1);
    end;
  procedure Find_Token (Source : String; Set : Maps.Character_Set; Test : Membership; First : out Positive;
                        Last : out Natural) is
    begin
      Find_Token (Source, Set, Source'First, Test, First, Last);
    end;
  function Translate (Source : String; Mapping : Maps.Character_Mapping) return String is
    (By_Table.Translate (Source, Mapping));
  procedure Translate (Source : in out String; Mapping : Maps.Character_Mapping) renames By_Table.Translate;
  function Translate (Source : String; Mapping : Maps.Character_Mapping_Function) return String is
    (By_Function.Translate (Source, Mapping));
  procedure Translate (Source : in out String; Mapping : Maps.Character_Mapping_Function) renames By_Function.Translate;
  function Replace_Slice (Source : String; Low : Positive; High : Natural; By : String) return String is
    Cut : constant Integer := Integer'Max (High, Low - 1);
    begin
      if Low > Source'Last + 1 or else High < Source'First - 1 then raise Index_Error; end if;
      declare
        Result : String (1 .. Low - Source'First + By'Length + Integer'Max (0, Source'Last - Cut));
        begin
          Join (Source (Source'First .. Low - 1), By, Source (Cut + 1 .. Source'Last), Result);
          return Result;
        end;
    end;
  procedure Replace_Slice (Source : in out String; Low : Positive; High : Natural; By : String; Drop : Truncation := Error;
                           Justify : Alignment := Left; Pad : Character := Space) is
    begin
      Move (Replace_Slice (Source, Low, High, By), Source, Drop, Justify, Pad);
    end;
  function Insert (Source : String; Before : Positive; New_Item : String) return String is
    Result : String (1 .. Source'Length + New_Item'Length);
    begin
      if Before not in Source'First .. Source'Last + 1 then raise Index_Error; end if;
      Join (Source (Source'First .. Before - 1), New_Item, Source (Before .. Source'Last), Result);
      return Result;
    end;
  procedure Insert (Source : in out String; Before : Positive; New_Item : String; Drop : Truncation := Error) is
    begin
      Move (Insert (Source, Before, New_Item), Source, Drop);
    end;
  function Overwrite (Source : String; Position : Positive; New_Item : String) return String is
    begin
      if Position not in Source'First .. Source'Last + 1 then raise Index_Error; end if;
      declare
        Result : String (1 .. Integer'Max (Source'Length, Position - Source'First + New_Item'Length));
        begin
          Join (Source (Source'First .. Position - 1), New_Item, Source (Position + New_Item'Length .. Source'Last), Result);
          return Result;
        end;
    end;
  procedure Overwrite (Source : in out String; Position : Positive; New_Item : String; Drop : Truncation := Right) is
    begin
      Move (Overwrite (Source, Position, New_Item), Source, Drop);
    end;
  function Delete (Source : String; From : Positive; Through : Natural) return String is
    begin
      if From <= Through and then (From not in Source'Range or else Through > Source'Last) then raise Index_Error; end if;
      declare
        Result : String (1 .. Source'Length - Integer'Max (0, Through - From + 1));
        begin
          Join (Source (Source'First .. Integer'Min (From - 1, Source'Last)), "",
                Source (Integer'Max (Through + 1, From) .. Source'Last), Result);
          return Result;
        end;
    end;
  procedure Delete (Source : in out String; From : Positive; Through : Natural; Justify : Alignment := Left;
                    Pad : Character := Space) is
    begin
      Move (Delete (Source, From, Through), Source, Justify => Justify, Pad => Pad);
    end;
  function Trim (Source : String; Side : Trim_End) return String is
    function Marked (Position : Positive) return Boolean is (Source (Position) /= Space);
    function Find is new Search (Marked);
    First  : constant Natural := (if Side = Right then Source'First else Find (Source'First, Source'Last, Forward));
    Start  : constant Positive := Integer'Max (First, 1);
    Stop   : constant Natural :=
      (if First = 0 then 0 elsif Side = Left then Source'Last else Find (Start, Source'Last, Backward));
    Result : String (1 .. Integer'Max (0, Stop - Start + 1));
    begin
      Join (Source (Start .. Stop), "", "", Result);
      return Result;
    end;
  procedure Trim (Source : in out String; Side : Trim_End; Justify : Alignment := Left; Pad : Character := Space) is
    begin
      Move (Trim (Source, Side), Source, Justify => Justify, Pad => Pad);
    end;
  function Trim (Source : String; Left : Maps.Character_Set; Right : Maps.Character_Set) return String is
    First  : constant Natural := Index (Source, Left, Outside);
    Start  : constant Positive := Integer'Max (First, 1);
    Stop   : constant Natural := (if First = 0 then 0 else Index (Source, Right, Outside, Backward));
    Result : String (1 .. Integer'Max (0, Stop - Start + 1));
    begin
      Join (Source (Start .. Stop), "", "", Result);
      return Result;
    end;
  procedure Trim (Source : in out String; Left : Maps.Character_Set; Right : Maps.Character_Set;
                  Justify : Alignment := Strings.Left;
                  Pad : Character := Space) is
    begin
      Move (Trim (Source, Left, Right), Source, Justify => Justify, Pad => Pad);
    end;
  function Head (Source : String; Count : Natural; Pad : Character := Space) return String is
    Result : String (1 .. Count);
    begin
      Join (Source (Source'First .. Source'First + Integer'Min (Count, Source'Length) - 1),
            (1 .. Count - Source'Length => Pad), "", Result);
      return Result;
    end;
  procedure Head (Source : in out String; Count : Natural; Justify : Alignment := Left; Pad : Character := Space) is
    begin
      Move (Head (Source, Count, Pad), Source, Error, Justify, Pad);
    end;
  function Tail (Source : String; Count : Natural; Pad : Character := Space) return String is
    Result : String (1 .. Count);
    begin
      Join ((1 .. Count - Source'Length => Pad),
            Source (Source'Last - Integer'Min (Count, Source'Length) + 1 .. Source'Last), "", Result);
      return Result;
    end;
  procedure Tail (Source : in out String; Count : Natural; Justify : Alignment := Left; Pad : Character := Space) is
    begin
      Move (Tail (Source, Count, Pad), Source, Error, Justify, Pad);
    end;
  function "*" (Left : Natural; Right : Character) return String is (1 .. Left => Right);
  function "*" (Left : Natural; Right : String) return String is
    Result : String (1 .. Left * Right'Length);
    begin
      for I in 0 .. Left - 1 loop
        Result (I * Right'Length + 1 .. (I + 1) * Right'Length) := Right;
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
    for C of Key loop
      Result := (Result xor Character'Pos (C)) * 16777619;
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
  begin
    return Ada.Characters.Handling.To_Lower (Left) = Ada.Characters.Handling.To_Lower (Right);
  end;
function Ada.Strings.Less_Case_Insensitive (Left, Right : String) return Boolean;
with Ada.Characters.Handling;
function Ada.Strings.Less_Case_Insensitive (Left, Right : String) return Boolean is
  begin
    return Ada.Characters.Handling.To_Lower (Left) < Ada.Characters.Handling.To_Lower (Right);
  end;
with Ada.Containers, Ada.Strings.Hash;
function Ada.Strings.Fixed.Hash (Key : String) return Ada.Containers.Hash_Type renames Ada.Strings.Hash;
with Ada.Containers, Ada.Strings.Hash_Case_Insensitive;
function Ada.Strings.Fixed.Hash_Case_Insensitive (Key : String) return Ada.Containers.Hash_Type renames Ada.Strings.Hash_Case_Insensitive;
with Ada.Strings.Equal_Case_Insensitive;
function Ada.Strings.Fixed.Equal_Case_Insensitive (Left, Right : String) return Boolean renames Ada.Strings.Equal_Case_Insensitive;
with Ada.Strings.Less_Case_Insensitive;
function Ada.Strings.Fixed.Less_Case_Insensitive (Left, Right : String) return Boolean renames Ada.Strings.Less_Case_Insensitive;
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
    function To_Bounded_String (Source : String; Drop : Truncation := Error) return Bounded_String;
    function To_String (Source : Bounded_String) return String;
    procedure Set_Bounded_String (Target : out Bounded_String; Source : String; Drop : Truncation := Error);
    function Append (Left, Right : Bounded_String; Drop : Truncation := Error) return Bounded_String;
    function Append (Left : Bounded_String; Right : String; Drop : Truncation := Error) return Bounded_String;
    function Append (Left : String; Right : Bounded_String; Drop : Truncation := Error) return Bounded_String;
    function Append (Left : Bounded_String; Right : Character; Drop : Truncation := Error) return Bounded_String;
    function Append (Left : Character; Right : Bounded_String; Drop : Truncation := Error) return Bounded_String;
    procedure Append (Source : in out Bounded_String; New_Item : Bounded_String; Drop : Truncation := Error);
    procedure Append (Source : in out Bounded_String; New_Item : String; Drop : Truncation := Error);
    procedure Append (Source : in out Bounded_String; New_Item : Character; Drop : Truncation := Error);
    function "&" (Left, Right : Bounded_String) return Bounded_String;
    function "&" (Left : Bounded_String; Right : String) return Bounded_String;
    function "&" (Left : String; Right : Bounded_String) return Bounded_String;
    function "&" (Left : Bounded_String; Right : Character) return Bounded_String;
    function "&" (Left : Character; Right : Bounded_String) return Bounded_String;
    function Element (Source : Bounded_String; Index : Positive) return Character;
    procedure Replace_Element (Source : in out Bounded_String; Index : Positive; By : Character);
    function Slice (Source : Bounded_String; Low : Positive; High : Natural) return String;
    function Bounded_Slice (Source : Bounded_String; Low : Positive; High : Natural) return Bounded_String;
    procedure Bounded_Slice (Source : Bounded_String; Target : out Bounded_String; Low : Positive; High : Natural);
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
    function Index (Source : Bounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
    function Index (Source : Bounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural;
    function Index (Source : Bounded_String; Pattern : String; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
    function Index (Source : Bounded_String; Pattern : String; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural;
    function Index (Source : Bounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership := Inside;
                    Going : Direction := Forward) return Natural;
    function Index (Source : Bounded_String; Set : Maps.Character_Set; Test : Membership := Inside;
                    Going : Direction := Forward) return Natural;
    function Index_Non_Blank (Source : Bounded_String; From : Positive; Going : Direction := Forward) return Natural;
    function Index_Non_Blank (Source : Bounded_String; Going : Direction := Forward) return Natural;
    function Count (Source : Bounded_String; Pattern : String;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
    function Count (Source : Bounded_String; Pattern : String; Mapping : Maps.Character_Mapping_Function) return Natural;
    function Count (Source : Bounded_String; Set : Maps.Character_Set) return Natural;
    procedure Find_Token (Source : Bounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership;
                          First : out Positive; Last : out Natural);
    procedure Find_Token (Source : Bounded_String; Set : Maps.Character_Set; Test : Membership; First : out Positive;
                          Last : out Natural);
    function Translate (Source : Bounded_String; Mapping : Maps.Character_Mapping) return Bounded_String;
    procedure Translate (Source : in out Bounded_String; Mapping : Maps.Character_Mapping);
    function Translate (Source : Bounded_String; Mapping : Maps.Character_Mapping_Function) return Bounded_String;
    procedure Translate (Source : in out Bounded_String; Mapping : Maps.Character_Mapping_Function);
    function Replace_Slice (Source : Bounded_String; Low : Positive; High : Natural; By : String; Drop : Truncation := Error)
      return Bounded_String;
    procedure Replace_Slice (Source : in out Bounded_String; Low : Positive; High : Natural; By : String;
                             Drop : Truncation := Error);
    function Insert (Source : Bounded_String; Before : Positive; New_Item : String;
                     Drop : Truncation := Error) return Bounded_String;
    procedure Insert (Source : in out Bounded_String; Before : Positive; New_Item : String; Drop : Truncation := Error);
    function Overwrite (Source : Bounded_String; Position : Positive; New_Item : String;
                        Drop : Truncation := Error) return Bounded_String;
    procedure Overwrite (Source : in out Bounded_String; Position : Positive; New_Item : String; Drop : Truncation := Error);
    function Delete (Source : Bounded_String; From : Positive; Through : Natural) return Bounded_String;
    procedure Delete (Source : in out Bounded_String; From : Positive; Through : Natural);
    function Trim (Source : Bounded_String; Side : Trim_End) return Bounded_String;
    procedure Trim (Source : in out Bounded_String; Side : Trim_End);
    function Trim (Source : Bounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set) return Bounded_String;
    procedure Trim (Source : in out Bounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set);
    function Head (Source : Bounded_String; Count : Natural; Pad : Character := Space;
                   Drop : Truncation := Error) return Bounded_String;
    procedure Head (Source : in out Bounded_String; Count : Natural; Pad : Character := Space; Drop : Truncation := Error);
    function Tail (Source : Bounded_String; Count : Natural; Pad : Character := Space;
                   Drop : Truncation := Error) return Bounded_String;
    procedure Tail (Source : in out Bounded_String; Count : Natural; Pad : Character := Space; Drop : Truncation := Error);
    function "*" (Left : Natural; Right : Character) return Bounded_String;
    function "*" (Left : Natural; Right : String) return Bounded_String;
    function "*" (Left : Natural; Right : Bounded_String) return Bounded_String;
    function Replicate (Count : Natural; Item : Character; Drop : Truncation := Error) return Bounded_String;
    function Replicate (Count : Natural; Item : String; Drop : Truncation := Error) return Bounded_String;
    function Replicate (Count : Natural; Item : Bounded_String; Drop : Truncation := Error) return Bounded_String;
  private
    type Bounded_String is record
      Length : Length_Range := 0;
      Data   : String (1 .. Max_Length);
    end record;
    Null_Bounded_String : constant Bounded_String := (Length => 0, Data => <>);
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
    function Length (Source : Bounded_String) return Length_Range is (Source.Length);
    function To_String (Source : Bounded_String) return String is (Source.Data (1 .. Source.Length));
    procedure Append (Source : in out Bounded_String; New_Item : String; Drop : Truncation := Error) is
      Room : constant Integer := Max_Length - Source.Length;
      begin
        if New_Item'Length <= Room then
          Source.Data (Source.Length + 1 .. Source.Length + New_Item'Length) := New_Item;
        elsif Drop = Error then
          raise Length_Error;
        elsif Drop = Right then
          Source.Data (Source.Length + 1 .. Max_Length) := New_Item (New_Item'First .. New_Item'First + Room - 1);
        elsif New_Item'Length >= Max_Length then
          Source.Data := New_Item (New_Item'Last - Max_Length + 1 .. New_Item'Last);
        else
          Source.Data (1 .. Max_Length - New_Item'Length) :=
            Source.Data (Source.Length - Max_Length + New_Item'Length + 1 .. Source.Length);
          Source.Data (Max_Length - New_Item'Length + 1 .. Max_Length) := New_Item;
        end if;
        Source.Length := Integer'Min (Max_Length, Source.Length + New_Item'Length);
      end;
    function To_Bounded_String (Source : String; Drop : Truncation := Error) return Bounded_String is
      Result : Bounded_String;
      begin
        Append (Result, Source, Drop);
        return Result;
      end;
    procedure Set_Bounded_String (Target : out Bounded_String; Source : String; Drop : Truncation := Error) is
      begin
        Target := To_Bounded_String (Source, Drop);
      end;
    function Append (Left, Right : Bounded_String; Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Left.Data (1 .. Left.Length) & Right.Data (1 .. Right.Length), Drop));
    function Append (Left : Bounded_String; Right : String; Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Left.Data (1 .. Left.Length) & Right, Drop));
    function Append (Left : String; Right : Bounded_String; Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Left & Right.Data (1 .. Right.Length), Drop));
    function Append (Left : Bounded_String; Right : Character; Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Left.Data (1 .. Left.Length) & Right, Drop));
    function Append (Left : Character; Right : Bounded_String; Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Left & Right.Data (1 .. Right.Length), Drop));
    procedure Append (Source : in out Bounded_String; New_Item : Bounded_String; Drop : Truncation := Error) is
      begin
        Append (Source, To_String (New_Item), Drop);
      end;
    procedure Append (Source : in out Bounded_String; New_Item : Character; Drop : Truncation := Error) is
      begin
        Append (Source, String'(1 => New_Item), Drop);
      end;
    function "&" (Left, Right : Bounded_String) return Bounded_String is (Append (Left, Right));
    function "&" (Left : Bounded_String; Right : String) return Bounded_String is (Append (Left, Right));
    function "&" (Left : String; Right : Bounded_String) return Bounded_String is (Append (Left, Right));
    function "&" (Left : Bounded_String; Right : Character) return Bounded_String is (Append (Left, Right));
    function "&" (Left : Character; Right : Bounded_String) return Bounded_String is (Append (Left, Right));
    function Element (Source : Bounded_String; Index : Positive) return Character is
      (if Index <= Source.Length then Source.Data (Index) else raise Index_Error);
    procedure Replace_Element (Source : in out Bounded_String; Index : Positive; By : Character) is
      begin
        if Index > Source.Length then raise Index_Error; end if;
        Source.Data (Index) := By;
      end;
    function Slice (Source : Bounded_String; Low : Positive; High : Natural) return String is
      (if Low > Source.Length + 1 or else High > Source.Length then raise Index_Error else Source.Data (Low .. High));
    function Bounded_Slice (Source : Bounded_String; Low : Positive; High : Natural) return Bounded_String is
      (To_Bounded_String (Slice (Source, Low, High)));
    procedure Bounded_Slice (Source : Bounded_String; Target : out Bounded_String; Low : Positive; High : Natural) is
      begin
        Target := Bounded_Slice (Source, Low, High);
      end;
    function "=" (Left, Right : Bounded_String) return Boolean is
      (Left.Data (1 .. Left.Length) = Right.Data (1 .. Right.Length));
    function "=" (Left : Bounded_String; Right : String) return Boolean is (Left.Data (1 .. Left.Length) = Right);
    function "=" (Left : String; Right : Bounded_String) return Boolean is (Left = Right.Data (1 .. Right.Length));
    function "<" (Left, Right : Bounded_String) return Boolean is
      (Left.Data (1 .. Left.Length) < Right.Data (1 .. Right.Length));
    function "<" (Left : Bounded_String; Right : String) return Boolean is (Left.Data (1 .. Left.Length) < Right);
    function "<" (Left : String; Right : Bounded_String) return Boolean is (Left < Right.Data (1 .. Right.Length));
    function "<=" (Left, Right : Bounded_String) return Boolean is
      (Left.Data (1 .. Left.Length) <= Right.Data (1 .. Right.Length));
    function "<=" (Left : Bounded_String; Right : String) return Boolean is (Left.Data (1 .. Left.Length) <= Right);
    function "<=" (Left : String; Right : Bounded_String) return Boolean is (Left <= Right.Data (1 .. Right.Length));
    function ">" (Left, Right : Bounded_String) return Boolean is
      (Left.Data (1 .. Left.Length) > Right.Data (1 .. Right.Length));
    function ">" (Left : Bounded_String; Right : String) return Boolean is (Left.Data (1 .. Left.Length) > Right);
    function ">" (Left : String; Right : Bounded_String) return Boolean is (Left > Right.Data (1 .. Right.Length));
    function ">=" (Left, Right : Bounded_String) return Boolean is
      (Left.Data (1 .. Left.Length) >= Right.Data (1 .. Right.Length));
    function ">=" (Left : Bounded_String; Right : String) return Boolean is (Left.Data (1 .. Left.Length) >= Right);
    function ">=" (Left : String; Right : Bounded_String) return Boolean is (Left >= Right.Data (1 .. Right.Length));
    function Index (Source : Bounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
      (Fixed.Index (Source.Data (1 .. Source.Length), Pattern, From, Going, Mapping));
    function Index (Source : Bounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural is
      (Fixed.Index (Source.Data (1 .. Source.Length), Pattern, From, Going, Mapping));
    function Index (Source : Bounded_String; Pattern : String; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
      (Fixed.Index (Source.Data (1 .. Source.Length), Pattern, Going, Mapping));
    function Index (Source : Bounded_String; Pattern : String; Going : Direction := Forward;
                    Mapping : Maps.Character_Mapping_Function) return Natural is
      (Fixed.Index (Source.Data (1 .. Source.Length), Pattern, Going, Mapping));
    function Index (Source : Bounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership := Inside;
                    Going : Direction := Forward) return Natural is
      (Fixed.Index (Source.Data (1 .. Source.Length), Set, From, Test, Going));
    function Index (Source : Bounded_String; Set : Maps.Character_Set; Test : Membership := Inside;
                    Going : Direction := Forward) return Natural is
      (Fixed.Index (Source.Data (1 .. Source.Length), Set, Test, Going));
    function Index_Non_Blank (Source : Bounded_String; From : Positive; Going : Direction := Forward) return Natural is
      (Fixed.Index_Non_Blank (Source.Data (1 .. Source.Length), From, Going));
    function Index_Non_Blank (Source : Bounded_String; Going : Direction := Forward) return Natural is
      (Fixed.Index_Non_Blank (Source.Data (1 .. Source.Length), Going));
    function Count (Source : Bounded_String; Pattern : String;
                    Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
      (Fixed.Count (Source.Data (1 .. Source.Length), Pattern, Mapping));
    function Count (Source : Bounded_String; Pattern : String; Mapping : Maps.Character_Mapping_Function) return Natural is
      (Fixed.Count (Source.Data (1 .. Source.Length), Pattern, Mapping));
    function Count (Source : Bounded_String; Set : Maps.Character_Set) return Natural is
      (Fixed.Count (Source.Data (1 .. Source.Length), Set));
    procedure Find_Token (Source : Bounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership;
                          First : out Positive; Last : out Natural) is
      begin
        Fixed.Find_Token (Source.Data (1 .. Source.Length), Set, From, Test, First, Last);
      end;
    procedure Find_Token (Source : Bounded_String; Set : Maps.Character_Set; Test : Membership; First : out Positive;
                          Last : out Natural) is
      begin
        Fixed.Find_Token (Source.Data (1 .. Source.Length), Set, Test, First, Last);
      end;
    function Translate (Source : Bounded_String; Mapping : Maps.Character_Mapping) return Bounded_String is
      (To_Bounded_String (Fixed.Translate (Source.Data (1 .. Source.Length), Mapping)));
    procedure Translate (Source : in out Bounded_String; Mapping : Maps.Character_Mapping) is
      begin
        Fixed.Translate (Source.Data (1 .. Source.Length), Mapping);
      end;
    function Translate (Source : Bounded_String; Mapping : Maps.Character_Mapping_Function) return Bounded_String is
      (To_Bounded_String (Fixed.Translate (Source.Data (1 .. Source.Length), Mapping)));
    procedure Translate (Source : in out Bounded_String; Mapping : Maps.Character_Mapping_Function) is
      begin
        Fixed.Translate (Source.Data (1 .. Source.Length), Mapping);
      end;
    function Replace_Slice (Source : Bounded_String; Low : Positive; High : Natural; By : String; Drop : Truncation := Error)
      return Bounded_String is
      (To_Bounded_String (Fixed.Replace_Slice (Source.Data (1 .. Source.Length), Low, High, By), Drop));
    procedure Replace_Slice (Source : in out Bounded_String; Low : Positive; High : Natural; By : String;
                             Drop : Truncation := Error) is
      begin
        Source := Replace_Slice (Source, Low, High, By, Drop);
      end;
    function Insert (Source : Bounded_String; Before : Positive; New_Item : String;
                     Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Fixed.Insert (Source.Data (1 .. Source.Length), Before, New_Item), Drop));
    procedure Insert (Source : in out Bounded_String; Before : Positive; New_Item : String; Drop : Truncation := Error) is
      begin
        Source := Insert (Source, Before, New_Item, Drop);
      end;
    function Overwrite (Source : Bounded_String; Position : Positive; New_Item : String;
                        Drop : Truncation := Error) return Bounded_String is
      (To_Bounded_String (Fixed.Overwrite (Source.Data (1 .. Source.Length), Position, New_Item), Drop));
    procedure Overwrite (Source : in out Bounded_String; Position : Positive; New_Item : String; Drop : Truncation := Error) is
      begin
        Source := Overwrite (Source, Position, New_Item, Drop);
      end;
    function Delete (Source : Bounded_String; From : Positive; Through : Natural) return Bounded_String is
      (To_Bounded_String (Fixed.Delete (Source.Data (1 .. Source.Length), From, Through)));
    procedure Delete (Source : in out Bounded_String; From : Positive; Through : Natural) is
      begin
        Source := Delete (Source, From, Through);
      end;
    function Trim (Source : Bounded_String; Side : Trim_End) return Bounded_String is
      (To_Bounded_String (Fixed.Trim (Source.Data (1 .. Source.Length), Side)));
    procedure Trim (Source : in out Bounded_String; Side : Trim_End) is
      begin
        Source := Trim (Source, Side);
      end;
    function Trim (Source : Bounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set) return Bounded_String is
      (To_Bounded_String (Fixed.Trim (Source.Data (1 .. Source.Length), Left, Right)));
    procedure Trim (Source : in out Bounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set) is
      begin
        Source := Trim (Source, Left, Right);
      end;
    function Head (Source : Bounded_String; Count : Natural; Pad : Character := Space;
                   Drop : Truncation := Error) return Bounded_String is
      (if Count > Max_Length and then Drop = Error then raise Length_Error
       else To_Bounded_String (Fixed.Head (Source.Data (1 .. Source.Length), Integer'Min (Count, 2 * Max_Length), Pad), Drop));
    procedure Head (Source : in out Bounded_String; Count : Natural; Pad : Character := Space; Drop : Truncation := Error) is
      begin
        Source := Head (Source, Count, Pad, Drop);
      end;
    function Tail (Source : Bounded_String; Count : Natural; Pad : Character := Space;
                   Drop : Truncation := Error) return Bounded_String is
      (if Count > Max_Length and then Drop = Error then raise Length_Error
       else To_Bounded_String (Fixed.Tail (Source.Data (1 .. Source.Length), Integer'Min (Count, 2 * Max_Length), Pad), Drop));
    procedure Tail (Source : in out Bounded_String; Count : Natural; Pad : Character := Space; Drop : Truncation := Error) is
      begin
        Source := Tail (Source, Count, Pad, Drop);
      end;
    function Replicate (Count : Natural; Item : Character; Drop : Truncation := Error) return Bounded_String is
      (if Count > Max_Length and then Drop = Error then raise Length_Error
       else To_Bounded_String (Fixed."*" (Integer'Min (Count, Max_Length), Item), Drop));
    function Replicate (Count : Natural; Item : String; Drop : Truncation := Error) return Bounded_String is
      (if Count * Item'Length > Max_Length and then Drop = Error then raise Length_Error
       else To_Bounded_String (Fixed."*" (Integer'Min (Count, Max_Length / Integer'Max (Item'Length, 1) + 1), Item), Drop));
    function Replicate (Count : Natural; Item : Bounded_String; Drop : Truncation := Error) return Bounded_String is
      (Replicate (Count, Item.Data (1 .. Item.Length), Drop));
    function "*" (Left : Natural; Right : Character) return Bounded_String is (Replicate (Left, Right));
    function "*" (Left : Natural; Right : String) return Bounded_String is (Replicate (Left, Right));
    function "*" (Left : Natural; Right : Bounded_String) return Bounded_String is (Replicate (Left, Right));
  end;
  function Hash (Key : Bounded.Bounded_String) return Ada.Containers.Hash_Type is (Ada.Strings.Hash (Bounded.To_String (Key)));
  function Hash_Case_Insensitive (Key : Bounded.Bounded_String) return Ada.Containers.Hash_Type is
    (Ada.Strings.Hash_Case_Insensitive (Bounded.To_String (Key)));
  function Equal_Case_Insensitive (Left, Right : Bounded.Bounded_String) return Boolean is
    (Ada.Strings.Equal_Case_Insensitive (Bounded.To_String (Left), Bounded.To_String (Right)));
  function Less_Case_Insensitive (Left, Right : Bounded.Bounded_String) return Boolean is
    (Ada.Strings.Less_Case_Insensitive (Bounded.To_String (Left), Bounded.To_String (Right)));
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
  function Index (Source : Unbounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source : Unbounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source : Unbounded_String; Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Index (Source : Unbounded_String; Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural;
  function Index (Source : Unbounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural;
  function Index (Source : Unbounded_String; Set : Maps.Character_Set; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : Unbounded_String; From : Positive; Going : Direction := Forward) return Natural;
  function Index_Non_Blank (Source : Unbounded_String; Going : Direction := Forward) return Natural;
  function Count (Source : Unbounded_String; Pattern : String;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural;
  function Count (Source : Unbounded_String; Pattern : String; Mapping : Maps.Character_Mapping_Function) return Natural;
  function Count (Source : Unbounded_String; Set : Maps.Character_Set) return Natural;
  procedure Find_Token (Source : Unbounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership;
                        First : out Positive; Last : out Natural);
  procedure Find_Token (Source : Unbounded_String; Set : Maps.Character_Set; Test : Membership; First : out Positive;
                        Last : out Natural);
  function Translate (Source : Unbounded_String; Mapping : Maps.Character_Mapping) return Unbounded_String;
  procedure Translate (Source : in out Unbounded_String; Mapping : Maps.Character_Mapping);
  function Translate (Source : Unbounded_String; Mapping : Maps.Character_Mapping_Function) return Unbounded_String;
  procedure Translate (Source : in out Unbounded_String; Mapping : Maps.Character_Mapping_Function);
  function Replace_Slice (Source : Unbounded_String; Low : Positive; High : Natural; By : String) return Unbounded_String;
  procedure Replace_Slice (Source : in out Unbounded_String; Low : Positive; High : Natural; By : String);
  function Insert (Source : Unbounded_String; Before : Positive; New_Item : String) return Unbounded_String;
  procedure Insert (Source : in out Unbounded_String; Before : Positive; New_Item : String);
  function Overwrite (Source : Unbounded_String; Position : Positive; New_Item : String) return Unbounded_String;
  procedure Overwrite (Source : in out Unbounded_String; Position : Positive; New_Item : String);
  function Delete (Source : Unbounded_String; From : Positive; Through : Natural) return Unbounded_String;
  procedure Delete (Source : in out Unbounded_String; From : Positive; Through : Natural);
  function Trim (Source : Unbounded_String; Side : Trim_End) return Unbounded_String;
  procedure Trim (Source : in out Unbounded_String; Side : Trim_End);
  function Trim (Source : Unbounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set) return Unbounded_String;
  procedure Trim (Source : in out Unbounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set);
  function Head (Source : Unbounded_String; Count : Natural; Pad : Character := Space) return Unbounded_String;
  procedure Head (Source : in out Unbounded_String; Count : Natural; Pad : Character := Space);
  function Tail (Source : Unbounded_String; Count : Natural; Pad : Character := Space) return Unbounded_String;
  procedure Tail (Source : in out Unbounded_String; Count : Natural; Pad : Character := Space);
  function "*" (Left : Natural; Right : Character) return Unbounded_String;
  function "*" (Left : Natural; Right : String) return Unbounded_String;
  function "*" (Left : Natural; Right : Unbounded_String) return Unbounded_String;
private
  type Buffer_Access is access String;
  Empty : constant Buffer_Access := new String (1 .. 0);
  type Unbounded_String is new Controlled with record
    Buffer : Buffer_Access := Empty;
    Last   : Natural := 0;
  end record;
  procedure Adjust (Object : in out Unbounded_String);
  procedure Finalize (Object : in out Unbounded_String);
  Null_Unbounded_String : constant Unbounded_String := (Buffer => Empty, Last => 0);
end;
with Unchecked_Deallocation;
with Ada.Strings.Fixed;
package body Ada.Strings.Unbounded is
  procedure Release is new Unchecked_Deallocation (String, Buffer_Access);
  procedure Release is new Unchecked_Deallocation (String, String_Access);
  procedure Free (X : in out String_Access) renames Release;
  procedure Discard (Buffer : in out Buffer_Access) is
    begin
      if Buffer /= Empty then
        Release (Buffer);
      end if;
      Buffer := Empty;
    end;
  procedure Adjust (Object : in out Unbounded_String) is
    begin
      Object.Buffer := (if Object.Last = 0 then Empty else new String'(Object.Buffer (1 .. Object.Last)));
    end;
  procedure Finalize (Object : in out Unbounded_String) is
    begin
      Discard (Object.Buffer);
      Object.Last := 0;
    end;
  procedure Reserve (Source : in out Unbounded_String; Capacity : Natural) is
    Old : Buffer_Access := Source.Buffer;
    begin
      if Capacity > Old'Length then
        Source.Buffer := new String (1 .. Integer'Max (Capacity, 2 * Old'Length));
        Source.Buffer (1 .. Source.Last) := Old (1 .. Source.Last);
        Discard (Old);
      end if;
    end;
  procedure Splice (Source : in out Unbounded_String; Low : Positive; High : Natural; By : String) is
    Last : constant Natural := Low - 1 + By'Length + Source.Last - High;
    begin
      Reserve (Source, Last);
      if By'Length /= High - Low + 1 then
        Source.Buffer (Low + By'Length .. Last) := Source.Buffer (High + 1 .. Source.Last);
      end if;
      Source.Buffer (Low .. Low + By'Length - 1) := By;
      Source.Last := Last;
    end;
  procedure Keep (Source : in out Unbounded_String; First : Positive; Last : Natural) is
    begin
      Source.Buffer (1 .. Integer'Max (0, Last - First + 1)) := Source.Buffer (First .. Last);
      Source.Last := Integer'Max (0, Last - First + 1);
    end;
  function Length (Source : Unbounded_String) return Natural is (Source.Last);
  function To_String (Source : Unbounded_String) return String is (Source.Buffer (1 .. Source.Last));
  procedure Append (Source : in out Unbounded_String; New_Item : String) is
    begin
      Splice (Source, Source.Last + 1, Source.Last, New_Item);
    end;
  procedure Append (Source : in out Unbounded_String; New_Item : Unbounded_String) is
    begin
      Reserve (Source, Source.Last + New_Item.Last);
      Source.Buffer (Source.Last + 1 .. Source.Last + New_Item.Last) := New_Item.Buffer (1 .. New_Item.Last);
      Source.Last := Source.Last + New_Item.Last;
    end;
  procedure Append (Source : in out Unbounded_String; New_Item : Character) is
    begin
      Reserve (Source, Source.Last + 1);
      Source.Last := Source.Last + 1;
      Source.Buffer (Source.Last) := New_Item;
    end;
  function Join (Left, Right : String) return Unbounded_String is
    Result : Unbounded_String;
    begin
      Reserve (Result, Left'Length + Right'Length);
      Append (Result, Left);
      Append (Result, Right);
      return Result;
    end;
  function To_Unbounded_String (Source : String) return Unbounded_String is (Join (Source, ""));
  function To_Unbounded_String (Length : Natural) return Unbounded_String is (Join ((1 .. Length => Space), ""));
  procedure Set_Unbounded_String (Target : out Unbounded_String; Source : String) is
    begin
      Target := To_Unbounded_String (Source);
    end;
  function "&" (Left, Right : Unbounded_String) return Unbounded_String is
    (Join (Left.Buffer (1 .. Left.Last), Right.Buffer (1 .. Right.Last)));
  function "&" (Left : Unbounded_String; Right : String) return Unbounded_String is
    (Join (Left.Buffer (1 .. Left.Last), Right));
  function "&" (Left : String; Right : Unbounded_String) return Unbounded_String is
    (Join (Left, Right.Buffer (1 .. Right.Last)));
  function "&" (Left : Unbounded_String; Right : Character) return Unbounded_String is
    (Join (Left.Buffer (1 .. Left.Last), (1 => Right)));
  function "&" (Left : Character; Right : Unbounded_String) return Unbounded_String is
    (Join ((1 => Left), Right.Buffer (1 .. Right.Last)));
  function Element (Source : Unbounded_String; Index : Positive) return Character is
    (if Index <= Source.Last then Source.Buffer (Index) else raise Index_Error);
  procedure Replace_Element (Source : in out Unbounded_String; Index : Positive; By : Character) is
    begin
      if Index > Source.Last then raise Index_Error; end if;
      Source.Buffer (Index) := By;
    end;
  function Slice (Source : Unbounded_String; Low : Positive; High : Natural) return String is
    (if Low > Source.Last + 1 or else High > Source.Last then raise Index_Error else Source.Buffer (Low .. High));
  function Unbounded_Slice (Source : Unbounded_String; Low : Positive; High : Natural) return Unbounded_String is
    (To_Unbounded_String (Slice (Source, Low, High)));
  procedure Unbounded_Slice (Source : Unbounded_String; Target : out Unbounded_String; Low : Positive; High : Natural) is
    begin
      Target := Unbounded_Slice (Source, Low, High);
    end;
  function "=" (Left, Right : Unbounded_String) return Boolean is
    (Left.Buffer (1 .. Left.Last) = Right.Buffer (1 .. Right.Last));
  function "=" (Left : Unbounded_String; Right : String) return Boolean is (Left.Buffer (1 .. Left.Last) = Right);
  function "=" (Left : String; Right : Unbounded_String) return Boolean is (Left = Right.Buffer (1 .. Right.Last));
  function "<" (Left, Right : Unbounded_String) return Boolean is
    (Left.Buffer (1 .. Left.Last) < Right.Buffer (1 .. Right.Last));
  function "<" (Left : Unbounded_String; Right : String) return Boolean is (Left.Buffer (1 .. Left.Last) < Right);
  function "<" (Left : String; Right : Unbounded_String) return Boolean is (Left < Right.Buffer (1 .. Right.Last));
  function "<=" (Left, Right : Unbounded_String) return Boolean is
    (Left.Buffer (1 .. Left.Last) <= Right.Buffer (1 .. Right.Last));
  function "<=" (Left : Unbounded_String; Right : String) return Boolean is (Left.Buffer (1 .. Left.Last) <= Right);
  function "<=" (Left : String; Right : Unbounded_String) return Boolean is (Left <= Right.Buffer (1 .. Right.Last));
  function ">" (Left, Right : Unbounded_String) return Boolean is
    (Left.Buffer (1 .. Left.Last) > Right.Buffer (1 .. Right.Last));
  function ">" (Left : Unbounded_String; Right : String) return Boolean is (Left.Buffer (1 .. Left.Last) > Right);
  function ">" (Left : String; Right : Unbounded_String) return Boolean is (Left > Right.Buffer (1 .. Right.Last));
  function ">=" (Left, Right : Unbounded_String) return Boolean is
    (Left.Buffer (1 .. Left.Last) >= Right.Buffer (1 .. Right.Last));
  function ">=" (Left : Unbounded_String; Right : String) return Boolean is (Left.Buffer (1 .. Left.Last) >= Right);
  function ">=" (Left : String; Right : Unbounded_String) return Boolean is (Left >= Right.Buffer (1 .. Right.Last));
  function Index (Source : Unbounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    (Fixed.Index (Source.Buffer (1 .. Source.Last), Pattern, From, Going, Mapping));
  function Index (Source : Unbounded_String; Pattern : String; From : Positive; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    (Fixed.Index (Source.Buffer (1 .. Source.Last), Pattern, From, Going, Mapping));
  function Index (Source : Unbounded_String; Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    (Fixed.Index (Source.Buffer (1 .. Source.Last), Pattern, Going, Mapping));
  function Index (Source : Unbounded_String; Pattern : String; Going : Direction := Forward;
                  Mapping : Maps.Character_Mapping_Function) return Natural is
    (Fixed.Index (Source.Buffer (1 .. Source.Last), Pattern, Going, Mapping));
  function Index (Source : Unbounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural is
    (Fixed.Index (Source.Buffer (1 .. Source.Last), Set, From, Test, Going));
  function Index (Source : Unbounded_String; Set : Maps.Character_Set; Test : Membership := Inside;
                  Going : Direction := Forward) return Natural is
    (Fixed.Index (Source.Buffer (1 .. Source.Last), Set, Test, Going));
  function Index_Non_Blank (Source : Unbounded_String; From : Positive; Going : Direction := Forward) return Natural is
    (Fixed.Index_Non_Blank (Source.Buffer (1 .. Source.Last), From, Going));
  function Index_Non_Blank (Source : Unbounded_String; Going : Direction := Forward) return Natural is
    (Fixed.Index_Non_Blank (Source.Buffer (1 .. Source.Last), Going));
  function Count (Source : Unbounded_String; Pattern : String;
                  Mapping : Maps.Character_Mapping := Maps.Identity) return Natural is
    (Fixed.Count (Source.Buffer (1 .. Source.Last), Pattern, Mapping));
  function Count (Source : Unbounded_String; Pattern : String; Mapping : Maps.Character_Mapping_Function) return Natural is
    (Fixed.Count (Source.Buffer (1 .. Source.Last), Pattern, Mapping));
  function Count (Source : Unbounded_String; Set : Maps.Character_Set) return Natural is
    (Fixed.Count (Source.Buffer (1 .. Source.Last), Set));
  procedure Find_Token (Source : Unbounded_String; Set : Maps.Character_Set; From : Positive; Test : Membership;
                        First : out Positive; Last : out Natural) is
    begin
      Fixed.Find_Token (Source.Buffer (1 .. Source.Last), Set, From, Test, First, Last);
    end;
  procedure Find_Token (Source : Unbounded_String; Set : Maps.Character_Set; Test : Membership; First : out Positive;
                        Last : out Natural) is
    begin
      Fixed.Find_Token (Source.Buffer (1 .. Source.Last), Set, Test, First, Last);
    end;
  function Translate (Source : Unbounded_String; Mapping : Maps.Character_Mapping) return Unbounded_String is
    (To_Unbounded_String (Fixed.Translate (Source.Buffer (1 .. Source.Last), Mapping)));
  procedure Translate (Source : in out Unbounded_String; Mapping : Maps.Character_Mapping) is
    begin
      Fixed.Translate (Source.Buffer (1 .. Source.Last), Mapping);
    end;
  function Translate (Source : Unbounded_String; Mapping : Maps.Character_Mapping_Function) return Unbounded_String is
    (To_Unbounded_String (Fixed.Translate (Source.Buffer (1 .. Source.Last), Mapping)));
  procedure Translate (Source : in out Unbounded_String; Mapping : Maps.Character_Mapping_Function) is
    begin
      Fixed.Translate (Source.Buffer (1 .. Source.Last), Mapping);
    end;
  function Replace_Slice (Source : Unbounded_String; Low : Positive; High : Natural; By : String) return Unbounded_String is
    (To_Unbounded_String (Fixed.Replace_Slice (Source.Buffer (1 .. Source.Last), Low, High, By)));
  procedure Replace_Slice (Source : in out Unbounded_String; Low : Positive; High : Natural; By : String) is
    begin
      if Low > Source.Last + 1 then raise Index_Error; end if;
      Splice (Source, Low, Integer'Max (Low - 1, Integer'Min (High, Source.Last)), By);
    end;
  function Insert (Source : Unbounded_String; Before : Positive; New_Item : String) return Unbounded_String is
    (To_Unbounded_String (Fixed.Insert (Source.Buffer (1 .. Source.Last), Before, New_Item)));
  procedure Insert (Source : in out Unbounded_String; Before : Positive; New_Item : String) is
    begin
      Replace_Slice (Source, Before, Before - 1, New_Item);
    end;
  function Overwrite (Source : Unbounded_String; Position : Positive; New_Item : String) return Unbounded_String is
    (To_Unbounded_String (Fixed.Overwrite (Source.Buffer (1 .. Source.Last), Position, New_Item)));
  procedure Overwrite (Source : in out Unbounded_String; Position : Positive; New_Item : String) is
    begin
      Replace_Slice (Source, Position, Position + New_Item'Length - 1, New_Item);
    end;
  function Delete (Source : Unbounded_String; From : Positive; Through : Natural) return Unbounded_String is
    (To_Unbounded_String (Fixed.Delete (Source.Buffer (1 .. Source.Last), From, Through)));
  procedure Delete (Source : in out Unbounded_String; From : Positive; Through : Natural) is
    begin
      if From > Through then
        null;
      elsif Through > Source.Last then
        raise Index_Error;
      else
        Splice (Source, From, Through, "");
      end if;
    end;
  function Trim (Source : Unbounded_String; Side : Trim_End) return Unbounded_String is
    (To_Unbounded_String (Fixed.Trim (Source.Buffer (1 .. Source.Last), Side)));
  procedure Trim (Source : in out Unbounded_String; Side : Trim_End) is
    First : constant Natural := (if Side = Right then 1 else Index_Non_Blank (Source));
    begin
      Keep (Source, Integer'Max (First, 1),
            (if First = 0 then 0 elsif Side = Left then Source.Last else Index_Non_Blank (Source, Backward)));
    end;
  function Trim (Source : Unbounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set) return Unbounded_String is
    (To_Unbounded_String (Fixed.Trim (Source.Buffer (1 .. Source.Last), Left, Right)));
  procedure Trim (Source : in out Unbounded_String; Left : Maps.Character_Set; Right : Maps.Character_Set) is
    First : constant Natural := Index (Source, Left, Outside);
    begin
      Keep (Source, Integer'Max (First, 1), (if First = 0 then 0 else Index (Source, Right, Outside, Backward)));
    end;
  function Head (Source : Unbounded_String; Count : Natural; Pad : Character := Space) return Unbounded_String is
    (To_Unbounded_String (Fixed.Head (Source.Buffer (1 .. Source.Last), Count, Pad)));
  procedure Head (Source : in out Unbounded_String; Count : Natural; Pad : Character := Space) is
    begin
      Keep (Source, 1, Integer'Min (Count, Source.Last));
      Append (Source, String'(1 .. Count - Source.Last => Pad));
    end;
  function Tail (Source : Unbounded_String; Count : Natural; Pad : Character := Space) return Unbounded_String is
    (To_Unbounded_String (Fixed.Tail (Source.Buffer (1 .. Source.Last), Count, Pad)));
  procedure Tail (Source : in out Unbounded_String; Count : Natural; Pad : Character := Space) is
    begin
      Keep (Source, Integer'Max (Source.Last - Count + 1, 1), Source.Last);
      Insert (Source, 1, String'(1 .. Count - Source.Last => Pad));
    end;
  function "*" (Left : Natural; Right : Character) return Unbounded_String is (Join ((1 .. Left => Right), ""));
  function "*" (Left : Natural; Right : String) return Unbounded_String is (To_Unbounded_String (Fixed."*" (Left, Right)));
  function "*" (Left : Natural; Right : Unbounded_String) return Unbounded_String is (Left * Right.Buffer (1 .. Right.Last));
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
with Ada.Strings.Unbounded;
package Text_IO.Unbounded_IO is
  procedure Put (File : File_Type; Item : Ada.Strings.Unbounded.Unbounded_String);
  procedure Put (Item : Ada.Strings.Unbounded.Unbounded_String);
  procedure Put_Line (File : File_Type; Item : Ada.Strings.Unbounded.Unbounded_String);
  procedure Put_Line (Item : Ada.Strings.Unbounded.Unbounded_String);
  function Get_Line (File : File_Type) return Ada.Strings.Unbounded.Unbounded_String;
  function Get_Line return Ada.Strings.Unbounded.Unbounded_String;
  procedure Get_Line (File : File_Type; Item : out Ada.Strings.Unbounded.Unbounded_String);
  procedure Get_Line (Item : out Ada.Strings.Unbounded.Unbounded_String);
end;
package body Text_IO.Unbounded_IO is
  use Ada.Strings.Unbounded;
  procedure Put (File : File_Type; Item : Unbounded_String) is
    begin
      Put (File, To_String (Item));
    end;
  procedure Put (Item : Unbounded_String) is
    begin
      Put (To_String (Item));
    end;
  procedure Put_Line (File : File_Type; Item : Unbounded_String) is
    begin
      Put_Line (File, To_String (Item));
    end;
  procedure Put_Line (Item : Unbounded_String) is
    begin
      Put_Line (To_String (Item));
    end;
  function Get_Line (File : File_Type) return Unbounded_String is
    Chunk : String (1 .. 512);
    Last  : Natural;
    Item  : Unbounded_String;
    begin
      loop
        Get_Line (File, Chunk, Last);
        Append (Item, Chunk (1 .. Last));
        exit when Last < Chunk'Last;
      end loop;
      return Item;
    end;
  function Get_Line return Unbounded_String is (Get_Line (Current_Input));
  procedure Get_Line (File : File_Type; Item : out Unbounded_String) is
    begin
      Item := Get_Line (File);
    end;
  procedure Get_Line (Item : out Unbounded_String) is
    begin
      Item := Get_Line (Current_Input);
    end;
end;
with Ada.Strings.Bounded;
generic
  with package Bounded is new Ada.Strings.Bounded.Generic_Bounded_Length (<>);
package Text_IO.Bounded_IO is
  procedure Put (File : File_Type; Item : Bounded.Bounded_String);
  procedure Put (Item : Bounded.Bounded_String);
  procedure Put_Line (File : File_Type; Item : Bounded.Bounded_String);
  procedure Put_Line (Item : Bounded.Bounded_String);
  function Get_Line (File : File_Type) return Bounded.Bounded_String;
  function Get_Line return Bounded.Bounded_String;
  procedure Get_Line (File : File_Type; Item : out Bounded.Bounded_String);
  procedure Get_Line (Item : out Bounded.Bounded_String);
end;
package body Text_IO.Bounded_IO is
  use Bounded;
  procedure Put (File : File_Type; Item : Bounded.Bounded_String) is
    begin
      Put (File, To_String (Item));
    end;
  procedure Put (Item : Bounded.Bounded_String) is
    begin
      Put (To_String (Item));
    end;
  procedure Put_Line (File : File_Type; Item : Bounded.Bounded_String) is
    begin
      Put_Line (File, To_String (Item));
    end;
  procedure Put_Line (Item : Bounded.Bounded_String) is
    begin
      Put_Line (To_String (Item));
    end;
  function Get_Line (File : File_Type) return Bounded.Bounded_String is
    Chunk : String (1 .. 512);
    Last  : Natural;
    Item  : Bounded.Bounded_String;
    begin
      Get_Line (File, Chunk, Last);
      Item := To_Bounded_String (Chunk (1 .. Last));
      while Last = Chunk'Last loop
        Get_Line (File, Chunk, Last);
        Append (Item, Chunk (1 .. Last));
      end loop;
      return Item;
    end;
  function Get_Line return Bounded.Bounded_String is (Get_Line (Current_Input));
  procedure Get_Line (File : File_Type; Item : out Bounded.Bounded_String) is
    begin
      Item := Get_Line (File);
    end;
  procedure Get_Line (Item : out Bounded.Bounded_String) is
    begin
      Item := Get_Line (Current_Input);
    end;
end;
with Ada.Iterator_Interfaces;
with System;
with Unchecked_Conversion;
with Unchecked_Deallocation;
package Ada.Containers is
  type Hash_Type is mod 2**32;
  type Count_Type is range 0 .. 2**31 - 1;
  Capacity_Error : exception;
  protected type Exclusive_Lock is
    entry Seize;
    procedure Release;
  private
    Held : Boolean := False;
  end;
  type Exclusive_Lock_Access is access Exclusive_Lock;
  generic
    type Index_Type is (<>) or use Positive;
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
    type Index_Type is (<>) or use Positive;
    with function Before (Left, Right : Index_Type) return Boolean;
    with procedure Swap (Left, Right : Index_Type);
  procedure Generic_Sort (First, Last : Index_Type'Base);
  generic
    type Element_Type is private;
  package Direct_Storage is
    type Pointer is access all Element_Type;
    procedure Store (Slot : in out Element_Type; Item : Element_Type) with Inline;
    procedure Put (Slot : in out Element_Type; Item : Element_Type) renames Store;
    function Same (Item : Pointer) return Pointer is (Item);
    procedure Keep (Item : in out Element_Type) is null;
  end;
  generic
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
  package Indirect_Storage is
    type Pointer is access all Element_Type;
    type Pointer_Pointer is access all Pointer;
    procedure Store (Slot : in out Pointer; Item : Element_Type) with Inline;
    procedure Put (Slot : in out Pointer; Item : Element_Type) with Inline;
    function Target (Item : Pointer_Pointer) return Pointer is (Item.all);
    function Equal (Left : Pointer; Right : Element_Type) return Boolean is (Left.all = Right);
    procedure Free is new Unchecked_Deallocation (Element_Type, Pointer);
  end;
  generic
    type Index_Type is range <>;
    type Element_Type (<>) is private;
    type Stored is private;
    type Stored_Pointer is access all Stored;
    type Element_Pointer is access all Element_Type;
    with procedure Store (Slot : in out Stored; Item : Element_Type);
    with procedure Put (Slot : in out Stored; Item : Element_Type);
    with function Target (Item : Stored_Pointer) return Element_Pointer;
    with procedure Release (Item : in out Stored);
    with function "=" (Left : Stored; Right : Element_Type) return Boolean;
    Bounded   : Boolean;
    Indirect  : Boolean;
    Task_Safe : Boolean := False;
  package Vector_Core is
    subtype Extended_Index is Index_Type'Base range Index_Type'First - 1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
    No_Index : constant Extended_Index := Extended_Index'First;
    type Vector (Bound : Count_Type := 0) is private
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
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Insert_Vector;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Insert_Vector;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Insert_Vector;
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
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1);
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1);
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1) renames Insert_Space;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Insert_Space;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector);
    procedure Prepend (Container : in out Vector; New_Item : Vector) renames Prepend_Vector;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1);
    procedure Append_Vector (Container : in out Vector; New_Item : Vector);
    procedure Append (Container : in out Vector; New_Item : Vector) renames Append_Vector;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type);
    procedure Append (Container : in out Vector; New_Item : Element_Type);
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
    type Elements_Array is array (Index_Type range <>) of aliased Stored;
    type Elements_Access is access Elements_Array;
    type Shared is record
      Elements : Elements_Access;
      Last     : Extended_Index := No_Index;
      Busy     : aliased Natural := 0;
      Lock     : aliased Natural := 0;
      Mutex    : Exclusive_Lock_Access := (if Task_Safe then new Exclusive_Lock else null);
    end record;
    type Shared_Access is access Shared;
    type Guard is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Initialize (Handle : in out Guard);
    procedure Adjust (Handle : in out Guard);
    procedure Finalize (Handle : in out Guard);
    type Vector (Bound : Count_Type := 0) is record
      Handle : Guard;
    end record;
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
    Empty_Vector : constant Vector := (Bound => 0, Handle => (Data => null));
    No_Element   : constant Cursor := (Data => null, Index => No_Index);
  end;
  generic
    type Element_Type (<>) is private;
    type Stored is private;
    type Stored_Pointer is access all Stored;
    type Element_Pointer is access all Element_Type;
    with procedure Store (Slot : in out Stored; Item : Element_Type);
    with procedure Put (Slot : in out Stored; Item : Element_Type);
    with function Target (Item : Stored_Pointer) return Element_Pointer;
    with procedure Release (Item : in out Stored);
    with function "=" (Left : Stored; Right : Element_Type) return Boolean;
    Bounded   : Boolean;
    Indirect  : Boolean;
    Task_Safe : Boolean := False;
  package List_Core is
    type List (Bound : Count_Type := 0) is private
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
    function Capacity (Container : List) return Count_Type;
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
    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
      Element  : aliased Stored;
      Next     : Node_Access;
      Previous : Node_Access;
    end record;
    type Shared is record
      First  : Node_Access;
      Last   : Node_Access;
      Length : Count_Type := 0;
      Busy   : aliased Natural := 0;
      Lock   : aliased Natural := 0;
      Mutex  : Exclusive_Lock_Access := (if Task_Safe then new Exclusive_Lock else null);
    end record;
    type Shared_Access is access Shared;
    type Guard is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Initialize (Handle : in out Guard);
    procedure Adjust (Handle : in out Guard);
    procedure Finalize (Handle : in out Guard);
    type List (Bound : Count_Type := 0) is record
      Handle : Guard;
    end record;
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
    Empty_List : constant List := (Bound => 0, Handle => (Data => null));
    No_Element : constant Cursor := (Data => null, Node => null);
  end;
  generic
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Max_Size  : Count_Type := 0;
    Task_Safe : Boolean := False;
  package Holder_Core is
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
      Busy    : aliased Natural := 0;
      Mutex   : Exclusive_Lock_Access := (if Task_Safe then new Exclusive_Lock else null);
    end record;
    type Shared_Access is access Shared;
    type Holder is new Controlled with record
      Data : Shared_Access;
    end record;
    procedure Initialize (Container : in out Holder);
    procedure Adjust (Container : in out Holder);
    procedure Finalize (Container : in out Holder);
    type Constant_Reference_Type (Element : not null access constant Element_Type) is null record;
    type Reference_Type (Element : not null access Element_Type) is null record;
    Empty_Holder : constant Holder := (Data => null);
  end;
  generic
    type Index_Type is range <> or use Positive;
    type Element_Type  is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Vectors is
    package Storage is new Direct_Storage (Element_Type);
    package Core is new Vector_Core (Index_Type, Element_Type, Element_Type, Storage.Pointer, Storage.Pointer, Storage.Store, Storage.Put, Storage.Same, Storage.Keep, "=", False, False, Task_Safe);
    subtype Extended_Index is Core.Extended_Index;
    No_Index : Extended_Index renames Core.No_Index;
    subtype Vector is Core.Vector;
    subtype Cursor is Core.Cursor;
    Empty_Vector : Vector renames Core.Empty_Vector;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean renames Core.Has_Element;
    package Vector_Iterator_Interfaces renames Core.Vector_Iterator_Interfaces;
    subtype Vector_Iterator is Core.Vector_Iterator;
    function "=" (Left, Right : Vector) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Maximum_Length return Count_Type renames Core.Maximum_Length;
    function Empty (Capacity : Count_Type := 10) return Vector renames Core.Empty;
    function To_Vector (Length : Count_Type) return Vector renames Core.To_Vector;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector renames Core.To_Vector;
    function "&" (Left, Right : Vector) return Vector renames Core."&";
    function "&" (Left : Vector; Right : Element_Type) return Vector renames Core."&";
    function "&" (Left : Element_Type; Right : Vector) return Vector renames Core."&";
    function "&" (Left, Right : Element_Type) return Vector renames Core."&";
    function Capacity (Container : Vector) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Vector) return Count_Type renames Core.Length;
    procedure Set_Length (Container : in out Vector; Length : Count_Type) renames Core.Set_Length;
    function Is_Empty (Container : Vector) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Vector) renames Core.Clear;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor renames Core.To_Cursor;
    function To_Index (Position : Cursor) return Extended_Index renames Core.To_Index;
    function Element (Container : Vector; Index : Index_Type) return Element_Type renames Core.Element;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Vector; Source : Vector) renames Core.Assign;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector renames Core.Copy;
    procedure Move (Target : in out Vector; Source : in out Vector) renames Core.Move;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Core.Insert_Vector;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Core.Insert_Vector;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Core.Insert_Vector;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Core.Insert;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Core.Insert;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1) renames Core.Insert_Space;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1) renames Core.Insert_Space;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) renames Core.Prepend_Vector;
    procedure Prepend (Container : in out Vector; New_Item : Vector) renames Core.Prepend;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) renames Core.Prepend;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) renames Core.Append_Vector;
    procedure Append (Container : in out Vector; New_Item : Vector) renames Core.Append;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) renames Core.Append;
    procedure Append (Container : in out Vector; New_Item : Element_Type) renames Core.Append;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) renames Core.Delete_Last;
    procedure Reverse_Elements (Container : in out Vector) renames Core.Reverse_Elements;
    procedure Swap (Container : in out Vector; I, J : Index_Type) renames Core.Swap;
    procedure Swap (Container : in out Vector; I, J : Cursor) renames Core.Swap;
    function First_Index (Container : Vector) return Index_Type renames Core.First_Index;
    function First (Container : Vector) return Cursor renames Core.First;
    function First_Element (Container : Vector) return Element_Type renames Core.First_Element;
    function Last_Index (Container : Vector) return Extended_Index renames Core.Last_Index;
    function Last (Container : Vector) return Cursor renames Core.Last;
    function Last_Element (Container : Vector) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Vector; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Vector; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Vector; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Vector; Position : in out Cursor) renames Core.Previous;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index renames Core.Find_Index;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Find;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index renames Core.Reverse_Find_Index;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Reverse_Find;
    function Contains (Container : Vector; Item : Element_Type) return Boolean renames Core.Contains;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Vector) return Vector_Iterator renames Core.Iterate;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator renames Core.Iterate;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      package Sorting is new Core.Generic_Sorting ("<");
      function Is_Sorted (Container : Vector) return Boolean renames Sorting.Is_Sorted;
      procedure Sort (Container : in out Vector) renames Sorting.Sort;
      procedure Merge (Target : in out Vector; Source : in out Vector) renames Sorting.Merge;
    end;
  end;
  generic
    type Element_Type  is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Doubly_Linked_Lists is
    package Storage is new Direct_Storage (Element_Type);
    package Core is new List_Core (Element_Type, Element_Type, Storage.Pointer, Storage.Pointer, Storage.Store, Storage.Put, Storage.Same, Storage.Keep, "=", False, False, Task_Safe);
    subtype List is Core.List;
    subtype Cursor is Core.Cursor;
    Empty_List : List renames Core.Empty_List;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : List; Position : Cursor) return Boolean renames Core.Has_Element;
    package List_Iterator_Interfaces renames Core.List_Iterator_Interfaces;
    subtype List_Iterator is Core.List_Iterator;
    function "=" (Left, Right : List) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty return List is (Core.Empty_List);
    function Length (Container : List) return Count_Type renames Core.Length;
    function Is_Empty (Container : List) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out List) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out List; Source : List) renames Core.Assign;
    function Copy (Source : List) return List is (Core.Copy (Source));
    procedure Move (Target : in out List; Source : in out List) renames Core.Move;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) renames Core.Prepend;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) renames Core.Append;
    procedure Append (Container : in out List; New_Item : Element_Type) renames Core.Append;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) renames Core.Delete_First;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) renames Core.Delete_Last;
    procedure Reverse_Elements (Container : in out List) renames Core.Reverse_Elements;
    procedure Swap (Container : in out List; I, J : Cursor) renames Core.Swap;
    procedure Swap_Links (Container : in out List; I, J : Cursor) renames Core.Swap_Links;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) renames Core.Splice;
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor) renames Core.Splice;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) renames Core.Splice;
    function First (Container : List) return Cursor renames Core.First;
    function First_Element (Container : List) return Element_Type renames Core.First_Element;
    function Last (Container : List) return Cursor renames Core.Last;
    function Last_Element (Container : List) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Next (Position : in out Cursor) renames Core.Next;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Next (Container : List; Position : Cursor) return Cursor renames Core.Next;
    function Previous (Container : List; Position : Cursor) return Cursor renames Core.Previous;
    procedure Next (Container : List; Position : in out Cursor) renames Core.Next;
    procedure Previous (Container : List; Position : in out Cursor) renames Core.Previous;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Find;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Reverse_Find;
    function Contains (Container : List; Item : Element_Type) return Boolean renames Core.Contains;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : List) return List_Iterator renames Core.Iterate;
    function Iterate (Container : List; Start : Cursor) return List_Iterator renames Core.Iterate;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      package Sorting is new Core.Generic_Sorting ("<");
      function Is_Sorted (Container : List) return Boolean renames Sorting.Is_Sorted;
      procedure Sort (Container : in out List) renames Sorting.Sort;
      procedure Merge (Target, Source : in out List) renames Sorting.Merge;
    end;
  end;
  package Balanced_Trees is
    type Tally is record
      Busy : Natural := 0;
      Lock : Natural := 0;
    end record;
    type Tally_Access is access all Tally;
    type Hold (Counts : Tally_Access; Locking : Boolean) is new Limited_Controlled with null record;
    procedure Initialize (Object : in out Hold);
    procedure Finalize (Object : in out Hold);
    function Cursors_Prohibited (Counts : Tally_Access) return Boolean is (Counts /= null and then (Counts.Busy > 0 or else Counts.Lock > 0));
    function Elements_Prohibited (Counts : Tally_Access) return Boolean is (Counts /= null and then Counts.Lock > 0);
    procedure Check_Cursors (Counts : Tally_Access);
    procedure Check_Elements (Counts : Tally_Access);
    protected Serials is
      procedure Next (Id : out Natural);
    private
      Count : Natural := 0;
    end;
    function Fresh_Serial return Natural;
    protected type Object_Lock (Serial : Natural) is
      entry Seize;
      entry Share;
      procedure Admit;
      procedure Release (Shared : Boolean);
    private
      Held    : Boolean := False;
      Open    : Boolean := False;
      Sharers : Natural := 0;
    end;
    type Lock_Access is access Object_Lock;
    type Hold_Mode is (Writing, Reading, Walking);
    generic
      Task_Safe : Boolean;
    package Guards is
      type Lock_Hold (Lock : Lock_Access; Mode : Hold_Mode) is new Limited_Controlled with null record;
      procedure Initialize (Object : in out Lock_Hold);
      procedure Finalize (Object : in out Lock_Hold);
      type Pair_Hold (Lock : Lock_Access; Mode : Hold_Mode; Other : Lock_Access; Other_Mode : Hold_Mode) is new Limited_Controlled with null record;
      procedure Initialize (Object : in out Pair_Hold);
      procedure Finalize (Object : in out Pair_Hold);
    end;
    function New_Lock (Wanted : Boolean) return Lock_Access is (if Wanted then new Object_Lock (Fresh_Serial) else null);
    procedure Free_Lock is new Unchecked_Deallocation (Object_Lock, Lock_Access);
    generic
      type Element_Type (<>) is private;
      type Stored is private;
      type Stored_Access is access all Stored;
      type Element_Access is access all Element_Type;
      with function Store (Item : Element_Type) return Stored;
      with function Copy (Item : Stored) return Stored;
      with function Pointer (Item : Stored_Access) return Element_Access;
      with procedure Free (Item : in out Stored);
    package Storage is
      function Fetch (Item : Stored_Access) return Element_Type is (Pointer (Item).all);
    end;
    generic
      type Element_Type is private;
    package Definite is
      type Element_Access is access all Element_Type;
      function Store (Item : Element_Type) return Element_Type is (Item);
      function Pointer (Item : Element_Access) return Element_Access is (Item);
      procedure Free (Item : in out Element_Type) is null;
      package Policy is new Storage (Element_Type, Element_Type, Element_Access, Element_Access, Store, Store, Pointer, Free);
    end;
    generic
      type Element_Type (<>) is private;
    package Indefinite is
      type Element_Access is access all Element_Type;
      type Stored_Access is access all Element_Access;
      function Store (Item : Element_Type) return Element_Access is (new Element_Type'(Item));
      function Copy (Item : Element_Access) return Element_Access is (new Element_Type'(Item.all));
      function Pointer (Item : Stored_Access) return Element_Access is (Item.all);
      procedure Free (Item : in out Element_Access);
      package Policy is new Storage (Element_Type, Element_Access, Stored_Access, Element_Access, Store, Copy, Pointer, Free);
    end;
    generic
      type Item_Type is private;
      with function Copy (Item : Item_Type) return Item_Type;
      with procedure Dispose (Item : in out Item_Type);
      Task_Safe : Boolean := False;
    package Trees is
      type Node_Type;
      type Node_Access is access Node_Type;
      type Node_Type is record
        Parent : Node_Access;
        Left   : Node_Access;
        Right  : Node_Access;
        Height : Integer := 1;
        Item   : aliased Item_Type;
      end record;
      type Shared is record
        Root   : Node_Access;
        Length : Count_Type := 0;
        Counts : aliased Tally;
        Lock   : Lock_Access := New_Lock (Task_Safe);
      end record;
      type Shared_Access is access Shared;
      type Handle is new Controlled with record
        Data : Shared_Access;
      end record;
      package Guard is new Guards (Task_Safe);
      use Guard;
      procedure Initialize (Object : in out Handle);
      procedure Adjust (Object : in out Handle);
      procedure Finalize (Object : in out Handle);
      function New_Data return Shared_Access is (if Task_Safe then new Shared else null);
      function Lock (Data : Shared_Access) return Lock_Access is (if Task_Safe and then Data /= null then Data.Lock else null);
      function Root (Data : Shared_Access) return Node_Access is (if Data = null then null else Data.Root);
      function Length (Data : Shared_Access) return Count_Type is (if Data = null then 0 else Data.Length);
      function Counts (Data : Shared_Access) return Tally_Access is (if Data = null then null else Data.Counts'Unchecked_Access);
      function Extreme (Node : Node_Access; Leftward : Boolean) return Node_Access;
      function Step (Node : Node_Access; Forward : Boolean) return Node_Access;
      function Leftmost (Node : Node_Access) return Node_Access is (Extreme (Node, True));
      function Rightmost (Node : Node_Access) return Node_Access is (Extreme (Node, False));
      function Next (Node : Node_Access) return Node_Access is (Step (Node, True));
      function Previous (Node : Node_Access) return Node_Access is (Step (Node, False));
      function Clone (Node, Above : Node_Access) return Node_Access;
      procedure Release (Node : in out Node_Access);
      procedure Attach (Root : in out Node_Access; Node, Above : Node_Access; To_Left : Boolean);
      procedure Detach (Root : in out Node_Access; Node : Node_Access);
      procedure Ready (Data : in out Shared_Access; Full : Boolean);
      procedure Insert (Data : Shared_Access; Node, Above : Node_Access; To_Left : Boolean);
      procedure Remove (Data : Shared_Access; Node : Node_Access);
      procedure Clear (Data : Shared_Access);
      procedure Assign (Target : in out Shared_Access; Source : Shared_Access);
      procedure Move (Target, Source : in out Shared_Access);
      generic
        type Key_Type (<>) is private;
        with function Less (Key : Key_Type; Node : Node_Access) return Boolean;
        with function Greater (Key : Key_Type; Node : Node_Access) return Boolean;
      package Search is
        function Find (Root : Node_Access; Key : Key_Type) return Node_Access;
        function Floor (Root : Node_Access; Key : Key_Type) return Node_Access;
        function Ceiling (Root : Node_Access; Key : Key_Type) return Node_Access;
        procedure Locate (Root : Node_Access; Key : Key_Type; Node, Above : out Node_Access; To_Left : out Boolean);
      end;
    end;
    generic
      type Item_Type is private;
      with function Copy (Item : Item_Type) return Item_Type;
      with procedure Dispose (Item : in out Item_Type);
      Task_Safe : Boolean := False;
    package Tables is
      type Node_Type;
      type Node_Access is access Node_Type;
      type Node_Type is record
        Next : Node_Access;
        Hash : Hash_Type := 0;
        Item : aliased Item_Type;
      end record;
      type Bucket_Array is array (Hash_Type range <>) of Node_Access;
      type Bucket_Access is access Bucket_Array;
      type Shared is record
        Buckets : Bucket_Access;
        Length  : Count_Type := 0;
        Counts  : aliased Tally;
        Lock    : Lock_Access := New_Lock (Task_Safe);
      end record;
      type Shared_Access is access Shared;
      type Handle is new Controlled with record
        Data : Shared_Access;
      end record;
      package Guard is new Guards (Task_Safe);
      use Guard;
      procedure Initialize (Object : in out Handle);
      procedure Adjust (Object : in out Handle);
      procedure Finalize (Object : in out Handle);
      function New_Data return Shared_Access is (if Task_Safe then new Shared else null);
      function Lock (Data : Shared_Access) return Lock_Access is (if Task_Safe and then Data /= null then Data.Lock else null);
      function Slot (Data : Shared_Access; Code : Hash_Type) return Hash_Type is (Code mod Hash_Type (Data.Buckets'Length));
      function Buckets (Data : Shared_Access) return Count_Type is (if Data = null or else Data.Buckets = null then 0 else Data.Buckets'Length);
      function Length (Data : Shared_Access) return Count_Type is (if Data = null then 0 else Data.Length);
      function Counts (Data : Shared_Access) return Tally_Access is (if Data = null then null else Data.Counts'Unchecked_Access);
      function First (Data : Shared_Access; From : Hash_Type := 0) return Node_Access;
      function Next (Data : Shared_Access; Node : Node_Access) return Node_Access;
      procedure Resize (Data : Shared_Access; Size : Count_Type);
      procedure Reserve (Data : in out Shared_Access; Capacity : Count_Type);
      procedure Ready (Data : in out Shared_Access; Full : Boolean);
      procedure Link (Data : Shared_Access; Node : Node_Access);
      procedure Unlink (Data : Shared_Access; Node : Node_Access);
      procedure Remove (Data : Shared_Access; Node : Node_Access);
      procedure Clear (Data : Shared_Access);
      procedure Assign (Target : in out Shared_Access; Source : Shared_Access);
      procedure Move (Target, Source : in out Shared_Access);
      generic
        type Key_Type (<>) is private;
        with function Hash (Key : Key_Type) return Hash_Type;
        with function Equivalent (Key : Key_Type; Node : Node_Access) return Boolean;
      package Search is
        function Find (Data : Shared_Access; Key : Key_Type) return Node_Access;
      end;
    end;
    generic
      with package Keys is new Storage (<>);
      with package Elements is new Storage (<>);
      with function "<" (Left, Right : Keys.Element_Type) return Boolean;
      with function "=" (Left, Right : Elements.Element_Type) return Boolean;
      Task_Safe : Boolean := False;
    package Maps is
      subtype Key_Type is Keys.Element_Type;
      subtype Element_Type is Elements.Element_Type;
      type Map (Capacity : Count_Type) is private
        with Constant_Indexing => Constant_Reference,
             Variable_Indexing => Reference,
             Default_Iterator  => Iterate,
             Iterator_Element  => Element_Type;
      type Cursor is private;
      No_Element : constant Cursor;
      function Has_Element (Position : Cursor) return Boolean;
      function Has_Element (Container : Map; Position : Cursor) return Boolean;
      package Map_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
      type Map_Iterator is new Map_Iterator_Interfaces.Reversible_Iterator with private;
      type Constant_Reference_Type (Element : not null access constant Element_Type) is private with Implicit_Dereference => Element;
      type Reference_Type (Element : not null access Element_Type) is private with Implicit_Dereference => Element;
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean is (not (Left < Right) and then not (Right < Left));
      function "=" (Left, Right : Map) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
      function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
      function Empty (Capacity : Count_Type) return Map;
      function Length (Container : Map) return Count_Type;
      function Is_Empty (Container : Map) return Boolean is (Length (Container) = 0);
      procedure Clear (Container : in out Map);
      function Key (Position : Cursor) return Key_Type;
      function Key (Container : Map; Position : Cursor) return Key_Type;
      function Element (Position : Cursor) return Element_Type;
      function Element (Container : Map; Position : Cursor) return Element_Type;
      procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type));
      procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type));
      function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
      function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
      function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
      procedure Assign (Target : in out Map; Source : Map);
      function Copy (Source : Map; Capacity : Count_Type) return Map;
      procedure Move (Target : in out Map; Source : in out Map);
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean);
      procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean);
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
      procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
      procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
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
      type Item_Type is record
        Key     : aliased Keys.Stored;
        Element : aliased Elements.Stored;
      end record;
      function Copy (Item : Item_Type) return Item_Type is ((Keys.Copy (Item.Key), Elements.Copy (Item.Element)));
      procedure Dispose (Item : in out Item_Type);
      package Tree is new Trees (Item_Type, Copy, Dispose, Task_Safe);
      use Tree, Tree.Guard;
      type Map (Capacity : Count_Type) is record
        Guard : Handle;
      end record;
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
      No_Element : constant Cursor := (null, null);
    end;
    generic
      with package Elements is new Storage (<>);
      with function "<" (Left, Right : Elements.Element_Type) return Boolean;
      with function "=" (Left, Right : Elements.Element_Type) return Boolean;
      Task_Safe : Boolean := False;
    package Sets is
      subtype Element_Type is Elements.Element_Type;
      type Set (Capacity : Count_Type) is private
        with Constant_Indexing => Constant_Reference,
             Default_Iterator  => Iterate,
             Iterator_Element  => Element_Type;
      type Cursor is private;
      No_Element : constant Cursor;
      function Has_Element (Position : Cursor) return Boolean;
      function Has_Element (Container : Set; Position : Cursor) return Boolean;
      package Set_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);
      type Set_Iterator is new Set_Iterator_Interfaces.Reversible_Iterator with private;
      type Constant_Reference_Type (Element : not null access constant Element_Type) is private with Implicit_Dereference => Element;
      function Equivalent_Elements (Left, Right : Element_Type) return Boolean is (not (Left < Right) and then not (Right < Left));
      function "=" (Left, Right : Set) return Boolean;
      function Equivalent_Sets (Left, Right : Set) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
      function Empty (Capacity : Count_Type) return Set;
      function To_Set (New_Item : Element_Type; Capacity : Count_Type) return Set;
      function Length (Container : Set) return Count_Type;
      function Is_Empty (Container : Set) return Boolean is (Length (Container) = 0);
      procedure Clear (Container : in out Set);
      function Element (Position : Cursor) return Element_Type;
      function Element (Container : Set; Position : Cursor) return Element_Type;
      procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type));
      function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
      procedure Assign (Target : in out Set; Source : Set);
      function Copy (Source : Set; Capacity : Count_Type) return Set;
      procedure Move (Target : in out Set; Source : in out Set);
      procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean);
      procedure Insert (Container : in out Set; New_Item : Element_Type);
      procedure Include (Container : in out Set; New_Item : Element_Type);
      procedure Replace (Container : in out Set; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Item : Element_Type);
      procedure Delete (Container : in out Set; Item : Element_Type);
      procedure Delete (Container : in out Set; Position : in out Cursor);
      procedure Delete_First (Container : in out Set);
      procedure Delete_Last (Container : in out Set);
      procedure Union (Target : in out Set; Source : Set);
      procedure Intersection (Target : in out Set; Source : Set);
      procedure Difference (Target : in out Set; Source : Set);
      procedure Symmetric_Difference (Target : in out Set; Source : Set);
      function Union (Left, Right : Set) return Set;
      function Intersection (Left, Right : Set) return Set;
      function Difference (Left, Right : Set) return Set;
      function Symmetric_Difference (Left, Right : Set) return Set;
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
        function Equivalent_Keys (Left, Right : Key_Type) return Boolean is (not (Left < Right) and then not (Right < Left));
        function Key (Position : Cursor) return Key_Type;
        function Element (Container : Set; Key : Key_Type) return Element_Type;
        procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
        procedure Exclude (Container : in out Set; Key : Key_Type);
        procedure Delete (Container : in out Set; Key : Key_Type);
        function Find (Container : Set; Key : Key_Type) return Cursor;
        function Floor (Container : Set; Key : Key_Type) return Cursor;
        function Ceiling (Container : Set; Key : Key_Type) return Cursor;
        function Contains (Container : Set; Key : Key_Type) return Boolean;
        procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type));
        type Reference_Type (Element : not null access Element_Type) is private with Implicit_Dereference => Element;
        function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
        function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
        function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
      private
        type Reference_Type (Element : not null access Element_Type) is null record;
      end;
    private
      package Tree is new Trees (Elements.Stored, Elements.Copy, Elements.Free, Task_Safe);
      use Tree, Tree.Guard;
      type Set (Capacity : Count_Type) is record
        Guard : Handle;
      end record;
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
      No_Element : constant Cursor := (null, null);
    end;
    generic
      with package Keys is new Storage (<>);
      with package Elements is new Storage (<>);
      with function Hash (Key : Keys.Element_Type) return Hash_Type;
      with function Equivalent_Keys (Left, Right : Keys.Element_Type) return Boolean;
      with function "=" (Left, Right : Elements.Element_Type) return Boolean;
      Task_Safe : Boolean := False;
    package Hashed_Maps is
      subtype Key_Type is Keys.Element_Type;
      subtype Element_Type is Elements.Element_Type;
      type Map (Limit : Count_Type) is private
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
      type Constant_Reference_Type (Element : not null access constant Element_Type) is private with Implicit_Dereference => Element;
      type Reference_Type (Element : not null access Element_Type) is private with Implicit_Dereference => Element;
      function "=" (Left, Right : Map) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean;
      function Tampering_With_Elements_Prohibited (Container : Map) return Boolean;
      function Empty (Capacity : Count_Type := 10; Limit : Count_Type := Count_Type'Last) return Map;
      function Capacity (Container : Map) return Count_Type;
      procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type);
      function Length (Container : Map) return Count_Type;
      function Is_Empty (Container : Map) return Boolean is (Length (Container) = 0);
      procedure Clear (Container : in out Map);
      function Key (Position : Cursor) return Key_Type;
      function Key (Container : Map; Position : Cursor) return Key_Type;
      function Element (Position : Cursor) return Element_Type;
      function Element (Container : Map; Position : Cursor) return Element_Type;
      procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type));
      procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type));
      function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type;
      function Reference (Container : in out Map; Position : Cursor) return Reference_Type;
      function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type;
      function Reference (Container : in out Map; Key : Key_Type) return Reference_Type;
      procedure Assign (Target : in out Map; Source : Map);
      function Copy (Source : Map; Capacity : Count_Type := 0; Limit : Count_Type := Count_Type'Last) return Map;
      procedure Move (Target : in out Map; Source : in out Map);
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean);
      procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean);
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
      procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
      procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
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
      type Item_Type is record
        Key     : aliased Keys.Stored;
        Element : aliased Elements.Stored;
      end record;
      function Copy (Item : Item_Type) return Item_Type is ((Keys.Copy (Item.Key), Elements.Copy (Item.Element)));
      procedure Dispose (Item : in out Item_Type);
      package Table is new Tables (Item_Type, Copy, Dispose, Task_Safe);
      use Table, Table.Guard;
      type Map (Limit : Count_Type) is record
        Guard : Handle;
      end record;
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
      Empty_Map  : constant Map := (Limit => Count_Type'Last, Guard => (Data => null));
      No_Element : constant Cursor := (null, null);
    end;
    generic
      with package Elements is new Storage (<>);
      with function Hash (Element : Elements.Element_Type) return Hash_Type;
      with function Equivalent_Elements (Left, Right : Elements.Element_Type) return Boolean;
      with function "=" (Left, Right : Elements.Element_Type) return Boolean;
      Task_Safe : Boolean := False;
    package Hashed_Sets is
      subtype Element_Type is Elements.Element_Type;
      type Set (Limit : Count_Type) is private
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
      type Constant_Reference_Type (Element : not null access constant Element_Type) is private with Implicit_Dereference => Element;
      function "=" (Left, Right : Set) return Boolean;
      function Equivalent_Sets (Left, Right : Set) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean;
      function Empty (Capacity : Count_Type := 10; Limit : Count_Type := Count_Type'Last) return Set;
      function To_Set (New_Item : Element_Type; Limit : Count_Type := Count_Type'Last) return Set;
      function Capacity (Container : Set) return Count_Type;
      procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type);
      function Length (Container : Set) return Count_Type;
      function Is_Empty (Container : Set) return Boolean is (Length (Container) = 0);
      procedure Clear (Container : in out Set);
      function Element (Position : Cursor) return Element_Type;
      function Element (Container : Set; Position : Cursor) return Element_Type;
      procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type));
      function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type;
      procedure Assign (Target : in out Set; Source : Set);
      function Copy (Source : Set; Capacity : Count_Type := 0; Limit : Count_Type := Count_Type'Last) return Set;
      procedure Move (Target : in out Set; Source : in out Set);
      procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean);
      procedure Insert (Container : in out Set; New_Item : Element_Type);
      procedure Include (Container : in out Set; New_Item : Element_Type);
      procedure Replace (Container : in out Set; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Item : Element_Type);
      procedure Delete (Container : in out Set; Item : Element_Type);
      procedure Delete (Container : in out Set; Position : in out Cursor);
      procedure Union (Target : in out Set; Source : Set);
      procedure Intersection (Target : in out Set; Source : Set);
      procedure Difference (Target : in out Set; Source : Set);
      procedure Symmetric_Difference (Target : in out Set; Source : Set);
      function Union (Left, Right : Set) return Set;
      function Intersection (Left, Right : Set) return Set;
      function Difference (Left, Right : Set) return Set;
      function Symmetric_Difference (Left, Right : Set) return Set;
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
        with function Hash (Key : Key_Type) return Hash_Type is <>;
        with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
      package Generic_Keys is
        function Key (Position : Cursor) return Key_Type;
        function Element (Container : Set; Key : Key_Type) return Element_Type;
        procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
        procedure Exclude (Container : in out Set; Key : Key_Type);
        procedure Delete (Container : in out Set; Key : Key_Type);
        function Find (Container : Set; Key : Key_Type) return Cursor;
        function Contains (Container : Set; Key : Key_Type) return Boolean;
        procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type));
        type Reference_Type (Element : not null access Element_Type) is private with Implicit_Dereference => Element;
        function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type;
        function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type;
        function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type;
      private
        type Reference_Type (Element : not null access Element_Type) is null record;
      end;
    private
      package Table is new Tables (Elements.Stored, Elements.Copy, Elements.Free, Task_Safe);
      use Table, Table.Guard;
      type Set (Limit : Count_Type) is record
        Guard : Handle;
      end record;
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
      Empty_Set  : constant Set := (Limit => Count_Type'Last, Guard => (Data => null));
      No_Element : constant Cursor := (null, null);
    end;
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function "<" (Left, Right : Key_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Ordered_Maps is
    package Keys is new Balanced_Trees.Definite (Key_Type);
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Maps (Keys.Policy, Elements.Policy, "<", "=", Task_Safe);
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean renames Core.Equivalent_Keys;
    subtype Map is Core.Map (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Map  : constant Map := Core.Empty (Count_Type'Last);
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Map; Position : Cursor) return Boolean renames Core.Has_Element;
    package Map_Iterator_Interfaces renames Core.Map_Iterator_Interfaces;
    subtype Map_Iterator is Core.Map_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Map) return Boolean renames Core."=";
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty return Map is (Empty_Map);
    function Length (Container : Map) return Count_Type renames Core.Length;
    function Is_Empty (Container : Map) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Map) renames Core.Clear;
    function Key (Position : Cursor) return Key_Type renames Core.Key;
    function Key (Container : Map; Position : Cursor) return Key_Type renames Core.Key;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Map; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) renames Core.Update_Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Map; Source : Map) renames Core.Assign;
    function Copy (Source : Map) return Map is (Core.Copy (Source, Count_Type'Last));
    procedure Move (Target : in out Map; Source : in out Map) renames Core.Move;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Map; Key : Key_Type) renames Core.Exclude;
    procedure Delete (Container : in out Map; Key : Key_Type) renames Core.Delete;
    procedure Delete (Container : in out Map; Position : in out Cursor) renames Core.Delete;
    procedure Delete_First (Container : in out Map) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Map) renames Core.Delete_Last;
    function First (Container : Map) return Cursor renames Core.First;
    function First_Element (Container : Map) return Element_Type renames Core.First_Element;
    function First_Key (Container : Map) return Key_Type renames Core.First_Key;
    function Last (Container : Map) return Cursor renames Core.Last;
    function Last_Element (Container : Map) return Element_Type renames Core.Last_Element;
    function Last_Key (Container : Map) return Key_Type renames Core.Last_Key;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Map; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Map; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Map; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Map; Position : in out Cursor) renames Core.Previous;
    function Find (Container : Map; Key : Key_Type) return Cursor renames Core.Find;
    function Element (Container : Map; Key : Key_Type) return Element_Type renames Core.Element;
    function Floor (Container : Map; Key : Key_Type) return Cursor renames Core.Floor;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor renames Core.Ceiling;
    function Contains (Container : Map; Key : Key_Type) return Boolean renames Core.Contains;
    function "<" (Left, Right : Cursor) return Boolean renames Core."<";
    function ">" (Left, Right : Cursor) return Boolean renames Core.">";
    function "<" (Left : Cursor; Right : Key_Type) return Boolean renames Core."<";
    function ">" (Left : Cursor; Right : Key_Type) return Boolean renames Core.">";
    function "<" (Left : Key_Type; Right : Cursor) return Boolean renames Core."<";
    function ">" (Left : Key_Type; Right : Cursor) return Boolean renames Core.">";
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Map) return Map_Iterator renames Core.Iterate;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator renames Core.Iterate;
  end;
  generic
    type Element_Type is private;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Ordered_Sets is
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Sets (Elements.Policy, "<", "=", Task_Safe);
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean renames Core.Equivalent_Elements;
    subtype Set is Core.Set (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Set  : constant Set := Core.Empty (Count_Type'Last);
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Set; Position : Cursor) return Boolean renames Core.Has_Element;
    package Set_Iterator_Interfaces renames Core.Set_Iterator_Interfaces;
    subtype Set_Iterator is Core.Set_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Set) return Boolean renames Core."=";
    function Equivalent_Sets (Left, Right : Set) return Boolean renames Core.Equivalent_Sets;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Empty return Set is (Empty_Set);
    function To_Set (New_Item : Element_Type) return Set is (Core.To_Set (New_Item, Count_Type'Last));
    function Length (Container : Set) return Count_Type renames Core.Length;
    function Is_Empty (Container : Set) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Set) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Set; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    procedure Assign (Target : in out Set; Source : Set) renames Core.Assign;
    function Copy (Source : Set) return Set is (Core.Copy (Source, Count_Type'Last));
    procedure Move (Target : in out Set; Source : in out Set) renames Core.Move;
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Set; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Set; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Set; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Set; Item : Element_Type) renames Core.Exclude;
    procedure Delete (Container : in out Set; Item : Element_Type) renames Core.Delete;
    procedure Delete (Container : in out Set; Position : in out Cursor) renames Core.Delete;
    procedure Delete_First (Container : in out Set) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Set) renames Core.Delete_Last;
    procedure Union (Target : in out Set; Source : Set) renames Core.Union;
    function Union (Left, Right : Set) return Set renames Core.Union;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set) renames Core.Intersection;
    function Intersection (Left, Right : Set) return Set renames Core.Intersection;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set) renames Core.Difference;
    function Difference (Left, Right : Set) return Set renames Core.Difference;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) renames Core.Symmetric_Difference;
    function Symmetric_Difference (Left, Right : Set) return Set renames Core.Symmetric_Difference;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean renames Core.Overlap;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean renames Core.Is_Subset;
    function First (Container : Set) return Cursor renames Core.First;
    function First_Element (Container : Set) return Element_Type renames Core.First_Element;
    function Last (Container : Set) return Cursor renames Core.Last;
    function Last_Element (Container : Set) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Set; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Set; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Set; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Set; Position : in out Cursor) renames Core.Previous;
    function Find (Container : Set; Item : Element_Type) return Cursor renames Core.Find;
    function Floor (Container : Set; Item : Element_Type) return Cursor renames Core.Floor;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor renames Core.Ceiling;
    function Contains (Container : Set; Item : Element_Type) return Boolean renames Core.Contains;
    function "<" (Left, Right : Cursor) return Boolean renames Core."<";
    function ">" (Left, Right : Cursor) return Boolean renames Core.">";
    function "<" (Left : Cursor; Right : Element_Type) return Boolean renames Core."<";
    function ">" (Left : Cursor; Right : Element_Type) return Boolean renames Core.">";
    function "<" (Left : Element_Type; Right : Cursor) return Boolean renames Core."<";
    function ">" (Left : Element_Type; Right : Cursor) return Boolean renames Core.">";
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Set) return Set_Iterator renames Core.Iterate;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator renames Core.Iterate;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function "<" (Left, Right : Key_Type) return Boolean is <>;
    package Generic_Keys is
      package Keys is new Core.Generic_Keys (Key_Type, Key, "<");
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean renames Keys.Equivalent_Keys;
      function Key (Position : Cursor) return Key_Type renames Keys.Key;
      function Element (Container : Set; Key : Key_Type) return Element_Type renames Keys.Element;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) renames Keys.Replace;
      procedure Exclude (Container : in out Set; Key : Key_Type) renames Keys.Exclude;
      procedure Delete (Container : in out Set; Key : Key_Type) renames Keys.Delete;
      function Find (Container : Set; Key : Key_Type) return Cursor renames Keys.Find;
      function Floor (Container : Set; Key : Key_Type) return Cursor renames Keys.Floor;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor renames Keys.Ceiling;
      function Contains (Container : Set; Key : Key_Type) return Boolean renames Keys.Contains;
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) renames Keys.Update_Element_Preserving_Key;
      subtype Reference_Type is Keys.Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type renames Keys.Reference_Preserving_Key;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type renames Keys.Constant_Reference;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type renames Keys.Reference_Preserving_Key;
    end;
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function Hash (Key : Key_Type) return Hash_Type is <>;
    with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Hashed_Maps is
    package Keys is new Balanced_Trees.Definite (Key_Type);
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Hashed_Maps (Keys.Policy, Elements.Policy, Hash, Equivalent_Keys, "=", Task_Safe);
    subtype Map is Core.Map (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Map  : Map renames Core.Empty_Map;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Map; Position : Cursor) return Boolean renames Core.Has_Element;
    package Map_Iterator_Interfaces renames Core.Map_Iterator_Interfaces;
    subtype Map_Iterator is Core.Map_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Map) return Boolean renames Core."=";
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty (Capacity : Count_Type := 10) return Map is (Core.Empty (Capacity));
    function Capacity (Container : Map) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Map) return Count_Type renames Core.Length;
    function Is_Empty (Container : Map) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Map) renames Core.Clear;
    function Key (Position : Cursor) return Key_Type renames Core.Key;
    function Key (Container : Map; Position : Cursor) return Key_Type renames Core.Key;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Map; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) renames Core.Update_Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Map; Source : Map) renames Core.Assign;
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map is (Core.Copy (Source, Capacity));
    procedure Move (Target : in out Map; Source : in out Map) renames Core.Move;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Map; Key : Key_Type) renames Core.Exclude;
    procedure Delete (Container : in out Map; Key : Key_Type) renames Core.Delete;
    procedure Delete (Container : in out Map; Position : in out Cursor) renames Core.Delete;
    function First (Container : Map) return Cursor renames Core.First;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Map; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Map; Position : in out Cursor) renames Core.Next;
    function Find (Container : Map; Key : Key_Type) return Cursor renames Core.Find;
    function Element (Container : Map; Key : Key_Type) return Element_Type renames Core.Element;
    function Contains (Container : Map; Key : Key_Type) return Boolean renames Core.Contains;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean renames Core.Equivalent_Keys;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean renames Core.Equivalent_Keys;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean renames Core.Equivalent_Keys;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    function Iterate (Container : Map) return Map_Iterator renames Core.Iterate;
  end;
  generic
    type Element_Type is private;
    with function Hash (Element : Element_Type) return Hash_Type is <>;
    with function Equivalent_Elements (Left, Right : Element_Type) return Boolean is "=";
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Hashed_Sets is
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Hashed_Sets (Elements.Policy, Hash, Equivalent_Elements, "=", Task_Safe);
    subtype Set is Core.Set (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Set  : Set renames Core.Empty_Set;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Set; Position : Cursor) return Boolean renames Core.Has_Element;
    package Set_Iterator_Interfaces renames Core.Set_Iterator_Interfaces;
    subtype Set_Iterator is Core.Set_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Set) return Boolean renames Core."=";
    function Equivalent_Sets (Left, Right : Set) return Boolean renames Core.Equivalent_Sets;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Empty (Capacity : Count_Type := 10) return Set is (Core.Empty (Capacity));
    function To_Set (New_Item : Element_Type) return Set is (Core.To_Set (New_Item));
    function Capacity (Container : Set) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Set) return Count_Type renames Core.Length;
    function Is_Empty (Container : Set) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Set) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Set; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    procedure Assign (Target : in out Set; Source : Set) renames Core.Assign;
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set is (Core.Copy (Source, Capacity));
    procedure Move (Target : in out Set; Source : in out Set) renames Core.Move;
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Set; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Set; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Set; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Set; Item : Element_Type) renames Core.Exclude;
    procedure Delete (Container : in out Set; Item : Element_Type) renames Core.Delete;
    procedure Delete (Container : in out Set; Position : in out Cursor) renames Core.Delete;
    procedure Union (Target : in out Set; Source : Set) renames Core.Union;
    function Union (Left, Right : Set) return Set renames Core.Union;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set) renames Core.Intersection;
    function Intersection (Left, Right : Set) return Set renames Core.Intersection;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set) renames Core.Difference;
    function Difference (Left, Right : Set) return Set renames Core.Difference;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) renames Core.Symmetric_Difference;
    function Symmetric_Difference (Left, Right : Set) return Set renames Core.Symmetric_Difference;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean renames Core.Overlap;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean renames Core.Is_Subset;
    function First (Container : Set) return Cursor renames Core.First;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Set; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Set; Position : in out Cursor) renames Core.Next;
    function Find (Container : Set; Item : Element_Type) return Cursor renames Core.Find;
    function Contains (Container : Set; Item : Element_Type) return Boolean renames Core.Contains;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean renames Core.Equivalent_Elements;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean renames Core.Equivalent_Elements;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean renames Core.Equivalent_Elements;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    function Iterate (Container : Set) return Set_Iterator renames Core.Iterate;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type is <>;
      with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
    package Generic_Keys is
      package Keys is new Core.Generic_Keys (Key_Type, Key, Hash, Equivalent_Keys);
      function Key (Position : Cursor) return Key_Type renames Keys.Key;
      function Element (Container : Set; Key : Key_Type) return Element_Type renames Keys.Element;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) renames Keys.Replace;
      procedure Exclude (Container : in out Set; Key : Key_Type) renames Keys.Exclude;
      procedure Delete (Container : in out Set; Key : Key_Type) renames Keys.Delete;
      function Find (Container : Set; Key : Key_Type) return Cursor renames Keys.Find;
      function Contains (Container : Set; Key : Key_Type) return Boolean renames Keys.Contains;
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) renames Keys.Update_Element_Preserving_Key;
      subtype Reference_Type is Keys.Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type renames Keys.Reference_Preserving_Key;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type renames Keys.Constant_Reference;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type renames Keys.Reference_Preserving_Key;
    end;
  end;
  generic
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Holders is
    package Core is new Holder_Core (Element_Type, "=", Task_Safe => Task_Safe);
    subtype Holder is Core.Holder;
    Empty_Holder : Holder renames Core.Empty_Holder;
    function "=" (Left, Right : Holder) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean renames Core.Tampering_With_The_Element_Prohibited;
    function Empty return Holder renames Core.Empty;
    function To_Holder (New_Item : Element_Type) return Holder renames Core.To_Holder;
    function Is_Empty (Container : Holder) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Holder) renames Core.Clear;
    function Element (Container : Holder) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Container : Holder;
                             Process   : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Holder;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Holder) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Holder; Source : Holder) renames Core.Assign;
    function Copy (Source : Holder) return Holder renames Core.Copy;
    procedure Move (Target : in out Holder; Source : in out Holder) renames Core.Move;
    procedure Swap (Left, Right : in out Holder) renames Core.Swap;
  end;
  generic
    type Index_Type is range <> or use Positive;
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Vectors is
    package Storage is new Indirect_Storage (Element_Type, "=");
    package Core is new Vector_Core (Index_Type, Element_Type, Storage.Pointer, Storage.Pointer_Pointer, Storage.Pointer, Storage.Store, Storage.Put, Storage.Target, Storage.Free, Storage.Equal, False, True, Task_Safe);
    subtype Extended_Index is Core.Extended_Index;
    No_Index : Extended_Index renames Core.No_Index;
    subtype Vector is Core.Vector;
    subtype Cursor is Core.Cursor;
    Empty_Vector : Vector renames Core.Empty_Vector;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean renames Core.Has_Element;
    package Vector_Iterator_Interfaces renames Core.Vector_Iterator_Interfaces;
    subtype Vector_Iterator is Core.Vector_Iterator;
    function "=" (Left, Right : Vector) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Maximum_Length return Count_Type renames Core.Maximum_Length;
    function Empty (Capacity : Count_Type := 10) return Vector renames Core.Empty;
    function To_Vector (Length : Count_Type) return Vector renames Core.To_Vector;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector renames Core.To_Vector;
    function "&" (Left, Right : Vector) return Vector renames Core."&";
    function "&" (Left : Vector; Right : Element_Type) return Vector renames Core."&";
    function "&" (Left : Element_Type; Right : Vector) return Vector renames Core."&";
    function "&" (Left, Right : Element_Type) return Vector renames Core."&";
    function Capacity (Container : Vector) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Vector) return Count_Type renames Core.Length;
    procedure Set_Length (Container : in out Vector; Length : Count_Type) renames Core.Set_Length;
    function Is_Empty (Container : Vector) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Vector) renames Core.Clear;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor renames Core.To_Cursor;
    function To_Index (Position : Cursor) return Extended_Index renames Core.To_Index;
    function Element (Container : Vector; Index : Index_Type) return Element_Type renames Core.Element;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Vector; Source : Vector) renames Core.Assign;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector renames Core.Copy;
    procedure Move (Target : in out Vector; Source : in out Vector) renames Core.Move;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Core.Insert_Vector;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Core.Insert_Vector;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Core.Insert_Vector;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Core.Insert;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Core.Insert;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1) renames Core.Insert_Space;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1) renames Core.Insert_Space;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) renames Core.Prepend_Vector;
    procedure Prepend (Container : in out Vector; New_Item : Vector) renames Core.Prepend;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) renames Core.Prepend;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) renames Core.Append_Vector;
    procedure Append (Container : in out Vector; New_Item : Vector) renames Core.Append;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) renames Core.Append;
    procedure Append (Container : in out Vector; New_Item : Element_Type) renames Core.Append;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) renames Core.Delete_Last;
    procedure Reverse_Elements (Container : in out Vector) renames Core.Reverse_Elements;
    procedure Swap (Container : in out Vector; I, J : Index_Type) renames Core.Swap;
    procedure Swap (Container : in out Vector; I, J : Cursor) renames Core.Swap;
    function First_Index (Container : Vector) return Index_Type renames Core.First_Index;
    function First (Container : Vector) return Cursor renames Core.First;
    function First_Element (Container : Vector) return Element_Type renames Core.First_Element;
    function Last_Index (Container : Vector) return Extended_Index renames Core.Last_Index;
    function Last (Container : Vector) return Cursor renames Core.Last;
    function Last_Element (Container : Vector) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Vector; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Vector; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Vector; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Vector; Position : in out Cursor) renames Core.Previous;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index renames Core.Find_Index;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Find;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index renames Core.Reverse_Find_Index;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Reverse_Find;
    function Contains (Container : Vector; Item : Element_Type) return Boolean renames Core.Contains;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Vector) return Vector_Iterator renames Core.Iterate;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator renames Core.Iterate;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      package Sorting is new Core.Generic_Sorting ("<");
      function Is_Sorted (Container : Vector) return Boolean renames Sorting.Is_Sorted;
      procedure Sort (Container : in out Vector) renames Sorting.Sort;
      procedure Merge (Target : in out Vector; Source : in out Vector) renames Sorting.Merge;
    end;
  end;
  generic
    type Element_Type (<>) is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Doubly_Linked_Lists is
    package Storage is new Indirect_Storage (Element_Type, "=");
    package Core is new List_Core (Element_Type, Storage.Pointer, Storage.Pointer_Pointer, Storage.Pointer, Storage.Store, Storage.Put, Storage.Target, Storage.Free, Storage.Equal, False, True, Task_Safe);
    subtype List is Core.List;
    subtype Cursor is Core.Cursor;
    Empty_List : List renames Core.Empty_List;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : List; Position : Cursor) return Boolean renames Core.Has_Element;
    package List_Iterator_Interfaces renames Core.List_Iterator_Interfaces;
    subtype List_Iterator is Core.List_Iterator;
    function "=" (Left, Right : List) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty return List is (Core.Empty_List);
    function Length (Container : List) return Count_Type renames Core.Length;
    function Is_Empty (Container : List) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out List) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out List; Source : List) renames Core.Assign;
    function Copy (Source : List) return List is (Core.Copy (Source));
    procedure Move (Target : in out List; Source : in out List) renames Core.Move;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) renames Core.Prepend;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) renames Core.Append;
    procedure Append (Container : in out List; New_Item : Element_Type) renames Core.Append;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) renames Core.Delete_First;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) renames Core.Delete_Last;
    procedure Reverse_Elements (Container : in out List) renames Core.Reverse_Elements;
    procedure Swap (Container : in out List; I, J : Cursor) renames Core.Swap;
    procedure Swap_Links (Container : in out List; I, J : Cursor) renames Core.Swap_Links;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) renames Core.Splice;
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor) renames Core.Splice;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) renames Core.Splice;
    function First (Container : List) return Cursor renames Core.First;
    function First_Element (Container : List) return Element_Type renames Core.First_Element;
    function Last (Container : List) return Cursor renames Core.Last;
    function Last_Element (Container : List) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Next (Position : in out Cursor) renames Core.Next;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Next (Container : List; Position : Cursor) return Cursor renames Core.Next;
    function Previous (Container : List; Position : Cursor) return Cursor renames Core.Previous;
    procedure Next (Container : List; Position : in out Cursor) renames Core.Next;
    procedure Previous (Container : List; Position : in out Cursor) renames Core.Previous;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Find;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Reverse_Find;
    function Contains (Container : List; Item : Element_Type) return Boolean renames Core.Contains;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : List) return List_Iterator renames Core.Iterate;
    function Iterate (Container : List; Start : Cursor) return List_Iterator renames Core.Iterate;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      package Sorting is new Core.Generic_Sorting ("<");
      function Is_Sorted (Container : List) return Boolean renames Sorting.Is_Sorted;
      procedure Sort (Container : in out List) renames Sorting.Sort;
      procedure Merge (Target, Source : in out List) renames Sorting.Merge;
    end;
  end;
  generic
    type Key_Type (<>) is private;
    type Element_Type (<>) is private;
    with function "<" (Left, Right : Key_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Ordered_Maps is
    package Keys is new Balanced_Trees.Indefinite (Key_Type);
    package Elements is new Balanced_Trees.Indefinite (Element_Type);
    package Core is new Balanced_Trees.Maps (Keys.Policy, Elements.Policy, "<", "=", Task_Safe);
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean renames Core.Equivalent_Keys;
    subtype Map is Core.Map (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Map  : constant Map := Core.Empty (Count_Type'Last);
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Map; Position : Cursor) return Boolean renames Core.Has_Element;
    package Map_Iterator_Interfaces renames Core.Map_Iterator_Interfaces;
    subtype Map_Iterator is Core.Map_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Map) return Boolean renames Core."=";
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty return Map is (Empty_Map);
    function Length (Container : Map) return Count_Type renames Core.Length;
    function Is_Empty (Container : Map) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Map) renames Core.Clear;
    function Key (Position : Cursor) return Key_Type renames Core.Key;
    function Key (Container : Map; Position : Cursor) return Key_Type renames Core.Key;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Map; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) renames Core.Update_Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Map; Source : Map) renames Core.Assign;
    function Copy (Source : Map) return Map is (Core.Copy (Source, Count_Type'Last));
    procedure Move (Target : in out Map; Source : in out Map) renames Core.Move;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Map; Key : Key_Type) renames Core.Exclude;
    procedure Delete (Container : in out Map; Key : Key_Type) renames Core.Delete;
    procedure Delete (Container : in out Map; Position : in out Cursor) renames Core.Delete;
    procedure Delete_First (Container : in out Map) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Map) renames Core.Delete_Last;
    function First (Container : Map) return Cursor renames Core.First;
    function First_Element (Container : Map) return Element_Type renames Core.First_Element;
    function First_Key (Container : Map) return Key_Type renames Core.First_Key;
    function Last (Container : Map) return Cursor renames Core.Last;
    function Last_Element (Container : Map) return Element_Type renames Core.Last_Element;
    function Last_Key (Container : Map) return Key_Type renames Core.Last_Key;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Map; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Map; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Map; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Map; Position : in out Cursor) renames Core.Previous;
    function Find (Container : Map; Key : Key_Type) return Cursor renames Core.Find;
    function Element (Container : Map; Key : Key_Type) return Element_Type renames Core.Element;
    function Floor (Container : Map; Key : Key_Type) return Cursor renames Core.Floor;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor renames Core.Ceiling;
    function Contains (Container : Map; Key : Key_Type) return Boolean renames Core.Contains;
    function "<" (Left, Right : Cursor) return Boolean renames Core."<";
    function ">" (Left, Right : Cursor) return Boolean renames Core.">";
    function "<" (Left : Cursor; Right : Key_Type) return Boolean renames Core."<";
    function ">" (Left : Cursor; Right : Key_Type) return Boolean renames Core.">";
    function "<" (Left : Key_Type; Right : Cursor) return Boolean renames Core."<";
    function ">" (Left : Key_Type; Right : Cursor) return Boolean renames Core.">";
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Map) return Map_Iterator renames Core.Iterate;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator renames Core.Iterate;
  end;
  generic
    type Key_Type (<>) is private;
    type Element_Type (<>) is private;
    with function Hash (Key : Key_Type) return Hash_Type is <>;
    with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Hashed_Maps is
    package Keys is new Balanced_Trees.Indefinite (Key_Type);
    package Elements is new Balanced_Trees.Indefinite (Element_Type);
    package Core is new Balanced_Trees.Hashed_Maps (Keys.Policy, Elements.Policy, Hash, Equivalent_Keys, "=", Task_Safe);
    subtype Map is Core.Map (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Map  : Map renames Core.Empty_Map;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Map; Position : Cursor) return Boolean renames Core.Has_Element;
    package Map_Iterator_Interfaces renames Core.Map_Iterator_Interfaces;
    subtype Map_Iterator is Core.Map_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Map) return Boolean renames Core."=";
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty (Capacity : Count_Type := 10) return Map is (Core.Empty (Capacity));
    function Capacity (Container : Map) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Map) return Count_Type renames Core.Length;
    function Is_Empty (Container : Map) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Map) renames Core.Clear;
    function Key (Position : Cursor) return Key_Type renames Core.Key;
    function Key (Container : Map; Position : Cursor) return Key_Type renames Core.Key;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Map; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) renames Core.Update_Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Map; Source : Map) renames Core.Assign;
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map is (Core.Copy (Source, Capacity));
    procedure Move (Target : in out Map; Source : in out Map) renames Core.Move;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Map; Key : Key_Type) renames Core.Exclude;
    procedure Delete (Container : in out Map; Key : Key_Type) renames Core.Delete;
    procedure Delete (Container : in out Map; Position : in out Cursor) renames Core.Delete;
    function First (Container : Map) return Cursor renames Core.First;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Map; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Map; Position : in out Cursor) renames Core.Next;
    function Find (Container : Map; Key : Key_Type) return Cursor renames Core.Find;
    function Element (Container : Map; Key : Key_Type) return Element_Type renames Core.Element;
    function Contains (Container : Map; Key : Key_Type) return Boolean renames Core.Contains;
    function Equivalent_Keys (Left, Right : Cursor) return Boolean renames Core.Equivalent_Keys;
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean renames Core.Equivalent_Keys;
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean renames Core.Equivalent_Keys;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    function Iterate (Container : Map) return Map_Iterator renames Core.Iterate;
  end;
  generic
    type Element_Type (<>) is private;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Ordered_Sets is
    package Elements is new Balanced_Trees.Indefinite (Element_Type);
    package Core is new Balanced_Trees.Sets (Elements.Policy, "<", "=", Task_Safe);
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean renames Core.Equivalent_Elements;
    subtype Set is Core.Set (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Set  : constant Set := Core.Empty (Count_Type'Last);
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Set; Position : Cursor) return Boolean renames Core.Has_Element;
    package Set_Iterator_Interfaces renames Core.Set_Iterator_Interfaces;
    subtype Set_Iterator is Core.Set_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Set) return Boolean renames Core."=";
    function Equivalent_Sets (Left, Right : Set) return Boolean renames Core.Equivalent_Sets;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Empty return Set is (Empty_Set);
    function To_Set (New_Item : Element_Type) return Set is (Core.To_Set (New_Item, Count_Type'Last));
    function Length (Container : Set) return Count_Type renames Core.Length;
    function Is_Empty (Container : Set) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Set) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Set; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    procedure Assign (Target : in out Set; Source : Set) renames Core.Assign;
    function Copy (Source : Set) return Set is (Core.Copy (Source, Count_Type'Last));
    procedure Move (Target : in out Set; Source : in out Set) renames Core.Move;
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Set; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Set; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Set; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Set; Item : Element_Type) renames Core.Exclude;
    procedure Delete (Container : in out Set; Item : Element_Type) renames Core.Delete;
    procedure Delete (Container : in out Set; Position : in out Cursor) renames Core.Delete;
    procedure Delete_First (Container : in out Set) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Set) renames Core.Delete_Last;
    procedure Union (Target : in out Set; Source : Set) renames Core.Union;
    function Union (Left, Right : Set) return Set renames Core.Union;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set) renames Core.Intersection;
    function Intersection (Left, Right : Set) return Set renames Core.Intersection;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set) renames Core.Difference;
    function Difference (Left, Right : Set) return Set renames Core.Difference;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) renames Core.Symmetric_Difference;
    function Symmetric_Difference (Left, Right : Set) return Set renames Core.Symmetric_Difference;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean renames Core.Overlap;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean renames Core.Is_Subset;
    function First (Container : Set) return Cursor renames Core.First;
    function First_Element (Container : Set) return Element_Type renames Core.First_Element;
    function Last (Container : Set) return Cursor renames Core.Last;
    function Last_Element (Container : Set) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Set; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Set; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Set; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Set; Position : in out Cursor) renames Core.Previous;
    function Find (Container : Set; Item : Element_Type) return Cursor renames Core.Find;
    function Floor (Container : Set; Item : Element_Type) return Cursor renames Core.Floor;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor renames Core.Ceiling;
    function Contains (Container : Set; Item : Element_Type) return Boolean renames Core.Contains;
    function "<" (Left, Right : Cursor) return Boolean renames Core."<";
    function ">" (Left, Right : Cursor) return Boolean renames Core.">";
    function "<" (Left : Cursor; Right : Element_Type) return Boolean renames Core."<";
    function ">" (Left : Cursor; Right : Element_Type) return Boolean renames Core.">";
    function "<" (Left : Element_Type; Right : Cursor) return Boolean renames Core."<";
    function ">" (Left : Element_Type; Right : Cursor) return Boolean renames Core.">";
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Set) return Set_Iterator renames Core.Iterate;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator renames Core.Iterate;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function "<" (Left, Right : Key_Type) return Boolean is <>;
    package Generic_Keys is
      package Keys is new Core.Generic_Keys (Key_Type, Key, "<");
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean renames Keys.Equivalent_Keys;
      function Key (Position : Cursor) return Key_Type renames Keys.Key;
      function Element (Container : Set; Key : Key_Type) return Element_Type renames Keys.Element;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) renames Keys.Replace;
      procedure Exclude (Container : in out Set; Key : Key_Type) renames Keys.Exclude;
      procedure Delete (Container : in out Set; Key : Key_Type) renames Keys.Delete;
      function Find (Container : Set; Key : Key_Type) return Cursor renames Keys.Find;
      function Floor (Container : Set; Key : Key_Type) return Cursor renames Keys.Floor;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor renames Keys.Ceiling;
      function Contains (Container : Set; Key : Key_Type) return Boolean renames Keys.Contains;
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) renames Keys.Update_Element_Preserving_Key;
      subtype Reference_Type is Keys.Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type renames Keys.Reference_Preserving_Key;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type renames Keys.Constant_Reference;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type renames Keys.Reference_Preserving_Key;
    end;
  end;
  generic
    type Element_Type (<>) is private;
    with function Hash (Element : Element_Type) return Hash_Type is <>;
    with function Equivalent_Elements (Left, Right : Element_Type) return Boolean is "=";
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Indefinite_Hashed_Sets is
    package Elements is new Balanced_Trees.Indefinite (Element_Type);
    package Core is new Balanced_Trees.Hashed_Sets (Elements.Policy, Hash, Equivalent_Elements, "=", Task_Safe);
    subtype Set is Core.Set (Count_Type'Last);
    subtype Cursor is Core.Cursor;
    Empty_Set  : Set renames Core.Empty_Set;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Set; Position : Cursor) return Boolean renames Core.Has_Element;
    package Set_Iterator_Interfaces renames Core.Set_Iterator_Interfaces;
    subtype Set_Iterator is Core.Set_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Set) return Boolean renames Core."=";
    function Equivalent_Sets (Left, Right : Set) return Boolean renames Core.Equivalent_Sets;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Empty (Capacity : Count_Type := 10) return Set is (Core.Empty (Capacity));
    function To_Set (New_Item : Element_Type) return Set is (Core.To_Set (New_Item));
    function Capacity (Container : Set) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Set) return Count_Type renames Core.Length;
    function Is_Empty (Container : Set) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Set) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Set; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    procedure Assign (Target : in out Set; Source : Set) renames Core.Assign;
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set is (Core.Copy (Source, Capacity));
    procedure Move (Target : in out Set; Source : in out Set) renames Core.Move;
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Set; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Set; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Set; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Set; Item : Element_Type) renames Core.Exclude;
    procedure Delete (Container : in out Set; Item : Element_Type) renames Core.Delete;
    procedure Delete (Container : in out Set; Position : in out Cursor) renames Core.Delete;
    procedure Union (Target : in out Set; Source : Set) renames Core.Union;
    function Union (Left, Right : Set) return Set renames Core.Union;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set) renames Core.Intersection;
    function Intersection (Left, Right : Set) return Set renames Core.Intersection;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set) renames Core.Difference;
    function Difference (Left, Right : Set) return Set renames Core.Difference;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) renames Core.Symmetric_Difference;
    function Symmetric_Difference (Left, Right : Set) return Set renames Core.Symmetric_Difference;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean renames Core.Overlap;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean renames Core.Is_Subset;
    function First (Container : Set) return Cursor renames Core.First;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Set; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Set; Position : in out Cursor) renames Core.Next;
    function Find (Container : Set; Item : Element_Type) return Cursor renames Core.Find;
    function Contains (Container : Set; Item : Element_Type) return Boolean renames Core.Contains;
    function Equivalent_Elements (Left, Right : Cursor) return Boolean renames Core.Equivalent_Elements;
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean renames Core.Equivalent_Elements;
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean renames Core.Equivalent_Elements;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    function Iterate (Container : Set) return Set_Iterator renames Core.Iterate;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type is <>;
      with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
    package Generic_Keys is
      package Keys is new Core.Generic_Keys (Key_Type, Key, Hash, Equivalent_Keys);
      function Key (Position : Cursor) return Key_Type renames Keys.Key;
      function Element (Container : Set; Key : Key_Type) return Element_Type renames Keys.Element;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) renames Keys.Replace;
      procedure Exclude (Container : in out Set; Key : Key_Type) renames Keys.Exclude;
      procedure Delete (Container : in out Set; Key : Key_Type) renames Keys.Delete;
      function Find (Container : Set; Key : Key_Type) return Cursor renames Keys.Find;
      function Contains (Container : Set; Key : Key_Type) return Boolean renames Keys.Contains;
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) renames Keys.Update_Element_Preserving_Key;
      subtype Reference_Type is Keys.Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type renames Keys.Reference_Preserving_Key;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type renames Keys.Constant_Reference;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type renames Keys.Reference_Preserving_Key;
    end;
  end;
  generic
    type Index_Type is range <> or use Positive;
    type Element_Type  is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Vectors is
    package Storage is new Direct_Storage (Element_Type);
    package Core is new Vector_Core (Index_Type, Element_Type, Element_Type, Storage.Pointer, Storage.Pointer, Storage.Store, Storage.Put, Storage.Same, Storage.Keep, "=", True, False, Task_Safe);
    subtype Extended_Index is Core.Extended_Index;
    No_Index : Extended_Index renames Core.No_Index;
    subtype Vector is Core.Vector;
    subtype Cursor is Core.Cursor;
    Empty_Vector : Vector renames Core.Empty_Vector;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Vector; Position : Cursor) return Boolean renames Core.Has_Element;
    package Vector_Iterator_Interfaces renames Core.Vector_Iterator_Interfaces;
    subtype Vector_Iterator is Core.Vector_Iterator;
    function "=" (Left, Right : Vector) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Maximum_Length return Count_Type renames Core.Maximum_Length;
    function Empty (Capacity : Count_Type := 10) return Vector renames Core.Empty;
    function To_Vector (Length : Count_Type) return Vector renames Core.To_Vector;
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector renames Core.To_Vector;
    function "&" (Left, Right : Vector) return Vector renames Core."&";
    function "&" (Left : Vector; Right : Element_Type) return Vector renames Core."&";
    function "&" (Left : Element_Type; Right : Vector) return Vector renames Core."&";
    function "&" (Left, Right : Element_Type) return Vector renames Core."&";
    function Capacity (Container : Vector) return Count_Type renames Core.Capacity;
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) renames Core.Reserve_Capacity;
    function Length (Container : Vector) return Count_Type renames Core.Length;
    procedure Set_Length (Container : in out Vector; Length : Count_Type) renames Core.Set_Length;
    function Is_Empty (Container : Vector) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Vector) renames Core.Clear;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor renames Core.To_Cursor;
    function To_Index (Position : Cursor) return Extended_Index renames Core.To_Index;
    function Element (Container : Vector; Index : Index_Type) return Element_Type renames Core.Element;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Container : Vector;
                             Index     : Index_Type;
                             Process   : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Vector;
                              Index     : Index_Type;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    procedure Update_Element (Container : in out Vector;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Vector; Source : Vector) renames Core.Assign;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector renames Core.Copy;
    procedure Move (Target : in out Vector; Source : in out Vector) renames Core.Move;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Core.Insert_Vector;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Core.Insert_Vector;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Core.Insert_Vector;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Vector) renames Core.Insert;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector) renames Core.Insert;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Extended_Index;
                            Count     : Count_Type := 1) renames Core.Insert_Space;
    procedure Insert_Space (Container : in out Vector;
                            Before    : Cursor;
                            Position  : out Cursor;
                            Count     : Count_Type := 1) renames Core.Insert_Space;
    procedure Insert (Container : in out Vector;
                      Before    : Extended_Index;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out Vector;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) renames Core.Prepend_Vector;
    procedure Prepend (Container : in out Vector; New_Item : Vector) renames Core.Prepend;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) renames Core.Prepend;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) renames Core.Append_Vector;
    procedure Append (Container : in out Vector; New_Item : Vector) renames Core.Append;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) renames Core.Append;
    procedure Append (Container : in out Vector; New_Item : Element_Type) renames Core.Append;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) renames Core.Delete_Last;
    procedure Reverse_Elements (Container : in out Vector) renames Core.Reverse_Elements;
    procedure Swap (Container : in out Vector; I, J : Index_Type) renames Core.Swap;
    procedure Swap (Container : in out Vector; I, J : Cursor) renames Core.Swap;
    function First_Index (Container : Vector) return Index_Type renames Core.First_Index;
    function First (Container : Vector) return Cursor renames Core.First;
    function First_Element (Container : Vector) return Element_Type renames Core.First_Element;
    function Last_Index (Container : Vector) return Extended_Index renames Core.Last_Index;
    function Last (Container : Vector) return Cursor renames Core.Last;
    function Last_Element (Container : Vector) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Vector; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Vector; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Vector; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Vector; Position : in out Cursor) renames Core.Previous;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index renames Core.Find_Index;
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Find;
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index renames Core.Reverse_Find_Index;
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Reverse_Find;
    function Contains (Container : Vector; Item : Element_Type) return Boolean renames Core.Contains;
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Vector) return Vector_Iterator renames Core.Iterate;
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator renames Core.Iterate;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      package Sorting is new Core.Generic_Sorting ("<");
      function Is_Sorted (Container : Vector) return Boolean renames Sorting.Is_Sorted;
      procedure Sort (Container : in out Vector) renames Sorting.Sort;
      procedure Merge (Target : in out Vector; Source : in out Vector) renames Sorting.Merge;
    end;
  end;
  generic
    type Element_Type  is private;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Doubly_Linked_Lists is
    package Storage is new Direct_Storage (Element_Type);
    package Core is new List_Core (Element_Type, Element_Type, Storage.Pointer, Storage.Pointer, Storage.Store, Storage.Put, Storage.Same, Storage.Keep, "=", True, False, Task_Safe);
    subtype List is Core.List;
    subtype Cursor is Core.Cursor;
    Empty_List : List renames Core.Empty_List;
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : List; Position : Cursor) return Boolean renames Core.Has_Element;
    package List_Iterator_Interfaces renames Core.List_Iterator_Interfaces;
    subtype List_Iterator is Core.List_Iterator;
    function "=" (Left, Right : List) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty (Capacity : Count_Type := 10) return List renames Core.Empty;
    function Capacity (Container : List) return Count_Type renames Core.Capacity;
    function Length (Container : List) return Count_Type renames Core.Length;
    function Is_Empty (Container : List) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out List) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor;
                             Process  : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out List;
                              Position  : Cursor;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out List; Position : Cursor) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out List; Source : List) renames Core.Assign;
    function Copy (Source : List; Capacity : Count_Type := 0) return List renames Core.Copy;
    procedure Move (Target : in out List; Source : in out List) renames Core.Move;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      New_Item  : Element_Type;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Insert (Container : in out List;
                      Before    : Cursor;
                      Position  : out Cursor;
                      Count     : Count_Type := 1) renames Core.Insert;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) renames Core.Prepend;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) renames Core.Append;
    procedure Append (Container : in out List; New_Item : Element_Type) renames Core.Append;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) renames Core.Delete;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) renames Core.Delete_First;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) renames Core.Delete_Last;
    procedure Reverse_Elements (Container : in out List) renames Core.Reverse_Elements;
    procedure Swap (Container : in out List; I, J : Cursor) renames Core.Swap;
    procedure Swap_Links (Container : in out List; I, J : Cursor) renames Core.Swap_Links;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) renames Core.Splice;
    procedure Splice (Target   : in out List;
                      Before   : Cursor;
                      Source   : in out List;
                      Position : in out Cursor) renames Core.Splice;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) renames Core.Splice;
    function First (Container : List) return Cursor renames Core.First;
    function First_Element (Container : List) return Element_Type renames Core.First_Element;
    function Last (Container : List) return Cursor renames Core.Last;
    function Last_Element (Container : List) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Next (Position : in out Cursor) renames Core.Next;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Next (Container : List; Position : Cursor) return Cursor renames Core.Next;
    function Previous (Container : List; Position : Cursor) return Cursor renames Core.Previous;
    procedure Next (Container : List; Position : in out Cursor) renames Core.Next;
    procedure Previous (Container : List; Position : in out Cursor) renames Core.Previous;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Find;
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor renames Core.Reverse_Find;
    function Contains (Container : List; Item : Element_Type) return Boolean renames Core.Contains;
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : List) return List_Iterator renames Core.Iterate;
    function Iterate (Container : List; Start : Cursor) return List_Iterator renames Core.Iterate;
    generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
    package Generic_Sorting is
      package Sorting is new Core.Generic_Sorting ("<");
      function Is_Sorted (Container : List) return Boolean renames Sorting.Is_Sorted;
      procedure Sort (Container : in out List) renames Sorting.Sort;
      procedure Merge (Target, Source : in out List) renames Sorting.Merge;
    end;
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function "<" (Left, Right : Key_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Ordered_Maps is
    package Keys is new Balanced_Trees.Definite (Key_Type);
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Maps (Keys.Policy, Elements.Policy, "<", "=", Task_Safe);
    function Equivalent_Keys (Left, Right : Key_Type) return Boolean renames Core.Equivalent_Keys;
    subtype Map is Core.Map;
    subtype Cursor is Core.Cursor;
    Empty_Map  : constant Map := Core.Empty (0);
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Map; Position : Cursor) return Boolean renames Core.Has_Element;
    package Map_Iterator_Interfaces renames Core.Map_Iterator_Interfaces;
    subtype Map_Iterator is Core.Map_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Map) return Boolean renames Core."=";
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean renames Core.Tampering_With_Elements_Prohibited;
    function Empty (Capacity : Count_Type := 10) return Map is (Core.Empty (Capacity));
    function Length (Container : Map) return Count_Type renames Core.Length;
    function Is_Empty (Container : Map) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Map) renames Core.Clear;
    function Key (Position : Cursor) return Key_Type renames Core.Key;
    function Key (Container : Map; Position : Cursor) return Key_Type renames Core.Key;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Map; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) renames Core.Update_Element;
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type renames Core.Reference;
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Map; Source : Map) renames Core.Assign;
    function Copy (Source : Map; Capacity : Count_Type := 0) return Map is (Core.Copy (Source, (if Capacity = 0 then Length (Source) else Capacity)));
    procedure Move (Target : in out Map; Source : in out Map) renames Core.Move;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Map; Key : Key_Type) renames Core.Exclude;
    procedure Delete (Container : in out Map; Key : Key_Type) renames Core.Delete;
    procedure Delete (Container : in out Map; Position : in out Cursor) renames Core.Delete;
    procedure Delete_First (Container : in out Map) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Map) renames Core.Delete_Last;
    function First (Container : Map) return Cursor renames Core.First;
    function First_Element (Container : Map) return Element_Type renames Core.First_Element;
    function First_Key (Container : Map) return Key_Type renames Core.First_Key;
    function Last (Container : Map) return Cursor renames Core.Last;
    function Last_Element (Container : Map) return Element_Type renames Core.Last_Element;
    function Last_Key (Container : Map) return Key_Type renames Core.Last_Key;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Map; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Map; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Map; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Map; Position : in out Cursor) renames Core.Previous;
    function Find (Container : Map; Key : Key_Type) return Cursor renames Core.Find;
    function Element (Container : Map; Key : Key_Type) return Element_Type renames Core.Element;
    function Floor (Container : Map; Key : Key_Type) return Cursor renames Core.Floor;
    function Ceiling (Container : Map; Key : Key_Type) return Cursor renames Core.Ceiling;
    function Contains (Container : Map; Key : Key_Type) return Boolean renames Core.Contains;
    function "<" (Left, Right : Cursor) return Boolean renames Core."<";
    function ">" (Left, Right : Cursor) return Boolean renames Core.">";
    function "<" (Left : Cursor; Right : Key_Type) return Boolean renames Core."<";
    function ">" (Left : Cursor; Right : Key_Type) return Boolean renames Core.">";
    function "<" (Left : Key_Type; Right : Cursor) return Boolean renames Core."<";
    function ">" (Left : Key_Type; Right : Cursor) return Boolean renames Core.">";
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Map) return Map_Iterator renames Core.Iterate;
    function Iterate (Container : Map; Start : Cursor) return Map_Iterator renames Core.Iterate;
  end;
  generic
    type Key_Type is private;
    type Element_Type is private;
    with function Hash (Key : Key_Type) return Hash_Type is <>;
    with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Hashed_Maps is
    package Keys is new Balanced_Trees.Definite (Key_Type);
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Hashed_Maps (Keys.Policy, Elements.Policy, Hash, Equivalent_Keys, "=", Task_Safe);
    type Map (Capacity : Count_Type; Modulus : Hash_Type) is record
      Items : Core.Map (Capacity);
    end record
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    subtype Cursor is Core.Cursor;
    Empty_Map  : constant Map := (0, 1, Core.Empty (0, 0));
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Map; Position : Cursor) return Boolean is (Core.Has_Element (Container.Items, Position));
    package Map_Iterator_Interfaces renames Core.Map_Iterator_Interfaces;
    subtype Map_Iterator is Core.Map_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Map) return Boolean is (Core."=" (Left.Items, Right.Items));
    function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is (Core.Tampering_With_Cursors_Prohibited (Container.Items));
    function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is (Core.Tampering_With_Elements_Prohibited (Container.Items));
    function Default_Modulus (Capacity : Count_Type) return Hash_Type is (Hash_Type (Capacity) * 2 + 1);
    function Empty (Capacity : Count_Type := 10) return Map is ((Capacity, Default_Modulus (Capacity), Core.Empty (Capacity, Capacity)));
    function Capacity (Container : Map) return Count_Type is (Container.Capacity);
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type);
    function Length (Container : Map) return Count_Type is (Core.Length (Container.Items));
    function Is_Empty (Container : Map) return Boolean is (Core.Is_Empty (Container.Items));
    procedure Clear (Container : in out Map);
    function Key (Position : Cursor) return Key_Type is (Core.Key (Position));
    function Key (Container : Map; Position : Cursor) return Key_Type is (Core.Key (Container.Items, Position));
    function Element (Position : Cursor) return Element_Type is (Core.Element (Position));
    function Element (Container : Map; Position : Cursor) return Element_Type is (Core.Element (Container.Items, Position));
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type));
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type));
    function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is (Core.Constant_Reference (Container.Items, Position));
    function Reference (Container : in out Map; Position : Cursor) return Reference_Type is (Core.Reference (Container.Items, Position));
    function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is (Core.Constant_Reference (Container.Items, Key));
    function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is (Core.Reference (Container.Items, Key));
    procedure Assign (Target : in out Map; Source : Map);
    function Copy (Source : Map; Capacity : Count_Type := 0; Modulus : Hash_Type := 0) return Map is
      (declare Wanted : constant Count_Type := (if Capacity = 0 then Length (Source) else Capacity);
       begin (Wanted, (if Modulus = 0 then Default_Modulus (Wanted) else Modulus), Core.Copy (Source.Items, 0, Wanted)));
    procedure Move (Target : in out Map; Source : in out Map);
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean);
    procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean);
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type);
    procedure Exclude (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Key : Key_Type);
    procedure Delete (Container : in out Map; Position : in out Cursor);
    function First (Container : Map) return Cursor is (Core.First (Container.Items));
    function Next (Position : Cursor) return Cursor is (Core.Next (Position));
    procedure Next (Position : in out Cursor);
    function Next (Container : Map; Position : Cursor) return Cursor is (Core.Next (Container.Items, Position));
    procedure Next (Container : Map; Position : in out Cursor);
    function Find (Container : Map; Key : Key_Type) return Cursor is (Core.Find (Container.Items, Key));
    function Element (Container : Map; Key : Key_Type) return Element_Type is (Core.Element (Container.Items, Key));
    function Contains (Container : Map; Key : Key_Type) return Boolean is (Core.Contains (Container.Items, Key));
    function Equivalent_Keys (Left, Right : Cursor) return Boolean is (Core.Equivalent_Keys (Left, Right));
    function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean is (Core.Equivalent_Keys (Left, Right));
    function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean is (Core.Equivalent_Keys (Left, Right));
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Map) return Map_Iterator is (Core.Iterate (Container.Items));
  end;
  generic
    type Element_Type is private;
    with function "<" (Left, Right : Element_Type) return Boolean is <>;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Ordered_Sets is
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Sets (Elements.Policy, "<", "=", Task_Safe);
    function Equivalent_Elements (Left, Right : Element_Type) return Boolean renames Core.Equivalent_Elements;
    subtype Set is Core.Set;
    subtype Cursor is Core.Cursor;
    Empty_Set  : constant Set := Core.Empty (0);
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Set; Position : Cursor) return Boolean renames Core.Has_Element;
    package Set_Iterator_Interfaces renames Core.Set_Iterator_Interfaces;
    subtype Set_Iterator is Core.Set_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Set) return Boolean renames Core."=";
    function Equivalent_Sets (Left, Right : Set) return Boolean renames Core.Equivalent_Sets;
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean renames Core.Tampering_With_Cursors_Prohibited;
    function Empty (Capacity : Count_Type := 10) return Set is (Core.Empty (Capacity));
    function To_Set (New_Item : Element_Type) return Set is (Core.To_Set (New_Item, 1));
    function Length (Container : Set) return Count_Type renames Core.Length;
    function Is_Empty (Container : Set) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Set) renames Core.Clear;
    function Element (Position : Cursor) return Element_Type renames Core.Element;
    function Element (Container : Set; Position : Cursor) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type renames Core.Constant_Reference;
    procedure Assign (Target : in out Set; Source : Set) renames Core.Assign;
    function Copy (Source : Set; Capacity : Count_Type := 0) return Set is (Core.Copy (Source, (if Capacity = 0 then Length (Source) else Capacity)));
    procedure Move (Target : in out Set; Source : in out Set) renames Core.Move;
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) renames Core.Insert;
    procedure Insert (Container : in out Set; New_Item : Element_Type) renames Core.Insert;
    procedure Include (Container : in out Set; New_Item : Element_Type) renames Core.Include;
    procedure Replace (Container : in out Set; New_Item : Element_Type) renames Core.Replace;
    procedure Exclude (Container : in out Set; Item : Element_Type) renames Core.Exclude;
    procedure Delete (Container : in out Set; Item : Element_Type) renames Core.Delete;
    procedure Delete (Container : in out Set; Position : in out Cursor) renames Core.Delete;
    procedure Delete_First (Container : in out Set) renames Core.Delete_First;
    procedure Delete_Last (Container : in out Set) renames Core.Delete_Last;
    procedure Union (Target : in out Set; Source : Set) renames Core.Union;
    function Union (Left, Right : Set) return Set renames Core.Union;
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set) renames Core.Intersection;
    function Intersection (Left, Right : Set) return Set renames Core.Intersection;
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set) renames Core.Difference;
    function Difference (Left, Right : Set) return Set renames Core.Difference;
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) renames Core.Symmetric_Difference;
    function Symmetric_Difference (Left, Right : Set) return Set renames Core.Symmetric_Difference;
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean renames Core.Overlap;
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean renames Core.Is_Subset;
    function First (Container : Set) return Cursor renames Core.First;
    function First_Element (Container : Set) return Element_Type renames Core.First_Element;
    function Last (Container : Set) return Cursor renames Core.Last;
    function Last_Element (Container : Set) return Element_Type renames Core.Last_Element;
    function Next (Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Position : in out Cursor) renames Core.Next;
    function Next (Container : Set; Position : Cursor) return Cursor renames Core.Next;
    procedure Next (Container : Set; Position : in out Cursor) renames Core.Next;
    function Previous (Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Position : in out Cursor) renames Core.Previous;
    function Previous (Container : Set; Position : Cursor) return Cursor renames Core.Previous;
    procedure Previous (Container : Set; Position : in out Cursor) renames Core.Previous;
    function Find (Container : Set; Item : Element_Type) return Cursor renames Core.Find;
    function Floor (Container : Set; Item : Element_Type) return Cursor renames Core.Floor;
    function Ceiling (Container : Set; Item : Element_Type) return Cursor renames Core.Ceiling;
    function Contains (Container : Set; Item : Element_Type) return Boolean renames Core.Contains;
    function "<" (Left, Right : Cursor) return Boolean renames Core."<";
    function ">" (Left, Right : Cursor) return Boolean renames Core.">";
    function "<" (Left : Cursor; Right : Element_Type) return Boolean renames Core."<";
    function ">" (Left : Cursor; Right : Element_Type) return Boolean renames Core.">";
    function "<" (Left : Element_Type; Right : Cursor) return Boolean renames Core."<";
    function ">" (Left : Element_Type; Right : Cursor) return Boolean renames Core.">";
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Iterate;
    procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) renames Core.Reverse_Iterate;
    function Iterate (Container : Set) return Set_Iterator renames Core.Iterate;
    function Iterate (Container : Set; Start : Cursor) return Set_Iterator renames Core.Iterate;
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function "<" (Left, Right : Key_Type) return Boolean is <>;
    package Generic_Keys is
      package Keys is new Core.Generic_Keys (Key_Type, Key, "<");
      function Equivalent_Keys (Left, Right : Key_Type) return Boolean renames Keys.Equivalent_Keys;
      function Key (Position : Cursor) return Key_Type renames Keys.Key;
      function Element (Container : Set; Key : Key_Type) return Element_Type renames Keys.Element;
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) renames Keys.Replace;
      procedure Exclude (Container : in out Set; Key : Key_Type) renames Keys.Exclude;
      procedure Delete (Container : in out Set; Key : Key_Type) renames Keys.Delete;
      function Find (Container : Set; Key : Key_Type) return Cursor renames Keys.Find;
      function Floor (Container : Set; Key : Key_Type) return Cursor renames Keys.Floor;
      function Ceiling (Container : Set; Key : Key_Type) return Cursor renames Keys.Ceiling;
      function Contains (Container : Set; Key : Key_Type) return Boolean renames Keys.Contains;
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) renames Keys.Update_Element_Preserving_Key;
      subtype Reference_Type is Keys.Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type renames Keys.Reference_Preserving_Key;
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type renames Keys.Constant_Reference;
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type renames Keys.Reference_Preserving_Key;
    end;
  end;
  generic
    type Element_Type is private;
    with function Hash (Element : Element_Type) return Hash_Type is <>;
    with function Equivalent_Elements (Left, Right : Element_Type) return Boolean is "=";
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Hashed_Sets is
    package Elements is new Balanced_Trees.Definite (Element_Type);
    package Core is new Balanced_Trees.Hashed_Sets (Elements.Policy, Hash, Equivalent_Elements, "=", Task_Safe);
    type Set (Capacity : Count_Type; Modulus : Hash_Type) is record
      Items : Core.Set (Capacity);
    end record
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
    subtype Cursor is Core.Cursor;
    Empty_Set  : constant Set := (0, 1, Core.Empty (0, 0));
    No_Element : Cursor renames Core.No_Element;
    function Has_Element (Position : Cursor) return Boolean renames Core.Has_Element;
    function Has_Element (Container : Set; Position : Cursor) return Boolean is (Core.Has_Element (Container.Items, Position));
    package Set_Iterator_Interfaces renames Core.Set_Iterator_Interfaces;
    subtype Set_Iterator is Core.Set_Iterator;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    function "=" (Left, Right : Cursor) return Boolean renames Core."=";
    function "=" (Left, Right : Set) return Boolean is (Core."=" (Left.Items, Right.Items));
    function Equivalent_Sets (Left, Right : Set) return Boolean is (Core.Equivalent_Sets (Left.Items, Right.Items));
    function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is (Core.Tampering_With_Cursors_Prohibited (Container.Items));
    function Default_Modulus (Capacity : Count_Type) return Hash_Type is (Hash_Type (Capacity) * 2 + 1);
    function Sized (Items : Core.Set) return Set is ((Items.Limit, Default_Modulus (Items.Limit), Items));
    function Empty (Capacity : Count_Type := 10) return Set is ((Capacity, Default_Modulus (Capacity), Core.Empty (Capacity, Capacity)));
    function To_Set (New_Item : Element_Type) return Set is (Sized (Core.To_Set (New_Item, 1)));
    function Capacity (Container : Set) return Count_Type is (Container.Capacity);
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type);
    function Length (Container : Set) return Count_Type is (Core.Length (Container.Items));
    function Is_Empty (Container : Set) return Boolean is (Core.Is_Empty (Container.Items));
    procedure Clear (Container : in out Set);
    function Element (Position : Cursor) return Element_Type is (Core.Element (Position));
    function Element (Container : Set; Position : Cursor) return Element_Type is (Core.Element (Container.Items, Position));
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type);
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type));
    function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is (Core.Constant_Reference (Container.Items, Position));
    procedure Assign (Target : in out Set; Source : Set);
    function Copy (Source : Set; Capacity : Count_Type := 0; Modulus : Hash_Type := 0) return Set is
      (declare Wanted : constant Count_Type := (if Capacity = 0 then Length (Source) else Capacity);
       begin (Wanted, (if Modulus = 0 then Default_Modulus (Wanted) else Modulus), Core.Copy (Source.Items, 0, Wanted)));
    procedure Move (Target : in out Set; Source : in out Set);
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean);
    procedure Insert (Container : in out Set; New_Item : Element_Type);
    procedure Include (Container : in out Set; New_Item : Element_Type);
    procedure Replace (Container : in out Set; New_Item : Element_Type);
    procedure Exclude (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Item : Element_Type);
    procedure Delete (Container : in out Set; Position : in out Cursor);
    procedure Union (Target : in out Set; Source : Set);
    function Union (Left, Right : Set) return Set is (Sized (Core.Union (Left.Items, Right.Items)));
    function "or" (Left, Right : Set) return Set renames Union;
    procedure Intersection (Target : in out Set; Source : Set);
    function Intersection (Left, Right : Set) return Set is (Sized (Core.Intersection (Left.Items, Right.Items)));
    function "and" (Left, Right : Set) return Set renames Intersection;
    procedure Difference (Target : in out Set; Source : Set);
    function Difference (Left, Right : Set) return Set is (Sized (Core.Difference (Left.Items, Right.Items)));
    function "-" (Left, Right : Set) return Set renames Difference;
    procedure Symmetric_Difference (Target : in out Set; Source : Set);
    function Symmetric_Difference (Left, Right : Set) return Set is (Sized (Core.Symmetric_Difference (Left.Items, Right.Items)));
    function "xor" (Left, Right : Set) return Set renames Symmetric_Difference;
    function Overlap (Left, Right : Set) return Boolean is (Core.Overlap (Left.Items, Right.Items));
    function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is (Core.Is_Subset (Subset.Items, Of_Set.Items));
    function First (Container : Set) return Cursor is (Core.First (Container.Items));
    function Next (Position : Cursor) return Cursor is (Core.Next (Position));
    procedure Next (Position : in out Cursor);
    function Next (Container : Set; Position : Cursor) return Cursor is (Core.Next (Container.Items, Position));
    procedure Next (Container : Set; Position : in out Cursor);
    function Find (Container : Set; Item : Element_Type) return Cursor is (Core.Find (Container.Items, Item));
    function Contains (Container : Set; Item : Element_Type) return Boolean is (Core.Contains (Container.Items, Item));
    function Equivalent_Elements (Left, Right : Cursor) return Boolean is (Core.Equivalent_Elements (Left, Right));
    function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean is (Core.Equivalent_Elements (Left, Right));
    function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean is (Core.Equivalent_Elements (Left, Right));
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor));
    function Iterate (Container : Set) return Set_Iterator is (Core.Iterate (Container.Items));
    generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type is <>;
      with function Equivalent_Keys (Left, Right : Key_Type) return Boolean is "=";
    package Generic_Keys is
      package Keys is new Core.Generic_Keys (Key_Type, Key, Hash, Equivalent_Keys);
      function Key (Position : Cursor) return Key_Type renames Keys.Key;
      function Element (Container : Set; Key : Key_Type) return Element_Type is (Keys.Element (Container.Items, Key));
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type);
      procedure Exclude (Container : in out Set; Key : Key_Type);
      procedure Delete (Container : in out Set; Key : Key_Type);
      function Find (Container : Set; Key : Key_Type) return Cursor is (Keys.Find (Container.Items, Key));
      function Contains (Container : Set; Key : Key_Type) return Boolean is (Keys.Contains (Container.Items, Key));
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type));
      subtype Reference_Type is Keys.Reference_Type;
      function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is (Keys.Reference_Preserving_Key (Container.Items, Position));
      function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is (Keys.Constant_Reference (Container.Items, Key));
      function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is (Keys.Reference_Preserving_Key (Container.Items, Key));
    end;
  end;
  generic
    type Element_Type (<>) is private;
    Max_Element_Size_in_Storage_Elements : Count_Type;
    with function "=" (Left, Right : Element_Type) return Boolean is <>;
    Task_Safe : Boolean := False;
  package Bounded_Indefinite_Holders is
    package Core is new Holder_Core (Element_Type, "=", Max_Element_Size_in_Storage_Elements, Task_Safe);
    subtype Holder is Core.Holder;
    Empty_Holder : Holder renames Core.Empty_Holder;
    function "=" (Left, Right : Holder) return Boolean is (Core."=" (Left, Right));
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean renames Core.Tampering_With_The_Element_Prohibited;
    function Empty return Holder renames Core.Empty;
    function To_Holder (New_Item : Element_Type) return Holder renames Core.To_Holder;
    function Is_Empty (Container : Holder) return Boolean renames Core.Is_Empty;
    procedure Clear (Container : in out Holder) renames Core.Clear;
    function Element (Container : Holder) return Element_Type renames Core.Element;
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) renames Core.Replace_Element;
    procedure Query_Element (Container : Holder;
                             Process   : not null access procedure (Element : Element_Type)) renames Core.Query_Element;
    procedure Update_Element (Container : in out Holder;
                              Process   : not null access procedure (Element : in out Element_Type)) renames Core.Update_Element;
    subtype Constant_Reference_Type is Core.Constant_Reference_Type;
    subtype Reference_Type is Core.Reference_Type;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type renames Core.Constant_Reference;
    function Reference (Container : in out Holder) return Reference_Type renames Core.Reference;
    procedure Assign (Target : in out Holder; Source : Holder) renames Core.Assign;
    function Copy (Source : Holder) return Holder renames Core.Copy;
    procedure Move (Target : in out Holder; Source : in out Holder) renames Core.Move;
    procedure Swap (Left, Right : in out Holder) renames Core.Swap;
  end;
private
  type Counter_Hold (Counter : not null access Natural) is new Limited_Controlled with null record;
  procedure Initialize (Hold : in out Counter_Hold);
  procedure Finalize (Hold : in out Counter_Hold);
  type Exclusive_Hold (Lock : Exclusive_Lock_Access) is new Limited_Controlled with null record;
  procedure Initialize (Hold : in out Exclusive_Hold);
  procedure Finalize (Hold : in out Exclusive_Hold);
  type Locked_Counter_Hold (Counter : not null access Natural; Lock : Exclusive_Lock_Access) is new Limited_Controlled with null record;
  procedure Initialize (Hold : in out Locked_Counter_Hold);
  procedure Finalize (Hold : in out Locked_Counter_Hold);
  type Lock_Order is range System.Min_Int .. System.Max_Int;
  function Order is new Unchecked_Conversion (Exclusive_Lock_Access, Lock_Order);
  function Lower (Left, Right : Exclusive_Lock_Access) return Exclusive_Lock_Access is
    (if Left = null or else (Right /= null and then Order (Right) < Order (Left)) then Right else Left);
  function Upper (Left, Right : Exclusive_Lock_Access) return Exclusive_Lock_Access is
    (if Left = null or else Right = null or else Left = Right then null elsif Lower (Left, Right) = Left then Right else Left);
  procedure Free is new Unchecked_Deallocation (Exclusive_Lock, Exclusive_Lock_Access);
end;
with Unchecked_Deallocation;
package body Ada.Containers is
  protected body Exclusive_Lock is
    entry Seize when not Held is
      begin
        Held := True;
      end;
    procedure Release is
      begin
        Held := False;
      end;
  end;
  procedure Initialize (Hold : in out Counter_Hold) is
    begin
      Hold.Counter.all := Hold.Counter.all + 1;
    end;
  procedure Finalize (Hold : in out Counter_Hold) is
    begin
      Hold.Counter.all := Hold.Counter.all - 1;
    end;
  procedure Initialize (Hold : in out Exclusive_Hold) is
    begin
      if Hold.Lock /= null then Hold.Lock.Seize; end if;
    end;
  procedure Finalize (Hold : in out Exclusive_Hold) is
    begin
      if Hold.Lock /= null then Hold.Lock.Release; end if;
    end;
  procedure Initialize (Hold : in out Locked_Counter_Hold) is
    Seized : Exclusive_Hold (Hold.Lock);
    begin
      Hold.Counter.all := Hold.Counter.all + 1;
    end;
  procedure Finalize (Hold : in out Locked_Counter_Hold) is
    Seized : Exclusive_Hold (Hold.Lock);
    begin
      Hold.Counter.all := Hold.Counter.all - 1;
    end;
  procedure Generic_Sort (First, Last : Index_Type'Base) is
    Count : constant Integer := (if Last < First then 0 else Index_Type'Pos (Last) - Index_Type'Pos (First) + 1);
    function At_Position (Position : Integer) return Index_Type is (Index_Type'Val (Index_Type'Pos (First) + Position - 1));
    procedure Sift (Root, Size : Integer) is
      Parent : Integer := Root;
      Child  : Integer;
      begin
        loop
          Child := 2 * Parent;
          exit when Child > Size;
          if Child < Size and then Before (At_Position (Child), At_Position (Child + 1)) then Child := Child + 1; end if;
          exit when not Before (At_Position (Parent), At_Position (Child));
          Swap (At_Position (Parent), At_Position (Child));
          Parent := Child;
        end loop;
      end;
    begin
      for Root in reverse 1 .. Count / 2 loop
        Sift (Root, Count);
      end loop;
      for Size in reverse 2 .. Count loop
        Swap (At_Position (1), At_Position (Size));
        Sift (1, Size - 1);
      end loop;
    end;
  procedure Generic_Array_Sort (Container : in out Array_Type) is
    function Precedes (Left, Right : Index_Type) return Boolean is (Container (Left) < Container (Right));
    procedure Exchange (Left, Right : Index_Type) is
      Held : constant Element_Type := Container (Left);
      begin
        Container (Left) := Container (Right);
        Container (Right) := Held;
      end;
    procedure Sort is new Generic_Sort (Index_Type, Precedes, Exchange);
    begin
      Sort (Container'First, Container'Last);
    end;
  procedure Generic_Constrained_Array_Sort (Container : in out Array_Type) is
    function Precedes (Left, Right : Index_Type) return Boolean is (Container (Left) < Container (Right));
    procedure Exchange (Left, Right : Index_Type) is
      Held : constant Element_Type := Container (Left);
      begin
        Container (Left) := Container (Right);
        Container (Right) := Held;
      end;
    procedure Sort is new Generic_Sort (Index_Type, Precedes, Exchange);
    begin
      Sort (Container'First, Container'Last);
    end;
  package body Direct_Storage is
    procedure Store (Slot : in out Element_Type; Item : Element_Type) is
      begin
        Slot := Item;
      end;
  end;
  package body Indirect_Storage is
    procedure Store (Slot : in out Pointer; Item : Element_Type) is
      begin
        Slot := new Element_Type'(Item);
      end;
    procedure Put (Slot : in out Pointer; Item : Element_Type) is
      Fresh : constant Pointer := new Element_Type'(Item);
      begin
        Free (Slot);
        Slot := Fresh;
      end;
  end;
  package body Balanced_Trees is
    procedure Initialize (Object : in out Hold) is
      begin
        if Object.Counts = null then return; end if;
        if Object.Locking then Object.Counts.Lock := Object.Counts.Lock + 1; else Object.Counts.Busy := Object.Counts.Busy + 1; end if;
      end;
    procedure Finalize (Object : in out Hold) is
      begin
        if Object.Counts = null then return; end if;
        if Object.Locking then Object.Counts.Lock := Object.Counts.Lock - 1; else Object.Counts.Busy := Object.Counts.Busy - 1; end if;
      end;
    procedure Check_Cursors (Counts : Tally_Access) is begin if Cursors_Prohibited (Counts) then raise Program_Error; end if; end;
    procedure Check_Elements (Counts : Tally_Access) is begin if Elements_Prohibited (Counts) then raise Program_Error; end if; end;
    protected body Serials is
      procedure Next (Id : out Natural) is begin Count := Count + 1; Id := Count; end;
    end;
    function Fresh_Serial return Natural is (declare Id : Natural; begin Serials.Next (Id); Id);
    protected body Object_Lock is
      entry Seize when not Held and then Sharers = 0 is begin Held := True; end;
      entry Share when Open or else (not Held and then Seize'Count = 0) is begin Sharers := Sharers + 1; end;
      procedure Admit is begin Open := True; end;
      procedure Release (Shared : Boolean) is
        begin
          if Shared then Sharers := Sharers - 1; else Held := False; Open := False; end if;
        end;
    end;
    procedure Take (Lock : Lock_Access; Mode : Hold_Mode) is
      begin
        if Lock = null then return; end if;
        if Mode = Reading then Lock.Share; else Lock.Seize; end if;
        if Mode = Walking then Lock.Admit; end if;
      end;
    procedure Drop (Lock : Lock_Access; Mode : Hold_Mode) is begin if Lock /= null then Lock.Release (Mode = Reading); end if; end;
    package body Guards is
      procedure Initialize (Object : in out Lock_Hold) is begin if Task_Safe then Take (Object.Lock, Object.Mode); end if; end;
      procedure Finalize (Object : in out Lock_Hold) is begin if Task_Safe then Drop (Object.Lock, Object.Mode); end if; end;
      function Joint (Object : Pair_Hold) return Hold_Mode is (if Object.Mode = Reading then Object.Other_Mode else Object.Mode);
      procedure Initialize (Object : in out Pair_Hold) is
        begin
          if not Task_Safe then return; end if;
          if Object.Lock = Object.Other then
            Take (Object.Lock, Joint (Object));
          elsif Object.Other = null or else (Object.Lock /= null and then Object.Lock.Serial < Object.Other.Serial) then
            Take (Object.Lock, Object.Mode);
            Take (Object.Other, Object.Other_Mode);
          else
            Take (Object.Other, Object.Other_Mode);
            Take (Object.Lock, Object.Mode);
          end if;
        end;
      procedure Finalize (Object : in out Pair_Hold) is
        begin
          if not Task_Safe then return; end if;
          if Object.Lock = Object.Other then
            Drop (Object.Lock, Joint (Object));
          else
            Drop (Object.Other, Object.Other_Mode);
            Drop (Object.Lock, Object.Mode);
          end if;
        end;
    end;
    package body Indefinite is
      procedure Deallocate is new Unchecked_Deallocation (Element_Type, Element_Access);
      procedure Free (Item : in out Element_Access) is begin Deallocate (Item); end;
    end;
    package body Trees is
      procedure Deallocate is new Unchecked_Deallocation (Node_Type, Node_Access);
      procedure Deallocate is new Unchecked_Deallocation (Shared, Shared_Access);
      function Tall (Node : Node_Access) return Integer is (if Node = null then 0 else Node.Height);
      procedure Measure (Node : Node_Access) is begin Node.Height := 1 + Integer'Max (Tall (Node.Left), Tall (Node.Right)); end;
      procedure Replace_Child (Root : in out Node_Access; Above, Old_Child, New_Child : Node_Access) is
        begin
          if Above = null then
            Root := New_Child;
          elsif Above.Left = Old_Child then
            Above.Left := New_Child;
          else
            Above.Right := New_Child;
          end if;
          if New_Child /= null then New_Child.Parent := Above; end if;
        end;
      procedure Rotate (Root : in out Node_Access; Node : Node_Access; Leftward : Boolean) is
        Pivot : constant Node_Access := (if Leftward then Node.Right else Node.Left);
        Inner : constant Node_Access := (if Leftward then Pivot.Left else Pivot.Right);
        begin
          if Leftward then
            Node.Right := Inner;
            Pivot.Left := Node;
          else
            Node.Left := Inner;
            Pivot.Right := Node;
          end if;
          if Inner /= null then Inner.Parent := Node; end if;
          Replace_Child (Root, Node.Parent, Node, Pivot);
          Node.Parent := Pivot;
          Measure (Node);
          Measure (Pivot);
        end;
      procedure Rebalance (Root : in out Node_Access; From : Node_Access) is
        Node    : Node_Access := From;
        Before  : Integer;
        Balance : Integer;
        begin
          while Node /= null loop
            Before := Node.Height;
            Measure (Node);
            Balance := Tall (Node.Left) - Tall (Node.Right);
            exit when Before = Node.Height and then abs Balance <= 1;
            if Balance > 1 then
              if Tall (Node.Left.Left) < Tall (Node.Left.Right) then Rotate (Root, Node.Left, True); end if;
              Rotate (Root, Node, False);
              Node := Node.Parent;
            elsif Balance < -1 then
              if Tall (Node.Right.Right) < Tall (Node.Right.Left) then Rotate (Root, Node.Right, False); end if;
              Rotate (Root, Node, True);
              Node := Node.Parent;
            end if;
            Node := Node.Parent;
          end loop;
        end;
      function Extreme (Node : Node_Access; Leftward : Boolean) return Node_Access is
        Result : Node_Access := Node;
        begin
          if Result = null then return null; end if;
          while (if Leftward then Result.Left else Result.Right) /= null loop
            Result := (if Leftward then Result.Left else Result.Right);
          end loop;
          return Result;
        end;
      function Step (Node : Node_Access; Forward : Boolean) return Node_Access is
        Child : Node_Access := Node;
        Above : Node_Access := (if Forward then Node.Right else Node.Left);
        begin
          if Above /= null then return Extreme (Above, Forward); end if;
          Above := Node.Parent;
          while Above /= null and then (if Forward then Above.Right else Above.Left) = Child loop
            Child := Above;
            Above := Above.Parent;
          end loop;
          return Above;
        end;
      function Clone (Node, Above : Node_Access) return Node_Access is
        Result : Node_Access;
        begin
          if Node = null then return null; end if;
          Result := new Node_Type'(Parent => Above, Height => Node.Height, Item => Copy (Node.Item), others => null);
          Result.Left := Clone (Node.Left, Result);
          Result.Right := Clone (Node.Right, Result);
          return Result;
        end;
      procedure Release (Node : in out Node_Access) is
        begin
          if Node = null then return; end if;
          Release (Node.Left);
          Release (Node.Right);
          Dispose (Node.Item);
          Deallocate (Node);
        end;
      procedure Attach (Root : in out Node_Access; Node, Above : Node_Access; To_Left : Boolean) is
        begin
          Node.Parent := Above;
          if Above = null then
            Root := Node;
          elsif To_Left then
            Above.Left := Node;
          else
            Above.Right := Node;
          end if;
          Rebalance (Root, Above);
        end;
      procedure Detach (Root : in out Node_Access; Node : Node_Access) is
        Heir  : Node_Access;
        Start : Node_Access := Node.Parent;
        begin
          if Node.Left = null or else Node.Right = null then
            Replace_Child (Root, Node.Parent, Node, (if Node.Left = null then Node.Right else Node.Left));
          else
            Heir := Leftmost (Node.Right);
            if Heir.Parent /= Node then
              Start := Heir.Parent;
              Replace_Child (Root, Start, Heir, Heir.Right);
              Heir.Right := Node.Right;
              Node.Right.Parent := Heir;
            else
              Start := Heir;
            end if;
            Heir.Left := Node.Left;
            Node.Left.Parent := Heir;
            Replace_Child (Root, Node.Parent, Node, Heir);
            Heir.Height := Node.Height;
          end if;
          Rebalance (Root, Start);
          Node.all := (Item => Node.Item, others => <>);
        end;
      procedure Ready (Data : in out Shared_Access; Full : Boolean) is
        begin
          if Full then raise Capacity_Error; end if;
          Check_Cursors (Counts (Data));
          if Data = null then Data := new Shared; end if;
        end;
      procedure Insert (Data : Shared_Access; Node, Above : Node_Access; To_Left : Boolean) is
        begin
          Attach (Data.Root, Node, Above, To_Left);
          Data.Length := Data.Length + 1;
        end;
      procedure Remove (Data : Shared_Access; Node : Node_Access) is
        Gone : Node_Access := Node;
        begin
          if Node = null then return; end if;
          Check_Cursors (Counts (Data));
          Detach (Data.Root, Node);
          Data.Length := Data.Length - 1;
          Dispose (Gone.Item);
          Deallocate (Gone);
        end;
      procedure Clear (Data : Shared_Access) is
        begin
          Check_Cursors (Counts (Data));
          if Data = null then return; end if;
          Release (Data.Root);
          Data.Length := 0;
        end;
      procedure Assign (Target : in out Shared_Access; Source : Shared_Access) is
        begin
          Clear (Target);
          if Length (Source) = 0 then return; end if;
          if Target = null then Target := new Shared; end if;
          Target.Root := Clone (Source.Root, null);
          Target.Length := Source.Length;
        end;
      procedure Move (Target, Source : in out Shared_Access) is
        begin
          Check_Cursors (Counts (Source));
          Clear (Target);
          if Length (Source) = 0 then return; end if;
          if Target = null then Target := new Shared; end if;
          Target.Root := Source.Root;
          Target.Length := Source.Length;
          Source.Root := null;
          Source.Length := 0;
        end;
      procedure Initialize (Object : in out Handle) is begin Object.Data := New_Data; end;
      procedure Adjust (Object : in out Handle) is
        Source : constant Shared_Access := Object.Data;
        Held   : Lock_Hold (Lock (Source), Reading);
        begin
          Object.Data := (if Task_Safe or else Length (Source) > 0 then new Shared'(Root => Clone (Root (Source), null), Length => Length (Source), others => <>) else null);
        end;
      procedure Finalize (Object : in out Handle) is
        begin
          if Object.Data = null then return; end if;
          Release (Object.Data.Root);
          if Task_Safe then Free_Lock (Object.Data.Lock); end if;
          Deallocate (Object.Data);
        end;
      package body Search is
        function Find (Root : Node_Access; Key : Key_Type) return Node_Access is
          Node : Node_Access := Root;
          begin
            while Node /= null loop
              if Less (Key, Node) then
                Node := Node.Left;
              elsif Greater (Key, Node) then
                Node := Node.Right;
              else
                return Node;
              end if;
            end loop;
            return null;
          end;
        function Bound (Root : Node_Access; Key : Key_Type; Above : Boolean) return Node_Access is
          Node   : Node_Access := Root;
          Result : Node_Access;
          begin
            while Node /= null loop
              if (if Above then Greater (Key, Node) else Less (Key, Node)) then
                Node := (if Above then Node.Right else Node.Left);
              else
                Result := Node;
                Node := (if Above then Node.Left else Node.Right);
              end if;
            end loop;
            return Result;
          end;
        function Floor (Root : Node_Access; Key : Key_Type) return Node_Access is (Bound (Root, Key, False));
        function Ceiling (Root : Node_Access; Key : Key_Type) return Node_Access is (Bound (Root, Key, True));
        procedure Locate (Root : Node_Access; Key : Key_Type; Node, Above : out Node_Access; To_Left : out Boolean) is
          Spot  : Node_Access := Root;
          Lower : Boolean := False;
          begin
            Above := null;
            while Spot /= null loop
              Above := Spot;
              Lower := Less (Key, Spot);
              exit when not Lower and then not Greater (Key, Spot);
              Spot := (if Lower then Spot.Left else Spot.Right);
            end loop;
            Node := Spot;
            To_Left := Lower;
          end;
      end;
    end;
    package body Tables is
      procedure Deallocate is new Unchecked_Deallocation (Node_Type, Node_Access);
      procedure Deallocate is new Unchecked_Deallocation (Bucket_Array, Bucket_Access);
      procedure Deallocate is new Unchecked_Deallocation (Shared, Shared_Access);
      function First (Data : Shared_Access; From : Hash_Type := 0) return Node_Access is
        begin
          if Length (Data) > 0 then
            for B in From .. Data.Buckets'Last loop
              if Data.Buckets (B) /= null then return Data.Buckets (B); end if;
            end loop;
          end if;
          return null;
        end;
      function Next (Data : Shared_Access; Node : Node_Access) return Node_Access is
        (if Node.Next /= null then Node.Next elsif Slot (Data, Node.Hash) = Data.Buckets'Last then null else First (Data, Slot (Data, Node.Hash) + 1));
      procedure Resize (Data : Shared_Access; Size : Count_Type) is
        Grown : constant Bucket_Access := new Bucket_Array (0 .. Hash_Type (Size) - 1);
        Node  : Node_Access;
        Next  : Node_Access;
        begin
          if Data.Buckets /= null then
            for B in Data.Buckets'Range loop
              Node := Data.Buckets (B);
              while Node /= null loop
                Next := Node.Next;
                Node.Next := Grown (Node.Hash mod Hash_Type (Size));
                Grown (Node.Hash mod Hash_Type (Size)) := Node;
                Node := Next;
              end loop;
            end loop;
            Deallocate (Data.Buckets);
          end if;
          Data.Buckets := Grown;
        end;
      procedure Reserve (Data : in out Shared_Access; Capacity : Count_Type) is
        begin
          if Capacity <= Buckets (Data) then return; end if;
          Ready (Data, False);
          Resize (Data, Capacity);
        end;
      procedure Ready (Data : in out Shared_Access; Full : Boolean) is
        begin
          if Full then raise Capacity_Error; end if;
          Check_Cursors (Counts (Data));
          if Data = null then Data := new Shared; end if;
        end;
      procedure Link (Data : Shared_Access; Node : Node_Access) is
        begin
          if Data.Buckets = null then
            Resize (Data, 31);
          elsif Data.Length >= Data.Buckets'Length then
            Resize (Data, 2 * Data.Buckets'Length + 1);
          end if;
          Node.Next := Data.Buckets (Slot (Data, Node.Hash));
          Data.Buckets (Slot (Data, Node.Hash)) := Node;
          Data.Length := Data.Length + 1;
        end;
      procedure Unlink (Data : Shared_Access; Node : Node_Access) is
        Prior : Node_Access := Data.Buckets (Slot (Data, Node.Hash));
        begin
          if Prior = Node then
            Data.Buckets (Slot (Data, Node.Hash)) := Node.Next;
          else
            while Prior.Next /= Node loop Prior := Prior.Next; end loop;
            Prior.Next := Node.Next;
          end if;
          Node.Next := null;
          Data.Length := Data.Length - 1;
        end;
      procedure Remove (Data : Shared_Access; Node : Node_Access) is
        Gone : Node_Access := Node;
        begin
          if Node = null then return; end if;
          Check_Cursors (Counts (Data));
          Unlink (Data, Node);
          Dispose (Gone.Item);
          Deallocate (Gone);
        end;
      procedure Release (Data : Shared_Access) is
        Node : Node_Access;
        Next : Node_Access;
        begin
          if Data.Buckets = null then return; end if;
          for B in Data.Buckets'Range loop
            Node := Data.Buckets (B);
            while Node /= null loop
              Next := Node.Next;
              Dispose (Node.Item);
              Deallocate (Node);
              Node := Next;
            end loop;
            Data.Buckets (B) := null;
          end loop;
          Data.Length := 0;
        end;
      procedure Clear (Data : Shared_Access) is
        begin
          Check_Cursors (Counts (Data));
          if Data /= null then Release (Data); end if;
        end;
      procedure Clone (Source, Into : Shared_Access) is
        Node : Node_Access;
        begin
          Into.Buckets := new Bucket_Array (Source.Buckets'Range);
          Into.Length := Source.Length;
          for B in Source.Buckets'Range loop
            Node := Source.Buckets (B);
            while Node /= null loop
              Into.Buckets (B) := new Node_Type'(Into.Buckets (B), Node.Hash, Copy (Node.Item));
              Node := Node.Next;
            end loop;
          end loop;
        end;
      procedure Assign (Target : in out Shared_Access; Source : Shared_Access) is
        begin
          Clear (Target);
          if Length (Source) = 0 then return; end if;
          if Target = null then Target := new Shared; end if;
          Deallocate (Target.Buckets);
          Clone (Source, Target);
        end;
      procedure Move (Target, Source : in out Shared_Access) is
        Held : Bucket_Access;
        begin
          Check_Cursors (Counts (Source));
          Clear (Target);
          if Length (Source) = 0 then return; end if;
          if Target = null then Target := new Shared; end if;
          Held := Target.Buckets;
          Target.Buckets := Source.Buckets;
          Target.Length := Source.Length;
          Source.Buckets := Held;
          Source.Length := 0;
        end;
      procedure Initialize (Object : in out Handle) is begin Object.Data := New_Data; end;
      procedure Adjust (Object : in out Handle) is
        Source : constant Shared_Access := Object.Data;
        Held   : Lock_Hold (Lock (Source), Reading);
        begin
          Object.Data := (if Task_Safe or else Length (Source) > 0 then new Shared else null);
          if Length (Source) > 0 then Clone (Source, Object.Data); end if;
        end;
      procedure Finalize (Object : in out Handle) is
        begin
          if Object.Data = null then return; end if;
          Release (Object.Data);
          Deallocate (Object.Data.Buckets);
          if Task_Safe then Free_Lock (Object.Data.Lock); end if;
          Deallocate (Object.Data);
        end;
      package body Search is
        function Find (Data : Shared_Access; Key : Key_Type) return Node_Access is
          Code : constant Hash_Type := Hash (Key);
          Node : Node_Access := (if Length (Data) = 0 then null else Data.Buckets (Slot (Data, Code)));
          begin
            while Node /= null and then not (Node.Hash = Code and then Equivalent (Key, Node)) loop Node := Node.Next; end loop;
            return Node;
          end;
      end;
    end;
    package body Maps is
      function Data (Container : Map) return Shared_Access is (Container.Guard.Data);
      function Root (Container : Map) return Node_Access is (Root (Data (Container)));
      function Lock (Container : Map) return Lock_Access is (Lock (Data (Container)));
      function Lock (Position : Cursor) return Lock_Access is (Lock (Position.Data));
      function Key_Of (Node : Node_Access) return Keys.Element_Access is (Keys.Pointer (Node.Item.Key'Access));
      function Element_Of (Node : Node_Access) return Elements.Element_Access is (Elements.Pointer (Node.Item.Element'Access));
      function Less (Key : Key_Type; Node : Node_Access) return Boolean is (Key < Key_Of (Node).all);
      function Greater (Key : Key_Type; Node : Node_Access) return Boolean is (Key_Of (Node).all < Key);
      package Search is new Tree.Search (Key_Type, Less, Greater);
      procedure Dispose (Item : in out Item_Type) is
        begin
          Keys.Free (Item.Key);
          Elements.Free (Item.Element);
        end;
      function Checked (Position : Cursor) return Node_Access is (if Position.Node = null then raise Constraint_Error else Position.Node);
      function Checked (Container : Map; Position : Cursor) return Node_Access is
        (if Position.Node = null then raise Constraint_Error elsif Position.Data /= Data (Container) then raise Program_Error else Position.Node);
      function Found (Container : Map; Key : Key_Type) return Node_Access is
        (declare Node : constant Node_Access := Search.Find (Root (Container), Key); begin (if Node = null then raise Constraint_Error else Node));
      function Edge (Container : Map; Leftward : Boolean) return Node_Access is
        (declare Node : constant Node_Access := Extreme (Root (Container), Leftward); begin (if Node = null then raise Constraint_Error else Node));
      function Make (Data : Shared_Access; Node : Node_Access) return Cursor is (if Node = null then No_Element else (Data, Node));
      procedure Put (Node : Node_Access; New_Item : Element_Type) is
        Fresh : constant Elements.Stored := Elements.Store (New_Item);
        begin
          Elements.Free (Node.Item.Element);
          Node.Item.Element := Fresh;
        end;
      procedure Put (Node : Node_Access; Key : Key_Type; New_Item : Element_Type) is
        Fresh : constant Keys.Stored := Keys.Store (Key);
        begin
          Keys.Free (Node.Item.Key);
          Node.Item.Key := Fresh;
          Put (Node, New_Item);
        end;
      function Has_Element (Position : Cursor) return Boolean is (Position.Node /= null);
      function Has_Element (Container : Map; Position : Cursor) return Boolean is (Position.Node /= null and then Position.Data = Data (Container));
      function "=" (Left, Right : Map) return Boolean is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        L    : Node_Access := Leftmost (Root (Left));
        R    : Node_Access := Leftmost (Root (Right));
        begin
          if Length (Data (Left)) /= Length (Data (Right)) then return False; end if;
          while L /= null loop
            if not Equivalent_Keys (Key_Of (L).all, Key_Of (R).all) or else not (Element_Of (L).all = Element_Of (R).all) then return False; end if;
            L := Next (L);
            R := Next (R);
          end loop;
          return True;
        end;
      function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is (Cursors_Prohibited (Counts (Data (Container))));
      function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is (Elements_Prohibited (Counts (Data (Container))));
      function Empty (Capacity : Count_Type) return Map is ((Capacity => Capacity, Guard => (Data => New_Data)));
      function Length (Container : Map) return Count_Type is (declare Held : Lock_Hold (Lock (Container), Reading); begin Length (Data (Container)));
      procedure Clear (Container : in out Map) is Held : Lock_Hold (Lock (Container), Writing); begin Clear (Data (Container)); end;
      function Key (Position : Cursor) return Key_Type is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin Keys.Fetch (Checked (Position).Item.Key'Access));
      function Key (Container : Map; Position : Cursor) return Key_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Keys.Fetch (Checked (Container, Position).Item.Key'Access));
      function Element (Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin Elements.Fetch (Checked (Position).Item.Element'Access));
      function Element (Container : Map; Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Checked (Container, Position).Item.Element'Access));
      procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Checked (Container, Position);
        begin
          Check_Elements (Counts (Data (Container)));
          Put (Node, New_Item);
        end;
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) is
        Held : Lock_Hold (Lock (Position), Walking);
        Node : constant Node_Access := Checked (Position);
        Busy : Hold (Counts (Position.Data), True);
        begin
          Process (Key_Of (Node).all, Element_Of (Node).all);
        end;
      procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Checked (Container, Position);
        Busy : Hold (Counts (Position.Data), True);
        begin
          Process (Key_Of (Node).all, Element_Of (Node).all);
        end;
      function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      Held : Lock_Hold (Lock (Container), Reading);
      begin
        return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
      end;
      function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      Held : Lock_Hold (Lock (Container), Writing);
      begin
        return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
      end;
      function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      Held : Lock_Hold (Lock (Container), Reading);
      begin
        return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
      end;
      function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      Held : Lock_Hold (Lock (Container), Writing);
      begin
        return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
      end;
      procedure Fill (Target : in out Map; Source : Map) is
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Capacity then raise Capacity_Error; end if;
          Assign (Target.Guard.Data, Data (Source));
        end;
      procedure Assign (Target : in out Map; Source : Map) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Fill (Target, Source); end;
      function Copy (Source : Map; Capacity : Count_Type) return Map is
        Result : Map (Capacity);
        begin
          Assign (Result, Source);
          return Result;
        end;
      procedure Move (Target : in out Map; Source : in out Map) is
        Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Writing);
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Capacity then raise Capacity_Error; end if;
          Move (Target.Guard.Data, Source.Guard.Data);
        end;
      procedure Add (Container : in out Map; Key : Key_Type; Node : out Node_Access; Inserted : out Boolean) is
        Spot  : Node_Access;
        Above : Node_Access;
        Left  : Boolean;
        begin
          Search.Locate (Root (Container), Key, Spot, Above, Left);
          Inserted := Spot = null;
          if Spot = null then
            Ready (Container.Guard.Data, Length (Data (Container)) >= Container.Capacity);
            Spot := new Node_Type'(Item => (Key => Keys.Store (Key), Element => <>), others => <>);
            Insert (Data (Container), Spot, Above, Left);
          end if;
          Node := Spot;
        end;
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) is
        Held  : Lock_Hold (Lock (Container), Writing);
        Node  : Node_Access;
        Added : Boolean;
        begin
          Add (Container, Key, Node, Added);
          if Added then Node.Item.Element := Elements.Store (New_Item); end if;
          Position := (Data (Container), Node);
          Inserted := Added;
        end;
      procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : Node_Access;
        begin
          Add (Container, Key, Node, Inserted);
          Position := (Data (Container), Node);
        end;
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is
        Position : Cursor;
        Inserted : Boolean;
        begin
          Insert (Container, Key, New_Item, Position, Inserted);
          if not Inserted then raise Constraint_Error; end if;
        end;
      procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is
        Held  : Lock_Hold (Lock (Container), Writing);
        Node  : Node_Access;
        Added : Boolean;
        begin
          Add (Container, Key, Node, Added);
          if Added then
            Node.Item.Element := Elements.Store (New_Item);
          else
            Check_Elements (Counts (Data (Container)));
            Put (Node, Key, New_Item);
          end if;
        end;
      procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Found (Container, Key);
        begin
          Check_Elements (Counts (Data (Container)));
          Put (Node, Key, New_Item);
        end;
      procedure Exclude (Container : in out Map; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Search.Find (Root (Container), Key)); end;
      procedure Delete (Container : in out Map; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Found (Container, Key)); end;
      procedure Delete (Container : in out Map; Position : in out Cursor) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          Remove (Data (Container), Checked (Container, Position));
          Position := No_Element;
        end;
      procedure Delete_First (Container : in out Map) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Leftmost (Root (Container))); end;
      procedure Delete_Last (Container : in out Map) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Rightmost (Root (Container))); end;
      function First (Container : Map) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Leftmost (Root (Container))));
      function First_Element (Container : Map) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Edge (Container, True).Item.Element'Access));
      function First_Key (Container : Map) return Key_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Keys.Fetch (Edge (Container, True).Item.Key'Access));
      function Last (Container : Map) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Rightmost (Root (Container))));
      function Last_Element (Container : Map) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Edge (Container, False).Item.Element'Access));
      function Last_Key (Container : Map) return Key_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Keys.Fetch (Edge (Container, False).Item.Key'Access));
      function Next (Position : Cursor) return Cursor is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin (if Position.Node = null then No_Element else Make (Position.Data, Next (Position.Node))));
      procedure Next (Position : in out Cursor) is begin Position := Next (Position); end;
      function Next (Container : Map; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Data (Container) then raise Program_Error else Next (Position));
      procedure Next (Container : Map; Position : in out Cursor) is begin Position := Next (Container, Position); end;
      function Previous (Position : Cursor) return Cursor is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin (if Position.Node = null then No_Element else Make (Position.Data, Previous (Position.Node))));
      procedure Previous (Position : in out Cursor) is begin Position := Previous (Position); end;
      function Previous (Container : Map; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Data (Container) then raise Program_Error else Previous (Position));
      procedure Previous (Container : Map; Position : in out Cursor) is begin Position := Previous (Container, Position); end;
      function Find (Container : Map; Key : Key_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Find (Root (Container), Key)));
      function Element (Container : Map; Key : Key_Type) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Found (Container, Key).Item.Element'Access));
      function Floor (Container : Map; Key : Key_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Floor (Root (Container), Key)));
      function Ceiling (Container : Map; Key : Key_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Ceiling (Root (Container), Key)));
      function Contains (Container : Map; Key : Key_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Search.Find (Root (Container), Key) /= null);
      function "<" (Left, Right : Cursor) return Boolean is
        (declare Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading); begin Key_Of (Checked (Left)).all < Key_Of (Checked (Right)).all);
      function ">" (Left, Right : Cursor) return Boolean is
        (declare Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading); begin Key_Of (Checked (Right)).all < Key_Of (Checked (Left)).all);
      function "<" (Left : Cursor; Right : Key_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Left), Reading); begin Key_Of (Checked (Left)).all < Right);
      function ">" (Left : Cursor; Right : Key_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Left), Reading); begin Right < Key_Of (Checked (Left)).all);
      function "<" (Left : Key_Type; Right : Cursor) return Boolean is
        (declare Held : Lock_Hold (Lock (Right), Reading); begin Left < Key_Of (Checked (Right)).all);
      function ">" (Left : Key_Type; Right : Cursor) return Boolean is
        (declare Held : Lock_Hold (Lock (Right), Reading); begin Key_Of (Checked (Right)).all < Left);
      procedure Walk (Container : Map; Process : not null access procedure (Position : Cursor); Forward : Boolean) is
        Held : Lock_Hold (Lock (Container), Walking);
        Busy : Hold (Counts (Data (Container)), False);
        Node : Node_Access := Extreme (Root (Container), Forward);
        begin
          while Node /= null loop
            Process ((Data (Container), Node));
            Node := Step (Node, Forward);
          end loop;
        end;
      procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is begin Walk (Container, Process, True); end;
      procedure Reverse_Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is begin Walk (Container, Process, False); end;
      function Iterate (Container : Map) return Map_Iterator is ((Data => Data (Container), Start => null));
      function Iterate (Container : Map; Start : Cursor) return Map_Iterator is ((Data => Data (Container), Start => Checked (Container, Start)));
      function First (Object : Map_Iterator) return Cursor is
        (declare Held : Lock_Hold (Lock (Object.Data), Reading);
         begin (if Object.Start /= null then (Object.Data, Object.Start) else Make (Object.Data, Leftmost (Root (Object.Data)))));
      function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Next (Position));
      function Last (Object : Map_Iterator) return Cursor is
        (declare Held : Lock_Hold (Lock (Object.Data), Reading);
         begin (if Object.Start /= null then (Object.Data, Object.Start) else Make (Object.Data, Rightmost (Root (Object.Data)))));
      function Previous (Object : Map_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Previous (Position));
    end;
    package body Sets is
      function Data (Container : Set) return Shared_Access is (Container.Guard.Data);
      function Root (Container : Set) return Node_Access is (Root (Data (Container)));
      function Lock (Container : Set) return Lock_Access is (Lock (Data (Container)));
      function Lock (Position : Cursor) return Lock_Access is (Lock (Position.Data));
      function Element_Of (Node : Node_Access) return Elements.Element_Access is (Elements.Pointer (Node.Item'Access));
      function Less (Item : Element_Type; Node : Node_Access) return Boolean is (Item < Element_Of (Node).all);
      function Greater (Item : Element_Type; Node : Node_Access) return Boolean is (Element_Of (Node).all < Item);
      package Search is new Tree.Search (Element_Type, Less, Greater);
      function Checked (Position : Cursor) return Node_Access is (if Position.Node = null then raise Constraint_Error else Position.Node);
      function Checked (Container : Set; Position : Cursor) return Node_Access is
        (if Position.Node = null then raise Constraint_Error elsif Position.Data /= Data (Container) then raise Program_Error else Position.Node);
      function Found (Container : Set; Item : Element_Type) return Node_Access is
        (declare Node : constant Node_Access := Search.Find (Root (Container), Item); begin (if Node = null then raise Constraint_Error else Node));
      function Edge (Container : Set; Leftward : Boolean) return Node_Access is
        (declare Node : constant Node_Access := Extreme (Root (Container), Leftward); begin (if Node = null then raise Constraint_Error else Node));
      function Make (Data : Shared_Access; Node : Node_Access) return Cursor is (if Node = null then No_Element else (Data, Node));
      procedure Put (Node : Node_Access; New_Item : Element_Type) is
        Fresh : constant Elements.Stored := Elements.Store (New_Item);
        begin
          Elements.Free (Node.Item);
          Node.Item := Fresh;
        end;
      function Has_Element (Position : Cursor) return Boolean is (Position.Node /= null);
      function Has_Element (Container : Set; Position : Cursor) return Boolean is (Position.Node /= null and then Position.Data = Data (Container));
      function Matches (Left, Right : Set; Strict : Boolean) return Boolean is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        L    : Node_Access := Leftmost (Root (Left));
        R    : Node_Access := Leftmost (Root (Right));
        begin
          if Length (Data (Left)) /= Length (Data (Right)) then return False; end if;
          while L /= null loop
            if (if Strict then not (Element_Of (L).all = Element_Of (R).all) else not Equivalent_Elements (Element_Of (L).all, Element_Of (R).all)) then return False; end if;
            L := Next (L);
            R := Next (R);
          end loop;
          return True;
        end;
      function "=" (Left, Right : Set) return Boolean is (Matches (Left, Right, True));
      function Equivalent_Sets (Left, Right : Set) return Boolean is (Matches (Left, Right, False));
      function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is (Cursors_Prohibited (Counts (Data (Container))));
      function Empty (Capacity : Count_Type) return Set is ((Capacity => Capacity, Guard => (Data => New_Data)));
      function To_Set (New_Item : Element_Type; Capacity : Count_Type) return Set is
        Result : Set (Capacity);
        begin
          Insert (Result, New_Item);
          return Result;
        end;
      function Length (Container : Set) return Count_Type is (declare Held : Lock_Hold (Lock (Container), Reading); begin Length (Data (Container)));
      procedure Clear (Container : in out Set) is Held : Lock_Hold (Lock (Container), Writing); begin Clear (Data (Container)); end;
      function Element (Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin Elements.Fetch (Checked (Position).Item'Access));
      function Element (Container : Set; Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Checked (Container, Position).Item'Access));
      procedure Relink (Container : in out Set; Node : Node_Access; New_Item : Element_Type) is
        Found : Node_Access := Search.Find (Root (Container), New_Item);
        Above : Node_Access;
        Left  : Boolean;
        begin
          if Found = Node then
            Check_Elements (Counts (Data (Container)));
            Put (Node, New_Item);
          elsif Found /= null then
            raise Program_Error;
          else
            Check_Cursors (Counts (Data (Container)));
            Detach (Data (Container).Root, Node);
            Put (Node, New_Item);
            Search.Locate (Root (Container), New_Item, Found, Above, Left);
            Attach (Data (Container).Root, Node, Above, Left);
          end if;
        end;
      procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          Relink (Container, Checked (Container, Position), New_Item);
        end;
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) is
        Held : Lock_Hold (Lock (Position), Walking);
        Node : constant Node_Access := Checked (Position);
        Busy : Hold (Counts (Position.Data), True);
        begin
          Process (Element_Of (Node).all);
        end;
      function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      Held : Lock_Hold (Lock (Container), Reading);
      begin
        return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
      end;
      procedure Fill (Target : in out Set; Source : Set) is
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Capacity then raise Capacity_Error; end if;
          Assign (Target.Guard.Data, Data (Source));
        end;
      procedure Assign (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Fill (Target, Source); end;
      function Copy (Source : Set; Capacity : Count_Type) return Set is
        Result : Set (Capacity);
        begin
          Assign (Result, Source);
          return Result;
        end;
      procedure Move (Target : in out Set; Source : in out Set) is
        Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Writing);
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Capacity then raise Capacity_Error; end if;
          Move (Target.Guard.Data, Source.Guard.Data);
        end;
      procedure Add (Container : in out Set; New_Item : Element_Type; Node : out Node_Access; Inserted : out Boolean) is
        Spot  : Node_Access;
        Above : Node_Access;
        Left  : Boolean;
        begin
          Search.Locate (Root (Container), New_Item, Spot, Above, Left);
          Inserted := Spot = null;
          if Spot = null then
            Ready (Container.Guard.Data, Length (Data (Container)) >= Container.Capacity);
            Spot := new Node_Type'(Item => Elements.Store (New_Item), others => <>);
            Insert (Data (Container), Spot, Above, Left);
          end if;
          Node := Spot;
        end;
      procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : Node_Access;
        begin
          Add (Container, New_Item, Node, Inserted);
          Position := (Data (Container), Node);
        end;
      procedure Insert (Container : in out Set; New_Item : Element_Type) is
        Position : Cursor;
        Inserted : Boolean;
        begin
          Insert (Container, New_Item, Position, Inserted);
          if not Inserted then raise Constraint_Error; end if;
        end;
      procedure Include (Container : in out Set; New_Item : Element_Type) is
        Held  : Lock_Hold (Lock (Container), Writing);
        Node  : Node_Access;
        Added : Boolean;
        begin
          Add (Container, New_Item, Node, Added);
          if Added then return; end if;
          Check_Elements (Counts (Data (Container)));
          Put (Node, New_Item);
        end;
      procedure Replace (Container : in out Set; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Found (Container, New_Item);
        begin
          Check_Elements (Counts (Data (Container)));
          Put (Node, New_Item);
        end;
      procedure Exclude (Container : in out Set; Item : Element_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Search.Find (Root (Container), Item)); end;
      procedure Delete (Container : in out Set; Item : Element_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Found (Container, Item)); end;
      procedure Delete (Container : in out Set; Position : in out Cursor) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          Remove (Data (Container), Checked (Container, Position));
          Position := No_Element;
        end;
      procedure Delete_First (Container : in out Set) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Leftmost (Root (Container))); end;
      procedure Delete_Last (Container : in out Set) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Rightmost (Root (Container))); end;
      procedure Join (Target : in out Set; Source : Set) is
        Node  : Node_Access := Leftmost (Root (Source));
        Spot  : Node_Access;
        Added : Boolean;
        begin
          if Data (Target) = Data (Source) then return; end if;
          while Node /= null loop
            Add (Target, Element_Of (Node).all, Spot, Added);
            Node := Next (Node);
          end loop;
        end;
      procedure Meet (Target : in out Set; Source : Set) is
        Node : Node_Access := Leftmost (Root (Target));
        Gone : Node_Access;
        begin
          if Data (Target) = Data (Source) then return; end if;
          while Node /= null loop
            Gone := Node;
            Node := Next (Node);
            if Search.Find (Root (Source), Element_Of (Gone).all) = null then Remove (Data (Target), Gone); end if;
          end loop;
        end;
      procedure Except (Target : in out Set; Source : Set) is
        Node : Node_Access := Leftmost (Root (Source));
        begin
          if Data (Target) = Data (Source) then Clear (Data (Target)); return; end if;
          while Node /= null loop
            Remove (Data (Target), Search.Find (Root (Target), Element_Of (Node).all));
            Node := Next (Node);
          end loop;
        end;
      procedure Toggle (Target : in out Set; Source : Set) is
        Node  : Node_Access := Leftmost (Root (Source));
        Found : Node_Access;
        Added : Boolean;
        begin
          if Data (Target) = Data (Source) then Clear (Data (Target)); return; end if;
          while Node /= null loop
            Found := Search.Find (Root (Target), Element_Of (Node).all);
            if Found /= null then Remove (Data (Target), Found); else Add (Target, Element_Of (Node).all, Found, Added); end if;
            Node := Next (Node);
          end loop;
        end;
      procedure Union (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Join (Target, Source); end;
      procedure Intersection (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Meet (Target, Source); end;
      procedure Difference (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Except (Target, Source); end;
      procedure Symmetric_Difference (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Toggle (Target, Source); end;
      function Fitted (Source : in out Set; Capacity : Count_Type) return Set is
        Result : Set (if Capacity = Count_Type'Last then Capacity else Length (Data (Source)));
        begin
          Move (Result, Source);
          return Result;
        end;
      function Combined (Left, Right : Set; Combine : access procedure (Target : in out Set; Source : Set)) return Set is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        Work : Set (Count_Type'Last);
        begin
          Fill (Work, Left);
          Combine (Work, Right);
          return Fitted (Work, Left.Capacity);
        end;
      function Union (Left, Right : Set) return Set is (Combined (Left, Right, Join'Access));
      function Intersection (Left, Right : Set) return Set is (Combined (Left, Right, Meet'Access));
      function Difference (Left, Right : Set) return Set is (Combined (Left, Right, Except'Access));
      function Symmetric_Difference (Left, Right : Set) return Set is (Combined (Left, Right, Toggle'Access));
      function Scan (Left, Right : Set; Any : Boolean) return Boolean is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        Node : Node_Access := Leftmost (Root (Left));
        begin
          while Node /= null loop
            if (Search.Find (Root (Right), Element_Of (Node).all) /= null) = Any then return Any; end if;
            Node := Next (Node);
          end loop;
          return not Any;
        end;
      function Overlap (Left, Right : Set) return Boolean is (Scan (Left, Right, True));
      function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is (Scan (Subset, Of_Set, False));
      function First (Container : Set) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Leftmost (Root (Container))));
      function First_Element (Container : Set) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Edge (Container, True).Item'Access));
      function Last (Container : Set) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Rightmost (Root (Container))));
      function Last_Element (Container : Set) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Edge (Container, False).Item'Access));
      function Next (Position : Cursor) return Cursor is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin (if Position.Node = null then No_Element else Make (Position.Data, Next (Position.Node))));
      procedure Next (Position : in out Cursor) is begin Position := Next (Position); end;
      function Next (Container : Set; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Data (Container) then raise Program_Error else Next (Position));
      procedure Next (Container : Set; Position : in out Cursor) is begin Position := Next (Container, Position); end;
      function Previous (Position : Cursor) return Cursor is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin (if Position.Node = null then No_Element else Make (Position.Data, Previous (Position.Node))));
      procedure Previous (Position : in out Cursor) is begin Position := Previous (Position); end;
      function Previous (Container : Set; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Data (Container) then raise Program_Error else Previous (Position));
      procedure Previous (Container : Set; Position : in out Cursor) is begin Position := Previous (Container, Position); end;
      function Find (Container : Set; Item : Element_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Find (Root (Container), Item)));
      function Floor (Container : Set; Item : Element_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Floor (Root (Container), Item)));
      function Ceiling (Container : Set; Item : Element_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Ceiling (Root (Container), Item)));
      function Contains (Container : Set; Item : Element_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Search.Find (Root (Container), Item) /= null);
      function "<" (Left, Right : Cursor) return Boolean is
        (declare Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading); begin Element_Of (Checked (Left)).all < Element_Of (Checked (Right)).all);
      function ">" (Left, Right : Cursor) return Boolean is
        (declare Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading); begin Element_Of (Checked (Right)).all < Element_Of (Checked (Left)).all);
      function "<" (Left : Cursor; Right : Element_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Left), Reading); begin Element_Of (Checked (Left)).all < Right);
      function ">" (Left : Cursor; Right : Element_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Left), Reading); begin Right < Element_Of (Checked (Left)).all);
      function "<" (Left : Element_Type; Right : Cursor) return Boolean is
        (declare Held : Lock_Hold (Lock (Right), Reading); begin Left < Element_Of (Checked (Right)).all);
      function ">" (Left : Element_Type; Right : Cursor) return Boolean is
        (declare Held : Lock_Hold (Lock (Right), Reading); begin Element_Of (Checked (Right)).all < Left);
      procedure Walk (Container : Set; Process : not null access procedure (Position : Cursor); Forward : Boolean) is
        Held : Lock_Hold (Lock (Container), Walking);
        Busy : Hold (Counts (Data (Container)), False);
        Node : Node_Access := Extreme (Root (Container), Forward);
        begin
          while Node /= null loop
            Process ((Data (Container), Node));
            Node := Step (Node, Forward);
          end loop;
        end;
      procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is begin Walk (Container, Process, True); end;
      procedure Reverse_Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is begin Walk (Container, Process, False); end;
      function Iterate (Container : Set) return Set_Iterator is ((Data => Data (Container), Start => null));
      function Iterate (Container : Set; Start : Cursor) return Set_Iterator is ((Data => Data (Container), Start => Checked (Container, Start)));
      function First (Object : Set_Iterator) return Cursor is
        (declare Held : Lock_Hold (Lock (Object.Data), Reading);
         begin (if Object.Start /= null then (Object.Data, Object.Start) else Make (Object.Data, Leftmost (Root (Object.Data)))));
      function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Next (Position));
      function Last (Object : Set_Iterator) return Cursor is
        (declare Held : Lock_Hold (Lock (Object.Data), Reading);
         begin (if Object.Start /= null then (Object.Data, Object.Start) else Make (Object.Data, Rightmost (Root (Object.Data)))));
      function Previous (Object : Set_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Previous (Position));
      package body Generic_Keys is
        function Less (Key : Key_Type; Node : Node_Access) return Boolean is (Key < Generic_Keys.Key (Element_Of (Node).all));
        function Greater (Key : Key_Type; Node : Node_Access) return Boolean is (Generic_Keys.Key (Element_Of (Node).all) < Key);
        package Search is new Tree.Search (Key_Type, Less, Greater);
        function Found (Container : Set; Key : Key_Type) return Node_Access is
          (declare Node : constant Node_Access := Search.Find (Root (Container), Key); begin (if Node = null then raise Constraint_Error else Node));
        function Key (Position : Cursor) return Key_Type is
          (declare Held : Lock_Hold (Lock (Position), Reading); begin Key (Element_Of (Checked (Position)).all));
        function Element (Container : Set; Key : Key_Type) return Element_Type is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Found (Container, Key).Item'Access));
        procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
          Held : Lock_Hold (Lock (Container), Writing);
          begin
            Relink (Container, Found (Container, Key), New_Item);
          end;
        procedure Exclude (Container : in out Set; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Search.Find (Root (Container), Key)); end;
        procedure Delete (Container : in out Set; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Found (Container, Key)); end;
        function Find (Container : Set; Key : Key_Type) return Cursor is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Find (Root (Container), Key)));
        function Floor (Container : Set; Key : Key_Type) return Cursor is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Floor (Root (Container), Key)));
        function Ceiling (Container : Set; Key : Key_Type) return Cursor is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Ceiling (Root (Container), Key)));
        function Contains (Container : Set; Key : Key_Type) return Boolean is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Search.Find (Root (Container), Key) /= null);
        procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) is
          Held   : Lock_Hold (Lock (Container), Writing);
          Node   : constant Node_Access := Checked (Container, Position);
          Before : constant Key_Type := Key (Element_Of (Node).all);
          begin
            declare
              Busy : Hold (Counts (Data (Container)), True);
              begin
                Process (Element_Of (Node).all);
              end;
            if Equivalent_Keys (Before, Key (Element_Of (Node).all)) then return; end if;
            Remove (Data (Container), Node);
            raise Program_Error;
          end;
        function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
        end;
        function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        Held : Lock_Hold (Lock (Container), Reading);
        begin
          return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
        end;
        function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
        end;
      end;
    end;
    package body Hashed_Maps is
      function Data (Container : Map) return Shared_Access is (Container.Guard.Data);
      function Lock (Container : Map) return Lock_Access is (Lock (Data (Container)));
      function Lock (Position : Cursor) return Lock_Access is (Lock (Position.Data));
      function Key_Of (Node : Node_Access) return Keys.Element_Access is (Keys.Pointer (Node.Item.Key'Access));
      function Element_Of (Node : Node_Access) return Elements.Element_Access is (Elements.Pointer (Node.Item.Element'Access));
      function Equivalent (Key : Key_Type; Node : Node_Access) return Boolean is (Equivalent_Keys (Key_Of (Node).all, Key));
      package Search is new Table.Search (Key_Type, Hash, Equivalent);
      procedure Dispose (Item : in out Item_Type) is
        begin
          Keys.Free (Item.Key);
          Elements.Free (Item.Element);
        end;
      function Checked (Position : Cursor) return Node_Access is (if Position.Node = null then raise Constraint_Error else Position.Node);
      function Checked (Container : Map; Position : Cursor) return Node_Access is
        (if Position.Node = null then raise Constraint_Error elsif Position.Data /= Data (Container) then raise Program_Error else Position.Node);
      function Found (Container : Map; Key : Key_Type) return Node_Access is
        (declare Node : constant Node_Access := Search.Find (Data (Container), Key); begin (if Node = null then raise Constraint_Error else Node));
      function Make (Data : Shared_Access; Node : Node_Access) return Cursor is (if Node = null then No_Element else (Data, Node));
      procedure Put (Node : Node_Access; New_Item : Element_Type) is
        Fresh : constant Elements.Stored := Elements.Store (New_Item);
        begin
          Elements.Free (Node.Item.Element);
          Node.Item.Element := Fresh;
        end;
      procedure Put (Node : Node_Access; Key : Key_Type; New_Item : Element_Type) is
        Fresh : constant Keys.Stored := Keys.Store (Key);
        begin
          Keys.Free (Node.Item.Key);
          Node.Item.Key := Fresh;
          Put (Node, New_Item);
        end;
      function Has_Element (Position : Cursor) return Boolean is (Position.Node /= null);
      function Has_Element (Container : Map; Position : Cursor) return Boolean is (Position.Node /= null and then Position.Data = Data (Container));
      function Matches (Right : Map; Node : Node_Access) return Boolean is
        (declare Found : constant Node_Access := Search.Find (Data (Right), Key_Of (Node).all); begin Found /= null and then Element_Of (Found).all = Element_Of (Node).all);
      function "=" (Left, Right : Map) return Boolean is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        Node : Node_Access := First (Data (Left));
        begin
          if Length (Data (Left)) /= Length (Data (Right)) then return False; end if;
          while Node /= null loop
            if not Matches (Right, Node) then return False; end if;
            Node := Next (Data (Left), Node);
          end loop;
          return True;
        end;
      function Tampering_With_Cursors_Prohibited (Container : Map) return Boolean is (Cursors_Prohibited (Counts (Data (Container))));
      function Tampering_With_Elements_Prohibited (Container : Map) return Boolean is (Elements_Prohibited (Counts (Data (Container))));
      function Empty (Capacity : Count_Type := 10; Limit : Count_Type := Count_Type'Last) return Map is
        Result : Map (Limit);
        begin
          Reserve (Result.Guard.Data, Capacity);
          return Result;
        end;
      function Capacity (Container : Map) return Count_Type is (declare Held : Lock_Hold (Lock (Container), Reading); begin Buckets (Data (Container)));
      procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          if Capacity > Container.Limit then raise Capacity_Error; end if;
          Reserve (Container.Guard.Data, Capacity);
        end;
      function Length (Container : Map) return Count_Type is (declare Held : Lock_Hold (Lock (Container), Reading); begin Length (Data (Container)));
      procedure Clear (Container : in out Map) is Held : Lock_Hold (Lock (Container), Writing); begin Clear (Data (Container)); end;
      function Key (Position : Cursor) return Key_Type is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin Keys.Fetch (Checked (Position).Item.Key'Access));
      function Key (Container : Map; Position : Cursor) return Key_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Keys.Fetch (Checked (Container, Position).Item.Key'Access));
      function Element (Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin Elements.Fetch (Checked (Position).Item.Element'Access));
      function Element (Container : Map; Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Checked (Container, Position).Item.Element'Access));
      procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Checked (Container, Position);
        begin
          Check_Elements (Counts (Data (Container)));
          Put (Node, New_Item);
        end;
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) is
        Held : Lock_Hold (Lock (Position), Walking);
        Node : constant Node_Access := Checked (Position);
        Busy : Hold (Counts (Position.Data), True);
        begin
          Process (Key_Of (Node).all, Element_Of (Node).all);
        end;
      procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Checked (Container, Position);
        Busy : Hold (Counts (Position.Data), True);
        begin
          Process (Key_Of (Node).all, Element_Of (Node).all);
        end;
      function Constant_Reference (Container : Map; Position : Cursor) return Constant_Reference_Type is
      Held : Lock_Hold (Lock (Container), Reading);
      begin
        return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
      end;
      function Reference (Container : in out Map; Position : Cursor) return Reference_Type is
      Held : Lock_Hold (Lock (Container), Writing);
      begin
        return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
      end;
      function Constant_Reference (Container : Map; Key : Key_Type) return Constant_Reference_Type is
      Held : Lock_Hold (Lock (Container), Reading);
      begin
        return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
      end;
      function Reference (Container : in out Map; Key : Key_Type) return Reference_Type is
      Held : Lock_Hold (Lock (Container), Writing);
      begin
        return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
      end;
      procedure Fill (Target : in out Map; Source : Map) is
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Limit then raise Capacity_Error; end if;
          Assign (Target.Guard.Data, Data (Source));
        end;
      procedure Assign (Target : in out Map; Source : Map) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Fill (Target, Source); end;
      function Copy (Source : Map; Capacity : Count_Type := 0; Limit : Count_Type := Count_Type'Last) return Map is
        Result : Map (Limit);
        begin
          if Capacity /= 0 and then Capacity < Length (Source) then raise Capacity_Error; end if;
          Assign (Result, Source);
          Reserve (Result.Guard.Data, Capacity);
          return Result;
        end;
      procedure Move (Target : in out Map; Source : in out Map) is
        Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Writing);
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Limit then raise Capacity_Error; end if;
          Move (Target.Guard.Data, Source.Guard.Data);
        end;
      procedure Add (Container : in out Map; Key : Key_Type; Node : out Node_Access; Inserted : out Boolean) is
        Spot  : Node_Access := Search.Find (Data (Container), Key);
        Added : constant Boolean := Spot = null;
        begin
          if Added then
            Ready (Container.Guard.Data, Length (Data (Container)) >= Container.Limit);
            Spot := new Node_Type'(null, Hash (Key), (Key => Keys.Store (Key), Element => <>));
            Link (Data (Container), Spot);
          end if;
          Node := Spot;
          Inserted := Added;
        end;
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) is
        Held  : Lock_Hold (Lock (Container), Writing);
        Node  : Node_Access;
        Added : Boolean;
        begin
          Add (Container, Key, Node, Added);
          if Added then Node.Item.Element := Elements.Store (New_Item); end if;
          Position := (Data (Container), Node);
          Inserted := Added;
        end;
      procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : Node_Access;
        begin
          Add (Container, Key, Node, Inserted);
          Position := (Data (Container), Node);
        end;
      procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is
        Position : Cursor;
        Inserted : Boolean;
        begin
          Insert (Container, Key, New_Item, Position, Inserted);
          if not Inserted then raise Constraint_Error; end if;
        end;
      procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is
        Held  : Lock_Hold (Lock (Container), Writing);
        Node  : Node_Access;
        Added : Boolean;
        begin
          Add (Container, Key, Node, Added);
          if Added then
            Node.Item.Element := Elements.Store (New_Item);
          else
            Check_Elements (Counts (Data (Container)));
            Put (Node, Key, New_Item);
          end if;
        end;
      procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Found (Container, Key);
        begin
          Check_Elements (Counts (Data (Container)));
          Put (Node, Key, New_Item);
        end;
      procedure Exclude (Container : in out Map; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Search.Find (Data (Container), Key)); end;
      procedure Delete (Container : in out Map; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Found (Container, Key)); end;
      procedure Delete (Container : in out Map; Position : in out Cursor) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          Remove (Data (Container), Checked (Container, Position));
          Position := No_Element;
        end;
      function First (Container : Map) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), First (Data (Container))));
      function Next (Position : Cursor) return Cursor is
        (declare Held : Lock_Hold (Lock (Position), Reading);
         begin (if Position.Node = null then No_Element else Make (Position.Data, Next (Position.Data, Position.Node))));
      procedure Next (Position : in out Cursor) is begin Position := Next (Position); end;
      function Next (Container : Map; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Data (Container) then raise Program_Error else Next (Position));
      procedure Next (Container : Map; Position : in out Cursor) is begin Position := Next (Container, Position); end;
      function Find (Container : Map; Key : Key_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Find (Data (Container), Key)));
      function Element (Container : Map; Key : Key_Type) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Found (Container, Key).Item.Element'Access));
      function Contains (Container : Map; Key : Key_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Search.Find (Data (Container), Key) /= null);
      function Equivalent_Keys (Left, Right : Cursor) return Boolean is
        (declare Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading); begin Equivalent_Keys (Key_Of (Checked (Left)).all, Key_Of (Checked (Right)).all));
      function Equivalent_Keys (Left : Cursor; Right : Key_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Left), Reading); begin Equivalent_Keys (Key_Of (Checked (Left)).all, Right));
      function Equivalent_Keys (Left : Key_Type; Right : Cursor) return Boolean is
        (declare Held : Lock_Hold (Lock (Right), Reading); begin Equivalent_Keys (Left, Key_Of (Checked (Right)).all));
      procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is
        Held : Lock_Hold (Lock (Container), Walking);
        Busy : Hold (Counts (Data (Container)), False);
        Node : Node_Access := First (Data (Container));
        begin
          while Node /= null loop
            Process ((Data (Container), Node));
            Node := Next (Data (Container), Node);
          end loop;
        end;
      function Iterate (Container : Map) return Map_Iterator is ((Data => Data (Container)));
      function First (Object : Map_Iterator) return Cursor is
        (declare Held : Lock_Hold (Lock (Object.Data), Reading); begin Make (Object.Data, First (Object.Data)));
      function Next (Object : Map_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Next (Position));
    end;
    package body Hashed_Sets is
      function Data (Container : Set) return Shared_Access is (Container.Guard.Data);
      function Lock (Container : Set) return Lock_Access is (Lock (Data (Container)));
      function Lock (Position : Cursor) return Lock_Access is (Lock (Position.Data));
      function Element_Of (Node : Node_Access) return Elements.Element_Access is (Elements.Pointer (Node.Item'Access));
      function Equivalent (Item : Element_Type; Node : Node_Access) return Boolean is (Equivalent_Elements (Element_Of (Node).all, Item));
      package Search is new Table.Search (Element_Type, Hash, Equivalent);
      function Checked (Position : Cursor) return Node_Access is (if Position.Node = null then raise Constraint_Error else Position.Node);
      function Checked (Container : Set; Position : Cursor) return Node_Access is
        (if Position.Node = null then raise Constraint_Error elsif Position.Data /= Data (Container) then raise Program_Error else Position.Node);
      function Found (Container : Set; Item : Element_Type) return Node_Access is
        (declare Node : constant Node_Access := Search.Find (Data (Container), Item); begin (if Node = null then raise Constraint_Error else Node));
      function Make (Data : Shared_Access; Node : Node_Access) return Cursor is (if Node = null then No_Element else (Data, Node));
      procedure Put (Node : Node_Access; New_Item : Element_Type) is
        Fresh : constant Elements.Stored := Elements.Store (New_Item);
        begin
          Elements.Free (Node.Item);
          Node.Item := Fresh;
        end;
      function Has_Element (Position : Cursor) return Boolean is (Position.Node /= null);
      function Has_Element (Container : Set; Position : Cursor) return Boolean is (Position.Node /= null and then Position.Data = Data (Container));
      function Matches (Right : Set; Node : Node_Access; Strict : Boolean) return Boolean is
        (declare Found : constant Node_Access := Search.Find (Data (Right), Element_Of (Node).all);
         begin Found /= null and then (not Strict or else Element_Of (Found).all = Element_Of (Node).all));
      function Matches (Left, Right : Set; Strict : Boolean) return Boolean is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        Node : Node_Access := First (Data (Left));
        begin
          if Length (Data (Left)) /= Length (Data (Right)) then return False; end if;
          while Node /= null loop
            if not Matches (Right, Node, Strict) then return False; end if;
            Node := Next (Data (Left), Node);
          end loop;
          return True;
        end;
      function "=" (Left, Right : Set) return Boolean is (Matches (Left, Right, True));
      function Equivalent_Sets (Left, Right : Set) return Boolean is (Matches (Left, Right, False));
      function Tampering_With_Cursors_Prohibited (Container : Set) return Boolean is (Cursors_Prohibited (Counts (Data (Container))));
      function Empty (Capacity : Count_Type := 10; Limit : Count_Type := Count_Type'Last) return Set is
        Result : Set (Limit);
        begin
          Reserve (Result.Guard.Data, Capacity);
          return Result;
        end;
      function To_Set (New_Item : Element_Type; Limit : Count_Type := Count_Type'Last) return Set is
        Result : Set (Limit);
        begin
          Insert (Result, New_Item);
          return Result;
        end;
      function Capacity (Container : Set) return Count_Type is (declare Held : Lock_Hold (Lock (Container), Reading); begin Buckets (Data (Container)));
      procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          if Capacity > Container.Limit then raise Capacity_Error; end if;
          Reserve (Container.Guard.Data, Capacity);
        end;
      function Length (Container : Set) return Count_Type is (declare Held : Lock_Hold (Lock (Container), Reading); begin Length (Data (Container)));
      procedure Clear (Container : in out Set) is Held : Lock_Hold (Lock (Container), Writing); begin Clear (Data (Container)); end;
      function Element (Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Position), Reading); begin Elements.Fetch (Checked (Position).Item'Access));
      function Element (Container : Set; Position : Cursor) return Element_Type is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Checked (Container, Position).Item'Access));
      procedure Relink (Container : in out Set; Node : Node_Access; New_Item : Element_Type) is
        Found : constant Node_Access := Search.Find (Data (Container), New_Item);
        begin
          if Found = Node then
            Check_Elements (Counts (Data (Container)));
            Put (Node, New_Item);
          elsif Found /= null then
            raise Program_Error;
          else
            Check_Cursors (Counts (Data (Container)));
            Unlink (Data (Container), Node);
            Put (Node, New_Item);
            Node.Hash := Hash (New_Item);
            Link (Data (Container), Node);
          end if;
        end;
      procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          Relink (Container, Checked (Container, Position), New_Item);
        end;
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) is
        Held : Lock_Hold (Lock (Position), Walking);
        Node : constant Node_Access := Checked (Position);
        Busy : Hold (Counts (Position.Data), True);
        begin
          Process (Element_Of (Node).all);
        end;
      function Constant_Reference (Container : Set; Position : Cursor) return Constant_Reference_Type is
      Held : Lock_Hold (Lock (Container), Reading);
      begin
        return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
      end;
      procedure Fill (Target : in out Set; Source : Set) is
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Limit then raise Capacity_Error; end if;
          Assign (Target.Guard.Data, Data (Source));
        end;
      procedure Assign (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Fill (Target, Source); end;
      function Copy (Source : Set; Capacity : Count_Type := 0; Limit : Count_Type := Count_Type'Last) return Set is
        Result : Set (Limit);
        begin
          if Capacity /= 0 and then Capacity < Length (Source) then raise Capacity_Error; end if;
          Assign (Result, Source);
          Reserve (Result.Guard.Data, Capacity);
          return Result;
        end;
      procedure Move (Target : in out Set; Source : in out Set) is
        Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Writing);
        begin
          if Data (Target) = Data (Source) then return; end if;
          if Length (Data (Source)) > Target.Limit then raise Capacity_Error; end if;
          Move (Target.Guard.Data, Source.Guard.Data);
        end;
      procedure Add (Container : in out Set; New_Item : Element_Type; Node : out Node_Access; Inserted : out Boolean) is
        Spot  : Node_Access := Search.Find (Data (Container), New_Item);
        Added : constant Boolean := Spot = null;
        begin
          if Added then
            Ready (Container.Guard.Data, Length (Data (Container)) >= Container.Limit);
            Spot := new Node_Type'(null, Hash (New_Item), Elements.Store (New_Item));
            Link (Data (Container), Spot);
          end if;
          Node := Spot;
          Inserted := Added;
        end;
      procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : Node_Access;
        begin
          Add (Container, New_Item, Node, Inserted);
          Position := (Data (Container), Node);
        end;
      procedure Insert (Container : in out Set; New_Item : Element_Type) is
        Position : Cursor;
        Inserted : Boolean;
        begin
          Insert (Container, New_Item, Position, Inserted);
          if not Inserted then raise Constraint_Error; end if;
        end;
      procedure Include (Container : in out Set; New_Item : Element_Type) is
        Held  : Lock_Hold (Lock (Container), Writing);
        Node  : Node_Access;
        Added : Boolean;
        begin
          Add (Container, New_Item, Node, Added);
          if Added then return; end if;
          Check_Elements (Counts (Data (Container)));
          Put (Node, New_Item);
        end;
      procedure Replace (Container : in out Set; New_Item : Element_Type) is
        Held : Lock_Hold (Lock (Container), Writing);
        Node : constant Node_Access := Found (Container, New_Item);
        begin
          Check_Elements (Counts (Data (Container)));
          Put (Node, New_Item);
        end;
      procedure Exclude (Container : in out Set; Item : Element_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Search.Find (Data (Container), Item)); end;
      procedure Delete (Container : in out Set; Item : Element_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Found (Container, Item)); end;
      procedure Delete (Container : in out Set; Position : in out Cursor) is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          Remove (Data (Container), Checked (Container, Position));
          Position := No_Element;
        end;
      procedure Join (Target : in out Set; Source : Set) is
        Node  : Node_Access := First (Data (Source));
        Spot  : Node_Access;
        Added : Boolean;
        begin
          if Data (Target) = Data (Source) then return; end if;
          while Node /= null loop
            Add (Target, Element_Of (Node).all, Spot, Added);
            Node := Next (Data (Source), Node);
          end loop;
        end;
      procedure Meet (Target : in out Set; Source : Set) is
        Node : Node_Access := First (Data (Target));
        Gone : Node_Access;
        begin
          if Data (Target) = Data (Source) then return; end if;
          while Node /= null loop
            Gone := Node;
            Node := Next (Data (Target), Node);
            if Search.Find (Data (Source), Element_Of (Gone).all) = null then Remove (Data (Target), Gone); end if;
          end loop;
        end;
      procedure Except (Target : in out Set; Source : Set) is
        Node : Node_Access := First (Data (Source));
        begin
          if Data (Target) = Data (Source) then Clear (Data (Target)); return; end if;
          while Node /= null loop
            Remove (Data (Target), Search.Find (Data (Target), Element_Of (Node).all));
            Node := Next (Data (Source), Node);
          end loop;
        end;
      procedure Toggle (Target : in out Set; Source : Set) is
        Node  : Node_Access := First (Data (Source));
        Found : Node_Access;
        Added : Boolean;
        begin
          if Data (Target) = Data (Source) then Clear (Data (Target)); return; end if;
          while Node /= null loop
            Found := Search.Find (Data (Target), Element_Of (Node).all);
            if Found /= null then Remove (Data (Target), Found); else Add (Target, Element_Of (Node).all, Found, Added); end if;
            Node := Next (Data (Source), Node);
          end loop;
        end;
      procedure Union (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Join (Target, Source); end;
      procedure Intersection (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Meet (Target, Source); end;
      procedure Difference (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Except (Target, Source); end;
      procedure Symmetric_Difference (Target : in out Set; Source : Set) is Held : Pair_Hold (Lock (Target), Writing, Lock (Source), Reading); begin Toggle (Target, Source); end;
      function Fitted (Source : in out Set; Limit : Count_Type) return Set is
        Result : Set (if Limit = Count_Type'Last then Limit else Length (Data (Source)));
        begin
          Move (Result, Source);
          return Result;
        end;
      function Combined (Left, Right : Set; Combine : access procedure (Target : in out Set; Source : Set)) return Set is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        Work : Set (Count_Type'Last);
        begin
          Fill (Work, Left);
          Combine (Work, Right);
          return Fitted (Work, Left.Limit);
        end;
      function Union (Left, Right : Set) return Set is (Combined (Left, Right, Join'Access));
      function Intersection (Left, Right : Set) return Set is (Combined (Left, Right, Meet'Access));
      function Difference (Left, Right : Set) return Set is (Combined (Left, Right, Except'Access));
      function Symmetric_Difference (Left, Right : Set) return Set is (Combined (Left, Right, Toggle'Access));
      function Scan (Left, Right : Set; Any : Boolean) return Boolean is
        Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading);
        Node : Node_Access := First (Data (Left));
        begin
          while Node /= null loop
            if (Search.Find (Data (Right), Element_Of (Node).all) /= null) = Any then return Any; end if;
            Node := Next (Data (Left), Node);
          end loop;
          return not Any;
        end;
      function Overlap (Left, Right : Set) return Boolean is (Scan (Left, Right, True));
      function Is_Subset (Subset : Set; Of_Set : Set) return Boolean is (Scan (Subset, Of_Set, False));
      function First (Container : Set) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), First (Data (Container))));
      function Next (Position : Cursor) return Cursor is
        (declare Held : Lock_Hold (Lock (Position), Reading);
         begin (if Position.Node = null then No_Element else Make (Position.Data, Next (Position.Data, Position.Node))));
      procedure Next (Position : in out Cursor) is begin Position := Next (Position); end;
      function Next (Container : Set; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Data (Container) then raise Program_Error else Next (Position));
      procedure Next (Container : Set; Position : in out Cursor) is begin Position := Next (Container, Position); end;
      function Find (Container : Set; Item : Element_Type) return Cursor is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Find (Data (Container), Item)));
      function Contains (Container : Set; Item : Element_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Container), Reading); begin Search.Find (Data (Container), Item) /= null);
      function Equivalent_Elements (Left, Right : Cursor) return Boolean is
        (declare Held : Pair_Hold (Lock (Left), Reading, Lock (Right), Reading); begin Equivalent_Elements (Element_Of (Checked (Left)).all, Element_Of (Checked (Right)).all));
      function Equivalent_Elements (Left : Cursor; Right : Element_Type) return Boolean is
        (declare Held : Lock_Hold (Lock (Left), Reading); begin Equivalent_Elements (Element_Of (Checked (Left)).all, Right));
      function Equivalent_Elements (Left : Element_Type; Right : Cursor) return Boolean is
        (declare Held : Lock_Hold (Lock (Right), Reading); begin Equivalent_Elements (Left, Element_Of (Checked (Right)).all));
      procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is
        Held : Lock_Hold (Lock (Container), Walking);
        Busy : Hold (Counts (Data (Container)), False);
        Node : Node_Access := First (Data (Container));
        begin
          while Node /= null loop
            Process ((Data (Container), Node));
            Node := Next (Data (Container), Node);
          end loop;
        end;
      function Iterate (Container : Set) return Set_Iterator is ((Data => Data (Container)));
      function First (Object : Set_Iterator) return Cursor is
        (declare Held : Lock_Hold (Lock (Object.Data), Reading); begin Make (Object.Data, First (Object.Data)));
      function Next (Object : Set_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Next (Position));
      package body Generic_Keys is
        function Equivalent (Key : Key_Type; Node : Node_Access) return Boolean is (Equivalent_Keys (Generic_Keys.Key (Element_Of (Node).all), Key));
        package Search is new Table.Search (Key_Type, Hash, Equivalent);
        function Found (Container : Set; Key : Key_Type) return Node_Access is
          (declare Node : constant Node_Access := Search.Find (Data (Container), Key); begin (if Node = null then raise Constraint_Error else Node));
        function Key (Position : Cursor) return Key_Type is
          (declare Held : Lock_Hold (Lock (Position), Reading); begin Key (Element_Of (Checked (Position)).all));
        function Element (Container : Set; Key : Key_Type) return Element_Type is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Elements.Fetch (Found (Container, Key).Item'Access));
        procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is
          Held : Lock_Hold (Lock (Container), Writing);
          begin
            Relink (Container, Found (Container, Key), New_Item);
          end;
        procedure Exclude (Container : in out Set; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Search.Find (Data (Container), Key)); end;
        procedure Delete (Container : in out Set; Key : Key_Type) is Held : Lock_Hold (Lock (Container), Writing); begin Remove (Data (Container), Found (Container, Key)); end;
        function Find (Container : Set; Key : Key_Type) return Cursor is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Make (Data (Container), Search.Find (Data (Container), Key)));
        function Contains (Container : Set; Key : Key_Type) return Boolean is
          (declare Held : Lock_Hold (Lock (Container), Reading); begin Search.Find (Data (Container), Key) /= null);
        procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) is
          Held   : Lock_Hold (Lock (Container), Writing);
          Node   : constant Node_Access := Checked (Container, Position);
          Before : constant Key_Type := Key (Element_Of (Node).all);
          begin
            declare
              Busy : Hold (Counts (Data (Container)), True);
              begin
                Process (Element_Of (Node).all);
              end;
            if Equivalent_Keys (Before, Key (Element_Of (Node).all)) then return; end if;
            Remove (Data (Container), Node);
            raise Program_Error;
          end;
        function Reference_Preserving_Key (Container : in out Set; Position : Cursor) return Reference_Type is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          return (Element => Element_Of (Checked (Container, Position)).all'Unchecked_Access);
        end;
        function Constant_Reference (Container : Set; Key : Key_Type) return Constant_Reference_Type is
        Held : Lock_Hold (Lock (Container), Reading);
        begin
          return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
        end;
        function Reference_Preserving_Key (Container : in out Set; Key : Key_Type) return Reference_Type is
        Held : Lock_Hold (Lock (Container), Writing);
        begin
          return (Element => Element_Of (Found (Container, Key)).all'Unchecked_Access);
        end;
      end;
    end;
  end;
  package body Bounded_Hashed_Maps is
    procedure Reserve_Capacity (Container : in out Map; Capacity : Count_Type) is begin Core.Reserve_Capacity (Container.Items, Capacity); end;
    procedure Clear (Container : in out Map) is begin Core.Clear (Container.Items); end;
    procedure Replace_Element (Container : in out Map; Position : Cursor; New_Item : Element_Type) is
      begin Core.Replace_Element (Container.Items, Position, New_Item);
      end;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : Element_Type)) is
      begin Core.Query_Element (Position, Process);
      end;
    procedure Update_Element (Container : in out Map; Position : Cursor; Process : not null access procedure (Key : Key_Type; Element : in out Element_Type)) is
      begin Core.Update_Element (Container.Items, Position, Process);
      end;
    procedure Assign (Target : in out Map; Source : Map) is begin Core.Assign (Target.Items, Source.Items); end;
    procedure Move (Target : in out Map; Source : in out Map) is begin Core.Move (Target.Items, Source.Items); end;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) is
      begin Core.Insert (Container.Items, Key, New_Item, Position, Inserted);
      end;
    procedure Insert (Container : in out Map; Key : Key_Type; Position : out Cursor; Inserted : out Boolean) is
      begin Core.Insert (Container.Items, Key, Position, Inserted);
      end;
    procedure Insert (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is begin Core.Insert (Container.Items, Key, New_Item); end;
    procedure Include (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is begin Core.Include (Container.Items, Key, New_Item); end;
    procedure Replace (Container : in out Map; Key : Key_Type; New_Item : Element_Type) is begin Core.Replace (Container.Items, Key, New_Item); end;
    procedure Exclude (Container : in out Map; Key : Key_Type) is begin Core.Exclude (Container.Items, Key); end;
    procedure Delete (Container : in out Map; Key : Key_Type) is begin Core.Delete (Container.Items, Key); end;
    procedure Delete (Container : in out Map; Position : in out Cursor) is begin Core.Delete (Container.Items, Position); end;
    procedure Next (Position : in out Cursor) is begin Core.Next (Position); end;
    procedure Next (Container : Map; Position : in out Cursor) is begin Core.Next (Container.Items, Position); end;
    procedure Iterate (Container : Map; Process : not null access procedure (Position : Cursor)) is begin Core.Iterate (Container.Items, Process); end;
  end;
  package body Bounded_Hashed_Sets is
    procedure Reserve_Capacity (Container : in out Set; Capacity : Count_Type) is begin Core.Reserve_Capacity (Container.Items, Capacity); end;
    procedure Clear (Container : in out Set) is begin Core.Clear (Container.Items); end;
    procedure Replace_Element (Container : in out Set; Position : Cursor; New_Item : Element_Type) is
      begin Core.Replace_Element (Container.Items, Position, New_Item);
      end;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) is
      begin Core.Query_Element (Position, Process);
      end;
    procedure Assign (Target : in out Set; Source : Set) is begin Core.Assign (Target.Items, Source.Items); end;
    procedure Move (Target : in out Set; Source : in out Set) is begin Core.Move (Target.Items, Source.Items); end;
    procedure Insert (Container : in out Set; New_Item : Element_Type; Position : out Cursor; Inserted : out Boolean) is
      begin Core.Insert (Container.Items, New_Item, Position, Inserted);
      end;
    procedure Insert (Container : in out Set; New_Item : Element_Type) is begin Core.Insert (Container.Items, New_Item); end;
    procedure Include (Container : in out Set; New_Item : Element_Type) is begin Core.Include (Container.Items, New_Item); end;
    procedure Replace (Container : in out Set; New_Item : Element_Type) is begin Core.Replace (Container.Items, New_Item); end;
    procedure Exclude (Container : in out Set; Item : Element_Type) is begin Core.Exclude (Container.Items, Item); end;
    procedure Delete (Container : in out Set; Item : Element_Type) is begin Core.Delete (Container.Items, Item); end;
    procedure Delete (Container : in out Set; Position : in out Cursor) is begin Core.Delete (Container.Items, Position); end;
    procedure Union (Target : in out Set; Source : Set) is begin Core.Assign (Target.Items, Core.Union (Target.Items, Source.Items)); end;
    procedure Intersection (Target : in out Set; Source : Set) is begin Core.Intersection (Target.Items, Source.Items); end;
    procedure Difference (Target : in out Set; Source : Set) is begin Core.Difference (Target.Items, Source.Items); end;
    procedure Symmetric_Difference (Target : in out Set; Source : Set) is begin Core.Assign (Target.Items, Core.Symmetric_Difference (Target.Items, Source.Items)); end;
    procedure Next (Position : in out Cursor) is begin Core.Next (Position); end;
    procedure Next (Container : Set; Position : in out Cursor) is begin Core.Next (Container.Items, Position); end;
    procedure Iterate (Container : Set; Process : not null access procedure (Position : Cursor)) is begin Core.Iterate (Container.Items, Process); end;
    package body Generic_Keys is
      procedure Replace (Container : in out Set; Key : Key_Type; New_Item : Element_Type) is begin Keys.Replace (Container.Items, Key, New_Item); end;
      procedure Exclude (Container : in out Set; Key : Key_Type) is begin Keys.Exclude (Container.Items, Key); end;
      procedure Delete (Container : in out Set; Key : Key_Type) is begin Keys.Delete (Container.Items, Key); end;
      procedure Update_Element_Preserving_Key (Container : in out Set; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) is
        begin Keys.Update_Element_Preserving_Key (Container.Items, Position, Process);
        end;
    end;
  end;
  package body Vector_Core is
    procedure Free is new Unchecked_Deallocation (Elements_Array, Elements_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    Blank : Stored;
    function Last_Of (Container : Vector) return Extended_Index is
      (if Container.Handle.Data = null then No_Index else Container.Handle.Data.Last);
    function Index_After (Count : Count_Type) return Extended_Index is
      (Index_Type'Base (Count_Type'Pos (Count) + Index_Type'Pos (No_Index)));
    function Count_Before (Index : Extended_Index) return Count_Type is
      (Count_Type (Index_Type'Pos (Index) - Index_Type'Pos (No_Index)));
    function Item (Data : Shared_Access; Index : Index_Type) return Element_Pointer is
      (Target (Data.Elements (Index)'Access));
    function Room (Container : Vector) return Count_Type is
      (if Container.Handle.Data = null or else Container.Handle.Data.Elements = null then 0
       else Container.Handle.Data.Elements'Length);
    function Full (Container : Vector) return Boolean is
      (Container.Handle.Data = null or else Container.Handle.Data.Elements = null
       or else Container.Handle.Data.Last = Container.Handle.Data.Elements'Last
       or else (Bounded and then Count_Before (Container.Handle.Data.Last) >= Container.Bound));
    function Mutex (Data : Shared_Access) return Exclusive_Lock_Access is (if Data = null then null else Data.Mutex);
    function Mutex (Container : Vector) return Exclusive_Lock_Access is (Mutex (Container.Handle.Data));
    procedure Ensure (Container : in out Vector) is
      begin
        if Container.Handle.Data = null then Container.Handle.Data := new Shared; end if;
      end;
    procedure Drop (Data : Shared_Access; From, To : Extended_Index) is
      begin
        if Indirect then
          for I in From .. To loop
            Release (Data.Elements (I));
          end loop;
        end if;
      end;
    procedure Duplicate (Data : Shared_Access; From, To : Extended_Index) is
      begin
        if Indirect then
          for I in From .. To loop
            Store (Data.Elements (I), Item (Data, I).all);
          end loop;
        end if;
      end;
    procedure Fill (Data : Shared_Access; From, To : Extended_Index) is
      begin
        for I in From .. To loop
          Data.Elements (I) := Blank;
        end loop;
      end;
    procedure Exchange (Data : Shared_Access; I, J : Index_Type) is
      Held : constant Stored := Data.Elements (I);
      begin
        Data.Elements (I) := Data.Elements (J);
        Data.Elements (J) := Held;
      end;
    procedure Initialize (Handle : in out Guard) is
      begin
        if Task_Safe then Handle.Data := new Shared; end if;
      end;
    procedure Adjust (Handle : in out Guard) is
      Source : constant Shared_Access := Handle.Data;
      begin
        Handle.Data := null;
        if Source /= null and then Source.Last >= Index_Type'First then
          Handle.Data := new Shared'(Elements => new Elements_Array'(Source.Elements (Index_Type'First .. Source.Last)), Last => Source.Last, others => <>);
          Duplicate (Handle.Data, Index_Type'First, Source.Last);
        elsif Task_Safe then
          Handle.Data := new Shared;
        end if;
      end;
    procedure Finalize (Handle : in out Guard) is
      begin
        if Handle.Data /= null then
          Drop (Handle.Data, Index_Type'First, Handle.Data.Last);
          Free (Handle.Data.Elements);
          if Task_Safe then Free (Handle.Data.Mutex); end if;
          Free (Handle.Data);
        end if;
      end;
    generic
    package Raw_Layer is
      function Has_Element (Position : Cursor) return Boolean;
      function Has_Element (Container : Vector; Position : Cursor) return Boolean;
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
      procedure Query_Element (Container : Vector; Index : Index_Type; Process : not null access procedure (Element : Element_Type));
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type));
      procedure Update_Element (Container : in out Vector; Index : Index_Type; Process : not null access procedure (Element : in out Element_Type));
      procedure Update_Element (Container : in out Vector; Position : Cursor; Process : not null access procedure (Element : in out Element_Type));
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
      procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1);
      procedure Insert_Space (Container : in out Vector; Before : Extended_Index; Count : Count_Type := 1);
      procedure Insert_Space (Container : in out Vector; Before : Cursor; Position : out Cursor; Count : Count_Type := 1);
      procedure Prepend_Vector (Container : in out Vector; New_Item : Vector);
      procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Append_Vector (Container : in out Vector; New_Item : Vector);
      procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type);
      procedure Append (Container : in out Vector; New_Item : Element_Type);
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
      function First (Object : Vector_Iterator) return Cursor;
      function Next (Object : Vector_Iterator; Position : Cursor) return Cursor;
      function Last (Object : Vector_Iterator) return Cursor;
      function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor;
      procedure Check_Cursors (Container : Vector);
    end;
    package body Raw_Layer is
      procedure Check_Cursors (Container : Vector) is
        begin
          if Tampering_With_Cursors_Prohibited (Container) then raise Program_Error; end if;
        end;
      procedure Check_Elements (Container : Vector) is
        begin
          if Tampering_With_Elements_Prohibited (Container) then raise Program_Error; end if;
        end;
      procedure Check_Index (Container : Vector; Index : Index_Type) is
        begin
          if Index > Last_Of (Container) then raise Constraint_Error; end if;
        end;
      function Checked (Container : Vector; Position : Cursor) return Index_Type is
        (if Position.Data = null then raise Constraint_Error
         elsif Position.Data /= Container.Handle.Data then raise Program_Error
         elsif Position.Index > Position.Data.Last then raise Constraint_Error
         else Position.Index);
      procedure Check_Insertion (Container : Vector; Before : Extended_Index; Count : Count_Type) is
        begin
          if Before not in Index_Type'First .. Last_Of (Container) + 1 then raise Constraint_Error; end if;
          Check_Cursors (Container);
          if Length (Container) > Maximum_Length - Count then raise Constraint_Error; end if;
          if Bounded and then Length (Container) + Count > Container.Bound then raise Capacity_Error; end if;
        end;
      function Has_Element (Position : Cursor) return Boolean is
        (Position.Data /= null and then Position.Index in Index_Type'First .. Position.Data.Last);
      function Has_Element (Container : Vector; Position : Cursor) return Boolean is
        (Has_Element (Position) and then Position.Data = Container.Handle.Data);
      function "=" (Left, Right : Vector) return Boolean is
        (Last_Of (Left) = Last_Of (Right) and then
         (for all I in Index_Type'First .. Last_Of (Left) => Left.Handle.Data.Elements (I) = Item (Right.Handle.Data, I).all));
      function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean is
        (Container.Handle.Data /= null and then (Container.Handle.Data.Busy > 0 or else Container.Handle.Data.Lock > 0));
      function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean is
        (Container.Handle.Data /= null and then Container.Handle.Data.Lock > 0);
      function Maximum_Length return Count_Type is
        (if Index_Type'Pos (Index_Type'Last) - Index_Type'Pos (Index_Type'First) >= Count_Type'Pos (Count_Type'Last)
         then Count_Type'Last else Count_Type (Index_Type'Pos (Index_Type'Last) - Index_Type'Pos (Index_Type'First) + 1));
      function Capacity (Container : Vector) return Count_Type is
        (if Bounded then Container.Bound else Room (Container));
      procedure Grow (Container : in out Vector; Wanted : Count_Type) is
        Size  : Count_Type := Room (Container);
        Grown : Elements_Access;
        begin
          if Bounded and then Wanted > Container.Bound then raise Capacity_Error; end if;
          if Wanted <= Size then return; end if;
          if Wanted > Maximum_Length then raise Constraint_Error; end if;
          Size := (if Bounded then Container.Bound
                   elsif Size < Maximum_Length / 2 then Count_Type'Max (Wanted, Count_Type'Max (2 * Size, 4))
                   else Maximum_Length);
          Grown := new Elements_Array (Index_Type'First .. Index_After (Size));
          if Container.Handle.Data = null then
            Container.Handle.Data := new Shared;
          elsif Container.Handle.Data.Elements /= null then
            Grown (Index_Type'First .. Container.Handle.Data.Last) := Container.Handle.Data.Elements (Index_Type'First .. Container.Handle.Data.Last);
            Free (Container.Handle.Data.Elements);
          end if;
          Container.Handle.Data.Elements := Grown;
        end;
      procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) is
        begin
          if Capacity > Room (Container) then
            Check_Cursors (Container);
            Grow (Container, Capacity);
          end if;
        end;
      function Sized (Capacity : Count_Type) return Vector is
        Result : Vector (if Bounded then Capacity else 0);
        begin
          Reserve_Capacity (Result, Capacity);
          return Result;
        end;
      function Empty (Capacity : Count_Type := 10) return Vector is (Sized (Capacity));
      function Length (Container : Vector) return Count_Type is (Count_Before (Last_Of (Container)));
      function Is_Empty (Container : Vector) return Boolean is (Last_Of (Container) = No_Index);
      procedure Clear (Container : in out Vector) is
        begin
          Check_Cursors (Container);
          if Container.Handle.Data /= null then
            Drop (Container.Handle.Data, Index_Type'First, Container.Handle.Data.Last);
            Container.Handle.Data.Last := No_Index;
          end if;
        end;
      procedure Set_Length (Container : in out Vector; Length : Count_Type) is
        Last : constant Extended_Index := Last_Of (Container);
        begin
          Check_Cursors (Container);
          Grow (Container, Length);
          if Container.Handle.Data /= null then
            Drop (Container.Handle.Data, Index_After (Length) + 1, Last);
            Fill (Container.Handle.Data, Last + 1, Index_After (Length));
            Container.Handle.Data.Last := Index_After (Length);
          end if;
        end;
      function To_Vector (Length : Count_Type) return Vector is
        Result : Vector := Sized (Length);
        begin
          Set_Length (Result, Length);
          return Result;
        end;
      function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector is
        Result : Vector := Sized (Length);
        begin
          Append (Result, New_Item, Length);
          return Result;
        end;
      function "&" (Left, Right : Vector) return Vector is
        Result : Vector := Sized (Length (Left) + Length (Right));
        begin
          Append_Vector (Result, Left);
          Append_Vector (Result, Right);
          return Result;
        end;
      function "&" (Left : Vector; Right : Element_Type) return Vector is (Left & To_Vector (Right, 1));
      function "&" (Left : Element_Type; Right : Vector) return Vector is (To_Vector (Left, 1) & Right);
      function "&" (Left, Right : Element_Type) return Vector is (To_Vector (Left, 1) & Right);
      function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor is
        (if Index in Index_Type'First .. Last_Of (Container) then (Container.Handle.Data, Index) else No_Element);
      function To_Index (Position : Cursor) return Extended_Index is
        (if Has_Element (Position) then Position.Index else No_Index);
      function Element (Container : Vector; Index : Index_Type) return Element_Type is
        (if Index > Last_Of (Container) then raise Constraint_Error else Item (Container.Handle.Data, Index).all);
      function Element (Position : Cursor) return Element_Type is
        (if Has_Element (Position) then Item (Position.Data, Position.Index).all else raise Constraint_Error);
      procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) is
        begin
          Check_Index (Container, Index);
          Check_Elements (Container);
          Put (Container.Handle.Data.Elements (Index), New_Item);
        end;
      procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) is
        begin
          Replace_Element (Container, Checked (Container, Position), New_Item);
        end;
      procedure Query_Element (Container : Vector;
                               Index     : Index_Type;
                               Process   : not null access procedure (Element : Element_Type)) is
        Hold : Locked_Counter_Hold (Container.Handle.Data.Lock'Access, Mutex (Container));
        begin
          Check_Index (Container, Index);
          Process (Item (Container.Handle.Data, Index).all);
        end;
      procedure Query_Element (Position : Cursor;
                               Process  : not null access procedure (Element : Element_Type)) is
        Hold : Locked_Counter_Hold (Position.Data.Lock'Access, Mutex (Position.Data));
        begin
          if not Has_Element (Position) then raise Constraint_Error; end if;
          Process (Item (Position.Data, Position.Index).all);
        end;
      procedure Update_Element (Container : in out Vector;
                                Index     : Index_Type;
                                Process   : not null access procedure (Element : in out Element_Type)) is
        Hold : Locked_Counter_Hold (Container.Handle.Data.Lock'Access, Mutex (Container));
        begin
          Check_Index (Container, Index);
          Process (Item (Container.Handle.Data, Index).all);
        end;
      procedure Update_Element (Container : in out Vector;
                                Position  : Cursor;
                                Process   : not null access procedure (Element : in out Element_Type)) is
        begin
          Update_Element (Container, Checked (Container, Position), Process);
        end;
      function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type is
        (if Index > Last_Of (Container) then raise Constraint_Error
         else (Element => Item (Container.Handle.Data, Index).all'Access));
      function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type is
        (if Index > Last_Of (Container) then raise Constraint_Error
         else (Element => Item (Container.Handle.Data, Index).all'Access));
      function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type is
        ((Element => Item (Container.Handle.Data, Checked (Container, Position)).all'Access));
      function Reference (Container : in out Vector; Position : Cursor) return Reference_Type is
        ((Element => Item (Container.Handle.Data, Checked (Container, Position)).all'Access));
      procedure Assign (Target : in out Vector; Source : Vector) is
        Last : constant Extended_Index := Last_Of (Source);
        begin
          if Target.Handle.Data = Source.Handle.Data then return; end if;
          Check_Cursors (Target);
          Grow (Target, Length (Source));
          Clear (Target);
          if Last >= Index_Type'First then
            Target.Handle.Data.Elements (Index_Type'First .. Last) := Source.Handle.Data.Elements (Index_Type'First .. Last);
            Duplicate (Target.Handle.Data, Index_Type'First, Last);
            Target.Handle.Data.Last := Last;
          end if;
        end;
      function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector is
        Result : Vector := Sized (if Capacity /= 0 and then Capacity < Length (Source) then raise Capacity_Error
                                  else Count_Type'Max (Capacity, Length (Source)));
        begin
          Assign (Result, Source);
          return Result;
        end;
      procedure Move (Target : in out Vector; Source : in out Vector) is
        Held : Elements_Access;
        begin
          if Target.Handle.Data = Source.Handle.Data then return; end if;
          Check_Cursors (Target);
          Check_Cursors (Source);
          if Bounded and then Length (Source) > Target.Bound then raise Capacity_Error; end if;
          Clear (Target);
          if Source.Handle.Data = null then return; end if;
          Ensure (Target);
          Held := Target.Handle.Data.Elements;
          Target.Handle.Data.all := (Source.Handle.Data.Elements, Source.Handle.Data.Last, 0, 0, Target.Handle.Data.Mutex);
          Source.Handle.Data.all := (Held, No_Index, 0, 0, Source.Handle.Data.Mutex);
        end;
      procedure Open_Space (Container : in out Vector; Before : Extended_Index; Count : Count_Type) is
        Last  : constant Extended_Index := Last_Of (Container);
        Shift : constant Index_Type'Base := Index_After (Count) - No_Index;
        begin
          Check_Insertion (Container, Before, Count);
          if Count = 0 then return; end if;
          Grow (Container, Length (Container) + Count);
          Container.Handle.Data.Elements (Before + Shift .. Last + Shift) := Container.Handle.Data.Elements (Before .. Last);
          Container.Handle.Data.Last := Last + Shift;
        end;
      function Before_Index (Container : Vector; Before : Cursor) return Extended_Index is
        (if Before.Data = null then Last_Of (Container) + 1
         elsif Before.Data /= Container.Handle.Data then raise Program_Error
         elsif Before.Index > Container.Handle.Data.Last then Container.Handle.Data.Last + 1
         else Before.Index);
      procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
        Count    : constant Count_Type := Length (New_Item);
        Shift    : constant Index_Type'Base := Index_After (Count) - No_Index;
        Overlaps : constant Boolean := New_Item.Handle.Data = Container.Handle.Data;
        begin
          Open_Space (Container, Before, Count);
          for I in Index_Type'First .. Index_After (Count) loop
            Store (Container.Handle.Data.Elements (Before + (I - Index_Type'First)),
                   Item (New_Item.Handle.Data, (if Overlaps and then I >= Before then I + Shift else I)).all);
          end loop;
        end;
      procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) is
        begin
          Insert_Vector (Container, Before_Index (Container, Before), New_Item);
        end;
      procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
        Index : constant Extended_Index := Before_Index (Container, Before);
        begin
          Insert_Vector (Container, Index, New_Item);
          Position := (if Is_Empty (New_Item) then Before else (Container.Handle.Data, Index));
        end;
      procedure Insert (Container : in out Vector;
                        Before    : Extended_Index;
                        New_Item  : Element_Type;
                        Count     : Count_Type := 1) is
        Fresh : Stored;
        begin
          Check_Insertion (Container, Before, Count);
          if Count = 0 then return; end if;
          Store (Fresh, New_Item);
          Open_Space (Container, Before, Count);
          Container.Handle.Data.Elements (Before) := Fresh;
          for I in Before + 1 .. Before + (Index_After (Count) - Index_Type'First) loop
            Store (Container.Handle.Data.Elements (I), Item (Container.Handle.Data, Before).all);
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
          Position := (if Count = 0 then Before else (Container.Handle.Data, Index));
        end;
      procedure Insert_Space (Container : in out Vector;
                              Before    : Extended_Index;
                              Count     : Count_Type := 1) is
        begin
          Open_Space (Container, Before, Count);
          if Count > 0 then Fill (Container.Handle.Data, Before, Before + (Index_After (Count) - Index_Type'First)); end if;
        end;
      procedure Insert_Space (Container : in out Vector;
                              Before    : Cursor;
                              Position  : out Cursor;
                              Count     : Count_Type := 1) is
        Index : constant Extended_Index := Before_Index (Container, Before);
        begin
          Insert_Space (Container, Index, Count);
          Position := (if Count = 0 then Before else (Container.Handle.Data, Index));
        end;
      procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) is
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
      procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) is
        begin
          Insert (Container, Last_Of (Container) + 1, New_Item, Count);
        end;
      procedure Append (Container : in out Vector; New_Item : Element_Type) is
        begin
          Check_Cursors (Container);
          if Full (Container) then
            declare
              Fresh : Stored;
              begin
                Store (Fresh, New_Item);
                Grow (Container, Length (Container) + 1);
                Container.Handle.Data.Last := Container.Handle.Data.Last + 1;
                Container.Handle.Data.Elements (Container.Handle.Data.Last) := Fresh;
              end;
          else
            Container.Handle.Data.Last := Container.Handle.Data.Last + 1;
            Store (Container.Handle.Data.Elements (Container.Handle.Data.Last), New_Item);
          end if;
        end;
      procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) is
        Last : constant Extended_Index := Last_Of (Container);
        Stop : Extended_Index;
        begin
          if Index not in Index_Type'First .. Last + 1 then raise Constraint_Error; end if;
          if Count = 0 or else Index > Last then return; end if;
          Check_Cursors (Container);
          Stop := (if Count >= Count_Before (Last) - Count_Before (Index - 1) then Last
                   else Index + (Index_After (Count) - Index_Type'First));
          Drop (Container.Handle.Data, Index, Stop);
          Container.Handle.Data.Elements (Index .. Last - (Stop - Index) - 1) := Container.Handle.Data.Elements (Stop + 1 .. Last);
          Container.Handle.Data.Last := Last - (Stop - Index) - 1;
        end;
      procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) is
        begin
          Delete (Container, Checked (Container, Position), Count);
          Position := No_Element;
        end;
      procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) is
        begin
          Delete (Container, Index_Type'First, Count);
        end;
      procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) is
        begin
          Delete (Container, Index_After (Length (Container) - Count_Type'Min (Count, Length (Container))) + 1, Count);
        end;
      procedure Reverse_Elements (Container : in out Vector) is
        Last : constant Extended_Index := Last_Of (Container);
        begin
          Check_Elements (Container);
          for I in Index_Type'First .. Index_After (Length (Container) / 2) loop
            Exchange (Container.Handle.Data, I, Last - (I - Index_Type'First));
          end loop;
        end;
      procedure Swap (Container : in out Vector; I, J : Index_Type) is
        begin
          Check_Index (Container, I);
          Check_Index (Container, J);
          Check_Elements (Container);
          if I /= J then Exchange (Container.Handle.Data, I, J); end if;
        end;
      procedure Swap (Container : in out Vector; I, J : Cursor) is
        begin
          Swap (Container, Checked (Container, I), Checked (Container, J));
        end;
      function First_Index (Container : Vector) return Index_Type is (Index_Type'First);
      function First (Container : Vector) return Cursor is (To_Cursor (Container, Index_Type'First));
      function First_Element (Container : Vector) return Element_Type is (Element (Container, Index_Type'First));
      function Last_Index (Container : Vector) return Extended_Index is (Last_Of (Container));
      function Last (Container : Vector) return Cursor is (To_Cursor (Container, Last_Of (Container)));
      function Last_Element (Container : Vector) return Element_Type is
        (if Is_Empty (Container) then raise Constraint_Error else Item (Container.Handle.Data, Last_Of (Container)).all);
      function Next (Position : Cursor) return Cursor is
        (if not Has_Element (Position) or else Position.Index >= Position.Data.Last then No_Element
         else (Position.Data, Position.Index + 1));
      procedure Next (Position : in out Cursor) is
        begin
          Position := Next (Position);
        end;
      function Next (Container : Vector; Position : Cursor) return Cursor is
        (if Position.Data /= null and then Position.Data /= Container.Handle.Data then raise Program_Error else Next (Position));
      procedure Next (Container : Vector; Position : in out Cursor) is
        begin
          Position := Next (Container, Position);
        end;
      function Previous (Position : Cursor) return Cursor is
        (if not Has_Element (Position) or else Position.Index <= Index_Type'First then No_Element
         else (Position.Data, Position.Index - 1));
      procedure Previous (Position : in out Cursor) is
        begin
          Position := Previous (Position);
        end;
      function Previous (Container : Vector; Position : Cursor) return Cursor is
        (if Position.Data /= null and then Position.Data /= Container.Handle.Data then raise Program_Error else Previous (Position));
      procedure Previous (Container : Vector; Position : in out Cursor) is
        begin
          Position := Previous (Container, Position);
        end;
      function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index is
        begin
          for I in Index .. Last_Of (Container) loop
            if Container.Handle.Data.Elements (I) = Item then return I; end if;
          end loop;
          return No_Index;
        end;
      function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        (To_Cursor (Container, Find_Index (Container, Item, (if Position.Data = null then Index_Type'First else Checked (Container, Position)))));
      function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index is
        begin
          for I in reverse Index_Type'First .. Extended_Index'Min (Index, Last_Of (Container)) loop
            if Container.Handle.Data.Elements (I) = Item then return I; end if;
          end loop;
          return No_Index;
        end;
      function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        (To_Cursor (Container, Reverse_Find_Index (Container, Item, (if Position.Data = null then Index_Type'Last else Checked (Container, Position)))));
      function Contains (Container : Vector; Item : Element_Type) return Boolean is
        (Find_Index (Container, Item) /= No_Index);
      procedure Walk (Container : Vector; Process : not null access procedure (Position : Cursor); Backward : Boolean) is
        Data : constant Shared_Access := Container.Handle.Data;
        begin
          if Data = null then return; end if;
          declare
            Hold : Locked_Counter_Hold (Data.Busy'Access, Mutex (Data));
            begin
              for I in Index_Type'First .. Data.Last loop
                Process ((Data, (if Backward then Data.Last - (I - Index_Type'First) else I)));
              end loop;
            end;
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
        ((Data => Container.Handle.Data, Start => No_Index));
      function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator is
        ((Data => Container.Handle.Data, Start => Checked (Container, Start)));
      function First (Object : Vector_Iterator) return Cursor is
        (if Object.Data = null or else Object.Data.Last < Index_Type'First then No_Element
         elsif Object.Start /= No_Index then (Object.Data, Object.Start)
         else (Object.Data, Index_Type'First));
      function Next (Object : Vector_Iterator; Position : Cursor) return Cursor is
        (if Position.Data /= null and then Position.Data /= Object.Data then raise Program_Error else Next (Position));
      function Last (Object : Vector_Iterator) return Cursor is
        (if Object.Data = null or else Object.Data.Last < Index_Type'First then No_Element
         elsif Object.Start /= No_Index then (Object.Data, Object.Start)
         else (Object.Data, Object.Data.Last));
      function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor is
        (if Position.Data /= null and then Position.Data /= Object.Data then raise Program_Error else Previous (Position));
    end;
    package Raw is new Raw_Layer;
    package Inner is new Raw_Layer;
    package Locked is
      function Has_Element (Position : Cursor) return Boolean;
      function Has_Element (Container : Vector; Position : Cursor) return Boolean;
      function "=" (Left, Right : Vector) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean;
      function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean;
      function "&" (Left, Right : Vector) return Vector;
      function "&" (Left : Vector; Right : Element_Type) return Vector;
      function "&" (Left : Element_Type; Right : Vector) return Vector;
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
      procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1);
      procedure Insert_Space (Container : in out Vector; Before : Extended_Index; Count : Count_Type := 1);
      procedure Insert_Space (Container : in out Vector; Before : Cursor; Position : out Cursor; Count : Count_Type := 1);
      procedure Prepend_Vector (Container : in out Vector; New_Item : Vector);
      procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Append_Vector (Container : in out Vector; New_Item : Vector);
      procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type);
      procedure Append (Container : in out Vector; New_Item : Element_Type);
      procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1);
      procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1);
      procedure Delete_First (Container : in out Vector; Count : Count_Type := 1);
      procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1);
      procedure Reverse_Elements (Container : in out Vector);
      procedure Swap (Container : in out Vector; I, J : Index_Type);
      procedure Swap (Container : in out Vector; I, J : Cursor);
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
      function Iterate (Container : Vector) return Vector_Iterator;
      function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator;
      function First (Object : Vector_Iterator) return Cursor;
      function Next (Object : Vector_Iterator; Position : Cursor) return Cursor;
      function Last (Object : Vector_Iterator) return Cursor;
      function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor;
    end;
    package body Locked is
      function Has_Element (Position : Cursor) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Has_Element (Position));
      function Has_Element (Container : Vector; Position : Cursor) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Has_Element (Container, Position));
      function "=" (Left, Right : Vector) return Boolean is
        (declare Hold_1 : Exclusive_Hold (Lower (Mutex (Left), Mutex (Right))); Hold_2 : Exclusive_Hold (Upper (Mutex (Left), Mutex (Right))); begin Inner."=" (Left, Right));
      function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Tampering_With_Cursors_Prohibited (Container));
      function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Tampering_With_Elements_Prohibited (Container));
      function "&" (Left, Right : Vector) return Vector is
        (declare Hold_1 : Exclusive_Hold (Lower (Mutex (Left), Mutex (Right))); Hold_2 : Exclusive_Hold (Upper (Mutex (Left), Mutex (Right))); begin Inner."&" (Left, Right));
      function "&" (Left : Vector; Right : Element_Type) return Vector is
        (declare Hold : Exclusive_Hold (Mutex (Left)); begin Inner."&" (Left, Right));
      function "&" (Left : Element_Type; Right : Vector) return Vector is
        (declare Hold : Exclusive_Hold (Mutex (Right)); begin Inner."&" (Left, Right));
      function Capacity (Container : Vector) return Count_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Capacity (Container));
      procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Reserve_Capacity (Container, Capacity);
        end;
      function Length (Container : Vector) return Count_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Length (Container));
      procedure Set_Length (Container : in out Vector; Length : Count_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Set_Length (Container, Length);
        end;
      function Is_Empty (Container : Vector) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Is_Empty (Container));
      procedure Clear (Container : in out Vector) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Clear (Container);
        end;
      function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.To_Cursor (Container, Index));
      function To_Index (Position : Cursor) return Extended_Index is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.To_Index (Position));
      function Element (Container : Vector; Index : Index_Type) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Element (Container, Index));
      function Element (Position : Cursor) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Element (Position));
      procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Replace_Element (Container, Index, New_Item);
        end;
      procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Replace_Element (Container, Position, New_Item);
        end;
      function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Constant_Reference (Container, Index);
        end;
      function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Reference (Container, Index);
        end;
      function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Constant_Reference (Container, Position);
        end;
      function Reference (Container : in out Vector; Position : Cursor) return Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Reference (Container, Position);
        end;
      procedure Assign (Target : in out Vector; Source : Vector) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Assign (Target, Source);
        end;
      function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector is
        (declare Hold : Exclusive_Hold (Mutex (Source)); begin Inner.Copy (Source, Capacity));
      procedure Move (Target : in out Vector; Source : in out Vector) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Move (Target, Source);
        end;
      procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Container), Mutex (New_Item)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Container), Mutex (New_Item)));
        begin
          Inner.Insert_Vector (Container, Before, New_Item);
        end;
      procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Container), Mutex (New_Item)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Container), Mutex (New_Item)));
        begin
          Inner.Insert_Vector (Container, Before, New_Item);
        end;
      procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Container), Mutex (New_Item)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Container), Mutex (New_Item)));
        begin
          Inner.Insert_Vector (Container, Before, New_Item, Position);
        end;
      procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Element_Type; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert (Container, Before, New_Item, Count);
        end;
      procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert (Container, Before, New_Item, Count);
        end;
      procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert (Container, Before, New_Item, Position, Count);
        end;
      procedure Insert_Space (Container : in out Vector; Before : Extended_Index; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert_Space (Container, Before, Count);
        end;
      procedure Insert_Space (Container : in out Vector; Before : Cursor; Position : out Cursor; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert_Space (Container, Before, Position, Count);
        end;
      procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Container), Mutex (New_Item)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Container), Mutex (New_Item)));
        begin
          Inner.Prepend_Vector (Container, New_Item);
        end;
      procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Prepend (Container, New_Item, Count);
        end;
      procedure Append_Vector (Container : in out Vector; New_Item : Vector) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Container), Mutex (New_Item)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Container), Mutex (New_Item)));
        begin
          Inner.Append_Vector (Container, New_Item);
        end;
      procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Append (Container, New_Item, Count);
        end;
      procedure Append (Container : in out Vector; New_Item : Element_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Append (Container, New_Item);
        end;
      procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete (Container, Index, Count);
        end;
      procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete (Container, Position, Count);
        end;
      procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete_First (Container, Count);
        end;
      procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete_Last (Container, Count);
        end;
      procedure Reverse_Elements (Container : in out Vector) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Reverse_Elements (Container);
        end;
      procedure Swap (Container : in out Vector; I, J : Index_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Swap (Container, I, J);
        end;
      procedure Swap (Container : in out Vector; I, J : Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Swap (Container, I, J);
        end;
      function First (Container : Vector) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.First (Container));
      function First_Element (Container : Vector) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.First_Element (Container));
      function Last_Index (Container : Vector) return Extended_Index is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Last_Index (Container));
      function Last (Container : Vector) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Last (Container));
      function Last_Element (Container : Vector) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Last_Element (Container));
      function Next (Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Next (Position));
      procedure Next (Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Position.Data));
        begin
          Inner.Next (Position);
        end;
      function Next (Container : Vector; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Next (Container, Position));
      procedure Next (Container : Vector; Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Next (Container, Position);
        end;
      function Previous (Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Previous (Position));
      procedure Previous (Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Position.Data));
        begin
          Inner.Previous (Position);
        end;
      function Previous (Container : Vector; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Previous (Container, Position));
      procedure Previous (Container : Vector; Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Previous (Container, Position);
        end;
      function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Find_Index (Container, Item, Index));
      function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Find (Container, Item, Position));
      function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Reverse_Find_Index (Container, Item, Index));
      function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Reverse_Find (Container, Item, Position));
      function Contains (Container : Vector; Item : Element_Type) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Contains (Container, Item));
      function Iterate (Container : Vector) return Vector_Iterator is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Iterate (Container));
      function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Iterate (Container, Start));
      function First (Object : Vector_Iterator) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.First (Object));
      function Next (Object : Vector_Iterator; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.Next (Object, Position));
      function Last (Object : Vector_Iterator) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.Last (Object));
      function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.Previous (Object, Position));
    end;
    function Has_Element (Position : Cursor) return Boolean is
      (if Task_Safe then Locked.Has_Element (Position) else Raw.Has_Element (Position));
    function Has_Element (Container : Vector; Position : Cursor) return Boolean is
      (if Task_Safe then Locked.Has_Element (Container, Position) else Raw.Has_Element (Container, Position));
    function "=" (Left, Right : Vector) return Boolean is
      (if Task_Safe then Locked."=" (Left, Right) else Raw."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : Vector) return Boolean is
      (if Task_Safe then Locked.Tampering_With_Cursors_Prohibited (Container) else Raw.Tampering_With_Cursors_Prohibited (Container));
    function Tampering_With_Elements_Prohibited (Container : Vector) return Boolean is
      (if Task_Safe then Locked.Tampering_With_Elements_Prohibited (Container) else Raw.Tampering_With_Elements_Prohibited (Container));
    function Maximum_Length return Count_Type is
      (Raw.Maximum_Length);
    function Empty (Capacity : Count_Type := 10) return Vector is
      (Raw.Empty (Capacity));
    function To_Vector (Length : Count_Type) return Vector is
      (Raw.To_Vector (Length));
    function To_Vector (New_Item : Element_Type; Length : Count_Type) return Vector is
      (Raw.To_Vector (New_Item, Length));
    function "&" (Left, Right : Vector) return Vector is
      (if Task_Safe then Locked."&" (Left, Right) else Raw."&" (Left, Right));
    function "&" (Left : Vector; Right : Element_Type) return Vector is
      (if Task_Safe then Locked."&" (Left, Right) else Raw."&" (Left, Right));
    function "&" (Left : Element_Type; Right : Vector) return Vector is
      (if Task_Safe then Locked."&" (Left, Right) else Raw."&" (Left, Right));
    function "&" (Left, Right : Element_Type) return Vector is
      (Raw."&" (Left, Right));
    function Capacity (Container : Vector) return Count_Type is
      (if Task_Safe then Locked.Capacity (Container) else Raw.Capacity (Container));
    procedure Reserve_Capacity (Container : in out Vector; Capacity : Count_Type) is
      begin
        if Task_Safe then Locked.Reserve_Capacity (Container, Capacity); else Raw.Reserve_Capacity (Container, Capacity); end if;
      end;
    function Length (Container : Vector) return Count_Type is
      (if Task_Safe then Locked.Length (Container) else Raw.Length (Container));
    procedure Set_Length (Container : in out Vector; Length : Count_Type) is
      begin
        if Task_Safe then Locked.Set_Length (Container, Length); else Raw.Set_Length (Container, Length); end if;
      end;
    function Is_Empty (Container : Vector) return Boolean is
      (if Task_Safe then Locked.Is_Empty (Container) else Raw.Is_Empty (Container));
    procedure Clear (Container : in out Vector) is
      begin
        if Task_Safe then Locked.Clear (Container); else Raw.Clear (Container); end if;
      end;
    function To_Cursor (Container : Vector; Index : Extended_Index) return Cursor is
      (if Task_Safe then Locked.To_Cursor (Container, Index) else Raw.To_Cursor (Container, Index));
    function To_Index (Position : Cursor) return Extended_Index is
      (if Task_Safe then Locked.To_Index (Position) else Raw.To_Index (Position));
    function Element (Container : Vector; Index : Index_Type) return Element_Type is
      (if Task_Safe then Locked.Element (Container, Index) else Raw.Element (Container, Index));
    function Element (Position : Cursor) return Element_Type is
      (if Task_Safe then Locked.Element (Position) else Raw.Element (Position));
    procedure Replace_Element (Container : in out Vector; Index : Index_Type; New_Item : Element_Type) is
      begin
        if Task_Safe then Locked.Replace_Element (Container, Index, New_Item); else Raw.Replace_Element (Container, Index, New_Item); end if;
      end;
    procedure Replace_Element (Container : in out Vector; Position : Cursor; New_Item : Element_Type) is
      begin
        if Task_Safe then Locked.Replace_Element (Container, Position, New_Item); else Raw.Replace_Element (Container, Position, New_Item); end if;
      end;
    procedure Query_Element (Container : Vector; Index : Index_Type; Process : not null access procedure (Element : Element_Type)) is
      begin
        Raw.Query_Element (Container, Index, Process);
      end;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) is
      begin
        Raw.Query_Element (Position, Process);
      end;
    procedure Update_Element (Container : in out Vector; Index : Index_Type; Process : not null access procedure (Element : in out Element_Type)) is
      begin
        Raw.Update_Element (Container, Index, Process);
      end;
    procedure Update_Element (Container : in out Vector; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) is
      begin
        Raw.Update_Element (Container, Position, Process);
      end;
    function Constant_Reference (Container : Vector; Index : Index_Type) return Constant_Reference_Type is
      (if Task_Safe then Locked.Constant_Reference (Container, Index) else Raw.Constant_Reference (Container, Index));
    function Reference (Container : in out Vector; Index : Index_Type) return Reference_Type is
      (if Task_Safe then Locked.Reference (Container, Index) else Raw.Reference (Container, Index));
    function Constant_Reference (Container : Vector; Position : Cursor) return Constant_Reference_Type is
      (if Task_Safe then Locked.Constant_Reference (Container, Position) else Raw.Constant_Reference (Container, Position));
    function Reference (Container : in out Vector; Position : Cursor) return Reference_Type is
      (if Task_Safe then Locked.Reference (Container, Position) else Raw.Reference (Container, Position));
    procedure Assign (Target : in out Vector; Source : Vector) is
      begin
        if Task_Safe then Locked.Assign (Target, Source); else Raw.Assign (Target, Source); end if;
      end;
    function Copy (Source : Vector; Capacity : Count_Type := 0) return Vector is
      (if Task_Safe then Locked.Copy (Source, Capacity) else Raw.Copy (Source, Capacity));
    procedure Move (Target : in out Vector; Source : in out Vector) is
      begin
        if Task_Safe then Locked.Move (Target, Source); else Raw.Move (Target, Source); end if;
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Extended_Index; New_Item : Vector) is
      begin
        if Task_Safe then Locked.Insert_Vector (Container, Before, New_Item); else Raw.Insert_Vector (Container, Before, New_Item); end if;
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector) is
      begin
        if Task_Safe then Locked.Insert_Vector (Container, Before, New_Item); else Raw.Insert_Vector (Container, Before, New_Item); end if;
      end;
    procedure Insert_Vector (Container : in out Vector; Before : Cursor; New_Item : Vector; Position : out Cursor) is
      begin
        if Task_Safe then Locked.Insert_Vector (Container, Before, New_Item, Position); else Raw.Insert_Vector (Container, Before, New_Item, Position); end if;
      end;
    procedure Insert (Container : in out Vector; Before : Extended_Index; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert (Container, Before, New_Item, Count); else Raw.Insert (Container, Before, New_Item, Count); end if;
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert (Container, Before, New_Item, Count); else Raw.Insert (Container, Before, New_Item, Count); end if;
      end;
    procedure Insert (Container : in out Vector; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert (Container, Before, New_Item, Position, Count); else Raw.Insert (Container, Before, New_Item, Position, Count); end if;
      end;
    procedure Insert_Space (Container : in out Vector; Before : Extended_Index; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert_Space (Container, Before, Count); else Raw.Insert_Space (Container, Before, Count); end if;
      end;
    procedure Insert_Space (Container : in out Vector; Before : Cursor; Position : out Cursor; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert_Space (Container, Before, Position, Count); else Raw.Insert_Space (Container, Before, Position, Count); end if;
      end;
    procedure Prepend_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        if Task_Safe then Locked.Prepend_Vector (Container, New_Item); else Raw.Prepend_Vector (Container, New_Item); end if;
      end;
    procedure Prepend (Container : in out Vector; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Prepend (Container, New_Item, Count); else Raw.Prepend (Container, New_Item, Count); end if;
      end;
    procedure Append_Vector (Container : in out Vector; New_Item : Vector) is
      begin
        if Task_Safe then Locked.Append_Vector (Container, New_Item); else Raw.Append_Vector (Container, New_Item); end if;
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type; Count : Count_Type) is
      begin
        if Task_Safe then Locked.Append (Container, New_Item, Count); else Raw.Append (Container, New_Item, Count); end if;
      end;
    procedure Append (Container : in out Vector; New_Item : Element_Type) is
      begin
        if Task_Safe then Locked.Append (Container, New_Item); else Raw.Append (Container, New_Item); end if;
      end;
    procedure Delete (Container : in out Vector; Index : Extended_Index; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete (Container, Index, Count); else Raw.Delete (Container, Index, Count); end if;
      end;
    procedure Delete (Container : in out Vector; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete (Container, Position, Count); else Raw.Delete (Container, Position, Count); end if;
      end;
    procedure Delete_First (Container : in out Vector; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete_First (Container, Count); else Raw.Delete_First (Container, Count); end if;
      end;
    procedure Delete_Last (Container : in out Vector; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete_Last (Container, Count); else Raw.Delete_Last (Container, Count); end if;
      end;
    procedure Reverse_Elements (Container : in out Vector) is
      begin
        if Task_Safe then Locked.Reverse_Elements (Container); else Raw.Reverse_Elements (Container); end if;
      end;
    procedure Swap (Container : in out Vector; I, J : Index_Type) is
      begin
        if Task_Safe then Locked.Swap (Container, I, J); else Raw.Swap (Container, I, J); end if;
      end;
    procedure Swap (Container : in out Vector; I, J : Cursor) is
      begin
        if Task_Safe then Locked.Swap (Container, I, J); else Raw.Swap (Container, I, J); end if;
      end;
    function First_Index (Container : Vector) return Index_Type is
      (Raw.First_Index (Container));
    function First (Container : Vector) return Cursor is
      (if Task_Safe then Locked.First (Container) else Raw.First (Container));
    function First_Element (Container : Vector) return Element_Type is
      (if Task_Safe then Locked.First_Element (Container) else Raw.First_Element (Container));
    function Last_Index (Container : Vector) return Extended_Index is
      (if Task_Safe then Locked.Last_Index (Container) else Raw.Last_Index (Container));
    function Last (Container : Vector) return Cursor is
      (if Task_Safe then Locked.Last (Container) else Raw.Last (Container));
    function Last_Element (Container : Vector) return Element_Type is
      (if Task_Safe then Locked.Last_Element (Container) else Raw.Last_Element (Container));
    function Next (Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Next (Position) else Raw.Next (Position));
    procedure Next (Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Next (Position); else Raw.Next (Position); end if;
      end;
    function Next (Container : Vector; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Next (Container, Position) else Raw.Next (Container, Position));
    procedure Next (Container : Vector; Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Next (Container, Position); else Raw.Next (Container, Position); end if;
      end;
    function Previous (Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Previous (Position) else Raw.Previous (Position));
    procedure Previous (Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Previous (Position); else Raw.Previous (Position); end if;
      end;
    function Previous (Container : Vector; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Previous (Container, Position) else Raw.Previous (Container, Position));
    procedure Previous (Container : Vector; Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Previous (Container, Position); else Raw.Previous (Container, Position); end if;
      end;
    function Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index is
      (if Task_Safe then Locked.Find_Index (Container, Item, Index) else Raw.Find_Index (Container, Item, Index));
    function Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      (if Task_Safe then Locked.Find (Container, Item, Position) else Raw.Find (Container, Item, Position));
    function Reverse_Find_Index (Container : Vector; Item : Element_Type; Index : Index_Type := Index_Type'Last) return Extended_Index is
      (if Task_Safe then Locked.Reverse_Find_Index (Container, Item, Index) else Raw.Reverse_Find_Index (Container, Item, Index));
    function Reverse_Find (Container : Vector; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      (if Task_Safe then Locked.Reverse_Find (Container, Item, Position) else Raw.Reverse_Find (Container, Item, Position));
    function Contains (Container : Vector; Item : Element_Type) return Boolean is
      (if Task_Safe then Locked.Contains (Container, Item) else Raw.Contains (Container, Item));
    procedure Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      begin
        Raw.Iterate (Container, Process);
      end;
    procedure Reverse_Iterate (Container : Vector; Process : not null access procedure (Position : Cursor)) is
      begin
        Raw.Reverse_Iterate (Container, Process);
      end;
    function Iterate (Container : Vector) return Vector_Iterator is
      (if Task_Safe then Locked.Iterate (Container) else Raw.Iterate (Container));
    function Iterate (Container : Vector; Start : Cursor) return Vector_Iterator is
      (if Task_Safe then Locked.Iterate (Container, Start) else Raw.Iterate (Container, Start));
    function First (Object : Vector_Iterator) return Cursor is
      (if Task_Safe then Locked.First (Object) else Raw.First (Object));
    function Next (Object : Vector_Iterator; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Next (Object, Position) else Raw.Next (Object, Position));
    function Last (Object : Vector_Iterator) return Cursor is
      (if Task_Safe then Locked.Last (Object) else Raw.Last (Object));
    function Previous (Object : Vector_Iterator; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Previous (Object, Position) else Raw.Previous (Object, Position));
    package body Generic_Sorting is
      function Sorted (Container : Vector) return Boolean is
        (for all I in Index_Type'First .. Last_Of (Container) - 1 =>
           not (Item (Container.Handle.Data, I + 1).all < Item (Container.Handle.Data, I).all));
      procedure Sort_Storage (Container : in out Vector) is
        Data : constant Shared_Access := Container.Handle.Data;
        function Precedes (Left, Right : Index_Type) return Boolean is (Item (Data, Left).all < Item (Data, Right).all);
        procedure Exchange (Left, Right : Index_Type) is
          begin
            Exchange (Data, Left, Right);
          end;
        procedure Sort_Range is new Generic_Sort (Index_Type, Precedes, Exchange);
        begin
          Raw.Check_Cursors (Container);
          if Data /= null then Sort_Range (Index_Type'First, Data.Last); end if;
        end;
      procedure Merge_Storage (Target : in out Vector; Source : in out Vector) is
        I : Extended_Index := Last_Of (Target);
        J : Extended_Index := Last_Of (Source);
        begin
          if Target.Handle.Data = Source.Handle.Data or else J < Index_Type'First then return; end if;
          Raw.Check_Cursors (Target);
          Raw.Check_Cursors (Source);
          Raw.Reserve_Capacity (Target, Raw.Length (Target) + Raw.Length (Source));
          Target.Handle.Data.Last := Index_After (Raw.Length (Target) + Raw.Length (Source));
          for K in reverse Index_Type'First .. Target.Handle.Data.Last loop
            exit when J < Index_Type'First;
            if I < Index_Type'First or else not (Item (Source.Handle.Data, J).all < Item (Target.Handle.Data, I).all) then
              Target.Handle.Data.Elements (K) := Source.Handle.Data.Elements (J);
              J := J - 1;
            else
              Target.Handle.Data.Elements (K) := Target.Handle.Data.Elements (I);
              I := I - 1;
            end if;
          end loop;
          Source.Handle.Data.Last := No_Index;
        end;
      function Is_Sorted (Container : Vector) return Boolean is
        (if Task_Safe then (declare Hold : Exclusive_Hold (Mutex (Container)); begin Sorted (Container)) else Sorted (Container));
      procedure Sort (Container : in out Vector) is
        begin
          if not Task_Safe then Sort_Storage (Container); return; end if;
          declare Hold : Exclusive_Hold (Mutex (Container)); begin Sort_Storage (Container); end;
        end;
      procedure Merge (Target : in out Vector; Source : in out Vector) is
        begin
          if not Task_Safe then Merge_Storage (Target, Source); return; end if;
          declare Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source))); Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source))); begin Merge_Storage (Target, Source); end;
        end;
    end;
  end;
  package body List_Core is
    procedure Free is new Unchecked_Deallocation (Node_Type, Node_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    function Item (Node : Node_Access) return Element_Pointer is (Target (Node.Element'Access));
    procedure Ensure (Container : in out List) is
      begin
        if Container.Handle.Data = null then Container.Handle.Data := new Shared; end if;
      end;
    function Mutex (Data : Shared_Access) return Exclusive_Lock_Access is (if Data = null then null else Data.Mutex);
    function Mutex (Container : List) return Exclusive_Lock_Access is (Mutex (Container.Handle.Data));
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
    function Fresh (New_Item : Element_Type) return Node_Access is
      Node : constant Node_Access := new Node_Type;
      begin
        Store (Node.Element, New_Item);
        return Node;
      end;
    procedure Dispose (Node : in out Node_Access) is
      begin
        if Indirect then Release (Node.Element); end if;
        Free (Node);
      end;
    procedure Release_Nodes (Data : Shared_Access) is
      Node : Node_Access := Data.First;
      Next : Node_Access;
      begin
        while Node /= null loop
          Next := Node.Next;
          Dispose (Node);
          Node := Next;
        end loop;
        Data.all := (Mutex => Data.Mutex, others => <>);
      end;
    procedure Initialize (Handle : in out Guard) is
      begin
        if Task_Safe then Handle.Data := new Shared; end if;
      end;
    procedure Adjust (Handle : in out Guard) is
      Source : constant Shared_Access := Handle.Data;
      Node   : Node_Access;
      begin
        Handle.Data := null;
        if Source /= null and then Source.Length > 0 then
          Handle.Data := new Shared;
          Node := Source.First;
          while Node /= null loop
            Link (Handle.Data, null, Fresh (Item (Node).all));
            Node := Node.Next;
          end loop;
        elsif Task_Safe then
          Handle.Data := new Shared;
        end if;
      end;
    procedure Finalize (Handle : in out Guard) is
      begin
        if Handle.Data /= null then
          Release_Nodes (Handle.Data);
          if Task_Safe then Free (Handle.Data.Mutex); end if;
          Free (Handle.Data);
        end if;
      end;
    generic
    package Raw_Layer is
      function Has_Element (Position : Cursor) return Boolean;
      function Has_Element (Container : List; Position : Cursor) return Boolean;
      function "=" (Left, Right : List) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : List) return Boolean;
      function Tampering_With_Elements_Prohibited (Container : List) return Boolean;
      function Empty (Capacity : Count_Type := 10) return List;
      function Capacity (Container : List) return Count_Type;
      function Length (Container : List) return Count_Type;
      function Is_Empty (Container : List) return Boolean;
      procedure Clear (Container : in out List);
      function Element (Position : Cursor) return Element_Type;
      procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type);
      procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type));
      procedure Update_Element (Container : in out List; Position : Cursor; Process : not null access procedure (Element : in out Element_Type));
      function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type;
      function Reference (Container : in out List; Position : Cursor) return Reference_Type;
      procedure Assign (Target : in out List; Source : List);
      function Copy (Source : List; Capacity : Count_Type := 0) return List;
      procedure Move (Target : in out List; Source : in out List);
      procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1);
      procedure Insert (Container : in out List; Before : Cursor; Position : out Cursor; Count : Count_Type := 1);
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
      procedure Splice (Target : in out List; Before : Cursor; Source : in out List; Position : in out Cursor);
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
      function First (Object : List_Iterator) return Cursor;
      function Next (Object : List_Iterator; Position : Cursor) return Cursor;
      function Last (Object : List_Iterator) return Cursor;
      function Previous (Object : List_Iterator; Position : Cursor) return Cursor;
      procedure Check_Cursors (Container : List);
      procedure Check_Room (Container : List; Count : Count_Type);
    end;
    package body Raw_Layer is
      procedure Check_Cursors (Container : List) is
        begin
          if Tampering_With_Cursors_Prohibited (Container) then raise Program_Error; end if;
        end;
      procedure Check_Elements (Container : List) is
        begin
          if Tampering_With_Elements_Prohibited (Container) then raise Program_Error; end if;
        end;
      function Checked (Container : List; Position : Cursor) return Node_Access is
        (if Position.Node = null then raise Constraint_Error
         elsif Position.Data /= Container.Handle.Data then raise Program_Error
         else Position.Node);
      procedure Check_Before (Container : List; Before : Cursor) is
        begin
          if Before.Node /= null and then Before.Data /= Container.Handle.Data then raise Program_Error; end if;
        end;
      procedure Check_Room (Container : List; Count : Count_Type) is
        begin
          if Bounded and then Length (Container) + Count > Container.Bound then raise Capacity_Error; end if;
        end;
      function Has_Element (Position : Cursor) return Boolean is (Position.Node /= null);
      function Has_Element (Container : List; Position : Cursor) return Boolean is
        (Position.Node /= null and then Position.Data = Container.Handle.Data);
      function "=" (Left, Right : List) return Boolean is
        L : Node_Access := (if Left.Handle.Data = null then null else Left.Handle.Data.First);
        R : Node_Access := (if Right.Handle.Data = null then null else Right.Handle.Data.First);
        begin
          if Length (Left) /= Length (Right) then return False; end if;
          while L /= null loop
            if not (L.Element = Item (R).all) then return False; end if;
            L := L.Next;
            R := R.Next;
          end loop;
          return True;
        end;
      function Tampering_With_Cursors_Prohibited (Container : List) return Boolean is
        (Container.Handle.Data /= null and then (Container.Handle.Data.Busy > 0 or else Container.Handle.Data.Lock > 0));
      function Tampering_With_Elements_Prohibited (Container : List) return Boolean is
        (Container.Handle.Data /= null and then Container.Handle.Data.Lock > 0);
      function Empty (Capacity : Count_Type := 10) return List is
        Result : List (if Bounded then Capacity else 0);
        begin
          return Result;
        end;
      function Capacity (Container : List) return Count_Type is (Container.Bound);
      function Length (Container : List) return Count_Type is
        (if Container.Handle.Data = null then 0 else Container.Handle.Data.Length);
      function Is_Empty (Container : List) return Boolean is (Length (Container) = 0);
      procedure Clear (Container : in out List) is
        begin
          Check_Cursors (Container);
          if Container.Handle.Data /= null then Release_Nodes (Container.Handle.Data); end if;
        end;
      function Element (Position : Cursor) return Element_Type is
        (if Position.Node = null then raise Constraint_Error else Item (Position.Node).all);
      procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) is
        Node : constant Node_Access := Checked (Container, Position);
        begin
          Check_Elements (Container);
          Put (Node.Element, New_Item);
        end;
      procedure Query_Element (Position : Cursor;
                               Process  : not null access procedure (Element : Element_Type)) is
        Hold : Locked_Counter_Hold (Position.Data.Lock'Access, Mutex (Position.Data));
        begin
          if Position.Node = null then raise Constraint_Error; end if;
          Process (Item (Position.Node).all);
        end;
      procedure Update_Element (Container : in out List;
                                Position  : Cursor;
                                Process   : not null access procedure (Element : in out Element_Type)) is
        Hold : Locked_Counter_Hold (Position.Data.Lock'Access, Mutex (Position.Data));
        Node : constant Node_Access := Checked (Container, Position);
        begin
          Process (Item (Node).all);
        end;
      function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type is
        ((Element => Item (Checked (Container, Position)).all'Access));
      function Reference (Container : in out List; Position : Cursor) return Reference_Type is
        ((Element => Item (Checked (Container, Position)).all'Access));
      procedure Assign (Target : in out List; Source : List) is
        Node : Node_Access;
        begin
          if Target.Handle.Data = Source.Handle.Data then return; end if;
          Check_Cursors (Target);
          if Bounded and then Length (Source) > Target.Bound then raise Capacity_Error; end if;
          Clear (Target);
          if Length (Source) = 0 then return; end if;
          Ensure (Target);
          Node := Source.Handle.Data.First;
          while Node /= null loop
            Link (Target.Handle.Data, null, Fresh (Item (Node).all));
            Node := Node.Next;
          end loop;
        end;
      function Copy (Source : List; Capacity : Count_Type := 0) return List is
        Result : List := Empty (if Capacity /= 0 and then Capacity < Length (Source) then raise Capacity_Error
                                else Count_Type'Max (Capacity, Length (Source)));
        begin
          Assign (Result, Source);
          return Result;
        end;
      procedure Move (Target : in out List; Source : in out List) is
        begin
          if Target.Handle.Data = Source.Handle.Data then return; end if;
          Check_Cursors (Target);
          Check_Cursors (Source);
          if Bounded and then Length (Source) > Target.Bound then raise Capacity_Error; end if;
          Clear (Target);
          if Source.Handle.Data = null then return; end if;
          Ensure (Target);
          Target.Handle.Data.all := (Source.Handle.Data.First, Source.Handle.Data.Last, Source.Handle.Data.Length, 0, 0, Target.Handle.Data.Mutex);
          Source.Handle.Data.all := (Mutex => Source.Handle.Data.Mutex, others => <>);
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
          Check_Room (Container, Count);
          Position := Before;
          if Count = 0 then return; end if;
          Ensure (Container);
          for I in 1 .. Count loop
            Node := Fresh (New_Item);
            Link (Container.Handle.Data, Before.Node, Node);
            if I = 1 then Position := (Container.Handle.Data, Node); end if;
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
          Check_Room (Container, Count);
          Position := Before;
          if Count = 0 then return; end if;
          Ensure (Container);
          for I in 1 .. Count loop
            Node := new Node_Type;
            Link (Container.Handle.Data, Before.Node, Node);
            if I = 1 then Position := (Container.Handle.Data, Node); end if;
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
          Check_Room (Container, 1);
          Ensure (Container);
          Link (Container.Handle.Data, null, Fresh (New_Item));
        end;
      procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) is
        Node : Node_Access := Checked (Container, Position);
        Next : Node_Access;
        begin
          Check_Cursors (Container);
          for I in 1 .. Count loop
            exit when Node = null;
            Next := Node.Next;
            Unlink (Container.Handle.Data, Node);
            Dispose (Node);
            Node := Next;
          end loop;
          Position := No_Element;
        end;
      procedure Delete_First (Container : in out List; Count : Count_Type := 1) is
        Position : Cursor := First (Container);
        begin
          if Count > 0 and then Position.Node /= null then Delete (Container, Position, Count); end if;
        end;
      procedure Delete_Last (Container : in out List; Count : Count_Type := 1) is
        Node : Node_Access;
        begin
          if Count = 0 or else Length (Container) = 0 then return; end if;
          Check_Cursors (Container);
          for I in 1 .. Count loop
            Node := Container.Handle.Data.Last;
            exit when Node = null;
            Unlink (Container.Handle.Data, Node);
            Dispose (Node);
          end loop;
        end;
      procedure Reverse_Elements (Container : in out List) is
        Node : Node_Access;
        Next : Node_Access;
        begin
          if Length (Container) < 2 then return; end if;
          Check_Cursors (Container);
          Node := Container.Handle.Data.First;
          while Node /= null loop
            Next := Node.Next;
            Node.Next := Node.Previous;
            Node.Previous := Next;
            Node := Next;
          end loop;
          Node := Container.Handle.Data.First;
          Container.Handle.Data.First := Container.Handle.Data.Last;
          Container.Handle.Data.Last := Node;
        end;
      procedure Swap (Container : in out List; I, J : Cursor) is
        Left  : constant Node_Access := Checked (Container, I);
        Right : constant Node_Access := Checked (Container, J);
        Held  : constant Stored := Left.Element;
        begin
          Check_Elements (Container);
          Left.Element := Right.Element;
          Right.Element := Held;
        end;
      procedure Swap_Links (Container : in out List; I, J : Cursor) is
        Left    : constant Node_Access := Checked (Container, I);
        Right   : constant Node_Access := Checked (Container, J);
        After_I : constant Node_Access := Left.Next;
        After_J : constant Node_Access := Right.Next;
        begin
          Check_Cursors (Container);
          if Left = Right then
            return;
          elsif After_I = Right then
            Unlink (Container.Handle.Data, Right);
            Link (Container.Handle.Data, Left, Right);
          elsif After_J = Left then
            Unlink (Container.Handle.Data, Left);
            Link (Container.Handle.Data, Right, Left);
          else
            Unlink (Container.Handle.Data, Left);
            Link (Container.Handle.Data, After_J, Left);
            Unlink (Container.Handle.Data, Right);
            Link (Container.Handle.Data, After_I, Right);
          end if;
        end;
      procedure Splice (Target : in out List; Before : Cursor; Source : in out List) is
        Node : Node_Access;
        begin
          if Target.Handle.Data = Source.Handle.Data or else Length (Source) = 0 then return; end if;
          Check_Before (Target, Before);
          Check_Cursors (Target);
          Check_Cursors (Source);
          Check_Room (Target, Length (Source));
          Ensure (Target);
          loop
            Node := Source.Handle.Data.First;
            exit when Node = null;
            Unlink (Source.Handle.Data, Node);
            Link (Target.Handle.Data, Before.Node, Node);
          end loop;
        end;
      procedure Splice (Target   : in out List;
                        Before   : Cursor;
                        Source   : in out List;
                        Position : in out Cursor) is
        begin
          if Target.Handle.Data = Source.Handle.Data then
            Splice (Target, Before, Position);
            return;
          end if;
          Check_Before (Target, Before);
          Check_Cursors (Target);
          Check_Cursors (Source);
          Check_Room (Target, 1);
          Ensure (Target);
          Unlink (Source.Handle.Data, Checked (Source, Position));
          Link (Target.Handle.Data, Before.Node, Position.Node);
          Position := (Target.Handle.Data, Position.Node);
        end;
      procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) is
        Node : constant Node_Access := Checked (Container, Position);
        begin
          Check_Before (Container, Before);
          if Before.Node = Node or else Node.Next = Before.Node then return; end if;
          Check_Cursors (Container);
          Unlink (Container.Handle.Data, Node);
          Link (Container.Handle.Data, Before.Node, Node);
        end;
      function First (Container : List) return Cursor is
        (if Length (Container) = 0 then No_Element else (Container.Handle.Data, Container.Handle.Data.First));
      function First_Element (Container : List) return Element_Type is (Element (First (Container)));
      function Last (Container : List) return Cursor is
        (if Length (Container) = 0 then No_Element else (Container.Handle.Data, Container.Handle.Data.Last));
      function Last_Element (Container : List) return Element_Type is (Element (Last (Container)));
      function Next (Position : Cursor) return Cursor is
        (if Position.Node = null or else Position.Node.Next = null then No_Element else (Position.Data, Position.Node.Next));
      function Previous (Position : Cursor) return Cursor is
        (if Position.Node = null or else Position.Node.Previous = null then No_Element else (Position.Data, Position.Node.Previous));
      procedure Next (Position : in out Cursor) is
        begin
          Position := Next (Position);
        end;
      procedure Previous (Position : in out Cursor) is
        begin
          Position := Previous (Position);
        end;
      function Next (Container : List; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Container.Handle.Data then raise Program_Error else Next (Position));
      function Previous (Container : List; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Container.Handle.Data then raise Program_Error else Previous (Position));
      procedure Next (Container : List; Position : in out Cursor) is
        begin
          Position := Next (Container, Position);
        end;
      procedure Previous (Container : List; Position : in out Cursor) is
        begin
          Position := Previous (Container, Position);
        end;
      function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        Node : Node_Access := (if Position.Node /= null then Checked (Container, Position)
                               elsif Length (Container) = 0 then null else Container.Handle.Data.First);
        begin
          while Node /= null loop
            if Node.Element = Item then return (Container.Handle.Data, Node); end if;
            Node := Node.Next;
          end loop;
          return No_Element;
        end;
      function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        Node : Node_Access := (if Position.Node /= null then Checked (Container, Position)
                               elsif Length (Container) = 0 then null else Container.Handle.Data.Last);
        begin
          while Node /= null loop
            if Node.Element = Item then return (Container.Handle.Data, Node); end if;
            Node := Node.Previous;
          end loop;
          return No_Element;
        end;
      function Contains (Container : List; Item : Element_Type) return Boolean is (Find (Container, Item) /= No_Element);
      procedure Walk (Container : List; Process : not null access procedure (Position : Cursor); Backward : Boolean) is
        Data : constant Shared_Access := Container.Handle.Data;
        Node : Node_Access;
        begin
          if Data = null then return; end if;
          declare
            Hold : Locked_Counter_Hold (Data.Busy'Access, Mutex (Data));
            begin
              Node := (if Backward then Data.Last else Data.First);
              while Node /= null loop
                Process ((Data, Node));
                Node := (if Backward then Node.Previous else Node.Next);
              end loop;
            end;
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
        ((Data => Container.Handle.Data, Start => null));
      function Iterate (Container : List; Start : Cursor) return List_Iterator is
        ((Data => Container.Handle.Data, Start => Checked (Container, Start)));
      function First (Object : List_Iterator) return Cursor is
        (if Object.Start /= null then (Object.Data, Object.Start)
         elsif Object.Data = null or else Object.Data.First = null then No_Element
         else (Object.Data, Object.Data.First));
      function Next (Object : List_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Next (Position));
      function Last (Object : List_Iterator) return Cursor is
        (if Object.Start /= null then (Object.Data, Object.Start)
         elsif Object.Data = null or else Object.Data.Last = null then No_Element
         else (Object.Data, Object.Data.Last));
      function Previous (Object : List_Iterator; Position : Cursor) return Cursor is
        (if Position.Node /= null and then Position.Data /= Object.Data then raise Program_Error else Previous (Position));
    end;
    package Raw is new Raw_Layer;
    package Inner is new Raw_Layer;
    package Locked is
      function Has_Element (Position : Cursor) return Boolean;
      function Has_Element (Container : List; Position : Cursor) return Boolean;
      function "=" (Left, Right : List) return Boolean;
      function Tampering_With_Cursors_Prohibited (Container : List) return Boolean;
      function Tampering_With_Elements_Prohibited (Container : List) return Boolean;
      function Capacity (Container : List) return Count_Type;
      function Length (Container : List) return Count_Type;
      function Is_Empty (Container : List) return Boolean;
      procedure Clear (Container : in out List);
      function Element (Position : Cursor) return Element_Type;
      procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type);
      function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type;
      function Reference (Container : in out List; Position : Cursor) return Reference_Type;
      procedure Assign (Target : in out List; Source : List);
      function Copy (Source : List; Capacity : Count_Type := 0) return List;
      procedure Move (Target : in out List; Source : in out List);
      procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1);
      procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1);
      procedure Insert (Container : in out List; Before : Cursor; Position : out Cursor; Count : Count_Type := 1);
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
      procedure Splice (Target : in out List; Before : Cursor; Source : in out List; Position : in out Cursor);
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
      function Iterate (Container : List) return List_Iterator;
      function Iterate (Container : List; Start : Cursor) return List_Iterator;
      function First (Object : List_Iterator) return Cursor;
      function Next (Object : List_Iterator; Position : Cursor) return Cursor;
      function Last (Object : List_Iterator) return Cursor;
      function Previous (Object : List_Iterator; Position : Cursor) return Cursor;
    end;
    package body Locked is
      function Has_Element (Position : Cursor) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Has_Element (Position));
      function Has_Element (Container : List; Position : Cursor) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Has_Element (Container, Position));
      function "=" (Left, Right : List) return Boolean is
        (declare Hold_1 : Exclusive_Hold (Lower (Mutex (Left), Mutex (Right))); Hold_2 : Exclusive_Hold (Upper (Mutex (Left), Mutex (Right))); begin Inner."=" (Left, Right));
      function Tampering_With_Cursors_Prohibited (Container : List) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Tampering_With_Cursors_Prohibited (Container));
      function Tampering_With_Elements_Prohibited (Container : List) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Tampering_With_Elements_Prohibited (Container));
      function Capacity (Container : List) return Count_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Capacity (Container));
      function Length (Container : List) return Count_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Length (Container));
      function Is_Empty (Container : List) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Is_Empty (Container));
      procedure Clear (Container : in out List) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Clear (Container);
        end;
      function Element (Position : Cursor) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Element (Position));
      procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Replace_Element (Container, Position, New_Item);
        end;
      function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Constant_Reference (Container, Position);
        end;
      function Reference (Container : in out List; Position : Cursor) return Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Reference (Container, Position);
        end;
      procedure Assign (Target : in out List; Source : List) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Assign (Target, Source);
        end;
      function Copy (Source : List; Capacity : Count_Type := 0) return List is
        (declare Hold : Exclusive_Hold (Mutex (Source)); begin Inner.Copy (Source, Capacity));
      procedure Move (Target : in out List; Source : in out List) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Move (Target, Source);
        end;
      procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert (Container, Before, New_Item, Count);
        end;
      procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert (Container, Before, New_Item, Position, Count);
        end;
      procedure Insert (Container : in out List; Before : Cursor; Position : out Cursor; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Insert (Container, Before, Position, Count);
        end;
      procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Prepend (Container, New_Item, Count);
        end;
      procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Append (Container, New_Item, Count);
        end;
      procedure Append (Container : in out List; New_Item : Element_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Append (Container, New_Item);
        end;
      procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete (Container, Position, Count);
        end;
      procedure Delete_First (Container : in out List; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete_First (Container, Count);
        end;
      procedure Delete_Last (Container : in out List; Count : Count_Type := 1) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Delete_Last (Container, Count);
        end;
      procedure Reverse_Elements (Container : in out List) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Reverse_Elements (Container);
        end;
      procedure Swap (Container : in out List; I, J : Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Swap (Container, I, J);
        end;
      procedure Swap_Links (Container : in out List; I, J : Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Swap_Links (Container, I, J);
        end;
      procedure Splice (Target : in out List; Before : Cursor; Source : in out List) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Splice (Target, Before, Source);
        end;
      procedure Splice (Target : in out List; Before : Cursor; Source : in out List; Position : in out Cursor) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Splice (Target, Before, Source, Position);
        end;
      procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Splice (Container, Before, Position);
        end;
      function First (Container : List) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.First (Container));
      function First_Element (Container : List) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.First_Element (Container));
      function Last (Container : List) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Last (Container));
      function Last_Element (Container : List) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Last_Element (Container));
      function Next (Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Next (Position));
      function Previous (Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Position.Data)); begin Inner.Previous (Position));
      procedure Next (Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Position.Data));
        begin
          Inner.Next (Position);
        end;
      procedure Previous (Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Position.Data));
        begin
          Inner.Previous (Position);
        end;
      function Next (Container : List; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Next (Container, Position));
      function Previous (Container : List; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Previous (Container, Position));
      procedure Next (Container : List; Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Next (Container, Position);
        end;
      procedure Previous (Container : List; Position : in out Cursor) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Previous (Container, Position);
        end;
      function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Find (Container, Item, Position));
      function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Reverse_Find (Container, Item, Position));
      function Contains (Container : List; Item : Element_Type) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Contains (Container, Item));
      function Iterate (Container : List) return List_Iterator is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Iterate (Container));
      function Iterate (Container : List; Start : Cursor) return List_Iterator is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Iterate (Container, Start));
      function First (Object : List_Iterator) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.First (Object));
      function Next (Object : List_Iterator; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.Next (Object, Position));
      function Last (Object : List_Iterator) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.Last (Object));
      function Previous (Object : List_Iterator; Position : Cursor) return Cursor is
        (declare Hold : Exclusive_Hold (Mutex (Object.Data)); begin Inner.Previous (Object, Position));
    end;
    function Has_Element (Position : Cursor) return Boolean is
      (if Task_Safe then Locked.Has_Element (Position) else Raw.Has_Element (Position));
    function Has_Element (Container : List; Position : Cursor) return Boolean is
      (if Task_Safe then Locked.Has_Element (Container, Position) else Raw.Has_Element (Container, Position));
    function "=" (Left, Right : List) return Boolean is
      (if Task_Safe then Locked."=" (Left, Right) else Raw."=" (Left, Right));
    function Tampering_With_Cursors_Prohibited (Container : List) return Boolean is
      (if Task_Safe then Locked.Tampering_With_Cursors_Prohibited (Container) else Raw.Tampering_With_Cursors_Prohibited (Container));
    function Tampering_With_Elements_Prohibited (Container : List) return Boolean is
      (if Task_Safe then Locked.Tampering_With_Elements_Prohibited (Container) else Raw.Tampering_With_Elements_Prohibited (Container));
    function Empty (Capacity : Count_Type := 10) return List is
      (Raw.Empty (Capacity));
    function Capacity (Container : List) return Count_Type is
      (if Task_Safe then Locked.Capacity (Container) else Raw.Capacity (Container));
    function Length (Container : List) return Count_Type is
      (if Task_Safe then Locked.Length (Container) else Raw.Length (Container));
    function Is_Empty (Container : List) return Boolean is
      (if Task_Safe then Locked.Is_Empty (Container) else Raw.Is_Empty (Container));
    procedure Clear (Container : in out List) is
      begin
        if Task_Safe then Locked.Clear (Container); else Raw.Clear (Container); end if;
      end;
    function Element (Position : Cursor) return Element_Type is
      (if Task_Safe then Locked.Element (Position) else Raw.Element (Position));
    procedure Replace_Element (Container : in out List; Position : Cursor; New_Item : Element_Type) is
      begin
        if Task_Safe then Locked.Replace_Element (Container, Position, New_Item); else Raw.Replace_Element (Container, Position, New_Item); end if;
      end;
    procedure Query_Element (Position : Cursor; Process : not null access procedure (Element : Element_Type)) is
      begin
        Raw.Query_Element (Position, Process);
      end;
    procedure Update_Element (Container : in out List; Position : Cursor; Process : not null access procedure (Element : in out Element_Type)) is
      begin
        Raw.Update_Element (Container, Position, Process);
      end;
    function Constant_Reference (Container : List; Position : Cursor) return Constant_Reference_Type is
      (if Task_Safe then Locked.Constant_Reference (Container, Position) else Raw.Constant_Reference (Container, Position));
    function Reference (Container : in out List; Position : Cursor) return Reference_Type is
      (if Task_Safe then Locked.Reference (Container, Position) else Raw.Reference (Container, Position));
    procedure Assign (Target : in out List; Source : List) is
      begin
        if Task_Safe then Locked.Assign (Target, Source); else Raw.Assign (Target, Source); end if;
      end;
    function Copy (Source : List; Capacity : Count_Type := 0) return List is
      (if Task_Safe then Locked.Copy (Source, Capacity) else Raw.Copy (Source, Capacity));
    procedure Move (Target : in out List; Source : in out List) is
      begin
        if Task_Safe then Locked.Move (Target, Source); else Raw.Move (Target, Source); end if;
      end;
    procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert (Container, Before, New_Item, Count); else Raw.Insert (Container, Before, New_Item, Count); end if;
      end;
    procedure Insert (Container : in out List; Before : Cursor; New_Item : Element_Type; Position : out Cursor; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert (Container, Before, New_Item, Position, Count); else Raw.Insert (Container, Before, New_Item, Position, Count); end if;
      end;
    procedure Insert (Container : in out List; Before : Cursor; Position : out Cursor; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Insert (Container, Before, Position, Count); else Raw.Insert (Container, Before, Position, Count); end if;
      end;
    procedure Prepend (Container : in out List; New_Item : Element_Type; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Prepend (Container, New_Item, Count); else Raw.Prepend (Container, New_Item, Count); end if;
      end;
    procedure Append (Container : in out List; New_Item : Element_Type; Count : Count_Type) is
      begin
        if Task_Safe then Locked.Append (Container, New_Item, Count); else Raw.Append (Container, New_Item, Count); end if;
      end;
    procedure Append (Container : in out List; New_Item : Element_Type) is
      begin
        if Task_Safe then Locked.Append (Container, New_Item); else Raw.Append (Container, New_Item); end if;
      end;
    procedure Delete (Container : in out List; Position : in out Cursor; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete (Container, Position, Count); else Raw.Delete (Container, Position, Count); end if;
      end;
    procedure Delete_First (Container : in out List; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete_First (Container, Count); else Raw.Delete_First (Container, Count); end if;
      end;
    procedure Delete_Last (Container : in out List; Count : Count_Type := 1) is
      begin
        if Task_Safe then Locked.Delete_Last (Container, Count); else Raw.Delete_Last (Container, Count); end if;
      end;
    procedure Reverse_Elements (Container : in out List) is
      begin
        if Task_Safe then Locked.Reverse_Elements (Container); else Raw.Reverse_Elements (Container); end if;
      end;
    procedure Swap (Container : in out List; I, J : Cursor) is
      begin
        if Task_Safe then Locked.Swap (Container, I, J); else Raw.Swap (Container, I, J); end if;
      end;
    procedure Swap_Links (Container : in out List; I, J : Cursor) is
      begin
        if Task_Safe then Locked.Swap_Links (Container, I, J); else Raw.Swap_Links (Container, I, J); end if;
      end;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List) is
      begin
        if Task_Safe then Locked.Splice (Target, Before, Source); else Raw.Splice (Target, Before, Source); end if;
      end;
    procedure Splice (Target : in out List; Before : Cursor; Source : in out List; Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Splice (Target, Before, Source, Position); else Raw.Splice (Target, Before, Source, Position); end if;
      end;
    procedure Splice (Container : in out List; Before : Cursor; Position : Cursor) is
      begin
        if Task_Safe then Locked.Splice (Container, Before, Position); else Raw.Splice (Container, Before, Position); end if;
      end;
    function First (Container : List) return Cursor is
      (if Task_Safe then Locked.First (Container) else Raw.First (Container));
    function First_Element (Container : List) return Element_Type is
      (if Task_Safe then Locked.First_Element (Container) else Raw.First_Element (Container));
    function Last (Container : List) return Cursor is
      (if Task_Safe then Locked.Last (Container) else Raw.Last (Container));
    function Last_Element (Container : List) return Element_Type is
      (if Task_Safe then Locked.Last_Element (Container) else Raw.Last_Element (Container));
    function Next (Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Next (Position) else Raw.Next (Position));
    function Previous (Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Previous (Position) else Raw.Previous (Position));
    procedure Next (Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Next (Position); else Raw.Next (Position); end if;
      end;
    procedure Previous (Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Previous (Position); else Raw.Previous (Position); end if;
      end;
    function Next (Container : List; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Next (Container, Position) else Raw.Next (Container, Position));
    function Previous (Container : List; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Previous (Container, Position) else Raw.Previous (Container, Position));
    procedure Next (Container : List; Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Next (Container, Position); else Raw.Next (Container, Position); end if;
      end;
    procedure Previous (Container : List; Position : in out Cursor) is
      begin
        if Task_Safe then Locked.Previous (Container, Position); else Raw.Previous (Container, Position); end if;
      end;
    function Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      (if Task_Safe then Locked.Find (Container, Item, Position) else Raw.Find (Container, Item, Position));
    function Reverse_Find (Container : List; Item : Element_Type; Position : Cursor := No_Element) return Cursor is
      (if Task_Safe then Locked.Reverse_Find (Container, Item, Position) else Raw.Reverse_Find (Container, Item, Position));
    function Contains (Container : List; Item : Element_Type) return Boolean is
      (if Task_Safe then Locked.Contains (Container, Item) else Raw.Contains (Container, Item));
    procedure Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      begin
        Raw.Iterate (Container, Process);
      end;
    procedure Reverse_Iterate (Container : List; Process : not null access procedure (Position : Cursor)) is
      begin
        Raw.Reverse_Iterate (Container, Process);
      end;
    function Iterate (Container : List) return List_Iterator is
      (if Task_Safe then Locked.Iterate (Container) else Raw.Iterate (Container));
    function Iterate (Container : List; Start : Cursor) return List_Iterator is
      (if Task_Safe then Locked.Iterate (Container, Start) else Raw.Iterate (Container, Start));
    function First (Object : List_Iterator) return Cursor is
      (if Task_Safe then Locked.First (Object) else Raw.First (Object));
    function Next (Object : List_Iterator; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Next (Object, Position) else Raw.Next (Object, Position));
    function Last (Object : List_Iterator) return Cursor is
      (if Task_Safe then Locked.Last (Object) else Raw.Last (Object));
    function Previous (Object : List_Iterator; Position : Cursor) return Cursor is
      (if Task_Safe then Locked.Previous (Object, Position) else Raw.Previous (Object, Position));
    package body Generic_Sorting is
      function Sorted (Container : List) return Boolean is
        Node : Node_Access := (if Raw.Length (Container) < 2 then null else Container.Handle.Data.First);
        begin
          while Node /= null and then Node.Next /= null loop
            if Item (Node.Next).all < Item (Node).all then return False; end if;
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
            if R = null or else (L /= null and then not (Item (R).all < Item (L).all)) then
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
          if Tail /= null then Tail.Next := null; end if;
          return Head;
        end;
      function Sort_Chain (Head : Node_Access; Count : Count_Type) return Node_Access is
        Middle : Node_Access := Head;
        Second : Node_Access;
        begin
          if Count < 2 then
            if Head /= null then Head.Next := null; end if;
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
      procedure Sort_Nodes (Container : in out List) is
        begin
          if Raw.Length (Container) < 2 then return; end if;
          Raw.Check_Cursors (Container);
          Relink (Container.Handle.Data, Sort_Chain (Container.Handle.Data.First, Container.Handle.Data.Length));
        end;
      procedure Merge_Nodes (Target, Source : in out List) is
        Count : constant Count_Type := Raw.Length (Target) + Raw.Length (Source);
        begin
          if Target.Handle.Data = Source.Handle.Data or else Raw.Length (Source) = 0 then return; end if;
          Raw.Check_Cursors (Target);
          Raw.Check_Cursors (Source);
          Raw.Check_Room (Target, Raw.Length (Source));
          Ensure (Target);
          Relink (Target.Handle.Data, Merge_Chains (Target.Handle.Data.First, Source.Handle.Data.First));
          Target.Handle.Data.Length := Count;
          Source.Handle.Data.all := (Mutex => Source.Handle.Data.Mutex, others => <>);
        end;
      function Is_Sorted (Container : List) return Boolean is
        (if Task_Safe then (declare Hold : Exclusive_Hold (Mutex (Container)); begin Sorted (Container)) else Sorted (Container));
      procedure Sort (Container : in out List) is
        begin
          if not Task_Safe then Sort_Nodes (Container); return; end if;
          declare Hold : Exclusive_Hold (Mutex (Container)); begin Sort_Nodes (Container); end;
        end;
      procedure Merge (Target, Source : in out List) is
        begin
          if not Task_Safe then Merge_Nodes (Target, Source); return; end if;
          declare Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source))); Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source))); begin Merge_Nodes (Target, Source); end;
        end;
    end;
  end;
  package body Holder_Core is
    procedure Free is new Unchecked_Deallocation (Element_Type, Element_Access);
    procedure Free is new Unchecked_Deallocation (Shared, Shared_Access);
    procedure Check_Element (Container : Holder) is
      begin
        if Container.Data /= null and then Container.Data.Busy > 0 then raise Program_Error; end if;
      end;
    function Mutex (Container : Holder) return Exclusive_Lock_Access is (if Container.Data = null then null else Container.Data.Mutex);
    procedure Ensure (Container : in out Holder) is
      begin
        if Container.Data = null then Container.Data := new Shared; end if;
      end;
    procedure Initialize (Container : in out Holder) is
      begin
        if Task_Safe then Container.Data := new Shared; end if;
      end;
    procedure Adjust (Container : in out Holder) is
      Source : constant Shared_Access := Container.Data;
      begin
        Container.Data := null;
        if Source /= null and then Source.Element /= null then
          Container.Data := new Shared'(Element => new Element_Type'(Source.Element.all), others => <>);
        elsif Task_Safe then
          Container.Data := new Shared;
        end if;
      end;
    procedure Finalize (Container : in out Holder) is
      begin
        if Container.Data /= null then
          Free (Container.Data.Element);
          if Task_Safe then Free (Container.Data.Mutex); end if;
          Free (Container.Data);
        end if;
      end;
    generic
    package Raw_Layer is
      function "=" (Left, Right : Holder) return Boolean;
      function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean;
      function Empty return Holder;
      function To_Holder (New_Item : Element_Type) return Holder;
      function Is_Empty (Container : Holder) return Boolean;
      procedure Clear (Container : in out Holder);
      function Element (Container : Holder) return Element_Type;
      procedure Replace_Element (Container : in out Holder; New_Item : Element_Type);
      procedure Query_Element (Container : Holder; Process : not null access procedure (Element : Element_Type));
      procedure Update_Element (Container : in out Holder; Process : not null access procedure (Element : in out Element_Type));
      function Constant_Reference (Container : Holder) return Constant_Reference_Type;
      function Reference (Container : in out Holder) return Reference_Type;
      procedure Assign (Target : in out Holder; Source : Holder);
      function Copy (Source : Holder) return Holder;
      procedure Move (Target : in out Holder; Source : in out Holder);
      procedure Swap (Left, Right : in out Holder);
    end;
    package body Raw_Layer is
      function Is_Empty (Container : Holder) return Boolean is
        (Container.Data = null or else Container.Data.Element = null);
      function "=" (Left, Right : Holder) return Boolean is
        (if Is_Empty (Left) or else Is_Empty (Right) then Is_Empty (Left) and then Is_Empty (Right)
         else Left.Data.Element.all = Right.Data.Element.all);
      function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean is
        (Container.Data /= null and then Container.Data.Busy > 0);
      function Empty return Holder is (Copy (Empty_Holder));
      function To_Holder (New_Item : Element_Type) return Holder is
        Result : Holder;
        begin
          Replace_Element (Result, New_Item);
          return Result;
        end;
      procedure Clear (Container : in out Holder) is
        begin
          Check_Element (Container);
          if Container.Data /= null then Free (Container.Data.Element); end if;
        end;
      function Element (Container : Holder) return Element_Type is
        (if Is_Empty (Container) then raise Constraint_Error else Container.Data.Element.all);
      procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) is
        Fresh : Element_Access;
        begin
          if Max_Size > 0 and then New_Item'Size > Max_Size * System.Storage_Unit then raise Program_Error; end if;
          Check_Element (Container);
          Fresh := new Element_Type'(New_Item);
          Ensure (Container);
          Free (Container.Data.Element);
          Container.Data.Element := Fresh;
        end;
      procedure Query_Element (Container : Holder;
                               Process   : not null access procedure (Element : Element_Type)) is
        Hold : Locked_Counter_Hold (Container.Data.Busy'Access, Mutex (Container));
        begin
          if Is_Empty (Container) then raise Constraint_Error; end if;
          Process (Container.Data.Element.all);
        end;
      procedure Update_Element (Container : in out Holder;
                                Process   : not null access procedure (Element : in out Element_Type)) is
        Hold : Locked_Counter_Hold (Container.Data.Busy'Access, Mutex (Container));
        begin
          if Is_Empty (Container) then raise Constraint_Error; end if;
          Process (Container.Data.Element.all);
        end;
      function Constant_Reference (Container : Holder) return Constant_Reference_Type is
        (if Is_Empty (Container) then raise Constraint_Error else (Element => Container.Data.Element));
      function Reference (Container : in out Holder) return Reference_Type is
        (if Is_Empty (Container) then raise Constraint_Error else (Element => Container.Data.Element));
      procedure Assign (Target : in out Holder; Source : Holder) is
        begin
          if Target.Data = Source.Data then
            return;
          elsif Is_Empty (Source) then
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
      procedure Swap (Left, Right : in out Holder) is
        Held : Element_Access;
        begin
          Check_Element (Left);
          Check_Element (Right);
          Ensure (Left);
          Ensure (Right);
          Held := Left.Data.Element;
          Left.Data.Element := Right.Data.Element;
          Right.Data.Element := Held;
        end;
      procedure Move (Target : in out Holder; Source : in out Holder) is
        begin
          if Target.Data /= Source.Data then
            Swap (Target, Source);
            Clear (Source);
          end if;
        end;
    end;
    package Raw is new Raw_Layer;
    package Inner is new Raw_Layer;
    package Locked is
      function "=" (Left, Right : Holder) return Boolean;
      function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean;
      function Is_Empty (Container : Holder) return Boolean;
      procedure Clear (Container : in out Holder);
      function Element (Container : Holder) return Element_Type;
      procedure Replace_Element (Container : in out Holder; New_Item : Element_Type);
      function Constant_Reference (Container : Holder) return Constant_Reference_Type;
      function Reference (Container : in out Holder) return Reference_Type;
      procedure Assign (Target : in out Holder; Source : Holder);
      function Copy (Source : Holder) return Holder;
      procedure Move (Target : in out Holder; Source : in out Holder);
      procedure Swap (Left, Right : in out Holder);
    end;
    package body Locked is
      function "=" (Left, Right : Holder) return Boolean is
        (declare Hold_1 : Exclusive_Hold (Lower (Mutex (Left), Mutex (Right))); Hold_2 : Exclusive_Hold (Upper (Mutex (Left), Mutex (Right))); begin Inner."=" (Left, Right));
      function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Tampering_With_The_Element_Prohibited (Container));
      function Is_Empty (Container : Holder) return Boolean is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Is_Empty (Container));
      procedure Clear (Container : in out Holder) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Clear (Container);
        end;
      function Element (Container : Holder) return Element_Type is
        (declare Hold : Exclusive_Hold (Mutex (Container)); begin Inner.Element (Container));
      procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          Inner.Replace_Element (Container, New_Item);
        end;
      function Constant_Reference (Container : Holder) return Constant_Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Constant_Reference (Container);
        end;
      function Reference (Container : in out Holder) return Reference_Type is
        Hold : Exclusive_Hold (Mutex (Container));
        begin
          return Inner.Reference (Container);
        end;
      procedure Assign (Target : in out Holder; Source : Holder) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Assign (Target, Source);
        end;
      function Copy (Source : Holder) return Holder is
        (declare Hold : Exclusive_Hold (Mutex (Source)); begin Inner.Copy (Source));
      procedure Move (Target : in out Holder; Source : in out Holder) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Target), Mutex (Source)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Target), Mutex (Source)));
        begin
          Inner.Move (Target, Source);
        end;
      procedure Swap (Left, Right : in out Holder) is
        Hold_1 : Exclusive_Hold (Lower (Mutex (Left), Mutex (Right)));
        Hold_2 : Exclusive_Hold (Upper (Mutex (Left), Mutex (Right)));
        begin
          Inner.Swap (Left, Right);
        end;
    end;
    function "=" (Left, Right : Holder) return Boolean is
      (if Task_Safe then Locked."=" (Left, Right) else Raw."=" (Left, Right));
    function Tampering_With_The_Element_Prohibited (Container : Holder) return Boolean is
      (if Task_Safe then Locked.Tampering_With_The_Element_Prohibited (Container) else Raw.Tampering_With_The_Element_Prohibited (Container));
    function Empty return Holder is
      (Raw.Empty);
    function To_Holder (New_Item : Element_Type) return Holder is
      (Raw.To_Holder (New_Item));
    function Is_Empty (Container : Holder) return Boolean is
      (if Task_Safe then Locked.Is_Empty (Container) else Raw.Is_Empty (Container));
    procedure Clear (Container : in out Holder) is
      begin
        if Task_Safe then Locked.Clear (Container); else Raw.Clear (Container); end if;
      end;
    function Element (Container : Holder) return Element_Type is
      (if Task_Safe then Locked.Element (Container) else Raw.Element (Container));
    procedure Replace_Element (Container : in out Holder; New_Item : Element_Type) is
      begin
        if Task_Safe then Locked.Replace_Element (Container, New_Item); else Raw.Replace_Element (Container, New_Item); end if;
      end;
    procedure Query_Element (Container : Holder; Process : not null access procedure (Element : Element_Type)) is
      begin
        Raw.Query_Element (Container, Process);
      end;
    procedure Update_Element (Container : in out Holder; Process : not null access procedure (Element : in out Element_Type)) is
      begin
        Raw.Update_Element (Container, Process);
      end;
    function Constant_Reference (Container : Holder) return Constant_Reference_Type is
      (if Task_Safe then Locked.Constant_Reference (Container) else Raw.Constant_Reference (Container));
    function Reference (Container : in out Holder) return Reference_Type is
      (if Task_Safe then Locked.Reference (Container) else Raw.Reference (Container));
    procedure Assign (Target : in out Holder; Source : Holder) is
      begin
        if Task_Safe then Locked.Assign (Target, Source); else Raw.Assign (Target, Source); end if;
      end;
    function Copy (Source : Holder) return Holder is
      (if Task_Safe then Locked.Copy (Source) else Raw.Copy (Source));
    procedure Move (Target : in out Holder; Source : in out Holder) is
      begin
        if Task_Safe then Locked.Move (Target, Source); else Raw.Move (Target, Source); end if;
      end;
    procedure Swap (Left, Right : in out Holder) is
      begin
        if Task_Safe then Locked.Swap (Left, Right); else Raw.Swap (Left, Right); end if;
      end;
  end;
end;

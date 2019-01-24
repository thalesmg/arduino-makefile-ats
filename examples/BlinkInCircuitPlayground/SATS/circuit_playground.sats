datatype port = 
  | PORTB of () 
  | PORTC of ()
  | PORTD of ()
  | PORTE of ()
  | PORTF of ()


#define PINMAX 15

typedef pin = [i:int | i <= PINMAX] int (i)

typedef ddr = uint8 

fun setPinHigh (port:port,pin:pin) : void 
fun setPinLow (port:port,pin:pin) : void 

fun setPinHighVal(port:int, pin:int):void = "ext#setPinHigh_in_c"


fun setPinLowVal(port:int, pin:int):void = "ext#setPinLow_in_c"


// fun ddrb():[l:addr] (uint8 @ l|ptr l)  = "ext#DDRB"
fun ddrc():[l:addr] (ddr @l |ptr l)  = "ext#getDDRC_in_c"

fun cast_int2_uint8(i:int):uint8 = "ext#cast_int2uint8_t_in_c"

fun setBitN(i:uint8, n:uint8):ddr = "ext#setBitN_in_c"

(* Time to define some fun stuff *)
dataview is_writeable (v:view+, i:int) = 
  | Writeable(v,i) of (v)



fun setDDR_Bit_High 
   {i:int} 
   {l:addr} ( pf:ddr@ l | x:int,ddr_ptr: ptr l): 
   (is_writeable(ddr @ l,i) | ptr l)
   
   
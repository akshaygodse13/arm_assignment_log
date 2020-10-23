     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
		VLDR.f32 S3, = 1;
		VLDR.f32 S14, = 0;
       VLDR.f32 S11, =0;	   
       VLDR.f32 S10,= 0 ; ANSWER 
	   ; Code is an infinte series and answer verified with term upto 6th
	   ;for more accurate number we have to consider lot of terms
	   ;answer is stored in s10 which should be 0.405
	   ;keep pressing f11 for 5-6 loops across label T1
       VLDR.f32 S13,= 0.5; x
       VMOV.f32 S5,S3; term number and intially 1
       VLDR.f32 S2,= 0; SIGN 
       VLDR.f32  S9,= 1 ;   
T1 		VMOV.f32 S9,S5 ; no of multiplication for calculation of x power in term
		VMOV.f32 S8,S13 ;term value is stored in S8
T3		VCMP.f32 S9,S3 ; this loop is for calcution of x^n power
		;ITTE GT
		VMRS APSR_nzcv,FPSCR
		BLE T2
		VMULGT.F32 S8,S13,S8;
		VSUBGT.F32 S9,S9,S3;
		BGT T3
    
T2 		VDIV.F32 S8,S8,S5; here (x^n)/n
		VCMP.F32 S2,#0 ; R2---->SIGN
		VMRS APSR_nzcv,FPSCR
		ITTE EQ;
		VADDEQ.f32 S10,S8,S10; odd terms are added
		VMOVEQ.f32 S2,S3;
		VSUBNE.F32 S10,S10,S8; even terms subtracted
		VMOVNE.f32 S2,S14;
		VADD.F32 S5,S5,S3; increasing term number
		B T1 ;
     endfunc
     end


     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
		VLDR.f32 S3, = 1;
       VLDR.f32 S11, =0;	   
       VLDR.f32 S10,= 0 ; ANSWER 
       VLDR.f32 S13,= 4.0; x
       VMOV.f32 S5,S3; count
       VLDR.f32 S2,= 0; SIGN 
       VLDR.f32  S9,= 1 ;   
T1 		VMOV.f32 S9,S5 ;
		VMOV.f32 S8,S13 
T3		VCMP.f32 S9,S3 ;
		;ITTE GT
		VMRS APSR_nzcv,FPSCR
		BLE T2
		VMULGT.F32 S8,S13,S8;
		VSUBGT.F32 S9,S9,S3;
		BGT T3
    
T2 		VDIVLT.F32 S8,S8,S5;
		VCMPLE.F32 S2,#0 ; R2---->SIGN
		VMRS APSR_nzcv,FPSCR
		ITTE EQ;
		VADDEQ.f32 S10,S8,S10;
		VMOVEQ.f32 S2,S3;
		VSUBNE.F32 S10,S8,S10;
		VMOVNE.f32 S2,S10;
		VADD.F32 S5,S5,S3;
		B T1 ;
     endfunc
     end

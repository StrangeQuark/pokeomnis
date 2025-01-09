	.include "MPlayDef.s"

	.equ	mus_route29_grp, voicegroup191
	.equ	mus_route29_pri, 0
	.equ	mus_route29_rev, reverb_set+50
	.equ	mus_route29_mvl, 70
	.equ	mus_route29_key, 0
	.equ	mus_route29_tbs, 1
	.equ	mus_route29_exg, 1
	.equ	mus_route29_cmp, 1

	.section .rodata
	.global	mus_route29
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

mus_route29_1:
	.byte	KEYSH , mus_route29_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 101*mus_route29_tbs/2
	.byte		VOICE , 6
	.byte		VOL   , 110*mus_route29_mvl/mxv
	.byte		MOD   , 0
	.byte		PAN   , c_v+16
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte		PAN   , c_v+44
	.byte		BEND  , c_v+0
	.byte		N06   , Cn4 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		PAN   , c_v+44
	.byte		N06   , En4 
	.byte	W12
	.byte		N03   , En4 , v120
	.byte	W03
	.byte		        En4 , v096
	.byte	W03
	.byte		        En4 , v064
	.byte	W03
	.byte		        En4 , v060
	.byte	W03
	.byte		N06   , Gn4 
	.byte	W12
	.byte		N03   , Gn4 , v112
	.byte	W03
	.byte		        Gn4 , v100
	.byte	W03
	.byte		        Gn4 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , Cn4 , v112
	.byte	W12
	.byte		VOICE , 6
	.byte		N03   , Dn4 , v120
	.byte	W03
	.byte		        Dn4 , v104
	.byte	W03
	.byte		        Dn4 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , En4 , v112
	.byte	W12
@ 001   ----------------------------------------
	.byte		N03   , Cn4 , v116
	.byte	W03
	.byte		        Cn4 , v104
	.byte	W03
	.byte		        Cn4 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , Fn4 , v112
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		N03   , Dn4 , v116
	.byte	W03
	.byte		        Dn4 , v104
	.byte	W03
	.byte		        Dn4 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , Bn3 , v112
	.byte	W12
	.byte		N03   , An3 
	.byte	W03
	.byte		        An3 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , Gn3 , v112
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		N03   , Gn4 
	.byte	W03
	.byte		        Gn4 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
@ 002   ----------------------------------------
	.byte		N03   
	.byte	W03
	.byte		        Gn4 , v056
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        Gn4 , v052
	.byte	W03
	.byte	TEMPO , 97*mus_route29_tbs/2
	.byte	TEMPO , 97*mus_route29_tbs/2
	.byte		N03   
	.byte	W03
	.byte		        Gn4 , v048
	.byte	W03
	.byte		N03   
	.byte	W02
	.byte	TEMPO , 91*mus_route29_tbs/2
	.byte	TEMPO , 91*mus_route29_tbs/2
	.byte	W01
	.byte		N03   
	.byte	W03
	.byte		        Gn4 , v044
	.byte	W03
	.byte		        Gn4 , v040
	.byte	W01
	.byte	TEMPO , 82*mus_route29_tbs/2
	.byte	TEMPO , 82*mus_route29_tbs/2
	.byte	W02
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        Gn4 , v036
	.byte	W03
	.byte		        Gn4 , v028
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        Gn4 , v024
	.byte	W03
	.byte		N15   
	.byte	W30
	.byte	TEMPO , 101*mus_route29_tbs/2
	.byte	TEMPO , 101*mus_route29_tbs/2
	.byte		VOICE , 35
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte	W12
@ 003   ----------------------------------------
mus_route29_1_B1:
	.byte		PAN   , c_v+19
	.byte		BEND  , c_v+0
	.byte		N06   , Cn4 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		PAN   , c_v+16
	.byte		N06   , En4 
	.byte	W12
	.byte		N12   
	.byte	W06
	.byte		MOD   , 7
	.byte	W06
	.byte		        0
	.byte		N06   , Gn4 , v092
	.byte	W12
	.byte		N03   , Fs4 , v068
	.byte		N12   , Gn4 , v100
	.byte	W12
	.byte		N06   , Cn4 , v112
	.byte	W12
	.byte		N09   , Dn4 
	.byte	W12
	.byte		N06   , En4 
	.byte	W12
@ 004   ----------------------------------------
	.byte		N12   , Cn4 
	.byte	W06
	.byte		MOD   , 7
	.byte	W06
	.byte		        0
	.byte		N06   , Fn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Dn4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		VOL   , 51*mus_route29_mvl/mxv
	.byte		N36   , Cn4 , v127
	.byte	W02
	.byte		VOL   , 56*mus_route29_mvl/mxv
	.byte	W03
	.byte		        67*mus_route29_mvl/mxv
	.byte	W03
	.byte		        72*mus_route29_mvl/mxv
	.byte	W04
	.byte		        80*mus_route29_mvl/mxv
	.byte	W02
	.byte		        91*mus_route29_mvl/mxv
	.byte	W03
	.byte		        108*mus_route29_mvl/mxv
	.byte	W03
	.byte		        127*mus_route29_mvl/mxv
	.byte	W04
	.byte		        127*mus_route29_mvl/mxv
	.byte	W12
@ 005   ----------------------------------------
	.byte		VOICE , 34
	.byte		PAN   , c_v-29
	.byte		BEND  , c_v+0
	.byte		N06   , Cn3 
	.byte	W03
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte	W03
	.byte		N06   , Dn3 
	.byte	W06
	.byte		BEND  , c_v+0
	.byte		N06   , En3 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
@ 006   ----------------------------------------
	.byte		N03   , Bn2 , v108
	.byte		N12   , Cn3 , v127
	.byte	W12
	.byte		N06   , Fn3 , v112
	.byte	W06
	.byte		        En3 , v127
	.byte	W06
	.byte		        Dn3 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		N12   , Gn3 
	.byte	W12
@ 007   ----------------------------------------
	.byte		VOICE , 34
	.byte		VOL   , 119*mus_route29_mvl/mxv
	.byte		N06   , Dn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte	TEMPO , 103*mus_route29_tbs/2
	.byte		        En4 
	.byte	W06
	.byte	TEMPO , 103*mus_route29_tbs/2
	.byte	W06
	.byte		N03   , Ds4 
	.byte		N12   , En4 
	.byte	W12
	.byte		N06   , Gn4 
	.byte	W12
	.byte		N12   
	.byte	W06
	.byte		MOD   , 7
	.byte	W06
	.byte	TEMPO , 98*mus_route29_tbs/2
	.byte		        0
	.byte		N03   , Gs4 , v124
	.byte		N06   , An4 
	.byte	W06
	.byte	TEMPO , 98*mus_route29_tbs/2
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        Dn4 , v108
	.byte	W06
	.byte	TEMPO , 98*mus_route29_tbs/2
	.byte		N12   , En4 , v120
	.byte	W06
	.byte	TEMPO , 98*mus_route29_tbs/2
	.byte		MOD   , 7
	.byte	W06
@ 008   ----------------------------------------
	.byte		        0
	.byte		N03   , Gs4 , v080
	.byte		N12   , An4 , v088
	.byte	W12
	.byte	TEMPO , 103*mus_route29_tbs/2
	.byte		N06   , Fn4 , v112
	.byte	W06
	.byte	TEMPO , 103*mus_route29_tbs/2
	.byte		        En4 
	.byte	W06
	.byte		        Dn4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N12   , Bn3 
	.byte	W12
	.byte		N36   , Cn4 
	.byte	W12
	.byte		MOD   , 8
	.byte	W12
	.byte	TEMPO , 93*mus_route29_tbs/2
	.byte		VOL   , 86*mus_route29_mvl/mxv
	.byte		        77*mus_route29_mvl/mxv
	.byte	W03
	.byte		        71*mus_route29_mvl/mxv
	.byte	W01
	.byte		        69*mus_route29_mvl/mxv
	.byte	W01
	.byte		        62*mus_route29_mvl/mxv
	.byte	W01
	.byte	TEMPO , 93*mus_route29_tbs/2
	.byte	W01
	.byte		        58*mus_route29_mvl/mxv
	.byte	W02
	.byte		        54*mus_route29_mvl/mxv
	.byte	W03
@ 009   ----------------------------------------
	.byte		VOICE , 35
	.byte		VOL   , 112*mus_route29_mvl/mxv
	.byte		N03   , Cn4 , v076
	.byte	W03
	.byte		MOD   , 0
	.byte		N03   , Dn4 , v092
	.byte	W03
	.byte		        En4 , v108
	.byte	W03
	.byte		        Gn4 , v120
	.byte	W03
	.byte	TEMPO , 98*mus_route29_tbs/2
	.byte		PAN   , c_v-10
	.byte		VOL   , 118*mus_route29_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N03   , Gs4 , v127
	.byte	W03
	.byte		        An4 
	.byte	W03
	.byte	TEMPO , 98*mus_route29_tbs/2
	.byte	W04
	.byte		VOL   , 82*mus_route29_mvl/mxv
	.byte	W02
	.byte		        84*mus_route29_mvl/mxv
	.byte		N12   
	.byte	W01
	.byte		VOL   , 86*mus_route29_mvl/mxv
	.byte	W01
	.byte		        89*mus_route29_mvl/mxv
	.byte	W01
	.byte		        92*mus_route29_mvl/mxv
	.byte	W01
	.byte		        96*mus_route29_mvl/mxv
	.byte	W02
	.byte		        104*mus_route29_mvl/mxv
	.byte	W01
	.byte		        118*mus_route29_mvl/mxv
	.byte	W05
	.byte		N06   , Cn5 
	.byte	W09
	.byte		VOL   , 89*mus_route29_mvl/mxv
	.byte	W01
	.byte		        92*mus_route29_mvl/mxv
	.byte	W02
	.byte		        100*mus_route29_mvl/mxv
	.byte		N12   
	.byte	W01
	.byte		VOL   , 104*mus_route29_mvl/mxv
	.byte	W01
	.byte		        108*mus_route29_mvl/mxv
	.byte	W01
	.byte		        114*mus_route29_mvl/mxv
	.byte	W01
	.byte		        119*mus_route29_mvl/mxv
	.byte	W02
	.byte		MOD   , 14
	.byte	W06
	.byte		        0
	.byte		N12   , Fn5 
	.byte	W01
	.byte		VOL   , 90*mus_route29_mvl/mxv
	.byte	W01
	.byte		        94*mus_route29_mvl/mxv
	.byte	W01
	.byte		        97*mus_route29_mvl/mxv
	.byte	W01
	.byte		        100*mus_route29_mvl/mxv
	.byte	W02
	.byte		        108*mus_route29_mvl/mxv
	.byte	W01
	.byte		        119*mus_route29_mvl/mxv
	.byte	W05
	.byte		N06   , An5 , v108
	.byte	W12
	.byte		VOL   , 69*mus_route29_mvl/mxv
	.byte		N12   , Gn5 
	.byte	W01
	.byte		VOL   , 73*mus_route29_mvl/mxv
	.byte	W01
	.byte		        79*mus_route29_mvl/mxv
	.byte	W01
	.byte		        86*mus_route29_mvl/mxv
	.byte	W01
	.byte		        94*mus_route29_mvl/mxv
	.byte	W01
	.byte		        99*mus_route29_mvl/mxv
	.byte	W01
	.byte		MOD   , 14
	.byte	W01
	.byte		VOL   , 108*mus_route29_mvl/mxv
	.byte	W01
	.byte		        117*mus_route29_mvl/mxv
	.byte	W01
	.byte		        122*mus_route29_mvl/mxv
	.byte	W03
@ 010   ----------------------------------------
	.byte		MOD   , 0
	.byte		N06   , Fn5 , v120
	.byte	W06
	.byte		N02   , Dn4 , v088
	.byte	W02
	.byte		        En4 
	.byte	W02
	.byte		        Fn4 , v104
	.byte	W02
	.byte		N03   , Fs4 , v127
	.byte	W03
	.byte		N06   , Gn4 
	.byte	W09
	.byte		N12   
	.byte	W12
	.byte		N06   , Cn5 
	.byte	W06
	.byte		N03   , Bn4 
	.byte	W06
	.byte		N06   , Dn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		N18   , En5 
	.byte	W18
	.byte		N06   , Gn5 , v120
	.byte	W06
	.byte		N01   , Fs5 , v096
	.byte	W01
	.byte		N04   , Fn5 , v108
	.byte	W05
	.byte		N18   , En5 , v124
	.byte	W06
@ 011   ----------------------------------------
	.byte	W12
	.byte		N12   , Fn4 , v120
	.byte	W12
	.byte		N04   , Dn4 
	.byte	W04
	.byte		        Fn4 , v124
	.byte	W04
	.byte		        An4 
	.byte	W04
	.byte		N01   , Fn5 
	.byte	W01
	.byte		        Gn5 , v104
	.byte	W01
	.byte		        Fn5 , v100
	.byte	W01
	.byte		        Gn5 
	.byte	W01
	.byte		        Fn5 , v104
	.byte	W02
	.byte		        Gn5 
	.byte	W01
	.byte		        Fn5 
	.byte	W01
	.byte		        Gn5 
	.byte	W01
	.byte		N14   , Fn5 , v127
	.byte	W15
	.byte		N12   , En5 , v120
	.byte	W12
	.byte		N06   , Gn5 , v112
	.byte	W12
	.byte		N12   , Cn5 , v120
	.byte	W12
@ 012   ----------------------------------------
	.byte		N06   , Dn5 , v112
	.byte	W06
	.byte		N02   , Cs5 , v080
	.byte	W02
	.byte		        Dn5 , v092
	.byte	W02
	.byte		        Ds5 , v096
	.byte	W02
	.byte		N12   , En5 , v127
	.byte	W12
	.byte		N06   , Dn5 , v108
	.byte	W12
	.byte		N12   , Cs5 
	.byte	W12
	.byte		N06   , Dn5 , v112
	.byte	W12
	.byte	TEMPO , 90*mus_route29_tbs/2
	.byte		N12   , Cs5 
	.byte	W06
	.byte	TEMPO , 90*mus_route29_tbs/2
	.byte	W06
	.byte		N06   , As4 
	.byte	W12
	.byte	TEMPO , 86*mus_route29_tbs/2
	.byte		N12   , An4 , v108
	.byte	W06
	.byte	TEMPO , 86*mus_route29_tbs/2
	.byte	W06
@ 013   ----------------------------------------
	.byte		N06   , Gn4 , v104
	.byte	W12
	.byte	TEMPO , 96*mus_route29_tbs/2
	.byte		VOICE , 23
	.byte		VOL   , 123*mus_route29_mvl/mxv
	.byte		PAN   , c_v-20
	.byte		BEND  , c_v+0
	.byte		N06   , An3 , v120
	.byte	W06
	.byte	TEMPO , 96*mus_route29_tbs/2
	.byte	W06
	.byte		N12   
	.byte	W12
	.byte		N06   , Cn4 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		N06   , An4 
	.byte	W12
	.byte		N12   , Gn4 
	.byte	W12
@ 014   ----------------------------------------
	.byte		N06   , Fn4 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N06   , En4 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N48   , Gn4 
	.byte	W36
@ 015   ----------------------------------------
	.byte	W12
	.byte		N12   , Fn4 
	.byte	W12
	.byte		N06   , En4 
	.byte	W12
	.byte		N12   , Dn4 
	.byte	W12
	.byte		N06   , Fn4 
	.byte	W12
	.byte		N24   , En4 
	.byte	W24
	.byte		        Dn4 
	.byte	W12
@ 016   ----------------------------------------
	.byte	W12
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte		N12   , Cn4 
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   , En4 
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   , Cn4 
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   , En4 
	.byte	W12
@ 017   ----------------------------------------
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   , Cn4 
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   , En4 
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N36   , Cn4 
	.byte	W24
	.byte		VOICE , 34
	.byte	W12
	.byte	GOTO
	 .word	mus_route29_1_B1
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

mus_route29_2:
	.byte	KEYSH , mus_route29_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		PAN   , c_v-32
	.byte		VOL   , 85*mus_route29_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W12
	.byte		PAN   , c_v-53
	.byte		VOL   , 95*mus_route29_mvl/mxv
	.byte	W12
	.byte		N03   , Cn3 , v100
	.byte	W24
	.byte		        En3 
	.byte	W24
	.byte		        An2 
	.byte	W24
@ 001   ----------------------------------------
	.byte		        Gn2 , v112
	.byte	W12
	.byte		VOL   , 108*mus_route29_mvl/mxv
	.byte		PAN   , c_v-36
	.byte		N06   , Dn2 
	.byte	W12
	.byte		N12   , Fn2 
	.byte		N12   , An2 
	.byte		N12   , Cn3 
	.byte	W12
	.byte		N24   , Bn1 
	.byte	W12
	.byte		N15   , Fs2 , v116
	.byte		N15   , An2 
	.byte		N15   , Cn3 
	.byte	W12
	.byte		N12   , Gn1 , v112
	.byte	W12
	.byte		        Dn1 
	.byte		N12   , Gn2 , v120
	.byte		N12   , Bn2 
	.byte		N12   , Fn3 
	.byte	W12
	.byte		N48   , Gn1 , v112
	.byte		N12   , Fn2 
	.byte		N12   , Gn3 
	.byte		N12   , Bn3 
	.byte		N12   , Ds4 
	.byte	W12
@ 002   ----------------------------------------
	.byte		N04   , Fn2 
	.byte	W02
	.byte		N07   , Gn3 , v064
	.byte	W02
	.byte		        Bn3 
	.byte	W02
	.byte		        Ds4 
	.byte	W02
	.byte		N04   , Fn2 , v076
	.byte	W04
	.byte		N07   , Gn3 , v064
	.byte	W02
	.byte		        Bn3 
	.byte		N07   , Ds4 
	.byte	W02
	.byte		N04   , Fn2 , v060
	.byte	W04
	.byte		N07   , Gn3 , v056
	.byte	W02
	.byte		        Bn3 
	.byte		N07   , Ds4 
	.byte	W02
	.byte		N04   , Fn2 
	.byte	W04
	.byte		N07   , Gn3 , v052
	.byte	W02
	.byte		        Bn3 
	.byte		N07   , Ds4 
	.byte	W02
	.byte		N04   , Fn2 , v048
	.byte	W04
	.byte		N60   , Gn1 , v112
	.byte		N07   , Gn3 , v048
	.byte	W02
	.byte		        Bn3 
	.byte		N07   , Ds4 
	.byte	W02
	.byte		N16   , Fn2 , v064
	.byte	W06
	.byte		N36   , Gn3 , v048, gtp3
	.byte	W02
	.byte		        Bn3 , v056, gtp3
	.byte	W02
	.byte		        Ds4 , v048, gtp3
	.byte	W32
	.byte	W02
	.byte		VOICE , 2
	.byte	W12
@ 003   ----------------------------------------
mus_route29_2_B1:
	.byte		N12   , Gn1 , v112
	.byte	W12
	.byte		VOICE , 2
	.byte		VOL   , 120*mus_route29_mvl/mxv
	.byte		PAN   , c_v-53
	.byte		N12   , Cn2 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 004   ----------------------------------------
	.byte		        Fn1 
	.byte	W12
	.byte		VOICE , 0
	.byte		VOL   , 96*mus_route29_mvl/mxv
	.byte		PAN   , c_v-53
	.byte		N06   , Dn2 
	.byte	W06
	.byte		N18   , Dn1 
	.byte		N18   , Cn3 
	.byte	W06
	.byte		N12   , Fn3 
	.byte	W12
	.byte		N06   , Gn1 
	.byte	W06
	.byte		N18   , Gn0 
	.byte		N18   , Gs3 
	.byte	W06
	.byte		N12   , Fn3 
	.byte	W12
	.byte		N48   , Cn1 
	.byte		N24   , En2 
	.byte	W06
	.byte		N15   , Gn2 
	.byte	W06
	.byte		N06   , Dn3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
@ 005   ----------------------------------------
	.byte		        Cn3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		VOICE , 33
	.byte		VOL   , 101*mus_route29_mvl/mxv
	.byte	W12
	.byte		N12   
	.byte	W24
	.byte		        Bn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
@ 006   ----------------------------------------
	.byte		        An3 , v088
	.byte	W24
	.byte		        En3 , v112
	.byte	W24
	.byte		        Fs3 
	.byte	W36
	.byte		N24   , Ds3 , v120
	.byte	W12
@ 007   ----------------------------------------
	.byte		VOL   , 94*mus_route29_mvl/mxv
	.byte	W12
	.byte		VOICE , 34
	.byte	W12
	.byte		N12   , En3 , v092
	.byte	W24
	.byte		        Gn3 , v112
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gs3 , v108
	.byte	W12
	.byte		        Gn3 , v112
	.byte	W12
@ 008   ----------------------------------------
	.byte		        Cn4 
	.byte	W24
	.byte		        Dn3 
	.byte	W12
	.byte		N06   , Cn3 
	.byte	W12
	.byte		N12   , An3 
	.byte	W12
	.byte		N36   , Gn3 
	.byte	W32
	.byte	W01
	.byte		VOICE , 23
	.byte	W03
@ 009   ----------------------------------------
	.byte		N12   , As3 
	.byte	W03
	.byte		VOL   , 96*mus_route29_mvl/mxv
	.byte	W09
	.byte		VOICE , 23
	.byte		PAN   , c_v+39
	.byte		VOL   , 115*mus_route29_mvl/mxv
	.byte		N06   , Fn1 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Dn2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		N02   , Gs2 
	.byte	W03
	.byte		N09   , Gn2 
	.byte	W09
	.byte		N06   , An2 
	.byte	W12
	.byte		N12   , Bn2 
	.byte	W12
@ 010   ----------------------------------------
	.byte		N06   , Dn3 
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Dn2 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
@ 011   ----------------------------------------
	.byte		        Dn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		N12   , An2 
	.byte	W12
	.byte		N05   , Cn2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		N12   , Fn2 
	.byte	W12
	.byte		N05   , Cn2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		N12   , Gn2 
	.byte	W12
	.byte		N05   , Gs2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		N24   , As2 
	.byte	W12
@ 012   ----------------------------------------
	.byte	W12
	.byte		N12   , En2 
	.byte	W12
	.byte		N03   , Cs2 
	.byte	W04
	.byte		        En2 
	.byte	W04
	.byte		        Fn2 
	.byte	W04
	.byte		N12   , Gn2 
	.byte	W12
	.byte		N03   , En2 
	.byte	W04
	.byte		        Gn2 
	.byte	W04
	.byte		        Gs2 
	.byte	W04
	.byte		N12   , An2 
	.byte	W12
	.byte		N03   , En2 
	.byte	W04
	.byte		        Gn2 
	.byte	W04
	.byte		        An2 
	.byte	W04
	.byte		N12   , Cs3 
	.byte	W12
@ 013   ----------------------------------------
	.byte		N11   , En3 
	.byte	W12
	.byte		VOICE , 32
	.byte		PAN   , c_v-32
	.byte		VOL   , 102*mus_route29_mvl/mxv
	.byte		N48   , An1 
	.byte	W48
	.byte		N18   , Cn2 
	.byte	W18
	.byte		N12   , Dn2 
	.byte	W12
	.byte		N06   , En2 
	.byte	W06
@ 014   ----------------------------------------
	.byte		        Dn2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Gn1 
	.byte	W24
	.byte		        Gn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		N18   , En3 
	.byte	W18
	.byte		N06   , An3 
	.byte	W06
	.byte		N12   , An2 
	.byte	W12
@ 015   ----------------------------------------
	.byte		        Bn2 
	.byte	W12
	.byte		VOL   , 111*mus_route29_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N12   , Cn3 
	.byte	W12
	.byte		N06   , Bn2 
	.byte	W12
	.byte		N12   , An2 
	.byte	W12
	.byte		N06   , Gn2 
	.byte	W12
	.byte		N12   , Fn2 
	.byte	W12
	.byte		N06   , En2 
	.byte	W12
	.byte		N12   , Dn2 
	.byte	W12
@ 016   ----------------------------------------
	.byte		N06   , Ds2 
	.byte	W12
	.byte		VOICE , 32
	.byte		N06   , Cn2 
	.byte	W12
	.byte		N01   , An2 
	.byte	W04
	.byte		        Fn2 , v116
	.byte	W04
	.byte		        Cn3 , v112
	.byte	W04
	.byte		N24   , Dn3 
	.byte	W24
	.byte		N06   , Dn2 
	.byte	W12
	.byte		N01   , An2 
	.byte	W04
	.byte		        Fn2 , v116
	.byte	W04
	.byte		        Cn3 , v112
	.byte	W04
	.byte		N24   , Ds3 
	.byte	W12
@ 017   ----------------------------------------
	.byte	W12
	.byte		N06   , En3 
	.byte	W12
	.byte		N01   , Dn2 
	.byte	W04
	.byte		        Fn2 , v116
	.byte	W04
	.byte		        Bn2 , v112
	.byte	W04
	.byte		N12   , Gn3 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		N36   , Cn2 
	.byte	W36
	.byte	GOTO
	 .word	mus_route29_2_B1
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

mus_route29_3:
	.byte	KEYSH , mus_route29_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		VOL   , 94*mus_route29_mvl/mxv
	.byte		PAN   , c_v-46
	.byte		BEND  , c_v+0
	.byte	W12
	.byte		VOL   , 95*mus_route29_mvl/mxv
	.byte		PAN   , c_v-18
	.byte	W12
	.byte		N03   , Gn3 , v100
	.byte	W24
	.byte		        Bn3 
	.byte	W24
	.byte		        En3 
	.byte	W24
@ 001   ----------------------------------------
	.byte		        En3 , v112
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
mus_route29_3_B1:
	.byte	W12
	.byte		VOICE , 0
	.byte		VOL   , 107*mus_route29_mvl/mxv
	.byte		PAN   , c_v-34
	.byte		N06   
	.byte	W12
	.byte		N12   , Cn3 
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W12
	.byte		N12   , An3 
	.byte	W12
	.byte		N06   , Gs3 
	.byte		N06   , Cn4 
	.byte	W12
	.byte		N09   , Bn3 
	.byte	W12
	.byte		N06   , An3 
	.byte	W12
@ 004   ----------------------------------------
	.byte		N12   , Gs3 
	.byte	W12
	.byte		VOL   , 116*mus_route29_mvl/mxv
	.byte	W18
	.byte		N12   , An3 
	.byte	W24
	.byte		N15   , Bn3 
	.byte	W42
@ 005   ----------------------------------------
	.byte	W12
	.byte		VOICE , 34
	.byte		VOL   , 95*mus_route29_mvl/mxv
	.byte	W12
	.byte		N12   , En3 
	.byte	W24
	.byte		        Dn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
@ 006   ----------------------------------------
	.byte		        Cn3 , v088
	.byte	W24
	.byte		        Cn3 , v112
	.byte	W24
	.byte		        Dn3 
	.byte	W36
	.byte		N24   , Bn2 , v120
	.byte	W12
@ 007   ----------------------------------------
	.byte		VOL   , 96*mus_route29_mvl/mxv
	.byte	W12
	.byte		VOICE , 34
	.byte	W12
	.byte		N12   , Gn2 , v092
	.byte	W24
	.byte		        Bn2 , v112
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Dn3 , v108
	.byte	W12
	.byte		        Cn3 , v112
	.byte	W12
@ 008   ----------------------------------------
	.byte		        An3 
	.byte	W24
	.byte		        Cn3 
	.byte	W12
	.byte		N06   , An2 
	.byte	W12
	.byte		N12   , Fn3 
	.byte	W12
	.byte		N03   , En3 
	.byte		N12   , Fn3 
	.byte	W12
	.byte		N06   , En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		N12   , En3 
	.byte	W12
@ 009   ----------------------------------------
	.byte		VOICE , 23
	.byte		N12   , Fs3 
	.byte	W03
	.byte		VOL   , 104*mus_route29_mvl/mxv
	.byte	W09
	.byte		VOICE , 3
	.byte		VOL   , 67*mus_route29_mvl/mxv
	.byte		PAN   , c_v+51
	.byte		N06   , Cn6 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        An5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		N03   , Bn5 
	.byte	W06
	.byte		N06   , Dn6 
	.byte	W06
	.byte		        Dn6 , v096
	.byte	W06
	.byte		        Dn6 , v088
	.byte	W06
	.byte		N03   , Fn5 , v112
	.byte	W06
	.byte		N06   , Bn5 
	.byte	W06
@ 010   ----------------------------------------
	.byte		        Bn5 , v080
	.byte	W06
	.byte		        Bn5 , v068
	.byte	W06
	.byte		        Bn5 , v112
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		N03   , Gn5 
	.byte	W06
	.byte		N18   , An5 
	.byte	W18
	.byte		N03   , En5 
	.byte	W06
	.byte		N18   , Cs6 
	.byte	W06
@ 011   ----------------------------------------
	.byte	W12
	.byte		N06   , An5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		N03   , Gn5 
	.byte	W06
	.byte		N18   , Bn5 
	.byte	W18
	.byte		N03   , Gn5 
	.byte	W06
	.byte		N18   , As5 
	.byte	W06
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W12
	.byte		VOICE , 29
	.byte		VOL   , 111*mus_route29_mvl/mxv
	.byte		PAN   , c_v+34
	.byte		N06   , An2 
	.byte	W12
	.byte		N04   , An2 , v104
	.byte	W04
	.byte		        Fn2 , v112
	.byte	W04
	.byte		        An2 
	.byte	W04
	.byte		N06   , Cn3 
	.byte	W12
	.byte		N04   , Cn3 , v104
	.byte	W04
	.byte		        An2 , v112
	.byte	W04
	.byte		        Cn3 
	.byte	W04
	.byte		N30   , Bn3 
	.byte	W36
@ 014   ----------------------------------------
	.byte	W12
	.byte		N06   , Gn2 
	.byte	W12
	.byte		N04   , Gn2 , v104
	.byte	W04
	.byte		        En2 , v112
	.byte	W04
	.byte		        Gn2 
	.byte	W04
	.byte		N12   , Dn3 
	.byte	W12
	.byte		N04   , Dn3 , v104
	.byte	W04
	.byte		        Bn2 , v112
	.byte	W04
	.byte		        Dn3 
	.byte	W04
	.byte		N12   , An3 
	.byte	W12
	.byte		N01   , Cs4 , v104
	.byte	W04
	.byte		        Cs4 , v112
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		N06   
	.byte	W12
@ 015   ----------------------------------------
	.byte		N01   , Cs4 , v104
	.byte	W04
	.byte		        Cs4 , v112
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		N06   , Cn4 , v127
	.byte	W84
@ 016   ----------------------------------------
	.byte		        Bn2 , v112
	.byte	W12
	.byte		        Gn2 
	.byte	W36
	.byte		N03   , Gn2 , v116
	.byte	W12
	.byte		N06   , Gn2 , v112
	.byte	W36
@ 017   ----------------------------------------
	.byte		N03   , Bn2 
	.byte	W12
	.byte		N06   , Gn2 
	.byte	W36
	.byte		N03   , Gn2 , v116
	.byte	W12
	.byte		N36   , Gn2 , v112
	.byte	W36
	.byte	GOTO
	 .word	mus_route29_3_B1
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

mus_route29_4:
	.byte	KEYSH , mus_route29_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 19
	.byte		PAN   , c_v+24
	.byte		VOL   , 111*mus_route29_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W12
	.byte		VOICE , 0
	.byte		PAN   , c_v-23
	.byte		N06   , Dn1 , v112
	.byte	W24
	.byte		        Bn0 
	.byte	W24
	.byte		        Gn0 
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		VOICE , 0
	.byte		N84   , Gn0 
	.byte	W12
@ 002   ----------------------------------------
	.byte	W84
	.byte		VOICE , 19
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte	W12
@ 003   ----------------------------------------
mus_route29_4_B1:
	.byte		N12   , Gn1 
	.byte	W12
	.byte		VOICE , 19
	.byte		PAN   , c_v+9
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte		N12   , Cn2 , v127
	.byte	W12
	.byte		        Bn1 , v112
	.byte	W12
	.byte		        As1 , v127
	.byte	W12
	.byte		        An1 , v112
	.byte	W12
	.byte		        Gs1 , v127
	.byte	W12
	.byte		        Gn1 , v112
	.byte	W12
	.byte		        Fs1 , v127
	.byte	W12
@ 004   ----------------------------------------
	.byte		        Fn1 , v112
	.byte	W12
	.byte		N24   , Dn1 , v127
	.byte	W24
	.byte		        Gn1 , v112
	.byte	W24
	.byte		N36   , Cn1 , v127
	.byte	W36
@ 005   ----------------------------------------
	.byte		N12   , Gn0 , v112
	.byte	W12
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte		N06   , Cn1 , v127
	.byte	W12
	.byte		N12   , Cn2 , v112
	.byte	W12
	.byte		N06   , En1 
	.byte	W12
	.byte		N12   , En2 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 006   ----------------------------------------
	.byte		        Fs1 , v088
	.byte	W12
	.byte		N06   , Dn1 , v112
	.byte	W12
	.byte		N12   , Fn2 
	.byte	W12
	.byte		N06   , Dn1 
	.byte	W12
	.byte		N12   , Fs2 
	.byte	W12
	.byte		N06   , Dn2 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		N12   , An1 
	.byte	W12
	.byte		N24   , Gn1 , v127
	.byte	W12
@ 007   ----------------------------------------
	.byte	W12
	.byte		N06   , Cn1 
	.byte	W12
	.byte		N12   , Cn2 , v120
	.byte	W12
	.byte		N06   , En1 
	.byte	W12
	.byte		N12   , En2 , v112
	.byte	W12
	.byte		        An1 , v116
	.byte	W12
	.byte		        Gs1 , v127
	.byte	W12
	.byte		        Gn1 , v108
	.byte	W12
@ 008   ----------------------------------------
	.byte		        Fs1 , v127
	.byte	W12
	.byte		N06   , Dn1 
	.byte	W12
	.byte		N12   , Cn2 , v112
	.byte	W12
	.byte		N06   , Gn1 , v127
	.byte	W12
	.byte		N12   , Dn1 , v112
	.byte	W12
	.byte		N36   , Cn2 , v127
	.byte	W36
@ 009   ----------------------------------------
	.byte		N12   , Fs1 , v112
	.byte	W12
	.byte		VOICE , 19
	.byte		VOL   , 127*mus_route29_mvl/mxv
	.byte		N36   , Fn1 , v127
	.byte	W36
	.byte		N06   , En2 
	.byte	W06
	.byte		        Cn2 , v112
	.byte	W06
	.byte		N24   , Fn1 , v127
	.byte	W24
	.byte		N18   , Dn2 
	.byte	W12
@ 010   ----------------------------------------
	.byte	W06
	.byte		N06   , Bn1 
	.byte	W06
	.byte		N36   , En1 , v127, gtp3
	.byte	W42
	.byte		N03   , Gn2 
	.byte	W06
	.byte		N18   , En1 
	.byte	W18
	.byte		N03   , Cs2 
	.byte	W06
	.byte		N18   , An0 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W06
	.byte		N03   , An1 
	.byte	W06
	.byte		N36   , Dn1 , v127, gtp3
	.byte	W36
	.byte		N03   , Fn2 
	.byte	W06
	.byte		N06   , Cn2 
	.byte	W06
	.byte		N24   , Gn1 
	.byte	W24
	.byte		        En1 
	.byte	W12
@ 012   ----------------------------------------
	.byte	W12
	.byte		N36   , An1 
	.byte	W36
	.byte		N03   , Gn2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		N24   , En1 
	.byte	W24
	.byte		        Cs2 
	.byte	W12
@ 013   ----------------------------------------
	.byte	W12
	.byte		VOICE , 31
	.byte		PAN   , c_v+38
	.byte		N06   , Cn2 , v120
	.byte	W24
	.byte		        Fn1 
	.byte	W24
	.byte		        Dn2 
	.byte	W24
	.byte		        Fn1 
	.byte	W12
@ 014   ----------------------------------------
	.byte	W12
	.byte		        En1 
	.byte	W24
	.byte		N12   , Gn1 
	.byte	W12
	.byte		N06   , Gs1 
	.byte	W12
	.byte		N24   , Cs1 
	.byte	W24
	.byte		        An0 
	.byte	W12
@ 015   ----------------------------------------
	.byte	W12
	.byte		N12   , Dn1 
	.byte	W12
	.byte		N06   , En1 
	.byte	W12
	.byte		N12   , Fn1 
	.byte	W12
	.byte		N06   , An0 
	.byte	W12
	.byte		N21   , Gn0 
	.byte	W24
	.byte		N12   , Bn0 
	.byte	W12
@ 016   ----------------------------------------
	.byte		        Gn0 
	.byte	W12
	.byte		N09   , Cn1 
	.byte	W24
	.byte		N12   , Dn2 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		N09   , Cn1 
	.byte	W24
	.byte		N12   , Ds2 
	.byte	W12
@ 017   ----------------------------------------
	.byte		        Fs1 
	.byte	W12
	.byte		N09   , Gn0 
	.byte	W24
	.byte		N12   , Gn1 
	.byte	W12
	.byte		        Gn0 
	.byte	W12
	.byte		N36   , Cn1 
	.byte	W24
	.byte		VOICE , 19
	.byte	W12
	.byte	GOTO
	 .word	mus_route29_4_B1
	.byte	FINE

@******************************************************@
	.align	2

mus_route29:
	.byte	4	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mus_route29_pri	@ Priority
	.byte	mus_route29_rev	@ Reverb.

	.word	mus_route29_grp

	.word	mus_route29_1
	.word	mus_route29_2
	.word	mus_route29_3
	.word	mus_route29_4

	.end

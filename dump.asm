
target/thumbv7em-none-eabihf/release/examples/fundsp:     file format elf32-littlearm


Disassembly of section .program_header:

2000c000 <g_pfnVectors>:
2000c000:	dadac0de 	ble	1f6bc380 <_fasteheap+0xf6b0380>
2000c004:	2000c000 	andcs	ip, r0, r0
2000c008:	20016090 	mulcs	r1, r0, r0
2000c00c:	2000c039 	andcs	ip, r0, r9, lsr r0
2000c010:	200161a0 	andcs	r6, r1, r0, lsr #3
2000c014:	20020000 	andcs	r0, r2, r0
2000c018:	20016150 	andcs	r6, r1, r0, asr r1
2000c01c:	20016090 	mulcs	r1, r0, r0
2000c020:	20016090 	mulcs	r1, r0, r0
2000c024:	20016090 	mulcs	r1, r0, r0
2000c028:	20016090 	mulcs	r1, r0, r0
2000c02c:	20016150 	andcs	r6, r1, r0, asr r1

2000c030 <_ZN9owl_patch14program_vector12PROGRAM_NAME17h72ca182471000b66E>:
2000c030:	00000061 	andeq	r0, r0, r1, rrx
2000c034:	00000062 	andeq	r0, r0, r2, rrx

Disassembly of section .text:

2000c038 <Reset_Handler>:
2000c038:	2100      	movs	r1, #0
2000c03a:	e003      	b.n	2000c044 <LoopCopyDataInit>

2000c03c <CopyDataInit>:
2000c03c:	4b09      	ldr	r3, [pc, #36]	; (2000c064 <LoopFillZerobss+0xc>)
2000c03e:	585b      	ldr	r3, [r3, r1]
2000c040:	5043      	str	r3, [r0, r1]
2000c042:	1d09      	adds	r1, r1, #4

2000c044 <LoopCopyDataInit>:
2000c044:	4808      	ldr	r0, [pc, #32]	; (2000c068 <LoopFillZerobss+0x10>)
2000c046:	4b09      	ldr	r3, [pc, #36]	; (2000c06c <LoopFillZerobss+0x14>)
2000c048:	1842      	adds	r2, r0, r1
2000c04a:	429a      	cmp	r2, r3
2000c04c:	d3f6      	bcc.n	2000c03c <CopyDataInit>
2000c04e:	4a08      	ldr	r2, [pc, #32]	; (2000c070 <LoopFillZerobss+0x18>)
2000c050:	e002      	b.n	2000c058 <LoopFillZerobss>

2000c052 <FillZerobss>:
2000c052:	2300      	movs	r3, #0
2000c054:	f842 3b04 	str.w	r3, [r2], #4

2000c058 <LoopFillZerobss>:
2000c058:	4b06      	ldr	r3, [pc, #24]	; (2000c074 <LoopFillZerobss+0x1c>)
2000c05a:	429a      	cmp	r2, r3
2000c05c:	d3f9      	bcc.n	2000c052 <FillZerobss>
2000c05e:	f002 fbc7 	bl	2000e7f0 <main>
2000c062:	4770      	bx	lr
2000c064:	20016090 	mulcs	r1, r0, r0
2000c068:	20016090 	mulcs	r1, r0, r0
2000c06c:	20016090 	mulcs	r1, r0, r0
2000c070:	20016090 	mulcs	r1, r0, r0
2000c074:	20016150 	andcs	r6, r1, r0, asr r1

2000c078 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h868764a26f62ff62E>:
2000c078:	69ca      	ldr	r2, [r1, #28]
2000c07a:	6800      	ldr	r0, [r0, #0]
2000c07c:	06d3      	lsls	r3, r2, #27
2000c07e:	bf48      	it	mi
2000c080:	f005 bb62 	bmi.w	20011748 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E>
2000c084:	0692      	lsls	r2, r2, #26
2000c086:	bf58      	it	pl
2000c088:	f004 bb17 	bpl.w	200106ba <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE>
2000c08c:	f005 bdbb 	b.w	20011c06 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E>

2000c090 <_ZN4core9panicking13assert_failed17h1a41b77201a27e65E>:
2000c090:	b580      	push	{r7, lr}
2000c092:	466f      	mov	r7, sp
2000c094:	e96d 0102 	strd	r0, r1, [sp, #-8]!
2000c098:	4668      	mov	r0, sp
2000c09a:	a901      	add	r1, sp, #4
2000c09c:	f004 fcbd 	bl	20010a1a <_ZN4core9panicking19assert_failed_inner17h6552fb528287fcd7E>

2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>:
2000c0a0:	b5f0      	push	{r4, r5, r6, r7, lr}
2000c0a2:	af03      	add	r7, sp, #12
2000c0a4:	e92d 0b00 	stmdb	sp!, {r8, r9, fp}
2000c0a8:	f246 0e90 	movw	lr, #24720	; 0x6090
2000c0ac:	f2c2 0e01 	movt	lr, #8193	; 0x2001
2000c0b0:	e9de 230a 	ldrd	r2, r3, [lr, #40]	; 0x28
2000c0b4:	4408      	add	r0, r1
2000c0b6:	3a01      	subs	r2, #1
2000c0b8:	1a5b      	subs	r3, r3, r1
2000c0ba:	3003      	adds	r0, #3
2000c0bc:	e9ce 230a 	strd	r2, r3, [lr, #40]	; 0x28
2000c0c0:	f020 0003 	bic.w	r0, r0, #3
2000c0c4:	6803      	ldr	r3, [r0, #0]
2000c0c6:	4283      	cmp	r3, r0
2000c0c8:	bf8e      	itee	hi
2000c0ca:	f8d3 8000 	ldrhi.w	r8, [r3]
2000c0ce:	4698      	movls	r8, r3
2000c0d0:	4603      	movls	r3, r0
2000c0d2:	f028 0003 	bic.w	r0, r8, #3
2000c0d6:	f850 2c04 	ldr.w	r2, [r0, #-4]
2000c0da:	f103 0c04 	add.w	ip, r3, #4
2000c0de:	07d5      	lsls	r5, r2, #31
2000c0e0:	d108      	bne.n	2000c0f4 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x54>
2000c0e2:	2a40      	cmp	r2, #64	; 0x40
2000c0e4:	eba0 0002 	sub.w	r0, r0, r2
2000c0e8:	d20c      	bcs.n	2000c104 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x64>
2000c0ea:	3a0c      	subs	r2, #12
2000c0ec:	ea4f 0992 	mov.w	r9, r2, lsr #2
2000c0f0:	e01c      	b.n	2000c12c <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x8c>
2000c0f2:	bf00      	nop
2000c0f4:	1c91      	adds	r1, r2, #2
2000c0f6:	f840 1c04 	str.w	r1, [r0, #-4]
2000c0fa:	ea5f 7188 	movs.w	r1, r8, lsl #30
2000c0fe:	d52a      	bpl.n	2000c156 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0xb6>
2000c100:	e04f      	b.n	2000c1a2 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x102>
2000c102:	bf00      	nop
2000c104:	2a80      	cmp	r2, #128	; 0x80
2000c106:	d203      	bcs.n	2000c110 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x70>
2000c108:	2405      	movs	r4, #5
2000c10a:	eb04 09d2 	add.w	r9, r4, r2, lsr #3
2000c10e:	e00d      	b.n	2000c12c <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x8c>
2000c110:	fab2 f482 	clz	r4, r2
2000c114:	f1c4 051e 	rsb	r5, r4, #30
2000c118:	40ea      	lsrs	r2, r5
2000c11a:	eba2 0244 	sub.w	r2, r2, r4, lsl #1
2000c11e:	f102 0943 	add.w	r9, r2, #67	; 0x43
2000c122:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
2000c126:	bf28      	it	cs
2000c128:	f04f 093f 	movcs.w	r9, #63	; 0x3f
2000c12c:	6886      	ldr	r6, [r0, #8]
2000c12e:	e9de 120c 	ldrd	r1, r2, [lr, #48]	; 0x30
2000c132:	6804      	ldr	r4, [r0, #0]
2000c134:	6845      	ldr	r5, [r0, #4]
2000c136:	1b89      	subs	r1, r1, r6
2000c138:	3a01      	subs	r2, #1
2000c13a:	e9ce 120c 	strd	r1, r2, [lr, #48]	; 0x30
2000c13e:	2c00      	cmp	r4, #0
2000c140:	602c      	str	r4, [r5, #0]
2000c142:	bf18      	it	ne
2000c144:	6065      	strne	r5, [r4, #4]
2000c146:	f8de 1048 	ldr.w	r1, [lr, #72]	; 0x48
2000c14a:	f851 1029 	ldr.w	r1, [r1, r9, lsl #2]
2000c14e:	b159      	cbz	r1, 2000c168 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0xc8>
2000c150:	ea5f 7188 	movs.w	r1, r8, lsl #30
2000c154:	d425      	bmi.n	2000c1a2 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x102>
2000c156:	ebac 0100 	sub.w	r1, ip, r0
2000c15a:	2940      	cmp	r1, #64	; 0x40
2000c15c:	d265      	bcs.n	2000c22a <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x18a>
2000c15e:	f1a1 020c 	sub.w	r2, r1, #12
2000c162:	0893      	lsrs	r3, r2, #2
2000c164:	e075      	b.n	2000c252 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x1b2>
2000c166:	bf00      	nop
2000c168:	f1b9 0f20 	cmp.w	r9, #32
2000c16c:	d20c      	bcs.n	2000c188 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0xe8>
2000c16e:	2101      	movs	r1, #1
2000c170:	f8de 2040 	ldr.w	r2, [lr, #64]	; 0x40
2000c174:	fa01 f109 	lsl.w	r1, r1, r9
2000c178:	4051      	eors	r1, r2
2000c17a:	f8ce 1040 	str.w	r1, [lr, #64]	; 0x40
2000c17e:	ea5f 7188 	movs.w	r1, r8, lsl #30
2000c182:	d5e8      	bpl.n	2000c156 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0xb6>
2000c184:	e00d      	b.n	2000c1a2 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x102>
2000c186:	bf00      	nop
2000c188:	f009 011f 	and.w	r1, r9, #31
2000c18c:	2201      	movs	r2, #1
2000c18e:	f8de 4044 	ldr.w	r4, [lr, #68]	; 0x44
2000c192:	fa02 f101 	lsl.w	r1, r2, r1
2000c196:	4061      	eors	r1, r4
2000c198:	f8ce 1044 	str.w	r1, [lr, #68]	; 0x44
2000c19c:	ea5f 7188 	movs.w	r1, r8, lsl #30
2000c1a0:	d5d9      	bpl.n	2000c156 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0xb6>
2000c1a2:	68d9      	ldr	r1, [r3, #12]
2000c1a4:	2940      	cmp	r1, #64	; 0x40
2000c1a6:	d203      	bcs.n	2000c1b0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x110>
2000c1a8:	f1a1 020c 	sub.w	r2, r1, #12
2000c1ac:	0892      	lsrs	r2, r2, #2
2000c1ae:	e011      	b.n	2000c1d4 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x134>
2000c1b0:	2980      	cmp	r1, #128	; 0x80
2000c1b2:	d203      	bcs.n	2000c1bc <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x11c>
2000c1b4:	2205      	movs	r2, #5
2000c1b6:	eb02 02d1 	add.w	r2, r2, r1, lsr #3
2000c1ba:	e00b      	b.n	2000c1d4 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x134>
2000c1bc:	fab1 f281 	clz	r2, r1
2000c1c0:	f1c2 041e 	rsb	r4, r2, #30
2000c1c4:	fa21 f404 	lsr.w	r4, r1, r4
2000c1c8:	eba4 0242 	sub.w	r2, r4, r2, lsl #1
2000c1cc:	3243      	adds	r2, #67	; 0x43
2000c1ce:	2a3f      	cmp	r2, #63	; 0x3f
2000c1d0:	bf28      	it	cs
2000c1d2:	223f      	movcs	r2, #63	; 0x3f
2000c1d4:	e9de 450c 	ldrd	r4, r5, [lr, #48]	; 0x30
2000c1d8:	1a66      	subs	r6, r4, r1
2000c1da:	e9d3 3401 	ldrd	r3, r4, [r3, #4]
2000c1de:	3d01      	subs	r5, #1
2000c1e0:	e9ce 650c 	strd	r6, r5, [lr, #48]	; 0x30
2000c1e4:	2b00      	cmp	r3, #0
2000c1e6:	6023      	str	r3, [r4, #0]
2000c1e8:	bf18      	it	ne
2000c1ea:	605c      	strne	r4, [r3, #4]
2000c1ec:	f8de 3048 	ldr.w	r3, [lr, #72]	; 0x48
2000c1f0:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
2000c1f4:	b9a3      	cbnz	r3, 2000c220 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x180>
2000c1f6:	2a20      	cmp	r2, #32
2000c1f8:	d208      	bcs.n	2000c20c <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x16c>
2000c1fa:	2301      	movs	r3, #1
2000c1fc:	f8de 4040 	ldr.w	r4, [lr, #64]	; 0x40
2000c200:	fa03 f202 	lsl.w	r2, r3, r2
2000c204:	4062      	eors	r2, r4
2000c206:	f8ce 2040 	str.w	r2, [lr, #64]	; 0x40
2000c20a:	e009      	b.n	2000c220 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x180>
2000c20c:	f002 021f 	and.w	r2, r2, #31
2000c210:	2301      	movs	r3, #1
2000c212:	f8de 4044 	ldr.w	r4, [lr, #68]	; 0x44
2000c216:	fa03 f202 	lsl.w	r2, r3, r2
2000c21a:	4062      	eors	r2, r4
2000c21c:	f8ce 2044 	str.w	r2, [lr, #68]	; 0x44
2000c220:	448c      	add	ip, r1
2000c222:	ebac 0100 	sub.w	r1, ip, r0
2000c226:	2940      	cmp	r1, #64	; 0x40
2000c228:	d399      	bcc.n	2000c15e <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0xbe>
2000c22a:	2980      	cmp	r1, #128	; 0x80
2000c22c:	d204      	bcs.n	2000c238 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x198>
2000c22e:	2205      	movs	r2, #5
2000c230:	eb02 03d1 	add.w	r3, r2, r1, lsr #3
2000c234:	e00d      	b.n	2000c252 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x1b2>
2000c236:	bf00      	nop
2000c238:	fab1 f281 	clz	r2, r1
2000c23c:	f1c2 031e 	rsb	r3, r2, #30
2000c240:	fa21 f303 	lsr.w	r3, r1, r3
2000c244:	eba3 0242 	sub.w	r2, r3, r2, lsl #1
2000c248:	f102 0343 	add.w	r3, r2, #67	; 0x43
2000c24c:	2b3f      	cmp	r3, #63	; 0x3f
2000c24e:	bf28      	it	cs
2000c250:	233f      	movcs	r3, #63	; 0x3f
2000c252:	f8de 2048 	ldr.w	r2, [lr, #72]	; 0x48
2000c256:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
2000c25a:	eb02 0283 	add.w	r2, r2, r3, lsl #2
2000c25e:	b12c      	cbz	r4, 2000c26c <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x1cc>
2000c260:	e9c0 4200 	strd	r4, r2, [r0]
2000c264:	6010      	str	r0, [r2, #0]
2000c266:	1d22      	adds	r2, r4, #4
2000c268:	e019      	b.n	2000c29e <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x1fe>
2000c26a:	bf00      	nop
2000c26c:	2b20      	cmp	r3, #32
2000c26e:	d209      	bcs.n	2000c284 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x1e4>
2000c270:	2401      	movs	r4, #1
2000c272:	f8de 5040 	ldr.w	r5, [lr, #64]	; 0x40
2000c276:	fa04 f303 	lsl.w	r3, r4, r3
2000c27a:	406b      	eors	r3, r5
2000c27c:	f8ce 3040 	str.w	r3, [lr, #64]	; 0x40
2000c280:	e00a      	b.n	2000c298 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE+0x1f8>
2000c282:	bf00      	nop
2000c284:	f003 031f 	and.w	r3, r3, #31
2000c288:	2401      	movs	r4, #1
2000c28a:	f8de 5044 	ldr.w	r5, [lr, #68]	; 0x44
2000c28e:	fa04 f303 	lsl.w	r3, r4, r3
2000c292:	406b      	eors	r3, r5
2000c294:	f8ce 3044 	str.w	r3, [lr, #68]	; 0x44
2000c298:	2300      	movs	r3, #0
2000c29a:	e9c0 3200 	strd	r3, r2, [r0]
2000c29e:	6010      	str	r0, [r2, #0]
2000c2a0:	6081      	str	r1, [r0, #8]
2000c2a2:	e9de 020c 	ldrd	r0, r2, [lr, #48]	; 0x30
2000c2a6:	f84c 1c04 	str.w	r1, [ip, #-4]
2000c2aa:	4408      	add	r0, r1
2000c2ac:	1c51      	adds	r1, r2, #1
2000c2ae:	e9ce 010c 	strd	r0, r1, [lr, #48]	; 0x30
2000c2b2:	e8bd 0b00 	ldmia.w	sp!, {r8, r9, fp}
2000c2b6:	bdf0      	pop	{r4, r5, r6, r7, pc}

2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>:
2000c2b8:	b5f0      	push	{r4, r5, r6, r7, lr}
2000c2ba:	af03      	add	r7, sp, #12
2000c2bc:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
2000c2c0:	b083      	sub	sp, #12
2000c2c2:	1dca      	adds	r2, r1, #7
2000c2c4:	f022 0903 	bic.w	r9, r2, #3
2000c2c8:	2909      	cmp	r1, #9
2000c2ca:	f246 0c90 	movw	ip, #24720	; 0x6090
2000c2ce:	bf38      	it	cc
2000c2d0:	f04f 090c 	movcc.w	r9, #12
2000c2d4:	f1b9 0f40 	cmp.w	r9, #64	; 0x40
2000c2d8:	f2c2 0c01 	movt	ip, #8193	; 0x2001
2000c2dc:	d20c      	bcs.n	2000c2f8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x40>
2000c2de:	f1a9 020c 	sub.w	r2, r9, #12
2000c2e2:	0892      	lsrs	r2, r2, #2
2000c2e4:	2a20      	cmp	r2, #32
2000c2e6:	f080 80ea 	bcs.w	2000c4be <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x206>
2000c2ea:	f8dc 3040 	ldr.w	r3, [ip, #64]	; 0x40
2000c2ee:	40d3      	lsrs	r3, r2
2000c2f0:	f040 80ef 	bne.w	2000c4d2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x21a>
2000c2f4:	e00c      	b.n	2000c310 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x58>
2000c2f6:	bf00      	nop
2000c2f8:	f1b9 0f80 	cmp.w	r9, #128	; 0x80
2000c2fc:	f080 80d0 	bcs.w	2000c4a0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x1e8>
2000c300:	2205      	movs	r2, #5
2000c302:	eb02 02d9 	add.w	r2, r2, r9, lsr #3
2000c306:	f8dc 3040 	ldr.w	r3, [ip, #64]	; 0x40
2000c30a:	40d3      	lsrs	r3, r2
2000c30c:	f040 80e1 	bne.w	2000c4d2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x21a>
2000c310:	f8dc 2044 	ldr.w	r2, [ip, #68]	; 0x44
2000c314:	2a00      	cmp	r2, #0
2000c316:	f000 816c 	beq.w	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c31a:	fa92 f2a2 	rbit	r2, r2
2000c31e:	fab2 f282 	clz	r2, r2
2000c322:	f042 0e20 	orr.w	lr, r2, #32
2000c326:	2804      	cmp	r0, #4
2000c328:	f240 80dc 	bls.w	2000c4e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x22c>
2000c32c:	f8dc 2040 	ldr.w	r2, [ip, #64]	; 0x40
2000c330:	f1a0 0b01 	sub.w	fp, r0, #1
2000c334:	9202      	str	r2, [sp, #8]
2000c336:	e9dc 2a11 	ldrd	r2, sl, [ip, #68]	; 0x44
2000c33a:	f1c0 0800 	rsb	r8, r0, #0
2000c33e:	9201      	str	r2, [sp, #4]
2000c340:	b192      	cbz	r2, 2000c368 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0xb0>
2000c342:	fa92 f0a2 	rbit	r0, r2
2000c346:	fab0 f080 	clz	r0, r0
2000c34a:	f040 0020 	orr.w	r0, r0, #32
2000c34e:	9000      	str	r0, [sp, #0]
2000c350:	e059      	b.n	2000c406 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x14e>
2000c352:	bf00      	nop
2000c354:	9a02      	ldr	r2, [sp, #8]
2000c356:	40c2      	lsrs	r2, r0
2000c358:	f000 814b 	beq.w	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c35c:	fa92 f2a2 	rbit	r2, r2
2000c360:	fab2 f282 	clz	r2, r2
2000c364:	eb02 0e00 	add.w	lr, r2, r0
2000c368:	f85a 202e 	ldr.w	r2, [sl, lr, lsl #2]
2000c36c:	b3d2      	cbz	r2, 2000c3e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x12c>
2000c36e:	6896      	ldr	r6, [r2, #8]
2000c370:	6813      	ldr	r3, [r2, #0]
2000c372:	454e      	cmp	r6, r9
2000c374:	d309      	bcc.n	2000c38a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0xd2>
2000c376:	eb0b 0002 	add.w	r0, fp, r2
2000c37a:	ea00 0008 	and.w	r0, r0, r8
2000c37e:	1845      	adds	r5, r0, r1
2000c380:	1994      	adds	r4, r2, r6
2000c382:	3504      	adds	r5, #4
2000c384:	42a5      	cmp	r5, r4
2000c386:	f240 80eb 	bls.w	2000c560 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2a8>
2000c38a:	b35b      	cbz	r3, 2000c3e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x12c>
2000c38c:	689e      	ldr	r6, [r3, #8]
2000c38e:	681a      	ldr	r2, [r3, #0]
2000c390:	454e      	cmp	r6, r9
2000c392:	d309      	bcc.n	2000c3a8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0xf0>
2000c394:	eb0b 0003 	add.w	r0, fp, r3
2000c398:	ea00 0008 	and.w	r0, r0, r8
2000c39c:	1845      	adds	r5, r0, r1
2000c39e:	199c      	adds	r4, r3, r6
2000c3a0:	3504      	adds	r5, #4
2000c3a2:	42a5      	cmp	r5, r4
2000c3a4:	f240 80de 	bls.w	2000c564 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2ac>
2000c3a8:	b1e2      	cbz	r2, 2000c3e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x12c>
2000c3aa:	6896      	ldr	r6, [r2, #8]
2000c3ac:	6813      	ldr	r3, [r2, #0]
2000c3ae:	454e      	cmp	r6, r9
2000c3b0:	d309      	bcc.n	2000c3c6 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x10e>
2000c3b2:	eb0b 0002 	add.w	r0, fp, r2
2000c3b6:	ea00 0008 	and.w	r0, r0, r8
2000c3ba:	1845      	adds	r5, r0, r1
2000c3bc:	1994      	adds	r4, r2, r6
2000c3be:	3504      	adds	r5, #4
2000c3c0:	42a5      	cmp	r5, r4
2000c3c2:	f240 80cd 	bls.w	2000c560 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2a8>
2000c3c6:	b16b      	cbz	r3, 2000c3e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x12c>
2000c3c8:	689e      	ldr	r6, [r3, #8]
2000c3ca:	681a      	ldr	r2, [r3, #0]
2000c3cc:	454e      	cmp	r6, r9
2000c3ce:	d3cd      	bcc.n	2000c36c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0xb4>
2000c3d0:	eb0b 0003 	add.w	r0, fp, r3
2000c3d4:	ea00 0008 	and.w	r0, r0, r8
2000c3d8:	1845      	adds	r5, r0, r1
2000c3da:	199c      	adds	r4, r3, r6
2000c3dc:	3504      	adds	r5, #4
2000c3de:	42a5      	cmp	r5, r4
2000c3e0:	d8c4      	bhi.n	2000c36c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0xb4>
2000c3e2:	e0bf      	b.n	2000c564 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2ac>
2000c3e4:	f10e 0001 	add.w	r0, lr, #1
2000c3e8:	281f      	cmp	r0, #31
2000c3ea:	d9b3      	bls.n	2000c354 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x9c>
2000c3ec:	e101      	b.n	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c3ee:	bf00      	nop
2000c3f0:	9a02      	ldr	r2, [sp, #8]
2000c3f2:	f8dd e000 	ldr.w	lr, [sp]
2000c3f6:	40c2      	lsrs	r2, r0
2000c3f8:	d005      	beq.n	2000c406 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x14e>
2000c3fa:	fa92 f2a2 	rbit	r2, r2
2000c3fe:	fab2 f282 	clz	r2, r2
2000c402:	eb02 0e00 	add.w	lr, r2, r0
2000c406:	f85a 202e 	ldr.w	r2, [sl, lr, lsl #2]
2000c40a:	b3da      	cbz	r2, 2000c484 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x1cc>
2000c40c:	6896      	ldr	r6, [r2, #8]
2000c40e:	6813      	ldr	r3, [r2, #0]
2000c410:	454e      	cmp	r6, r9
2000c412:	d309      	bcc.n	2000c428 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x170>
2000c414:	eb0b 0002 	add.w	r0, fp, r2
2000c418:	ea00 0008 	and.w	r0, r0, r8
2000c41c:	1845      	adds	r5, r0, r1
2000c41e:	1994      	adds	r4, r2, r6
2000c420:	3504      	adds	r5, #4
2000c422:	42a5      	cmp	r5, r4
2000c424:	f240 809c 	bls.w	2000c560 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2a8>
2000c428:	b363      	cbz	r3, 2000c484 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x1cc>
2000c42a:	689e      	ldr	r6, [r3, #8]
2000c42c:	681a      	ldr	r2, [r3, #0]
2000c42e:	454e      	cmp	r6, r9
2000c430:	d309      	bcc.n	2000c446 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x18e>
2000c432:	eb0b 0003 	add.w	r0, fp, r3
2000c436:	ea00 0008 	and.w	r0, r0, r8
2000c43a:	1845      	adds	r5, r0, r1
2000c43c:	199c      	adds	r4, r3, r6
2000c43e:	3504      	adds	r5, #4
2000c440:	42a5      	cmp	r5, r4
2000c442:	f240 808f 	bls.w	2000c564 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2ac>
2000c446:	b1ea      	cbz	r2, 2000c484 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x1cc>
2000c448:	6896      	ldr	r6, [r2, #8]
2000c44a:	6813      	ldr	r3, [r2, #0]
2000c44c:	454e      	cmp	r6, r9
2000c44e:	d309      	bcc.n	2000c464 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x1ac>
2000c450:	eb0b 0002 	add.w	r0, fp, r2
2000c454:	ea00 0008 	and.w	r0, r0, r8
2000c458:	1845      	adds	r5, r0, r1
2000c45a:	1994      	adds	r4, r2, r6
2000c45c:	3504      	adds	r5, #4
2000c45e:	42a5      	cmp	r5, r4
2000c460:	f240 807e 	bls.w	2000c560 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2a8>
2000c464:	b173      	cbz	r3, 2000c484 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x1cc>
2000c466:	689e      	ldr	r6, [r3, #8]
2000c468:	681a      	ldr	r2, [r3, #0]
2000c46a:	454e      	cmp	r6, r9
2000c46c:	d3cd      	bcc.n	2000c40a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x152>
2000c46e:	eb0b 0003 	add.w	r0, fp, r3
2000c472:	ea00 0008 	and.w	r0, r0, r8
2000c476:	1845      	adds	r5, r0, r1
2000c478:	199c      	adds	r4, r3, r6
2000c47a:	3504      	adds	r5, #4
2000c47c:	42a5      	cmp	r5, r4
2000c47e:	d8c4      	bhi.n	2000c40a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x152>
2000c480:	e070      	b.n	2000c564 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2ac>
2000c482:	bf00      	nop
2000c484:	f10e 0001 	add.w	r0, lr, #1
2000c488:	2820      	cmp	r0, #32
2000c48a:	d3b1      	bcc.n	2000c3f0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x138>
2000c48c:	2840      	cmp	r0, #64	; 0x40
2000c48e:	f080 80b0 	bcs.w	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c492:	9b01      	ldr	r3, [sp, #4]
2000c494:	f000 021f 	and.w	r2, r0, #31
2000c498:	fa33 f202 	lsrs.w	r2, r3, r2
2000c49c:	d1ad      	bne.n	2000c3fa <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x142>
2000c49e:	e0a8      	b.n	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c4a0:	fab9 f289 	clz	r2, r9
2000c4a4:	f1c2 031e 	rsb	r3, r2, #30
2000c4a8:	fa29 f303 	lsr.w	r3, r9, r3
2000c4ac:	eba3 0242 	sub.w	r2, r3, r2, lsl #1
2000c4b0:	3243      	adds	r2, #67	; 0x43
2000c4b2:	2a3f      	cmp	r2, #63	; 0x3f
2000c4b4:	bf28      	it	cs
2000c4b6:	223f      	movcs	r2, #63	; 0x3f
2000c4b8:	2a20      	cmp	r2, #32
2000c4ba:	f4ff af16 	bcc.w	2000c2ea <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x32>
2000c4be:	2a40      	cmp	r2, #64	; 0x40
2000c4c0:	f080 8097 	bcs.w	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c4c4:	f8dc 3044 	ldr.w	r3, [ip, #68]	; 0x44
2000c4c8:	f002 061f 	and.w	r6, r2, #31
2000c4cc:	40f3      	lsrs	r3, r6
2000c4ce:	f000 8090 	beq.w	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c4d2:	fa93 f3a3 	rbit	r3, r3
2000c4d6:	fab3 f383 	clz	r3, r3
2000c4da:	eb03 0e02 	add.w	lr, r3, r2
2000c4de:	2804      	cmp	r0, #4
2000c4e0:	f63f af24 	bhi.w	2000c32c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x74>
2000c4e4:	e9dc 8a10 	ldrd	r8, sl, [ip, #64]	; 0x40
2000c4e8:	f8dc 6048 	ldr.w	r6, [ip, #72]	; 0x48
2000c4ec:	f1ba 0f00 	cmp.w	sl, #0
2000c4f0:	d060      	beq.n	2000c5b4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2fc>
2000c4f2:	fa9a f0aa 	rbit	r0, sl
2000c4f6:	fab0 f080 	clz	r0, r0
2000c4fa:	f040 0320 	orr.w	r3, r0, #32
2000c4fe:	eb06 0b8e 	add.w	fp, r6, lr, lsl #2
2000c502:	465a      	mov	r2, fp
2000c504:	6812      	ldr	r2, [r2, #0]
2000c506:	b19a      	cbz	r2, 2000c530 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x278>
2000c508:	6890      	ldr	r0, [r2, #8]
2000c50a:	4548      	cmp	r0, r9
2000c50c:	d276      	bcs.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c50e:	6812      	ldr	r2, [r2, #0]
2000c510:	b172      	cbz	r2, 2000c530 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x278>
2000c512:	6890      	ldr	r0, [r2, #8]
2000c514:	4548      	cmp	r0, r9
2000c516:	d271      	bcs.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c518:	6812      	ldr	r2, [r2, #0]
2000c51a:	b14a      	cbz	r2, 2000c530 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x278>
2000c51c:	6890      	ldr	r0, [r2, #8]
2000c51e:	4548      	cmp	r0, r9
2000c520:	d26c      	bcs.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c522:	6812      	ldr	r2, [r2, #0]
2000c524:	b122      	cbz	r2, 2000c530 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x278>
2000c526:	6890      	ldr	r0, [r2, #8]
2000c528:	4548      	cmp	r0, r9
2000c52a:	d3eb      	bcc.n	2000c504 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x24c>
2000c52c:	e066      	b.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c52e:	bf00      	nop
2000c530:	f10e 0001 	add.w	r0, lr, #1
2000c534:	2820      	cmp	r0, #32
2000c536:	d205      	bcs.n	2000c544 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x28c>
2000c538:	fa38 f200 	lsrs.w	r2, r8, r0
2000c53c:	469e      	mov	lr, r3
2000c53e:	d108      	bne.n	2000c552 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x29a>
2000c540:	e7dd      	b.n	2000c4fe <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x246>
2000c542:	bf00      	nop
2000c544:	2840      	cmp	r0, #64	; 0x40
2000c546:	d254      	bcs.n	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c548:	f000 021f 	and.w	r2, r0, #31
2000c54c:	fa3a f202 	lsrs.w	r2, sl, r2
2000c550:	d04f      	beq.n	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c552:	fa92 f2a2 	rbit	r2, r2
2000c556:	fab2 f282 	clz	r2, r2
2000c55a:	eb02 0e00 	add.w	lr, r2, r0
2000c55e:	e7ce      	b.n	2000c4fe <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x246>
2000c560:	4698      	mov	r8, r3
2000c562:	e001      	b.n	2000c568 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2b0>
2000c564:	4690      	mov	r8, r2
2000c566:	461a      	mov	r2, r3
2000c568:	e9dc 350c 	ldrd	r3, r5, [ip, #48]	; 0x30
2000c56c:	f1b8 0f00 	cmp.w	r8, #0
2000c570:	eba3 0306 	sub.w	r3, r3, r6
2000c574:	f1a5 0501 	sub.w	r5, r5, #1
2000c578:	e9cc 350c 	strd	r3, r5, [ip, #48]	; 0x30
2000c57c:	6853      	ldr	r3, [r2, #4]
2000c57e:	f8c3 8000 	str.w	r8, [r3]
2000c582:	bf18      	it	ne
2000c584:	f8c8 3004 	strne.w	r3, [r8, #4]
2000c588:	f85a 302e 	ldr.w	r3, [sl, lr, lsl #2]
2000c58c:	2b00      	cmp	r3, #0
2000c58e:	d15a      	bne.n	2000c646 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x38e>
2000c590:	f1be 0f20 	cmp.w	lr, #32
2000c594:	f080 8142 	bcs.w	2000c81c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x564>
2000c598:	2301      	movs	r3, #1
2000c59a:	9e02      	ldr	r6, [sp, #8]
2000c59c:	fa03 f30e 	lsl.w	r3, r3, lr
2000c5a0:	4073      	eors	r3, r6
2000c5a2:	f8cc 3040 	str.w	r3, [ip, #64]	; 0x40
2000c5a6:	e04e      	b.n	2000c646 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x38e>
2000c5a8:	fa92 f2a2 	rbit	r2, r2
2000c5ac:	fab2 f282 	clz	r2, r2
2000c5b0:	eb02 0e00 	add.w	lr, r2, r0
2000c5b4:	eb06 0b8e 	add.w	fp, r6, lr, lsl #2
2000c5b8:	465a      	mov	r2, fp
2000c5ba:	6812      	ldr	r2, [r2, #0]
2000c5bc:	b192      	cbz	r2, 2000c5e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x32c>
2000c5be:	6890      	ldr	r0, [r2, #8]
2000c5c0:	4548      	cmp	r0, r9
2000c5c2:	d21b      	bcs.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c5c4:	6812      	ldr	r2, [r2, #0]
2000c5c6:	b16a      	cbz	r2, 2000c5e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x32c>
2000c5c8:	6890      	ldr	r0, [r2, #8]
2000c5ca:	4548      	cmp	r0, r9
2000c5cc:	d216      	bcs.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c5ce:	6812      	ldr	r2, [r2, #0]
2000c5d0:	b142      	cbz	r2, 2000c5e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x32c>
2000c5d2:	6890      	ldr	r0, [r2, #8]
2000c5d4:	4548      	cmp	r0, r9
2000c5d6:	d211      	bcs.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c5d8:	6812      	ldr	r2, [r2, #0]
2000c5da:	b11a      	cbz	r2, 2000c5e4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x32c>
2000c5dc:	6890      	ldr	r0, [r2, #8]
2000c5de:	4548      	cmp	r0, r9
2000c5e0:	d3eb      	bcc.n	2000c5ba <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x302>
2000c5e2:	e00b      	b.n	2000c5fc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x344>
2000c5e4:	f10e 0001 	add.w	r0, lr, #1
2000c5e8:	281f      	cmp	r0, #31
2000c5ea:	d802      	bhi.n	2000c5f2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x33a>
2000c5ec:	fa38 f200 	lsrs.w	r2, r8, r0
2000c5f0:	d1da      	bne.n	2000c5a8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x2f0>
2000c5f2:	2000      	movs	r0, #0
2000c5f4:	b003      	add	sp, #12
2000c5f6:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2000c5fa:	bdf0      	pop	{r4, r5, r6, r7, pc}
2000c5fc:	e9dc 360c 	ldrd	r3, r6, [ip, #48]	; 0x30
2000c600:	1a1c      	subs	r4, r3, r0
2000c602:	1e75      	subs	r5, r6, #1
2000c604:	e9d2 3600 	ldrd	r3, r6, [r2]
2000c608:	e9cc 450c 	strd	r4, r5, [ip, #48]	; 0x30
2000c60c:	2b00      	cmp	r3, #0
2000c60e:	6033      	str	r3, [r6, #0]
2000c610:	bf18      	it	ne
2000c612:	605e      	strne	r6, [r3, #4]
2000c614:	f8db 3000 	ldr.w	r3, [fp]
2000c618:	b99b      	cbnz	r3, 2000c642 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x38a>
2000c61a:	f1be 0f20 	cmp.w	lr, #32
2000c61e:	d207      	bcs.n	2000c630 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x378>
2000c620:	2301      	movs	r3, #1
2000c622:	fa03 f30e 	lsl.w	r3, r3, lr
2000c626:	ea83 0308 	eor.w	r3, r3, r8
2000c62a:	f8cc 3040 	str.w	r3, [ip, #64]	; 0x40
2000c62e:	e008      	b.n	2000c642 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x38a>
2000c630:	f00e 031f 	and.w	r3, lr, #31
2000c634:	2601      	movs	r6, #1
2000c636:	fa06 f303 	lsl.w	r3, r6, r3
2000c63a:	ea83 030a 	eor.w	r3, r3, sl
2000c63e:	f8cc 3044 	str.w	r3, [ip, #68]	; 0x44
2000c642:	1814      	adds	r4, r2, r0
2000c644:	4610      	mov	r0, r2
2000c646:	f1a4 090c 	sub.w	r9, r4, #12
2000c64a:	4548      	cmp	r0, r9
2000c64c:	bf98      	it	ls
2000c64e:	4681      	movls	r9, r0
2000c650:	eba9 0602 	sub.w	r6, r9, r2
2000c654:	2e0b      	cmp	r6, #11
2000c656:	d907      	bls.n	2000c668 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x3b0>
2000c658:	2e40      	cmp	r6, #64	; 0x40
2000c65a:	d20d      	bcs.n	2000c678 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x3c0>
2000c65c:	f1a6 030c 	sub.w	r3, r6, #12
2000c660:	ea4f 0893 	mov.w	r8, r3, lsr #2
2000c664:	e01d      	b.n	2000c6a2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x3ea>
2000c666:	bf00      	nop
2000c668:	f852 3c04 	ldr.w	r3, [r2, #-4]
2000c66c:	4691      	mov	r9, r2
2000c66e:	3b02      	subs	r3, #2
2000c670:	f842 3c04 	str.w	r3, [r2, #-4]
2000c674:	e049      	b.n	2000c70a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x452>
2000c676:	bf00      	nop
2000c678:	2e80      	cmp	r6, #128	; 0x80
2000c67a:	d203      	bcs.n	2000c684 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x3cc>
2000c67c:	2305      	movs	r3, #5
2000c67e:	eb03 08d6 	add.w	r8, r3, r6, lsr #3
2000c682:	e00e      	b.n	2000c6a2 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x3ea>
2000c684:	fab6 f386 	clz	r3, r6
2000c688:	f1c3 051e 	rsb	r5, r3, #30
2000c68c:	fa26 f505 	lsr.w	r5, r6, r5
2000c690:	eba5 0343 	sub.w	r3, r5, r3, lsl #1
2000c694:	f103 0843 	add.w	r8, r3, #67	; 0x43
2000c698:	f1b8 0f3f 	cmp.w	r8, #63	; 0x3f
2000c69c:	bf28      	it	cs
2000c69e:	f04f 083f 	movcs.w	r8, #63	; 0x3f
2000c6a2:	f8dc 3048 	ldr.w	r3, [ip, #72]	; 0x48
2000c6a6:	f853 5028 	ldr.w	r5, [r3, r8, lsl #2]
2000c6aa:	eb03 0e88 	add.w	lr, r3, r8, lsl #2
2000c6ae:	b13d      	cbz	r5, 2000c6c0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x408>
2000c6b0:	e9c2 5e00 	strd	r5, lr, [r2]
2000c6b4:	f8ce 2000 	str.w	r2, [lr]
2000c6b8:	f105 0e04 	add.w	lr, r5, #4
2000c6bc:	e01a      	b.n	2000c6f4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x43c>
2000c6be:	bf00      	nop
2000c6c0:	f1b8 0f20 	cmp.w	r8, #32
2000c6c4:	d208      	bcs.n	2000c6d8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x420>
2000c6c6:	2301      	movs	r3, #1
2000c6c8:	f8dc 5040 	ldr.w	r5, [ip, #64]	; 0x40
2000c6cc:	fa03 f308 	lsl.w	r3, r3, r8
2000c6d0:	406b      	eors	r3, r5
2000c6d2:	f8cc 3040 	str.w	r3, [ip, #64]	; 0x40
2000c6d6:	e00a      	b.n	2000c6ee <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x436>
2000c6d8:	f008 031f 	and.w	r3, r8, #31
2000c6dc:	f04f 0801 	mov.w	r8, #1
2000c6e0:	f8dc 5044 	ldr.w	r5, [ip, #68]	; 0x44
2000c6e4:	fa08 f303 	lsl.w	r3, r8, r3
2000c6e8:	406b      	eors	r3, r5
2000c6ea:	f8cc 3044 	str.w	r3, [ip, #68]	; 0x44
2000c6ee:	2300      	movs	r3, #0
2000c6f0:	e9c2 3e00 	strd	r3, lr, [r2]
2000c6f4:	f8ce 2000 	str.w	r2, [lr]
2000c6f8:	6096      	str	r6, [r2, #8]
2000c6fa:	e9dc 230c 	ldrd	r2, r3, [ip, #48]	; 0x30
2000c6fe:	f849 6c04 	str.w	r6, [r9, #-4]
2000c702:	4432      	add	r2, r6
2000c704:	3301      	adds	r3, #1
2000c706:	e9cc 230c 	strd	r2, r3, [ip, #48]	; 0x30
2000c70a:	1842      	adds	r2, r0, r1
2000c70c:	3203      	adds	r2, #3
2000c70e:	f022 0803 	bic.w	r8, r2, #3
2000c712:	f109 0608 	add.w	r6, r9, #8
2000c716:	4546      	cmp	r6, r8
2000c718:	bf98      	it	ls
2000c71a:	4646      	movls	r6, r8
2000c71c:	f106 0e04 	add.w	lr, r6, #4
2000c720:	eba4 050e 	sub.w	r5, r4, lr
2000c724:	2d0b      	cmp	r5, #11
2000c726:	d907      	bls.n	2000c738 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x480>
2000c728:	2d40      	cmp	r5, #64	; 0x40
2000c72a:	d209      	bcs.n	2000c740 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x488>
2000c72c:	f1a5 020c 	sub.w	r2, r5, #12
2000c730:	ea4f 0b92 	mov.w	fp, r2, lsr #2
2000c734:	e019      	b.n	2000c76a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x4b2>
2000c736:	bf00      	nop
2000c738:	1f26      	subs	r6, r4, #4
2000c73a:	2201      	movs	r2, #1
2000c73c:	e04a      	b.n	2000c7d4 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x51c>
2000c73e:	bf00      	nop
2000c740:	2d80      	cmp	r5, #128	; 0x80
2000c742:	d203      	bcs.n	2000c74c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x494>
2000c744:	2205      	movs	r2, #5
2000c746:	eb02 0bd5 	add.w	fp, r2, r5, lsr #3
2000c74a:	e00e      	b.n	2000c76a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x4b2>
2000c74c:	fab5 f285 	clz	r2, r5
2000c750:	f1c2 031e 	rsb	r3, r2, #30
2000c754:	fa25 f303 	lsr.w	r3, r5, r3
2000c758:	eba3 0242 	sub.w	r2, r3, r2, lsl #1
2000c75c:	f102 0b43 	add.w	fp, r2, #67	; 0x43
2000c760:	f1bb 0f3f 	cmp.w	fp, #63	; 0x3f
2000c764:	bf28      	it	cs
2000c766:	f04f 0b3f 	movcs.w	fp, #63	; 0x3f
2000c76a:	f8dc 3048 	ldr.w	r3, [ip, #72]	; 0x48
2000c76e:	f853 202b 	ldr.w	r2, [r3, fp, lsl #2]
2000c772:	eb03 0a8b 	add.w	sl, r3, fp, lsl #2
2000c776:	b13a      	cbz	r2, 2000c788 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x4d0>
2000c778:	e9c6 2a01 	strd	r2, sl, [r6, #4]
2000c77c:	f8ca e000 	str.w	lr, [sl]
2000c780:	f102 0a04 	add.w	sl, r2, #4
2000c784:	e01a      	b.n	2000c7bc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x504>
2000c786:	bf00      	nop
2000c788:	f1bb 0f20 	cmp.w	fp, #32
2000c78c:	d208      	bcs.n	2000c7a0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x4e8>
2000c78e:	2201      	movs	r2, #1
2000c790:	f8dc 3040 	ldr.w	r3, [ip, #64]	; 0x40
2000c794:	fa02 f20b 	lsl.w	r2, r2, fp
2000c798:	405a      	eors	r2, r3
2000c79a:	f8cc 2040 	str.w	r2, [ip, #64]	; 0x40
2000c79e:	e00a      	b.n	2000c7b6 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x4fe>
2000c7a0:	f00b 021f 	and.w	r2, fp, #31
2000c7a4:	f04f 0b01 	mov.w	fp, #1
2000c7a8:	f8dc 3044 	ldr.w	r3, [ip, #68]	; 0x44
2000c7ac:	fa0b f202 	lsl.w	r2, fp, r2
2000c7b0:	405a      	eors	r2, r3
2000c7b2:	f8cc 2044 	str.w	r2, [ip, #68]	; 0x44
2000c7b6:	2200      	movs	r2, #0
2000c7b8:	e9c6 2a01 	strd	r2, sl, [r6, #4]
2000c7bc:	e9dc 230c 	ldrd	r2, r3, [ip, #48]	; 0x30
2000c7c0:	f8ca e000 	str.w	lr, [sl]
2000c7c4:	442a      	add	r2, r5
2000c7c6:	3301      	adds	r3, #1
2000c7c8:	e9cc 230c 	strd	r2, r3, [ip, #48]	; 0x30
2000c7cc:	2203      	movs	r2, #3
2000c7ce:	60f5      	str	r5, [r6, #12]
2000c7d0:	f844 5c04 	str.w	r5, [r4, #-4]
2000c7d4:	444a      	add	r2, r9
2000c7d6:	4546      	cmp	r6, r8
2000c7d8:	6032      	str	r2, [r6, #0]
2000c7da:	bf18      	it	ne
2000c7dc:	f8c8 6000 	strne.w	r6, [r8]
2000c7e0:	f8dc 2028 	ldr.w	r2, [ip, #40]	; 0x28
2000c7e4:	f8dc 302c 	ldr.w	r3, [ip, #44]	; 0x2c
2000c7e8:	3201      	adds	r2, #1
2000c7ea:	f8cc 2028 	str.w	r2, [ip, #40]	; 0x28
2000c7ee:	185a      	adds	r2, r3, r1
2000c7f0:	f10c 0608 	add.w	r6, ip, #8
2000c7f4:	f8cc 202c 	str.w	r2, [ip, #44]	; 0x2c
2000c7f8:	ce4c      	ldmia	r6, {r2, r3, r6}
2000c7fa:	f8dc 5014 	ldr.w	r5, [ip, #20]
2000c7fe:	3201      	adds	r2, #1
2000c800:	f143 0300 	adc.w	r3, r3, #0
2000c804:	1989      	adds	r1, r1, r6
2000c806:	f145 0600 	adc.w	r6, r5, #0
2000c80a:	e9cc 2302 	strd	r2, r3, [ip, #8]
2000c80e:	e9cc 1604 	strd	r1, r6, [ip, #16]
2000c812:	b003      	add	sp, #12
2000c814:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2000c818:	bdf0      	pop	{r4, r5, r6, r7, pc}
2000c81a:	bf00      	nop
2000c81c:	f00e 031f 	and.w	r3, lr, #31
2000c820:	2601      	movs	r6, #1
2000c822:	fa06 f303 	lsl.w	r3, r6, r3
2000c826:	9e01      	ldr	r6, [sp, #4]
2000c828:	4073      	eors	r3, r6
2000c82a:	f8cc 3044 	str.w	r3, [ip, #68]	; 0x44
2000c82e:	e70a      	b.n	2000c646 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE+0x38e>

2000c830 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E>:
2000c830:	b301      	cbz	r1, 2000c874 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x44>
2000c832:	b5f0      	push	{r4, r5, r6, r7, lr}
2000c834:	af03      	add	r7, sp, #12
2000c836:	f84d 8d04 	str.w	r8, [sp, #-4]!
2000c83a:	4614      	mov	r4, r2
2000c83c:	f1b2 3fff 	cmp.w	r2, #4294967295	; 0xffffffff
2000c840:	dd1e      	ble.n	2000c880 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x50>
2000c842:	460d      	mov	r5, r1
2000c844:	6859      	ldr	r1, [r3, #4]
2000c846:	b1f9      	cbz	r1, 2000c888 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x58>
2000c848:	6899      	ldr	r1, [r3, #8]
2000c84a:	b399      	cbz	r1, 2000c8b4 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x84>
2000c84c:	681a      	ldr	r2, [r3, #0]
2000c84e:	4606      	mov	r6, r0
2000c850:	4610      	mov	r0, r2
2000c852:	462a      	mov	r2, r5
2000c854:	4623      	mov	r3, r4
2000c856:	f003 fb13 	bl	2000fe80 <__rust_realloc>
2000c85a:	4601      	mov	r1, r0
2000c85c:	4630      	mov	r0, r6
2000c85e:	2900      	cmp	r1, #0
2000c860:	d048      	beq.n	2000c8f4 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xc4>
2000c862:	e9c0 1401 	strd	r1, r4, [r0, #4]
2000c866:	2100      	movs	r1, #0
2000c868:	f85d 8b04 	ldr.w	r8, [sp], #4
2000c86c:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
2000c870:	6001      	str	r1, [r0, #0]
2000c872:	4770      	bx	lr
2000c874:	2100      	movs	r1, #0
2000c876:	6041      	str	r1, [r0, #4]
2000c878:	2101      	movs	r1, #1
2000c87a:	6001      	str	r1, [r0, #0]
2000c87c:	4770      	bx	lr
2000c87e:	bf00      	nop
2000c880:	2100      	movs	r1, #0
2000c882:	6041      	str	r1, [r0, #4]
2000c884:	e038      	b.n	2000c8f8 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xc8>
2000c886:	bf00      	nop
2000c888:	2c00      	cmp	r4, #0
2000c88a:	d03d      	beq.n	2000c908 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xd8>
2000c88c:	f246 01e0 	movw	r1, #24800	; 0x60e0
2000c890:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000c894:	f246 0690 	movw	r6, #24720	; 0x6090
2000c898:	7849      	ldrb	r1, [r1, #1]
2000c89a:	f2c2 0601 	movt	r6, #8193	; 0x2001
2000c89e:	e8d6 1f4f 	ldrexb	r1, [r6]
2000c8a2:	4680      	mov	r8, r0
2000c8a4:	2900      	cmp	r1, #0
2000c8a6:	d149      	bne.n	2000c93c <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x10c>
2000c8a8:	2001      	movs	r0, #1
2000c8aa:	e8c6 0f41 	strexb	r1, r0, [r6]
2000c8ae:	2900      	cmp	r1, #0
2000c8b0:	d146      	bne.n	2000c940 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x110>
2000c8b2:	e011      	b.n	2000c8d8 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xa8>
2000c8b4:	b344      	cbz	r4, 2000c908 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xd8>
2000c8b6:	f246 01e0 	movw	r1, #24800	; 0x60e0
2000c8ba:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000c8be:	f246 0690 	movw	r6, #24720	; 0x6090
2000c8c2:	7849      	ldrb	r1, [r1, #1]
2000c8c4:	f2c2 0601 	movt	r6, #8193	; 0x2001
2000c8c8:	e8d6 1f4f 	ldrexb	r1, [r6]
2000c8cc:	4680      	mov	r8, r0
2000c8ce:	b9f9      	cbnz	r1, 2000c910 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xe0>
2000c8d0:	2001      	movs	r0, #1
2000c8d2:	e8c6 0f41 	strexb	r1, r0, [r6]
2000c8d6:	b9e9      	cbnz	r1, 2000c914 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xe4>
2000c8d8:	4628      	mov	r0, r5
2000c8da:	4621      	mov	r1, r4
2000c8dc:	f3bf 8f5f 	dmb	sy
2000c8e0:	f7ff fcea 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000c8e4:	4601      	mov	r1, r0
2000c8e6:	2000      	movs	r0, #0
2000c8e8:	f3bf 8f5f 	dmb	sy
2000c8ec:	7030      	strb	r0, [r6, #0]
2000c8ee:	4640      	mov	r0, r8
2000c8f0:	2900      	cmp	r1, #0
2000c8f2:	d1b6      	bne.n	2000c862 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x32>
2000c8f4:	e9c0 5401 	strd	r5, r4, [r0, #4]
2000c8f8:	2101      	movs	r1, #1
2000c8fa:	f85d 8b04 	ldr.w	r8, [sp], #4
2000c8fe:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
2000c902:	6001      	str	r1, [r0, #0]
2000c904:	4770      	bx	lr
2000c906:	bf00      	nop
2000c908:	4629      	mov	r1, r5
2000c90a:	2900      	cmp	r1, #0
2000c90c:	d1a9      	bne.n	2000c862 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x32>
2000c90e:	e7f1      	b.n	2000c8f4 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xc4>
2000c910:	f3bf 8f2f 	clrex
2000c914:	7830      	ldrb	r0, [r6, #0]
2000c916:	b160      	cbz	r0, 2000c932 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x102>
2000c918:	bf10      	yield
2000c91a:	7830      	ldrb	r0, [r6, #0]
2000c91c:	b148      	cbz	r0, 2000c932 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x102>
2000c91e:	bf10      	yield
2000c920:	7830      	ldrb	r0, [r6, #0]
2000c922:	b130      	cbz	r0, 2000c932 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x102>
2000c924:	bf10      	yield
2000c926:	7830      	ldrb	r0, [r6, #0]
2000c928:	b118      	cbz	r0, 2000c932 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x102>
2000c92a:	bf10      	yield
2000c92c:	7830      	ldrb	r0, [r6, #0]
2000c92e:	2800      	cmp	r0, #0
2000c930:	d1f2      	bne.n	2000c918 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xe8>
2000c932:	e8d6 0f4f 	ldrexb	r0, [r6]
2000c936:	2800      	cmp	r0, #0
2000c938:	d1ea      	bne.n	2000c910 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xe0>
2000c93a:	e7c9      	b.n	2000c8d0 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0xa0>
2000c93c:	f3bf 8f2f 	clrex
2000c940:	7830      	ldrb	r0, [r6, #0]
2000c942:	b160      	cbz	r0, 2000c95e <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x12e>
2000c944:	bf10      	yield
2000c946:	7830      	ldrb	r0, [r6, #0]
2000c948:	b148      	cbz	r0, 2000c95e <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x12e>
2000c94a:	bf10      	yield
2000c94c:	7830      	ldrb	r0, [r6, #0]
2000c94e:	b130      	cbz	r0, 2000c95e <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x12e>
2000c950:	bf10      	yield
2000c952:	7830      	ldrb	r0, [r6, #0]
2000c954:	b118      	cbz	r0, 2000c95e <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x12e>
2000c956:	bf10      	yield
2000c958:	7830      	ldrb	r0, [r6, #0]
2000c95a:	2800      	cmp	r0, #0
2000c95c:	d1f2      	bne.n	2000c944 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x114>
2000c95e:	e8d6 0f4f 	ldrexb	r0, [r6]
2000c962:	2800      	cmp	r0, #0
2000c964:	d1ea      	bne.n	2000c93c <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x10c>
2000c966:	e79f      	b.n	2000c8a8 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E+0x78>

2000c968 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E>:
2000c968:	b5b0      	push	{r4, r5, r7, lr}
2000c96a:	af02      	add	r7, sp, #8
2000c96c:	b086      	sub	sp, #24
2000c96e:	188b      	adds	r3, r1, r2
2000c970:	d22a      	bcs.n	2000c9c8 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E+0x60>
2000c972:	4604      	mov	r4, r0
2000c974:	6800      	ldr	r0, [r0, #0]
2000c976:	1855      	adds	r5, r2, r1
2000c978:	ebb5 0f40 	cmp.w	r5, r0, lsl #1
2000c97c:	bf38      	it	cc
2000c97e:	0045      	lslcc	r5, r0, #1
2000c980:	0f29      	lsrs	r1, r5, #28
2000c982:	fab1 f181 	clz	r1, r1
2000c986:	2d04      	cmp	r5, #4
2000c988:	ea4f 1151 	mov.w	r1, r1, lsr #5
2000c98c:	bf98      	it	ls
2000c98e:	2504      	movls	r5, #4
2000c990:	00ea      	lsls	r2, r5, #3
2000c992:	ea4f 0181 	mov.w	r1, r1, lsl #2
2000c996:	b128      	cbz	r0, 2000c9a4 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E+0x3c>
2000c998:	6863      	ldr	r3, [r4, #4]
2000c99a:	00c0      	lsls	r0, r0, #3
2000c99c:	9005      	str	r0, [sp, #20]
2000c99e:	2004      	movs	r0, #4
2000c9a0:	9303      	str	r3, [sp, #12]
2000c9a2:	e000      	b.n	2000c9a6 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E+0x3e>
2000c9a4:	2000      	movs	r0, #0
2000c9a6:	9004      	str	r0, [sp, #16]
2000c9a8:	4668      	mov	r0, sp
2000c9aa:	ab03      	add	r3, sp, #12
2000c9ac:	f7ff ff40 	bl	2000c830 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E>
2000c9b0:	9800      	ldr	r0, [sp, #0]
2000c9b2:	2801      	cmp	r0, #1
2000c9b4:	bf1f      	itttt	ne
2000c9b6:	9801      	ldrne	r0, [sp, #4]
2000c9b8:	e9c4 5000 	strdne	r5, r0, [r4]
2000c9bc:	b006      	addne	sp, #24
2000c9be:	bdb0      	popne	{r4, r5, r7, pc}
2000c9c0:	e9dd 0101 	ldrd	r0, r1, [sp, #4]
2000c9c4:	f003 fcde 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>
2000c9c8:	2000      	movs	r0, #0
2000c9ca:	f003 fcdb 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>
2000c9ce:	d4d4      	bmi.n	2000c97a <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E+0x12>

2000c9d0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hd462a07635941de9E>:
2000c9d0:	b5b0      	push	{r4, r5, r7, lr}
2000c9d2:	af02      	add	r7, sp, #8
2000c9d4:	b086      	sub	sp, #24
2000c9d6:	4604      	mov	r4, r0
2000c9d8:	6800      	ldr	r0, [r0, #0]
2000c9da:	460d      	mov	r5, r1
2000c9dc:	ebb1 0f40 	cmp.w	r1, r0, lsl #1
2000c9e0:	bf38      	it	cc
2000c9e2:	0045      	lslcc	r5, r0, #1
2000c9e4:	0f69      	lsrs	r1, r5, #29
2000c9e6:	fab1 f181 	clz	r1, r1
2000c9ea:	2d04      	cmp	r5, #4
2000c9ec:	ea4f 1151 	mov.w	r1, r1, lsr #5
2000c9f0:	bf98      	it	ls
2000c9f2:	2504      	movls	r5, #4
2000c9f4:	00aa      	lsls	r2, r5, #2
2000c9f6:	ea4f 0181 	mov.w	r1, r1, lsl #2
2000c9fa:	b128      	cbz	r0, 2000ca08 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hd462a07635941de9E+0x38>
2000c9fc:	6863      	ldr	r3, [r4, #4]
2000c9fe:	0080      	lsls	r0, r0, #2
2000ca00:	9005      	str	r0, [sp, #20]
2000ca02:	2004      	movs	r0, #4
2000ca04:	9303      	str	r3, [sp, #12]
2000ca06:	e000      	b.n	2000ca0a <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hd462a07635941de9E+0x3a>
2000ca08:	2000      	movs	r0, #0
2000ca0a:	9004      	str	r0, [sp, #16]
2000ca0c:	4668      	mov	r0, sp
2000ca0e:	ab03      	add	r3, sp, #12
2000ca10:	f7ff ff0e 	bl	2000c830 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E>
2000ca14:	9800      	ldr	r0, [sp, #0]
2000ca16:	2801      	cmp	r0, #1
2000ca18:	bf1f      	itttt	ne
2000ca1a:	9801      	ldrne	r0, [sp, #4]
2000ca1c:	e9c4 5000 	strdne	r5, r0, [r4]
2000ca20:	b006      	addne	sp, #24
2000ca22:	bdb0      	popne	{r4, r5, r7, pc}
2000ca24:	e9dd 0101 	ldrd	r0, r1, [sp, #4]
2000ca28:	f003 fcac 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>

2000ca2c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E>:
2000ca2c:	b5b0      	push	{r4, r5, r7, lr}
2000ca2e:	af02      	add	r7, sp, #8
2000ca30:	b086      	sub	sp, #24
2000ca32:	4604      	mov	r4, r0
2000ca34:	6800      	ldr	r0, [r0, #0]
2000ca36:	1c45      	adds	r5, r0, #1
2000ca38:	d228      	bcs.n	2000ca8c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E+0x60>
2000ca3a:	ebb5 0f40 	cmp.w	r5, r0, lsl #1
2000ca3e:	bf38      	it	cc
2000ca40:	0045      	lslcc	r5, r0, #1
2000ca42:	0f29      	lsrs	r1, r5, #28
2000ca44:	fab1 f181 	clz	r1, r1
2000ca48:	2d04      	cmp	r5, #4
2000ca4a:	ea4f 1151 	mov.w	r1, r1, lsr #5
2000ca4e:	bf98      	it	ls
2000ca50:	2504      	movls	r5, #4
2000ca52:	00ea      	lsls	r2, r5, #3
2000ca54:	ea4f 0181 	mov.w	r1, r1, lsl #2
2000ca58:	b130      	cbz	r0, 2000ca68 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E+0x3c>
2000ca5a:	6863      	ldr	r3, [r4, #4]
2000ca5c:	00c0      	lsls	r0, r0, #3
2000ca5e:	9005      	str	r0, [sp, #20]
2000ca60:	2004      	movs	r0, #4
2000ca62:	9303      	str	r3, [sp, #12]
2000ca64:	e001      	b.n	2000ca6a <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E+0x3e>
2000ca66:	bf00      	nop
2000ca68:	2000      	movs	r0, #0
2000ca6a:	9004      	str	r0, [sp, #16]
2000ca6c:	4668      	mov	r0, sp
2000ca6e:	ab03      	add	r3, sp, #12
2000ca70:	f7ff fede 	bl	2000c830 <_ZN5alloc7raw_vec11finish_grow17h10071f67c569d6d0E>
2000ca74:	9800      	ldr	r0, [sp, #0]
2000ca76:	2801      	cmp	r0, #1
2000ca78:	bf1f      	itttt	ne
2000ca7a:	9801      	ldrne	r0, [sp, #4]
2000ca7c:	e9c4 5000 	strdne	r5, r0, [r4]
2000ca80:	b006      	addne	sp, #24
2000ca82:	bdb0      	popne	{r4, r5, r7, pc}
2000ca84:	e9dd 0101 	ldrd	r0, r1, [sp, #4]
2000ca88:	f003 fc7c 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>
2000ca8c:	2000      	movs	r0, #0
2000ca8e:	f003 fc79 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>
2000ca92:	d4d4      	bmi.n	2000ca3e <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E+0x12>
2000ca94:	d4d4      	bmi.n	2000ca40 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E+0x14>
2000ca96:	d4d4      	bmi.n	2000ca42 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E+0x16>

2000ca98 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E>:
2000ca98:	b5f0      	push	{r4, r5, r6, r7, lr}
2000ca9a:	af03      	add	r7, sp, #12
2000ca9c:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
2000caa0:	b081      	sub	sp, #4
2000caa2:	ed2d 8b08 	vpush	{d8-d11}
2000caa6:	b08e      	sub	sp, #56	; 0x38
2000caa8:	4682      	mov	sl, r0
2000caaa:	ed9a 1b00 	vldr	d1, [sl]
2000caae:	2000      	movs	r0, #0
2000cab0:	ec58 2b10 	vmov	r2, r8, d0
2000cab4:	f8ca 0040 	str.w	r0, [sl, #64]	; 0x40
2000cab8:	ec51 0b11 	vmov	r0, r1, d1
2000cabc:	4643      	mov	r3, r8
2000cabe:	ed8a 0b04 	vstr	d0, [sl, #16]
2000cac2:	9206      	str	r2, [sp, #24]
2000cac4:	f008 fb47 	bl	20015156 <__aeabi_dmul>
2000cac8:	f64f 72ff 	movw	r2, #65535	; 0xffff
2000cacc:	f6c3 72df 	movt	r2, #16351	; 0x3fdf
2000cad0:	460b      	mov	r3, r1
2000cad2:	f362 031e 	bfi	r3, r2, #0, #31
2000cad6:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
2000cada:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
2000cade:	f008 fccb 	bl	20015478 <__aeabi_dadd>
2000cae2:	4683      	mov	fp, r0
2000cae4:	460d      	mov	r5, r1
2000cae6:	ec41 0b18 	vmov	d8, r0, r1
2000caea:	f3c1 510a 	ubfx	r1, r1, #20, #11
2000caee:	f240 4032 	movw	r0, #1074	; 0x432
2000caf2:	4281      	cmp	r1, r0
2000caf4:	d934      	bls.n	2000cb60 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0xc8>
2000caf6:	ed9f 0b16 	vldr	d0, [pc, #88]	; 2000cb50 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0xb8>
2000cafa:	4658      	mov	r0, fp
2000cafc:	ec53 2b10 	vmov	r2, r3, d0
2000cb00:	4629      	mov	r1, r5
2000cb02:	f008 fcf5 	bl	200154f0 <__aeabi_dcmpgt>
2000cb06:	ed9f 0b14 	vldr	d0, [pc, #80]	; 2000cb58 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0xc0>
2000cb0a:	4604      	mov	r4, r0
2000cb0c:	ec53 2b10 	vmov	r2, r3, d0
2000cb10:	4658      	mov	r0, fp
2000cb12:	4629      	mov	r1, r5
2000cb14:	f008 fcb2 	bl	2001547c <__aeabi_dcmpge>
2000cb18:	4606      	mov	r6, r0
2000cb1a:	4658      	mov	r0, fp
2000cb1c:	4629      	mov	r1, r5
2000cb1e:	f008 fd33 	bl	20015588 <__aeabi_d2uiz>
2000cb22:	2e00      	cmp	r6, #0
2000cb24:	bf08      	it	eq
2000cb26:	4630      	moveq	r0, r6
2000cb28:	2c00      	cmp	r4, #0
2000cb2a:	bf18      	it	ne
2000cb2c:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
2000cb30:	f8da 1050 	ldr.w	r1, [sl, #80]	; 0x50
2000cb34:	2801      	cmp	r0, #1
2000cb36:	bf98      	it	ls
2000cb38:	2001      	movls	r0, #1
2000cb3a:	4288      	cmp	r0, r1
2000cb3c:	f000 810f 	beq.w	2000cd5e <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x2c6>
2000cb40:	f10a 0944 	add.w	r9, sl, #68	; 0x44
2000cb44:	f8cd 8014 	str.w	r8, [sp, #20]
2000cb48:	e0a7      	b.n	2000cc9a <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x202>
2000cb4a:	bf00      	nop
2000cb4c:	bf00      	nop
2000cb4e:	bf00      	nop
2000cb50:	ffe00000 			; <UNDEFINED> instruction: 0xffe00000
2000cb54:	41efffff 	strdmi	pc, [pc, #255]	; 2000cc5b <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x1c3>
	...
2000cb60:	0d28      	lsrs	r0, r5, #20
2000cb62:	300d      	adds	r0, #13
2000cb64:	f000 003f 	and.w	r0, r0, #63	; 0x3f
2000cb68:	fa26 f400 	lsr.w	r4, r6, r0
2000cb6c:	9001      	str	r0, [sp, #4]
2000cb6e:	3820      	subs	r0, #32
2000cb70:	f8cd 8014 	str.w	r8, [sp, #20]
2000cb74:	9403      	str	r4, [sp, #12]
2000cb76:	bf58      	it	pl
2000cb78:	2400      	movpl	r4, #0
2000cb7a:	9000      	str	r0, [sp, #0]
2000cb7c:	fa26 f000 	lsr.w	r0, r6, r0
2000cb80:	9002      	str	r0, [sp, #8]
2000cb82:	bf58      	it	pl
2000cb84:	4606      	movpl	r6, r0
2000cb86:	f240 30ff 	movw	r0, #1023	; 0x3ff
2000cb8a:	9104      	str	r1, [sp, #16]
2000cb8c:	4281      	cmp	r1, r0
2000cb8e:	bf3c      	itt	cc
2000cb90:	f04f 36ff 	movcc.w	r6, #4294967295	; 0xffffffff
2000cb94:	f06f 4400 	mvncc.w	r4, #2147483648	; 0x80000000
2000cb98:	ea04 0005 	and.w	r0, r4, r5
2000cb9c:	ea06 010b 	and.w	r1, r6, fp
2000cba0:	eeb0 0a48 	vmov.f32	s0, s16
2000cba4:	4308      	orrs	r0, r1
2000cba6:	eef0 0a68 	vmov.f32	s1, s17
2000cbaa:	d013      	beq.n	2000cbd4 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x13c>
2000cbac:	ed9f 0bf0 	vldr	d0, [pc, #960]	; 2000cf70 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4d8>
2000cbb0:	4658      	mov	r0, fp
2000cbb2:	ec53 2b10 	vmov	r2, r3, d0
2000cbb6:	4629      	mov	r1, r5
2000cbb8:	f008 fc5e 	bl	20015478 <__aeabi_dadd>
2000cbbc:	ec41 0b10 	vmov	d0, r0, r1
2000cbc0:	ea2b 0006 	bic.w	r0, fp, r6
2000cbc4:	ed8d 0b0c 	vstr	d0, [sp, #48]	; 0x30
2000cbc8:	ed9d 0b0c 	vldr	d0, [sp, #48]	; 0x30
2000cbcc:	ea25 0104 	bic.w	r1, r5, r4
2000cbd0:	ec41 0b10 	vmov	d0, r0, r1
2000cbd4:	ed9f 1be8 	vldr	d1, [pc, #928]	; 2000cf78 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4e0>
2000cbd8:	ec56 4b10 	vmov	r4, r6, d0
2000cbdc:	ec53 2b11 	vmov	r2, r3, d1
2000cbe0:	4620      	mov	r0, r4
2000cbe2:	4631      	mov	r1, r6
2000cbe4:	f008 fc84 	bl	200154f0 <__aeabi_dcmpgt>
2000cbe8:	ed9f 0be5 	vldr	d0, [pc, #916]	; 2000cf80 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4e8>
2000cbec:	4680      	mov	r8, r0
2000cbee:	ec53 2b10 	vmov	r2, r3, d0
2000cbf2:	4620      	mov	r0, r4
2000cbf4:	4631      	mov	r1, r6
2000cbf6:	f008 fc41 	bl	2001547c <__aeabi_dcmpge>
2000cbfa:	4681      	mov	r9, r0
2000cbfc:	4620      	mov	r0, r4
2000cbfe:	4631      	mov	r1, r6
2000cc00:	f008 fcc2 	bl	20015588 <__aeabi_d2uiz>
2000cc04:	f1b9 0f00 	cmp.w	r9, #0
2000cc08:	bf08      	it	eq
2000cc0a:	4648      	moveq	r0, r9
2000cc0c:	f1b8 0f00 	cmp.w	r8, #0
2000cc10:	bf18      	it	ne
2000cc12:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
2000cc16:	f8da 1050 	ldr.w	r1, [sl, #80]	; 0x50
2000cc1a:	2801      	cmp	r0, #1
2000cc1c:	bf98      	it	ls
2000cc1e:	2001      	movls	r0, #1
2000cc20:	f8dd 8014 	ldr.w	r8, [sp, #20]
2000cc24:	4288      	cmp	r0, r1
2000cc26:	f000 809a 	beq.w	2000cd5e <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x2c6>
2000cc2a:	9a04      	ldr	r2, [sp, #16]
2000cc2c:	f240 4032 	movw	r0, #1074	; 0x432
2000cc30:	4282      	cmp	r2, r0
2000cc32:	f10a 0944 	add.w	r9, sl, #68	; 0x44
2000cc36:	d830      	bhi.n	2000cc9a <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x202>
2000cc38:	9801      	ldr	r0, [sp, #4]
2000cc3a:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
2000cc3e:	f1c0 0020 	rsb	r0, r0, #32
2000cc42:	fa01 f000 	lsl.w	r0, r1, r0
2000cc46:	9900      	ldr	r1, [sp, #0]
2000cc48:	e9dd 6402 	ldrd	r6, r4, [sp, #8]
2000cc4c:	2900      	cmp	r1, #0
2000cc4e:	bf4c      	ite	mi
2000cc50:	ea44 0600 	orrmi.w	r6, r4, r0
2000cc54:	2400      	movpl	r4, #0
2000cc56:	f240 30ff 	movw	r0, #1023	; 0x3ff
2000cc5a:	4282      	cmp	r2, r0
2000cc5c:	bf3c      	itt	cc
2000cc5e:	f04f 36ff 	movcc.w	r6, #4294967295	; 0xffffffff
2000cc62:	f06f 4400 	mvncc.w	r4, #2147483648	; 0x80000000
2000cc66:	ea06 000b 	and.w	r0, r6, fp
2000cc6a:	ea04 0105 	and.w	r1, r4, r5
2000cc6e:	4308      	orrs	r0, r1
2000cc70:	d013      	beq.n	2000cc9a <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x202>
2000cc72:	ed9f 0bbf 	vldr	d0, [pc, #764]	; 2000cf70 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4d8>
2000cc76:	4658      	mov	r0, fp
2000cc78:	ec53 2b10 	vmov	r2, r3, d0
2000cc7c:	4629      	mov	r1, r5
2000cc7e:	f008 fbfb 	bl	20015478 <__aeabi_dadd>
2000cc82:	ec41 0b10 	vmov	d0, r0, r1
2000cc86:	ea2b 0006 	bic.w	r0, fp, r6
2000cc8a:	ed8d 0b0c 	vstr	d0, [sp, #48]	; 0x30
2000cc8e:	ed9d 0b0c 	vldr	d0, [sp, #48]	; 0x30
2000cc92:	ea25 0104 	bic.w	r1, r5, r4
2000cc96:	ec41 0b18 	vmov	d8, r0, r1
2000cc9a:	ed9f 0bb7 	vldr	d0, [pc, #732]	; 2000cf78 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4e0>
2000cc9e:	ec55 4b18 	vmov	r4, r5, d8
2000cca2:	ec53 2b10 	vmov	r2, r3, d0
2000cca6:	4620      	mov	r0, r4
2000cca8:	4629      	mov	r1, r5
2000ccaa:	f008 fc21 	bl	200154f0 <__aeabi_dcmpgt>
2000ccae:	ed9f 0bb4 	vldr	d0, [pc, #720]	; 2000cf80 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4e8>
2000ccb2:	4680      	mov	r8, r0
2000ccb4:	ec53 2b10 	vmov	r2, r3, d0
2000ccb8:	4620      	mov	r0, r4
2000ccba:	4629      	mov	r1, r5
2000ccbc:	f008 fbde 	bl	2001547c <__aeabi_dcmpge>
2000ccc0:	4606      	mov	r6, r0
2000ccc2:	4620      	mov	r0, r4
2000ccc4:	4629      	mov	r1, r5
2000ccc6:	f008 fc5f 	bl	20015588 <__aeabi_d2uiz>
2000ccca:	2e00      	cmp	r6, #0
2000cccc:	bf08      	it	eq
2000ccce:	4630      	moveq	r0, r6
2000ccd0:	f1b8 0f00 	cmp.w	r8, #0
2000ccd4:	f04f 0201 	mov.w	r2, #1
2000ccd8:	bf18      	it	ne
2000ccda:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
2000ccde:	2801      	cmp	r0, #1
2000cce0:	bf88      	it	hi
2000cce2:	4602      	movhi	r2, r0
2000cce4:	1e53      	subs	r3, r2, #1
2000cce6:	fab3 f383 	clz	r3, r3
2000ccea:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
2000ccee:	2101      	movs	r1, #1
2000ccf0:	fa26 f303 	lsr.w	r3, r6, r3
2000ccf4:	2801      	cmp	r0, #1
2000ccf6:	bf88      	it	hi
2000ccf8:	1c59      	addhi	r1, r3, #1
2000ccfa:	2000      	movs	r0, #0
2000ccfc:	2304      	movs	r3, #4
2000ccfe:	e9cd 3008 	strd	r3, r0, [sp, #32]
2000cd02:	f002 0301 	and.w	r3, r2, #1
2000cd06:	920a      	str	r2, [sp, #40]	; 0x28
2000cd08:	441a      	add	r2, r3
2000cd0a:	1855      	adds	r5, r2, r1
2000cd0c:	9007      	str	r0, [sp, #28]
2000cd0e:	910b      	str	r1, [sp, #44]	; 0x2c
2000cd10:	f040 80f8 	bne.w	2000cf04 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x46c>
2000cd14:	f8da 1044 	ldr.w	r1, [sl, #68]	; 0x44
2000cd18:	f8dd 8014 	ldr.w	r8, [sp, #20]
2000cd1c:	9009      	str	r0, [sp, #36]	; 0x24
2000cd1e:	b1c9      	cbz	r1, 2000cd54 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x2bc>
2000cd20:	f246 0490 	movw	r4, #24720	; 0x6090
2000cd24:	f2c2 0401 	movt	r4, #8193	; 0x2001
2000cd28:	f8da 0048 	ldr.w	r0, [sl, #72]	; 0x48
2000cd2c:	e8d4 2f4f 	ldrexb	r2, [r4]
2000cd30:	0089      	lsls	r1, r1, #2
2000cd32:	2a00      	cmp	r2, #0
2000cd34:	f040 8105 	bne.w	2000cf42 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4aa>
2000cd38:	2201      	movs	r2, #1
2000cd3a:	e8c4 2f43 	strexb	r3, r2, [r4]
2000cd3e:	2b00      	cmp	r3, #0
2000cd40:	f040 8102 	bne.w	2000cf48 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4b0>
2000cd44:	f3bf 8f5f 	dmb	sy
2000cd48:	f7ff f9aa 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
2000cd4c:	2000      	movs	r0, #0
2000cd4e:	f3bf 8f5f 	dmb	sy
2000cd52:	7020      	strb	r0, [r4, #0]
2000cd54:	a807      	add	r0, sp, #28
2000cd56:	e890 006e 	ldmia.w	r0, {r1, r2, r3, r5, r6}
2000cd5a:	e889 006e 	stmia.w	r9, {r1, r2, r3, r5, r6}
2000cd5e:	9806      	ldr	r0, [sp, #24]
2000cd60:	4641      	mov	r1, r8
2000cd62:	f007 fed5 	bl	20014b10 <__aeabi_d2f>
2000cd66:	ed9a 0a0d 	vldr	s0, [sl, #52]	; 0x34
2000cd6a:	ee0a 0a10 	vmov	s20, r0
2000cd6e:	ee20 0a0a 	vmul.f32	s0, s0, s20
2000cd72:	f8ca 003c 	str.w	r0, [sl, #60]	; 0x3c
2000cd76:	ed9a ba0e 	vldr	s22, [sl, #56]	; 0x38
2000cd7a:	ee10 0a10 	vmov	r0, s0
2000cd7e:	f008 f9a1 	bl	200150c4 <__aeabi_f2d>
2000cd82:	ed9f 8b81 	vldr	d8, [pc, #516]	; 2000cf88 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4f0>
2000cd86:	ec41 0b10 	vmov	d0, r0, r1
2000cd8a:	eeb0 1a48 	vmov.f32	s2, s16
2000cd8e:	eef0 1a68 	vmov.f32	s3, s17
2000cd92:	f007 fab7 	bl	20014304 <fmax>
2000cd96:	f005 f957 	bl	20012048 <_ZN4libm4math3log3log17h32bd796437813eb8E>
2000cd9a:	ec51 0b10 	vmov	r0, r1, d0
2000cd9e:	ed9f 0b7c 	vldr	d0, [pc, #496]	; 2000cf90 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4f8>
2000cda2:	ec53 2b10 	vmov	r2, r3, d0
2000cda6:	e9cd 2305 	strd	r2, r3, [sp, #20]
2000cdaa:	f008 fb65 	bl	20015478 <__aeabi_dadd>
2000cdae:	ed9f 0b74 	vldr	d0, [pc, #464]	; 2000cf80 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4e8>
2000cdb2:	460b      	mov	r3, r1
2000cdb4:	ec51 4b10 	vmov	r4, r1, d0
2000cdb8:	4602      	mov	r2, r0
2000cdba:	4620      	mov	r0, r4
2000cdbc:	9104      	str	r1, [sp, #16]
2000cdbe:	f007 ff48 	bl	20014c52 <__aeabi_dsub>
2000cdc2:	ec41 0b10 	vmov	d0, r0, r1
2000cdc6:	f005 fab3 	bl	20012330 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE>
2000cdca:	ec55 6b18 	vmov	r6, r5, d8
2000cdce:	ec51 0b10 	vmov	r0, r1, d0
2000cdd2:	4632      	mov	r2, r6
2000cdd4:	462b      	mov	r3, r5
2000cdd6:	f008 fb4f 	bl	20015478 <__aeabi_dadd>
2000cdda:	4602      	mov	r2, r0
2000cddc:	460b      	mov	r3, r1
2000cdde:	4630      	mov	r0, r6
2000cde0:	4629      	mov	r1, r5
2000cde2:	f007 fb92 	bl	2001450a <__aeabi_ddiv>
2000cde6:	ed9f 0b6c 	vldr	d0, [pc, #432]	; 2000cf98 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x500>
2000cdea:	ec53 9b10 	vmov	r9, r3, d0
2000cdee:	464a      	mov	r2, r9
2000cdf0:	9303      	str	r3, [sp, #12]
2000cdf2:	f008 f9b0 	bl	20015156 <__aeabi_dmul>
2000cdf6:	ed9f 0b6a 	vldr	d0, [pc, #424]	; 2000cfa0 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x508>
2000cdfa:	ec5b 8b10 	vmov	r8, fp, d0
2000cdfe:	4642      	mov	r2, r8
2000ce00:	465b      	mov	r3, fp
2000ce02:	f008 fb39 	bl	20015478 <__aeabi_dadd>
2000ce06:	ed9f 9b68 	vldr	d9, [pc, #416]	; 2000cfa8 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x510>
2000ce0a:	ec41 0b10 	vmov	d0, r0, r1
2000ce0e:	eeb0 1a49 	vmov.f32	s2, s18
2000ce12:	eef0 1a69 	vmov.f32	s3, s19
2000ce16:	f007 fa52 	bl	200142be <fmin>
2000ce1a:	ec53 2b10 	vmov	r2, r3, d0
2000ce1e:	4630      	mov	r0, r6
2000ce20:	4629      	mov	r1, r5
2000ce22:	f007 ff16 	bl	20014c52 <__aeabi_dsub>
2000ce26:	f007 fe73 	bl	20014b10 <__aeabi_d2f>
2000ce2a:	ee2b 0a0a 	vmul.f32	s0, s22, s20
2000ce2e:	9002      	str	r0, [sp, #8]
2000ce30:	f8ca 0024 	str.w	r0, [sl, #36]	; 0x24
2000ce34:	ee10 0a10 	vmov	r0, s0
2000ce38:	f008 f944 	bl	200150c4 <__aeabi_f2d>
2000ce3c:	ec41 0b10 	vmov	d0, r0, r1
2000ce40:	eeb0 1a48 	vmov.f32	s2, s16
2000ce44:	eef0 1a68 	vmov.f32	s3, s17
2000ce48:	f007 fa5c 	bl	20014304 <fmax>
2000ce4c:	f005 f8fc 	bl	20012048 <_ZN4libm4math3log3log17h32bd796437813eb8E>
2000ce50:	e9dd 2305 	ldrd	r2, r3, [sp, #20]
2000ce54:	ec51 0b10 	vmov	r0, r1, d0
2000ce58:	f008 fb0e 	bl	20015478 <__aeabi_dadd>
2000ce5c:	460b      	mov	r3, r1
2000ce5e:	9904      	ldr	r1, [sp, #16]
2000ce60:	4602      	mov	r2, r0
2000ce62:	4620      	mov	r0, r4
2000ce64:	f007 fef5 	bl	20014c52 <__aeabi_dsub>
2000ce68:	ec41 0b10 	vmov	d0, r0, r1
2000ce6c:	f005 fa60 	bl	20012330 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE>
2000ce70:	ec51 0b10 	vmov	r0, r1, d0
2000ce74:	4632      	mov	r2, r6
2000ce76:	462b      	mov	r3, r5
2000ce78:	f008 fafe 	bl	20015478 <__aeabi_dadd>
2000ce7c:	4602      	mov	r2, r0
2000ce7e:	460b      	mov	r3, r1
2000ce80:	4630      	mov	r0, r6
2000ce82:	4629      	mov	r1, r5
2000ce84:	f007 fb41 	bl	2001450a <__aeabi_ddiv>
2000ce88:	9b03      	ldr	r3, [sp, #12]
2000ce8a:	464a      	mov	r2, r9
2000ce8c:	f008 f963 	bl	20015156 <__aeabi_dmul>
2000ce90:	4642      	mov	r2, r8
2000ce92:	465b      	mov	r3, fp
2000ce94:	f008 faf0 	bl	20015478 <__aeabi_dadd>
2000ce98:	ec41 0b10 	vmov	d0, r0, r1
2000ce9c:	eeb0 1a49 	vmov.f32	s2, s18
2000cea0:	eef0 1a69 	vmov.f32	s3, s19
2000cea4:	f007 fa0b 	bl	200142be <fmin>
2000cea8:	ec53 2b10 	vmov	r2, r3, d0
2000ceac:	4630      	mov	r0, r6
2000ceae:	4629      	mov	r1, r5
2000ceb0:	f007 fecf 	bl	20014c52 <__aeabi_dsub>
2000ceb4:	f007 fe2c 	bl	20014b10 <__aeabi_d2f>
2000ceb8:	ed9a 0a0b 	vldr	s0, [sl, #44]	; 0x2c
2000cebc:	eeb7 1a00 	vmov.f32	s2, #112	; 0x3f800000  1.0
2000cec0:	eeb4 0a41 	vcmp.f32	s0, s2
2000cec4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000cec8:	f8ca 0028 	str.w	r0, [sl, #40]	; 0x28
2000cecc:	d508      	bpl.n	2000cee0 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x448>
2000cece:	9902      	ldr	r1, [sp, #8]
2000ced0:	ee01 0a10 	vmov	s2, r0
2000ced4:	ee00 1a10 	vmov	s0, r1
2000ced8:	ed8a 0a0b 	vstr	s0, [sl, #44]	; 0x2c
2000cedc:	ed8a 1a0c 	vstr	s2, [sl, #48]	; 0x30
2000cee0:	f8da 104c 	ldr.w	r1, [sl, #76]	; 0x4c
2000cee4:	b121      	cbz	r1, 2000cef0 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x458>
2000cee6:	f8da 0048 	ldr.w	r0, [sl, #72]	; 0x48
2000ceea:	0089      	lsls	r1, r1, #2
2000ceec:	f008 f898 	bl	20015020 <__aeabi_memclr4>
2000cef0:	2000      	movs	r0, #0
2000cef2:	f8ca 0060 	str.w	r0, [sl, #96]	; 0x60
2000cef6:	b00e      	add	sp, #56	; 0x38
2000cef8:	ecbd 8b08 	vpop	{d8-d11}
2000cefc:	b001      	add	sp, #4
2000cefe:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2000cf02:	bdf0      	pop	{r4, r5, r6, r7, pc}
2000cf04:	a807      	add	r0, sp, #28
2000cf06:	4629      	mov	r1, r5
2000cf08:	f7ff fd62 	bl	2000c9d0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hd462a07635941de9E>
2000cf0c:	e9dd 6408 	ldrd	r6, r4, [sp, #32]
2000cf10:	2d01      	cmp	r5, #1
2000cf12:	eb06 0084 	add.w	r0, r6, r4, lsl #2
2000cf16:	d00a      	beq.n	2000cf2e <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x496>
2000cf18:	f06f 0103 	mvn.w	r1, #3
2000cf1c:	eb01 0185 	add.w	r1, r1, r5, lsl #2
2000cf20:	f008 f87e 	bl	20015020 <__aeabi_memclr4>
2000cf24:	1961      	adds	r1, r4, r5
2000cf26:	eb06 0081 	add.w	r0, r6, r1, lsl #2
2000cf2a:	3804      	subs	r0, #4
2000cf2c:	1e4c      	subs	r4, r1, #1
2000cf2e:	2100      	movs	r1, #0
2000cf30:	6001      	str	r1, [r0, #0]
2000cf32:	1c60      	adds	r0, r4, #1
2000cf34:	e6ee      	b.n	2000cd14 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x27c>
2000cf36:	bf00      	nop
2000cf38:	e8d4 2f4f 	ldrexb	r2, [r4]
2000cf3c:	2a00      	cmp	r2, #0
2000cf3e:	f43f aefb 	beq.w	2000cd38 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x2a0>
2000cf42:	f3bf 8f2f 	clrex
2000cf46:	bf00      	nop
2000cf48:	7822      	ldrb	r2, [r4, #0]
2000cf4a:	2a00      	cmp	r2, #0
2000cf4c:	d0f4      	beq.n	2000cf38 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4a0>
2000cf4e:	bf10      	yield
2000cf50:	7822      	ldrb	r2, [r4, #0]
2000cf52:	2a00      	cmp	r2, #0
2000cf54:	d0f0      	beq.n	2000cf38 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4a0>
2000cf56:	bf10      	yield
2000cf58:	7822      	ldrb	r2, [r4, #0]
2000cf5a:	2a00      	cmp	r2, #0
2000cf5c:	d0ec      	beq.n	2000cf38 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4a0>
2000cf5e:	bf10      	yield
2000cf60:	7822      	ldrb	r2, [r4, #0]
2000cf62:	2a00      	cmp	r2, #0
2000cf64:	d0e8      	beq.n	2000cf38 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4a0>
2000cf66:	bf10      	yield
2000cf68:	7822      	ldrb	r2, [r4, #0]
2000cf6a:	2a00      	cmp	r2, #0
2000cf6c:	d1ef      	bne.n	2000cf4e <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4b6>
2000cf6e:	e7e3      	b.n	2000cf38 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E+0x4a0>
2000cf70:	00000000 	andeq	r0, r0, r0
2000cf74:	47700000 	ldrbmi	r0, [r0, -r0]!
2000cf78:	ffe00000 			; <UNDEFINED> instruction: 0xffe00000
2000cf7c:	41efffff 	strdmi	pc, [pc, #255]	; 2000d083 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0xd3>
	...
2000cf8c:	3ff00000 	svccc	0x00f00000	; IMB
2000cf90:	bdf4d5a4 	cfldr64lt	mvdx13, [r4, #656]!	; 0x290
2000cf94:	bfeb926d 	svclt	0x00eb926d
2000cf98:	560ac60d 	strpl	ip, [sl], -sp, lsl #12
2000cf9c:	3ff21dd7 	svccc	0x00f21dd7
2000cfa0:	3f16f152 	svccc	0x0016f152
2000cfa4:	bfc0eeba 	svclt	0x00c0eeba
2000cfa8:	ca501acb 	bgt	21413adc <_eram+0x13f3adc>
2000cfac:	3fefffff 	svccc	0x00efffff

2000cfb0 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E>:
2000cfb0:	b5f0      	push	{r4, r5, r6, r7, lr}
2000cfb2:	af03      	add	r7, sp, #12
2000cfb4:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
2000cfb8:	b081      	sub	sp, #4
2000cfba:	ed2d 8b10 	vpush	{d8-d15}
2000cfbe:	b082      	sub	sp, #8
2000cfc0:	460d      	mov	r5, r1
2000cfc2:	4680      	mov	r8, r0
2000cfc4:	6c09      	ldr	r1, [r1, #64]	; 0x40
2000cfc6:	6d68      	ldr	r0, [r5, #84]	; 0x54
2000cfc8:	6cee      	ldr	r6, [r5, #76]	; 0x4c
2000cfca:	1844      	adds	r4, r0, r1
2000cfcc:	42b4      	cmp	r4, r6
2000cfce:	9100      	str	r1, [sp, #0]
2000cfd0:	f080 80fc 	bcs.w	2000d1cc <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x21c>
2000cfd4:	f022 4000 	bic.w	r0, r2, #2147483648	; 0x80000000
2000cfd8:	eddf 0a8c 	vldr	s1, [pc, #560]	; 2000d20c <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x25c>
2000cfdc:	ee00 0a10 	vmov	s0, r0
2000cfe0:	469a      	mov	sl, r3
2000cfe2:	4693      	mov	fp, r2
2000cfe4:	f007 f9b1 	bl	2001434a <fmaxf>
2000cfe8:	f02a 4000 	bic.w	r0, sl, #2147483648	; 0x80000000
2000cfec:	ee00 0a90 	vmov	s1, r0
2000cff0:	f007 f9ab 	bl	2001434a <fmaxf>
2000cff4:	f8d5 9048 	ldr.w	r9, [r5, #72]	; 0x48
2000cff8:	2c02      	cmp	r4, #2
2000cffa:	eb09 0084 	add.w	r0, r9, r4, lsl #2
2000cffe:	ed80 0a00 	vstr	s0, [r0]
2000d002:	d315      	bcc.n	2000d030 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x80>
2000d004:	42b4      	cmp	r4, r6
2000d006:	f080 80d9 	bcs.w	2000d1bc <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x20c>
2000d00a:	f084 0001 	eor.w	r0, r4, #1
2000d00e:	42b0      	cmp	r0, r6
2000d010:	f080 80cc 	bcs.w	2000d1ac <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x1fc>
2000d014:	eb09 0080 	add.w	r0, r9, r0, lsl #2
2000d018:	edd0 0a00 	vldr	s1, [r0]
2000d01c:	f007 f995 	bl	2001434a <fmaxf>
2000d020:	2c03      	cmp	r4, #3
2000d022:	ea4f 0454 	mov.w	r4, r4, lsr #1
2000d026:	eb09 0084 	add.w	r0, r9, r4, lsl #2
2000d02a:	ed80 0a00 	vstr	s0, [r0]
2000d02e:	d8e9      	bhi.n	2000d004 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x54>
2000d030:	f8cd 8004 	str.w	r8, [sp, #4]
2000d034:	f8d5 8050 	ldr.w	r8, [r5, #80]	; 0x50
2000d038:	6e2c      	ldr	r4, [r5, #96]	; 0x60
2000d03a:	4544      	cmp	r4, r8
2000d03c:	d22a      	bcs.n	2000d094 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0xe4>
2000d03e:	f105 0058 	add.w	r0, r5, #88	; 0x58
2000d042:	6801      	ldr	r1, [r0, #0]
2000d044:	428c      	cmp	r4, r1
2000d046:	d103      	bne.n	2000d050 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0xa0>
2000d048:	f7ff fcf0 	bl	2000ca2c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h9a5e5934ccf16ff4E>
2000d04c:	f8d5 8050 	ldr.w	r8, [r5, #80]	; 0x50
2000d050:	6de8      	ldr	r0, [r5, #92]	; 0x5c
2000d052:	eb00 01c4 	add.w	r1, r0, r4, lsl #3
2000d056:	f840 b034 	str.w	fp, [r0, r4, lsl #3]
2000d05a:	1c60      	adds	r0, r4, #1
2000d05c:	4540      	cmp	r0, r8
2000d05e:	f8c1 a004 	str.w	sl, [r1, #4]
2000d062:	6628      	str	r0, [r5, #96]	; 0x60
2000d064:	d10c      	bne.n	2000d080 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0xd0>
2000d066:	6ce9      	ldr	r1, [r5, #76]	; 0x4c
2000d068:	2901      	cmp	r1, #1
2000d06a:	f240 80c7 	bls.w	2000d1fc <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x24c>
2000d06e:	6ca8      	ldr	r0, [r5, #72]	; 0x48
2000d070:	ed90 0a01 	vldr	s0, [r0, #4]
2000d074:	ed85 0a06 	vstr	s0, [r5, #24]
2000d078:	ed85 0a07 	vstr	s0, [r5, #28]
2000d07c:	ed85 0a08 	vstr	s0, [r5, #32]
2000d080:	6c28      	ldr	r0, [r5, #64]	; 0x40
2000d082:	1c41      	adds	r1, r0, #1
2000d084:	2000      	movs	r0, #0
2000d086:	4541      	cmp	r1, r8
2000d088:	bf28      	it	cs
2000d08a:	4601      	movcs	r1, r0
2000d08c:	6429      	str	r1, [r5, #64]	; 0x40
2000d08e:	2100      	movs	r1, #0
2000d090:	e082      	b.n	2000d198 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x1e8>
2000d092:	bf00      	nop
2000d094:	9800      	ldr	r0, [sp, #0]
2000d096:	42a0      	cmp	r0, r4
2000d098:	f080 80a0 	bcs.w	2000d1dc <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x22c>
2000d09c:	6dea      	ldr	r2, [r5, #92]	; 0x5c
2000d09e:	2e02      	cmp	r6, #2
2000d0a0:	eb02 01c0 	add.w	r1, r2, r0, lsl #3
2000d0a4:	ed91 ca00 	vldr	s24, [r1]
2000d0a8:	ed91 ba01 	vldr	s22, [r1, #4]
2000d0ac:	f842 b030 	str.w	fp, [r2, r0, lsl #3]
2000d0b0:	f8c1 a004 	str.w	sl, [r1, #4]
2000d0b4:	f0c0 809a 	bcc.w	2000d1ec <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x23c>
2000d0b8:	ed99 0a01 	vldr	s0, [r9, #4]
2000d0bc:	ed9f 1a54 	vldr	s2, [pc, #336]	; 2000d210 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x260>
2000d0c0:	eeb7 8a00 	vmov.f32	s16, #112	; 0x3f800000  1.0
2000d0c4:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d0c8:	eef0 0a48 	vmov.f32	s1, s16
2000d0cc:	4604      	mov	r4, r0
2000d0ce:	f007 f93c 	bl	2001434a <fmaxf>
2000d0d2:	ed95 fa08 	vldr	s30, [r5, #32]
2000d0d6:	ed9f aa4d 	vldr	s20, [pc, #308]	; 2000d20c <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E+0x25c>
2000d0da:	eeb0 9a40 	vmov.f32	s18, s0
2000d0de:	ed95 da06 	vldr	s26, [r5, #24]
2000d0e2:	ed95 ea07 	vldr	s28, [r5, #28]
2000d0e6:	edd5 8a0b 	vldr	s17, [r5, #44]	; 0x2c
2000d0ea:	edd5 9a0c 	vldr	s19, [r5, #48]	; 0x30
2000d0ee:	ee30 0a4f 	vsub.f32	s0, s0, s30
2000d0f2:	eef0 0a4a 	vmov.f32	s1, s20
2000d0f6:	f007 f928 	bl	2001434a <fmaxf>
2000d0fa:	ee28 0a80 	vmul.f32	s0, s17, s0
2000d0fe:	ee7f aa00 	vadd.f32	s21, s30, s0
2000d102:	ee3f 0a49 	vsub.f32	s0, s30, s18
2000d106:	eef0 0a4a 	vmov.f32	s1, s20
2000d10a:	f007 f91e 	bl	2001434a <fmaxf>
2000d10e:	ee29 0a80 	vmul.f32	s0, s19, s0
2000d112:	ee3a 9ac0 	vsub.f32	s18, s21, s0
2000d116:	ee39 0a4e 	vsub.f32	s0, s18, s28
2000d11a:	eef0 0a4a 	vmov.f32	s1, s20
2000d11e:	ed85 9a08 	vstr	s18, [r5, #32]
2000d122:	f007 f912 	bl	2001434a <fmaxf>
2000d126:	ee28 0a80 	vmul.f32	s0, s17, s0
2000d12a:	ee3e fa00 	vadd.f32	s30, s28, s0
2000d12e:	ee3e 0a49 	vsub.f32	s0, s28, s18
2000d132:	eef0 0a4a 	vmov.f32	s1, s20
2000d136:	f007 f908 	bl	2001434a <fmaxf>
2000d13a:	ee29 0a80 	vmul.f32	s0, s19, s0
2000d13e:	ee3f 9a40 	vsub.f32	s18, s30, s0
2000d142:	ee39 0a4d 	vsub.f32	s0, s18, s26
2000d146:	eef0 0a4a 	vmov.f32	s1, s20
2000d14a:	ed85 9a07 	vstr	s18, [r5, #28]
2000d14e:	f007 f8fc 	bl	2001434a <fmaxf>
2000d152:	ee28 0a80 	vmul.f32	s0, s17, s0
2000d156:	ee3d ea00 	vadd.f32	s28, s26, s0
2000d15a:	ee3d 0a49 	vsub.f32	s0, s26, s18
2000d15e:	eef0 0a4a 	vmov.f32	s1, s20
2000d162:	f007 f8f2 	bl	2001434a <fmaxf>
2000d166:	ee29 0a80 	vmul.f32	s0, s19, s0
2000d16a:	ee3e 0a40 	vsub.f32	s0, s28, s0
2000d16e:	ee88 1a00 	vdiv.f32	s2, s16, s0
2000d172:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	; 0x24
2000d176:	ed85 0a06 	vstr	s0, [r5, #24]
2000d17a:	e9c5 010b 	strd	r0, r1, [r5, #44]	; 0x2c
2000d17e:	1c60      	adds	r0, r4, #1
2000d180:	4540      	cmp	r0, r8
2000d182:	bf28      	it	cs
2000d184:	2000      	movcs	r0, #0
2000d186:	6428      	str	r0, [r5, #64]	; 0x40
2000d188:	ee2c 0a01 	vmul.f32	s0, s24, s2
2000d18c:	ee10 0a10 	vmov	r0, s0
2000d190:	ee2b 0a01 	vmul.f32	s0, s22, s2
2000d194:	ee10 1a10 	vmov	r1, s0
2000d198:	9a01      	ldr	r2, [sp, #4]
2000d19a:	e9c2 0100 	strd	r0, r1, [r2]
2000d19e:	b002      	add	sp, #8
2000d1a0:	ecbd 8b10 	vpop	{d8-d15}
2000d1a4:	b001      	add	sp, #4
2000d1a6:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2000d1aa:	bdf0      	pop	{r4, r5, r6, r7, pc}
2000d1ac:	f245 72e0 	movw	r2, #22496	; 0x57e0
2000d1b0:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000d1b4:	4631      	mov	r1, r6
2000d1b6:	f003 fa61 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000d1ba:	bf00      	nop
2000d1bc:	f245 72d0 	movw	r2, #22480	; 0x57d0
2000d1c0:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000d1c4:	4620      	mov	r0, r4
2000d1c6:	4631      	mov	r1, r6
2000d1c8:	f003 fa58 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000d1cc:	f245 72c0 	movw	r2, #22464	; 0x57c0
2000d1d0:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000d1d4:	4620      	mov	r0, r4
2000d1d6:	4631      	mov	r1, r6
2000d1d8:	f003 fa50 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000d1dc:	f245 72f0 	movw	r2, #22512	; 0x57f0
2000d1e0:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000d1e4:	4621      	mov	r1, r4
2000d1e6:	f003 fa49 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000d1ea:	bf00      	nop
2000d1ec:	f645 0200 	movw	r2, #22528	; 0x5800
2000d1f0:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000d1f4:	2001      	movs	r0, #1
2000d1f6:	4631      	mov	r1, r6
2000d1f8:	f003 fa40 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000d1fc:	f645 0200 	movw	r2, #22528	; 0x5800
2000d200:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000d204:	2001      	movs	r0, #1
2000d206:	f003 fa39 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000d20a:	bf00      	nop
2000d20c:	00000000 	andeq	r0, r0, r0
2000d210:	3f8ccccd 	svccc	0x008ccccd

2000d214 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17h6b0c7d5dc341a399E>:
2000d214:	b5f0      	push	{r4, r5, r6, r7, lr}
2000d216:	af03      	add	r7, sp, #12
2000d218:	e92d 0b00 	stmdb	sp!, {r8, r9, fp}
2000d21c:	ed2d 8b08 	vpush	{d8-d11}
2000d220:	4604      	mov	r4, r0
2000d222:	f500 66a0 	add.w	r6, r0, #1280	; 0x500
2000d226:	ec51 0b10 	vmov	r0, r1, d0
2000d22a:	f007 fc71 	bl	20014b10 <__aeabi_d2f>
2000d22e:	ed96 0a01 	vldr	s0, [r6, #4]
2000d232:	ed9f aa64 	vldr	s20, [pc, #400]	; 2000d3c4 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17h6b0c7d5dc341a399E+0x1b0>
2000d236:	ee09 0a10 	vmov	s18, r0
2000d23a:	ee20 0a0a 	vmul.f32	s0, s0, s20
2000d23e:	ee80 0a09 	vdiv.f32	s0, s0, s18
2000d242:	ed96 ba02 	vldr	s22, [r6, #8]
2000d246:	4605      	mov	r5, r0
2000d248:	f8c4 0500 	str.w	r0, [r4, #1280]	; 0x500
2000d24c:	f005 fa7c 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d250:	eeb7 8a00 	vmov.f32	s16, #112	; 0x3f800000  1.0
2000d254:	ee88 1a0b 	vdiv.f32	s2, s16, s22
2000d258:	f04f 0900 	mov.w	r9, #0
2000d25c:	f04f 587e 	mov.w	r8, #1065353216	; 0x3f800000
2000d260:	ed96 bad2 	vldr	s22, [r6, #840]	; 0x348
2000d264:	f8c4 951c 	str.w	r9, [r4, #1308]	; 0x51c
2000d268:	f8c4 9520 	str.w	r9, [r4, #1312]	; 0x520
2000d26c:	f8c4 8524 	str.w	r8, [r4, #1316]	; 0x524
2000d270:	f8c4 5840 	str.w	r5, [r4, #2112]	; 0x840
2000d274:	ee31 1a00 	vadd.f32	s2, s2, s0
2000d278:	ee20 1a01 	vmul.f32	s2, s0, s2
2000d27c:	ee31 1a08 	vadd.f32	s2, s2, s16
2000d280:	ee88 2a01 	vdiv.f32	s4, s16, s2
2000d284:	ed96 1ad1 	vldr	s2, [r6, #836]	; 0x344
2000d288:	ee21 1a0a 	vmul.f32	s2, s2, s20
2000d28c:	ee81 1a09 	vdiv.f32	s2, s2, s18
2000d290:	ed86 2a04 	vstr	s4, [r6, #16]
2000d294:	ee20 2a02 	vmul.f32	s4, s0, s4
2000d298:	ee20 0a02 	vmul.f32	s0, s0, s4
2000d29c:	ed86 0a06 	vstr	s0, [r6, #24]
2000d2a0:	eeb0 0a41 	vmov.f32	s0, s2
2000d2a4:	ed86 2a05 	vstr	s4, [r6, #20]
2000d2a8:	f005 fa4e 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d2ac:	ee88 1a0b 	vdiv.f32	s2, s16, s22
2000d2b0:	f604 3084 	addw	r0, r4, #2948	; 0xb84
2000d2b4:	f8c4 985c 	str.w	r9, [r4, #2140]	; 0x85c
2000d2b8:	f8c4 9860 	str.w	r9, [r4, #2144]	; 0x860
2000d2bc:	f8c4 8864 	str.w	r8, [r4, #2148]	; 0x864
2000d2c0:	f8c4 5b80 	str.w	r5, [r4, #2944]	; 0xb80
2000d2c4:	ee31 1a00 	vadd.f32	s2, s2, s0
2000d2c8:	ee20 1a01 	vmul.f32	s2, s0, s2
2000d2cc:	ee31 1a08 	vadd.f32	s2, s2, s16
2000d2d0:	ee88 2a01 	vdiv.f32	s4, s16, s2
2000d2d4:	ed90 1a00 	vldr	s2, [r0]
2000d2d8:	f604 3088 	addw	r0, r4, #2952	; 0xb88
2000d2dc:	ee21 1a0a 	vmul.f32	s2, s2, s20
2000d2e0:	ee81 1a09 	vdiv.f32	s2, s2, s18
2000d2e4:	ed90 ba00 	vldr	s22, [r0]
2000d2e8:	ed86 2ad4 	vstr	s4, [r6, #848]	; 0x350
2000d2ec:	ee20 2a02 	vmul.f32	s4, s0, s4
2000d2f0:	ee20 0a02 	vmul.f32	s0, s0, s4
2000d2f4:	ed86 0ad6 	vstr	s0, [r6, #856]	; 0x358
2000d2f8:	eeb0 0a41 	vmov.f32	s0, s2
2000d2fc:	ed86 2ad5 	vstr	s4, [r6, #852]	; 0x354
2000d300:	f504 6639 	add.w	r6, r4, #2960	; 0xb90
2000d304:	f005 fa20 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d308:	ee88 1a0b 	vdiv.f32	s2, s16, s22
2000d30c:	f604 60c4 	addw	r0, r4, #3780	; 0xec4
2000d310:	f8c4 8b9c 	str.w	r8, [r4, #2972]	; 0xb9c
2000d314:	f8c4 5ec0 	str.w	r5, [r4, #3776]	; 0xec0
2000d318:	f504 656d 	add.w	r5, r4, #3792	; 0xed0
2000d31c:	ee31 2a00 	vadd.f32	s4, s2, s0
2000d320:	ee20 2a02 	vmul.f32	s4, s0, s4
2000d324:	ee32 2a08 	vadd.f32	s4, s4, s16
2000d328:	ee88 2a02 	vdiv.f32	s4, s16, s4
2000d32c:	eeb1 1a41 	vneg.f32	s2, s2
2000d330:	ee20 3a02 	vmul.f32	s6, s0, s4
2000d334:	ee20 4a03 	vmul.f32	s8, s0, s6
2000d338:	ed90 0a00 	vldr	s0, [r0]
2000d33c:	f604 3094 	addw	r0, r4, #2964	; 0xb94
2000d340:	ee20 0a0a 	vmul.f32	s0, s0, s20
2000d344:	ee80 0a09 	vdiv.f32	s0, s0, s18
2000d348:	ed80 3a00 	vstr	s6, [r0]
2000d34c:	f604 3098 	addw	r0, r4, #2968	; 0xb98
2000d350:	ed80 4a00 	vstr	s8, [r0]
2000d354:	f504 603a 	add.w	r0, r4, #2976	; 0xba0
2000d358:	ed86 2a00 	vstr	s4, [r6]
2000d35c:	ed80 1a00 	vstr	s2, [r0]
2000d360:	2600      	movs	r6, #0
2000d362:	f604 60c8 	addw	r0, r4, #3784	; 0xec8
2000d366:	f6cb 7680 	movt	r6, #49024	; 0xbf80
2000d36a:	ed90 9a00 	vldr	s18, [r0]
2000d36e:	f8c4 6ba4 	str.w	r6, [r4, #2980]	; 0xba4
2000d372:	f005 f9e9 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d376:	ee88 1a09 	vdiv.f32	s2, s16, s18
2000d37a:	f604 60d4 	addw	r0, r4, #3796	; 0xed4
2000d37e:	f8c4 8edc 	str.w	r8, [r4, #3804]	; 0xedc
2000d382:	f8c4 6ee4 	str.w	r6, [r4, #3812]	; 0xee4
2000d386:	ee31 2a00 	vadd.f32	s4, s2, s0
2000d38a:	ee20 2a02 	vmul.f32	s4, s0, s4
2000d38e:	ee32 2a08 	vadd.f32	s4, s4, s16
2000d392:	ee88 2a02 	vdiv.f32	s4, s16, s4
2000d396:	eeb1 1a41 	vneg.f32	s2, s2
2000d39a:	ee20 3a02 	vmul.f32	s6, s0, s4
2000d39e:	ee20 0a03 	vmul.f32	s0, s0, s6
2000d3a2:	ed80 3a00 	vstr	s6, [r0]
2000d3a6:	f604 60d8 	addw	r0, r4, #3800	; 0xed8
2000d3aa:	ed80 0a00 	vstr	s0, [r0]
2000d3ae:	f504 606e 	add.w	r0, r4, #3808	; 0xee0
2000d3b2:	ed85 2a00 	vstr	s4, [r5]
2000d3b6:	ed80 1a00 	vstr	s2, [r0]
2000d3ba:	ecbd 8b08 	vpop	{d8-d11}
2000d3be:	e8bd 0b00 	ldmia.w	sp!, {r8, r9, fp}
2000d3c2:	bdf0      	pop	{r4, r5, r6, r7, pc}
2000d3c4:	40490fdb 	ldrdmi	r0, [r9], #-251	; 0xffffff05

2000d3c8 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E>:
2000d3c8:	b5f0      	push	{r4, r5, r6, r7, lr}
2000d3ca:	af03      	add	r7, sp, #12
2000d3cc:	e92d 0b00 	stmdb	sp!, {r8, r9, fp}
2000d3d0:	ed2d 8b10 	vpush	{d8-d15}
2000d3d4:	4681      	mov	r9, r0
2000d3d6:	f8d1 0530 	ldr.w	r0, [r1, #1328]	; 0x530
2000d3da:	460d      	mov	r5, r1
2000d3dc:	f501 66a0 	add.w	r6, r1, #1280	; 0x500
2000d3e0:	f8d1 1534 	ldr.w	r1, [r1, #1332]	; 0x534
2000d3e4:	6880      	ldr	r0, [r0, #8]
2000d3e6:	6889      	ldr	r1, [r1, #8]
2000d3e8:	ed96 1a01 	vldr	s2, [r6, #4]
2000d3ec:	eeb0 9a40 	vmov.f32	s18, s0
2000d3f0:	ee00 0a10 	vmov	s0, r0
2000d3f4:	eeb4 1a40 	vcmp.f32	s2, s0
2000d3f8:	eeb0 8a60 	vmov.f32	s16, s1
2000d3fc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d400:	ee0a 1a10 	vmov	s20, r1
2000d404:	d114      	bne.n	2000d430 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x68>
2000d406:	ed96 1a02 	vldr	s2, [r6, #8]
2000d40a:	eeb4 1a4a 	vcmp.f32	s2, s20
2000d40e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d412:	d10d      	bne.n	2000d430 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x68>
2000d414:	ed96 2a04 	vldr	s4, [r6, #16]
2000d418:	ed96 1a05 	vldr	s2, [r6, #20]
2000d41c:	ed96 0a06 	vldr	s0, [r6, #24]
2000d420:	edd6 9a07 	vldr	s19, [r6, #28]
2000d424:	edd6 8a08 	vldr	s17, [r6, #32]
2000d428:	ed96 fa09 	vldr	s30, [r6, #36]	; 0x24
2000d42c:	e02e      	b.n	2000d48c <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0xc4>
2000d42e:	bf00      	nop
2000d430:	ed9f 1a82 	vldr	s2, [pc, #520]	; 2000d63c <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x274>
2000d434:	ed96 2a00 	vldr	s4, [r6]
2000d438:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d43c:	ee80 0a02 	vdiv.f32	s0, s0, s4
2000d440:	f8c5 0504 	str.w	r0, [r5, #1284]	; 0x504
2000d444:	f8c5 1508 	str.w	r1, [r5, #1288]	; 0x508
2000d448:	f005 f97e 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d44c:	eeb7 fa00 	vmov.f32	s30, #112	; 0x3f800000  1.0
2000d450:	ee8f 1a0a 	vdiv.f32	s2, s30, s20
2000d454:	eddf 8a7a 	vldr	s17, [pc, #488]	; 2000d640 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x278>
2000d458:	2000      	movs	r0, #0
2000d45a:	f04f 517e 	mov.w	r1, #1065353216	; 0x3f800000
2000d45e:	eef0 9a68 	vmov.f32	s19, s17
2000d462:	e9c6 0007 	strd	r0, r0, [r6, #28]
2000d466:	6271      	str	r1, [r6, #36]	; 0x24
2000d468:	ee31 1a00 	vadd.f32	s2, s2, s0
2000d46c:	ee20 1a01 	vmul.f32	s2, s0, s2
2000d470:	ee31 1a0f 	vadd.f32	s2, s2, s30
2000d474:	ee8f 2a01 	vdiv.f32	s4, s30, s2
2000d478:	ee20 1a02 	vmul.f32	s2, s0, s4
2000d47c:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d480:	ed86 2a04 	vstr	s4, [r6, #16]
2000d484:	ed86 1a05 	vstr	s2, [r6, #20]
2000d488:	ed86 0a06 	vstr	s0, [r6, #24]
2000d48c:	ed96 3a0b 	vldr	s6, [r6, #44]	; 0x2c
2000d490:	ed96 4a0a 	vldr	s8, [r6, #40]	; 0x28
2000d494:	ee39 5a43 	vsub.f32	s10, s18, s6
2000d498:	ee21 6a05 	vmul.f32	s12, s2, s10
2000d49c:	ee21 1a04 	vmul.f32	s2, s2, s8
2000d4a0:	ee22 2a04 	vmul.f32	s4, s4, s8
2000d4a4:	ee33 1a01 	vadd.f32	s2, s6, s2
2000d4a8:	ee20 0a05 	vmul.f32	s0, s0, s10
2000d4ac:	ee72 aa06 	vadd.f32	s21, s4, s12
2000d4b0:	ee70 ba01 	vadd.f32	s23, s0, s2
2000d4b4:	ee3a 0aaa 	vadd.f32	s0, s21, s21
2000d4b8:	ee3b 1aab 	vadd.f32	s2, s23, s23
2000d4bc:	ee30 0a44 	vsub.f32	s0, s0, s8
2000d4c0:	ee31 1a43 	vsub.f32	s2, s2, s6
2000d4c4:	f8d5 0870 	ldr.w	r0, [r5, #2160]	; 0x870
2000d4c8:	ed86 0a0a 	vstr	s0, [r6, #40]	; 0x28
2000d4cc:	ed86 1a0b 	vstr	s2, [r6, #44]	; 0x2c
2000d4d0:	f8d5 1874 	ldr.w	r1, [r5, #2164]	; 0x874
2000d4d4:	6880      	ldr	r0, [r0, #8]
2000d4d6:	6889      	ldr	r1, [r1, #8]
2000d4d8:	ed96 1ad1 	vldr	s2, [r6, #836]	; 0x344
2000d4dc:	ee00 0a10 	vmov	s0, r0
2000d4e0:	eeb4 1a40 	vcmp.f32	s2, s0
2000d4e4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d4e8:	ee0b 1a10 	vmov	s22, r1
2000d4ec:	d114      	bne.n	2000d518 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x150>
2000d4ee:	ed96 1ad2 	vldr	s2, [r6, #840]	; 0x348
2000d4f2:	eeb4 1a4b 	vcmp.f32	s2, s22
2000d4f6:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d4fa:	d10d      	bne.n	2000d518 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x150>
2000d4fc:	ed96 2ad4 	vldr	s4, [r6, #848]	; 0x350
2000d500:	ed96 1ad5 	vldr	s2, [r6, #852]	; 0x354
2000d504:	ed96 0ad6 	vldr	s0, [r6, #856]	; 0x358
2000d508:	ed96 cad7 	vldr	s24, [r6, #860]	; 0x35c
2000d50c:	ed96 bad8 	vldr	s22, [r6, #864]	; 0x360
2000d510:	ed96 aad9 	vldr	s20, [r6, #868]	; 0x364
2000d514:	e02f      	b.n	2000d576 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x1ae>
2000d516:	bf00      	nop
2000d518:	ed9f 1ad5 	vldr	s2, [pc, #852]	; 2000d870 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x4a8>
2000d51c:	ed96 2ad0 	vldr	s4, [r6, #832]	; 0x340
2000d520:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d524:	ee80 0a02 	vdiv.f32	s0, s0, s4
2000d528:	f8c5 0844 	str.w	r0, [r5, #2116]	; 0x844
2000d52c:	f8c5 1848 	str.w	r1, [r5, #2120]	; 0x848
2000d530:	f005 f90a 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d534:	eeb7 aa00 	vmov.f32	s20, #112	; 0x3f800000  1.0
2000d538:	ee8a 1a0b 	vdiv.f32	s2, s20, s22
2000d53c:	ed9f bacd 	vldr	s22, [pc, #820]	; 2000d874 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x4ac>
2000d540:	2000      	movs	r0, #0
2000d542:	f04f 517e 	mov.w	r1, #1065353216	; 0x3f800000
2000d546:	eeb0 ca4b 	vmov.f32	s24, s22
2000d54a:	e9c6 00d7 	strd	r0, r0, [r6, #860]	; 0x35c
2000d54e:	f8c6 1364 	str.w	r1, [r6, #868]	; 0x364
2000d552:	ee31 1a00 	vadd.f32	s2, s2, s0
2000d556:	ee20 1a01 	vmul.f32	s2, s0, s2
2000d55a:	ee31 1a0a 	vadd.f32	s2, s2, s20
2000d55e:	ee8a 2a01 	vdiv.f32	s4, s20, s2
2000d562:	ee20 1a02 	vmul.f32	s2, s0, s4
2000d566:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d56a:	ed86 2ad4 	vstr	s4, [r6, #848]	; 0x350
2000d56e:	ed86 1ad5 	vstr	s2, [r6, #852]	; 0x354
2000d572:	ed86 0ad6 	vstr	s0, [r6, #856]	; 0x358
2000d576:	ed96 3adb 	vldr	s6, [r6, #876]	; 0x36c
2000d57a:	ed96 4ada 	vldr	s8, [r6, #872]	; 0x368
2000d57e:	ee38 5a43 	vsub.f32	s10, s16, s6
2000d582:	ee21 6a05 	vmul.f32	s12, s2, s10
2000d586:	ee21 1a04 	vmul.f32	s2, s2, s8
2000d58a:	ee22 2a04 	vmul.f32	s4, s4, s8
2000d58e:	ee33 1a01 	vadd.f32	s2, s6, s2
2000d592:	ee20 0a05 	vmul.f32	s0, s0, s10
2000d596:	ee32 da06 	vadd.f32	s26, s4, s12
2000d59a:	ee30 ea01 	vadd.f32	s28, s0, s2
2000d59e:	ee3d 0a0d 	vadd.f32	s0, s26, s26
2000d5a2:	ee3e 1a0e 	vadd.f32	s2, s28, s28
2000d5a6:	ee30 0a44 	vsub.f32	s0, s0, s8
2000d5aa:	ee31 1a43 	vsub.f32	s2, s2, s6
2000d5ae:	f8d5 0bb0 	ldr.w	r0, [r5, #2992]	; 0xbb0
2000d5b2:	ed86 0ada 	vstr	s0, [r6, #872]	; 0x368
2000d5b6:	ed86 1adb 	vstr	s2, [r6, #876]	; 0x36c
2000d5ba:	ee29 0a89 	vmul.f32	s0, s19, s18
2000d5be:	ee28 1aaa 	vmul.f32	s2, s17, s21
2000d5c2:	f8d5 1bb4 	ldr.w	r1, [r5, #2996]	; 0xbb4
2000d5c6:	ee30 0a01 	vadd.f32	s0, s0, s2
2000d5ca:	ee2f 1a2b 	vmul.f32	s2, s30, s23
2000d5ce:	6880      	ldr	r0, [r0, #8]
2000d5d0:	f206 6284 	addw	r2, r6, #1668	; 0x684
2000d5d4:	ee30 9a01 	vadd.f32	s18, s0, s2
2000d5d8:	6889      	ldr	r1, [r1, #8]
2000d5da:	ed92 1a00 	vldr	s2, [r2]
2000d5de:	ee00 0a10 	vmov	s0, r0
2000d5e2:	eeb4 1a40 	vcmp.f32	s2, s0
2000d5e6:	f240 0800 	movw	r8, #0
2000d5ea:	ee08 1a90 	vmov	s17, r1
2000d5ee:	f506 64d2 	add.w	r4, r6, #1680	; 0x690
2000d5f2:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d5f6:	f6cb 7880 	movt	r8, #49024	; 0xbf80
2000d5fa:	d123      	bne.n	2000d644 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x27c>
2000d5fc:	f506 62d1 	add.w	r2, r6, #1672	; 0x688
2000d600:	ed92 1a00 	vldr	s2, [r2]
2000d604:	eeb4 1a68 	vcmp.f32	s2, s17
2000d608:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d60c:	d11a      	bne.n	2000d644 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x27c>
2000d60e:	f206 6094 	addw	r0, r6, #1684	; 0x694
2000d612:	ed90 1a00 	vldr	s2, [r0]
2000d616:	f506 60d3 	add.w	r0, r6, #1688	; 0x698
2000d61a:	ed90 0a00 	vldr	s0, [r0]
2000d61e:	f206 609c 	addw	r0, r6, #1692	; 0x69c
2000d622:	ed90 fa00 	vldr	s30, [r0]
2000d626:	f506 60d4 	add.w	r0, r6, #1696	; 0x6a0
2000d62a:	edd0 8a00 	vldr	s17, [r0]
2000d62e:	f206 60a4 	addw	r0, r6, #1700	; 0x6a4
2000d632:	ed94 2a00 	vldr	s4, [r4]
2000d636:	edd0 9a00 	vldr	s19, [r0]
2000d63a:	e03b      	b.n	2000d6b4 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x2ec>
2000d63c:	40490fdb 	ldrdmi	r0, [r9], #-251	; 0xffffff05
2000d640:	00000000 	andeq	r0, r0, r0
2000d644:	f506 62d0 	add.w	r2, r6, #1664	; 0x680
2000d648:	ed9f 1a89 	vldr	s2, [pc, #548]	; 2000d870 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x4a8>
2000d64c:	ed92 2a00 	vldr	s4, [r2]
2000d650:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d654:	ee80 0a02 	vdiv.f32	s0, s0, s4
2000d658:	f8c5 0b84 	str.w	r0, [r5, #2948]	; 0xb84
2000d65c:	f8c5 1b88 	str.w	r1, [r5, #2952]	; 0xb88
2000d660:	f005 f872 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d664:	eeb7 fa00 	vmov.f32	s30, #112	; 0x3f800000  1.0
2000d668:	ee8f 3a28 	vdiv.f32	s6, s30, s17
2000d66c:	f206 6094 	addw	r0, r6, #1684	; 0x694
2000d670:	eeff 9a00 	vmov.f32	s19, #240	; 0xbf800000 -1.0
2000d674:	f8c6 86a4 	str.w	r8, [r6, #1700]	; 0x6a4
2000d678:	ee33 1a00 	vadd.f32	s2, s6, s0
2000d67c:	ee20 1a01 	vmul.f32	s2, s0, s2
2000d680:	ee31 1a0f 	vadd.f32	s2, s2, s30
2000d684:	ee8f 2a01 	vdiv.f32	s4, s30, s2
2000d688:	eef1 8a43 	vneg.f32	s17, s6
2000d68c:	ee20 1a02 	vmul.f32	s2, s0, s4
2000d690:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d694:	ed80 1a00 	vstr	s2, [r0]
2000d698:	f506 60d3 	add.w	r0, r6, #1688	; 0x698
2000d69c:	ed80 0a00 	vstr	s0, [r0]
2000d6a0:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000d6a4:	f8c6 069c 	str.w	r0, [r6, #1692]	; 0x69c
2000d6a8:	f506 60d4 	add.w	r0, r6, #1696	; 0x6a0
2000d6ac:	ed84 2a00 	vstr	s4, [r4]
2000d6b0:	edc0 8a00 	vstr	s17, [r0]
2000d6b4:	f206 60ac 	addw	r0, r6, #1708	; 0x6ac
2000d6b8:	ed90 3a00 	vldr	s6, [r0]
2000d6bc:	f506 61d5 	add.w	r1, r6, #1704	; 0x6a8
2000d6c0:	ed91 4a00 	vldr	s8, [r1]
2000d6c4:	ee39 5a43 	vsub.f32	s10, s18, s6
2000d6c8:	ee22 2a04 	vmul.f32	s4, s4, s8
2000d6cc:	ee21 6a05 	vmul.f32	s12, s2, s10
2000d6d0:	ee21 1a04 	vmul.f32	s2, s2, s8
2000d6d4:	ee72 aa06 	vadd.f32	s21, s4, s12
2000d6d8:	ee33 1a01 	vadd.f32	s2, s6, s2
2000d6dc:	ee20 0a05 	vmul.f32	s0, s0, s10
2000d6e0:	ee70 ba01 	vadd.f32	s23, s0, s2
2000d6e4:	ee3a 0aaa 	vadd.f32	s0, s21, s21
2000d6e8:	ee30 0a44 	vsub.f32	s0, s0, s8
2000d6ec:	ed81 0a00 	vstr	s0, [r1]
2000d6f0:	ee3b 0aab 	vadd.f32	s0, s23, s23
2000d6f4:	ee30 0a43 	vsub.f32	s0, s0, s6
2000d6f8:	ed80 0a00 	vstr	s0, [r0]
2000d6fc:	f8d5 0ef0 	ldr.w	r0, [r5, #3824]	; 0xef0
2000d700:	f8d5 1ef4 	ldr.w	r1, [r5, #3828]	; 0xef4
2000d704:	6880      	ldr	r0, [r0, #8]
2000d706:	f606 12c4 	addw	r2, r6, #2500	; 0x9c4
2000d70a:	6889      	ldr	r1, [r1, #8]
2000d70c:	ed92 1a00 	vldr	s2, [r2]
2000d710:	ee00 0a10 	vmov	s0, r0
2000d714:	eeb4 1a40 	vcmp.f32	s2, s0
2000d718:	ee0c 1a90 	vmov	s25, r1
2000d71c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d720:	f506 641d 	add.w	r4, r6, #2512	; 0x9d0
2000d724:	d120      	bne.n	2000d768 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x3a0>
2000d726:	f606 12c8 	addw	r2, r6, #2504	; 0x9c8
2000d72a:	ed92 1a00 	vldr	s2, [r2]
2000d72e:	eeb4 1a6c 	vcmp.f32	s2, s25
2000d732:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d736:	d117      	bne.n	2000d768 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x3a0>
2000d738:	f606 10d4 	addw	r0, r6, #2516	; 0x9d4
2000d73c:	ed90 2a00 	vldr	s4, [r0]
2000d740:	f606 10d8 	addw	r0, r6, #2520	; 0x9d8
2000d744:	ed90 4a00 	vldr	s8, [r0]
2000d748:	f606 10dc 	addw	r0, r6, #2524	; 0x9dc
2000d74c:	ed90 1a00 	vldr	s2, [r0]
2000d750:	f506 601e 	add.w	r0, r6, #2528	; 0x9e0
2000d754:	ed90 0a00 	vldr	s0, [r0]
2000d758:	f606 10e4 	addw	r0, r6, #2532	; 0x9e4
2000d75c:	ed94 3a00 	vldr	s6, [r4]
2000d760:	ed90 5a00 	vldr	s10, [r0]
2000d764:	e038      	b.n	2000d7d8 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x410>
2000d766:	bf00      	nop
2000d768:	f506 621c 	add.w	r2, r6, #2496	; 0x9c0
2000d76c:	ed9f 1a40 	vldr	s2, [pc, #256]	; 2000d870 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E+0x4a8>
2000d770:	ed92 2a00 	vldr	s4, [r2]
2000d774:	ee20 0a01 	vmul.f32	s0, s0, s2
2000d778:	ee80 0a02 	vdiv.f32	s0, s0, s4
2000d77c:	f8c5 0ec4 	str.w	r0, [r5, #3780]	; 0xec4
2000d780:	f8c5 1ec8 	str.w	r1, [r5, #3784]	; 0xec8
2000d784:	f004 ffe0 	bl	20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>
2000d788:	eeb7 1a00 	vmov.f32	s2, #112	; 0x3f800000  1.0
2000d78c:	ee81 5a2c 	vdiv.f32	s10, s2, s25
2000d790:	f606 10d4 	addw	r0, r6, #2516	; 0x9d4
2000d794:	f8c6 89e4 	str.w	r8, [r6, #2532]	; 0x9e4
2000d798:	ee35 2a00 	vadd.f32	s4, s10, s0
2000d79c:	ee20 2a02 	vmul.f32	s4, s0, s4
2000d7a0:	ee32 2a01 	vadd.f32	s4, s4, s2
2000d7a4:	ee81 3a02 	vdiv.f32	s6, s2, s4
2000d7a8:	ee20 2a03 	vmul.f32	s4, s0, s6
2000d7ac:	ee20 4a02 	vmul.f32	s8, s0, s4
2000d7b0:	ed80 2a00 	vstr	s4, [r0]
2000d7b4:	f606 10d8 	addw	r0, r6, #2520	; 0x9d8
2000d7b8:	ed80 4a00 	vstr	s8, [r0]
2000d7bc:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000d7c0:	eeb1 0a45 	vneg.f32	s0, s10
2000d7c4:	f8c6 09dc 	str.w	r0, [r6, #2524]	; 0x9dc
2000d7c8:	f506 601e 	add.w	r0, r6, #2528	; 0x9e0
2000d7cc:	eebf 5a00 	vmov.f32	s10, #240	; 0xbf800000 -1.0
2000d7d0:	ed84 3a00 	vstr	s6, [r4]
2000d7d4:	ed80 0a00 	vstr	s0, [r0]
2000d7d8:	ee2f 6a09 	vmul.f32	s12, s30, s18
2000d7dc:	ee28 7aaa 	vmul.f32	s14, s17, s21
2000d7e0:	ee36 6a07 	vadd.f32	s12, s12, s14
2000d7e4:	ee29 7aab 	vmul.f32	s14, s19, s23
2000d7e8:	ee36 6a07 	vadd.f32	s12, s12, s14
2000d7ec:	ee2c 7a08 	vmul.f32	s14, s24, s16
2000d7f0:	ee6b 0a0d 	vmul.f32	s1, s22, s26
2000d7f4:	ee37 7a20 	vadd.f32	s14, s14, s1
2000d7f8:	ee6a 0a0e 	vmul.f32	s1, s20, s28
2000d7fc:	f606 10ec 	addw	r0, r6, #2540	; 0x9ec
2000d800:	ee37 7a20 	vadd.f32	s14, s14, s1
2000d804:	edd0 0a00 	vldr	s1, [r0]
2000d808:	f606 11e8 	addw	r1, r6, #2536	; 0x9e8
2000d80c:	edd1 1a00 	vldr	s3, [r1]
2000d810:	ee77 2a60 	vsub.f32	s5, s14, s1
2000d814:	ee23 3a21 	vmul.f32	s6, s6, s3
2000d818:	ee62 3a22 	vmul.f32	s7, s4, s5
2000d81c:	ee22 2a21 	vmul.f32	s4, s4, s3
2000d820:	ee33 3a23 	vadd.f32	s6, s6, s7
2000d824:	ee24 4a22 	vmul.f32	s8, s8, s5
2000d828:	ee30 2a82 	vadd.f32	s4, s1, s4
2000d82c:	ee34 2a02 	vadd.f32	s4, s8, s4
2000d830:	ee33 4a03 	vadd.f32	s8, s6, s6
2000d834:	ee34 4a61 	vsub.f32	s8, s8, s3
2000d838:	ee21 1a07 	vmul.f32	s2, s2, s14
2000d83c:	ee20 0a03 	vmul.f32	s0, s0, s6
2000d840:	ed81 4a00 	vstr	s8, [r1]
2000d844:	ee32 4a02 	vadd.f32	s8, s4, s4
2000d848:	ee31 0a00 	vadd.f32	s0, s2, s0
2000d84c:	ee25 1a02 	vmul.f32	s2, s10, s4
2000d850:	ee34 4a60 	vsub.f32	s8, s8, s1
2000d854:	ee30 0a01 	vadd.f32	s0, s0, s2
2000d858:	ed80 4a00 	vstr	s8, [r0]
2000d85c:	ed89 6a00 	vstr	s12, [r9]
2000d860:	ed89 0a01 	vstr	s0, [r9, #4]
2000d864:	ecbd 8b10 	vpop	{d8-d15}
2000d868:	e8bd 0b00 	ldmia.w	sp!, {r8, r9, fp}
2000d86c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2000d86e:	bf00      	nop
2000d870:	40490fdb 	ldrdmi	r0, [r9], #-251	; 0xffffff05
2000d874:	00000000 	andeq	r0, r0, r0

2000d878 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE>:
2000d878:	b580      	push	{r7, lr}
2000d87a:	466f      	mov	r7, sp
2000d87c:	b098      	sub	sp, #96	; 0x60
2000d87e:	6805      	ldr	r5, [r0, #0]
2000d880:	b995      	cbnz	r5, 2000d8a8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x30>
2000d882:	f645 0024 	movw	r0, #22564	; 0x5824
2000d886:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000d88a:	9012      	str	r0, [sp, #72]	; 0x48
2000d88c:	2001      	movs	r0, #1
2000d88e:	9013      	str	r0, [sp, #76]	; 0x4c
2000d890:	2000      	movs	r0, #0
2000d892:	2104      	movs	r1, #4
2000d894:	e9cd 1014 	strd	r1, r0, [sp, #80]	; 0x50
2000d898:	f645 0168 	movw	r1, #22632	; 0x5868
2000d89c:	9016      	str	r0, [sp, #88]	; 0x58
2000d89e:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000d8a2:	a812      	add	r0, sp, #72	; 0x48
2000d8a4:	f002 feb7 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000d8a8:	e9d0 2304 	ldrd	r2, r3, [r0, #16]
2000d8ac:	e9d0 0601 	ldrd	r0, r6, [r0, #4]
2000d8b0:	fb03 f902 	mul.w	r9, r3, r2
2000d8b4:	e9cd 6009 	strd	r6, r0, [sp, #36]	; 0x24
2000d8b8:	e9d1 4000 	ldrd	r4, r0, [r1]
2000d8bc:	e9d1 8a04 	ldrd	r8, sl, [r1, #16]
2000d8c0:	9008      	str	r0, [sp, #32]
2000d8c2:	6888      	ldr	r0, [r1, #8]
2000d8c4:	ed9f 8a5d 	vldr	s16, [pc, #372]	; 2000da3c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1c4>
2000d8c8:	9007      	str	r0, [sp, #28]
2000d8ca:	68c8      	ldr	r0, [r1, #12]
2000d8cc:	f1a9 0104 	sub.w	r1, r9, #4
2000d8d0:	9006      	str	r0, [sp, #24]
2000d8d2:	f009 0003 	and.w	r0, r9, #3
2000d8d6:	900d      	str	r0, [sp, #52]	; 0x34
2000d8d8:	2001      	movs	r0, #1
2000d8da:	eb00 0091 	add.w	r0, r0, r1, lsr #2
2000d8de:	9101      	str	r1, [sp, #4]
2000d8e0:	f000 0103 	and.w	r1, r0, #3
2000d8e4:	f020 0003 	bic.w	r0, r0, #3
2000d8e8:	ed9f 9a55 	vldr	s18, [pc, #340]	; 2000da40 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1c8>
2000d8ec:	ed9f ba55 	vldr	s22, [pc, #340]	; 2000da44 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1cc>
2000d8f0:	ed9f ca55 	vldr	s24, [pc, #340]	; 2000da48 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1d0>
2000d8f4:	ed9f ea55 	vldr	s28, [pc, #340]	; 2000da4c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1d4>
2000d8f8:	ed9f fa55 	vldr	s30, [pc, #340]	; 2000da50 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1d8>
2000d8fc:	eddf 8a55 	vldr	s17, [pc, #340]	; 2000da54 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1dc>
2000d900:	f50a 5b88 	add.w	fp, sl, #4352	; 0x1100
2000d904:	eeb3 aa0e 	vmov.f32	s20, #62	; 0x41f00000  30.0
2000d908:	eeb3 da04 	vmov.f32	s26, #52	; 0x41a00000  20.0
2000d90c:	9000      	str	r0, [sp, #0]
2000d90e:	0080      	lsls	r0, r0, #2
2000d910:	9103      	str	r1, [sp, #12]
2000d912:	900b      	str	r0, [sp, #44]	; 0x2c
2000d914:	e9cd 4504 	strd	r4, r5, [sp, #16]
2000d918:	f8cd 9008 	str.w	r9, [sp, #8]
2000d91c:	e00c      	b.n	2000d938 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xc0>
2000d91e:	bf00      	nop
2000d920:	f1b9 0f00 	cmp.w	r9, #0
2000d924:	f04f 0100 	mov.w	r1, #0
2000d928:	4680      	mov	r8, r0
2000d92a:	4614      	mov	r4, r2
2000d92c:	f8cd 9044 	str.w	r9, [sp, #68]	; 0x44
2000d930:	910e      	str	r1, [sp, #56]	; 0x38
2000d932:	f040 8405 	bne.w	2000e140 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8c8>
2000d936:	9d05      	ldr	r5, [sp, #20]
2000d938:	47a8      	blx	r5
2000d93a:	6861      	ldr	r1, [r4, #4]
2000d93c:	2900      	cmp	r1, #0
2000d93e:	f000 8407 	beq.w	2000e150 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8d8>
2000d942:	2901      	cmp	r1, #1
2000d944:	f000 840c 	beq.w	2000e160 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8e8>
2000d948:	2902      	cmp	r1, #2
2000d94a:	f240 8411 	bls.w	2000e170 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8f8>
2000d94e:	6821      	ldr	r1, [r4, #0]
2000d950:	f9b1 0000 	ldrsh.w	r0, [r1]
2000d954:	ee00 0a10 	vmov	s0, r0
2000d958:	f9b1 0004 	ldrsh.w	r0, [r1, #4]
2000d95c:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000d960:	ee01 0a10 	vmov	s2, r0
2000d964:	ee20 0a08 	vmul.f32	s0, s0, s16
2000d968:	eeb8 1ac1 	vcvt.f32.s32	s2, s2
2000d96c:	ee20 0a00 	vmul.f32	s0, s0, s0
2000d970:	ee21 1a08 	vmul.f32	s2, s2, s16
2000d974:	ee20 0a09 	vmul.f32	s0, s0, s18
2000d978:	ee21 1a0c 	vmul.f32	s2, s2, s24
2000d97c:	ee30 2a01 	vadd.f32	s4, s0, s2
2000d980:	eeb4 2a4d 	vcmp.f32	s4, s26
2000d984:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d988:	bf48      	it	mi
2000d98a:	eeb0 2a4d 	vmovmi.f32	s4, s26
2000d98e:	eeb4 2a4e 	vcmp.f32	s4, s28
2000d992:	ee30 0a41 	vsub.f32	s0, s0, s2
2000d996:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d99a:	eeb4 0a4d 	vcmp.f32	s0, s26
2000d99e:	bfc8      	it	gt
2000d9a0:	eeb0 2a4e 	vmovgt.f32	s4, s28
2000d9a4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d9a8:	bf48      	it	mi
2000d9aa:	eeb0 0a4d 	vmovmi.f32	s0, s26
2000d9ae:	eeb4 0a4e 	vcmp.f32	s0, s28
2000d9b2:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000d9b6:	bfc8      	it	gt
2000d9b8:	eeb0 0a4e 	vmovgt.f32	s0, s28
2000d9bc:	9e09      	ldr	r6, [sp, #36]	; 0x24
2000d9be:	980a      	ldr	r0, [sp, #40]	; 0x28
2000d9c0:	f8d6 e000 	ldr.w	lr, [r6]
2000d9c4:	9e08      	ldr	r6, [sp, #32]
2000d9c6:	ee12 2a10 	vmov	r2, s4
2000d9ca:	6836      	ldr	r6, [r6, #0]
2000d9cc:	f9b1 1002 	ldrsh.w	r1, [r1, #2]
2000d9d0:	6800      	ldr	r0, [r0, #0]
2000d9d2:	60b2      	str	r2, [r6, #8]
2000d9d4:	ee10 3a10 	vmov	r3, s0
2000d9d8:	ee00 1a10 	vmov	s0, r1
2000d9dc:	9907      	ldr	r1, [sp, #28]
2000d9de:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000d9e2:	6809      	ldr	r1, [r1, #0]
2000d9e4:	ee20 0a08 	vmul.f32	s0, s0, s16
2000d9e8:	608b      	str	r3, [r1, #8]
2000d9ea:	9906      	ldr	r1, [sp, #24]
2000d9ec:	ee20 0a0a 	vmul.f32	s0, s0, s20
2000d9f0:	ee30 0a0b 	vadd.f32	s0, s0, s22
2000d9f4:	6809      	ldr	r1, [r1, #0]
2000d9f6:	ee10 2a10 	vmov	r2, s0
2000d9fa:	608a      	str	r2, [r1, #8]
2000d9fc:	e9d8 1200 	ldrd	r1, r2, [r8]
2000da00:	f8cd 9038 	str.w	r9, [sp, #56]	; 0x38
2000da04:	454a      	cmp	r2, r9
2000da06:	9211      	str	r2, [sp, #68]	; 0x44
2000da08:	f040 839a 	bne.w	2000e140 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8c8>
2000da0c:	f1b9 0f00 	cmp.w	r9, #0
2000da10:	f000 81ce 	beq.w	2000ddb0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x538>
2000da14:	f1b9 0f04 	cmp.w	r9, #4
2000da18:	d202      	bcs.n	2000da20 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1a8>
2000da1a:	2300      	movs	r3, #0
2000da1c:	e197      	b.n	2000dd4e <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x4d6>
2000da1e:	bf00      	nop
2000da20:	9a01      	ldr	r2, [sp, #4]
2000da22:	2a0c      	cmp	r2, #12
2000da24:	d218      	bcs.n	2000da58 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1e0>
2000da26:	9b03      	ldr	r3, [sp, #12]
2000da28:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
2000da2a:	f04f 0c00 	mov.w	ip, #0
2000da2e:	2b00      	cmp	r3, #0
2000da30:	4613      	mov	r3, r2
2000da32:	920b      	str	r2, [sp, #44]	; 0x2c
2000da34:	f040 80d1 	bne.w	2000dbda <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x362>
2000da38:	e189      	b.n	2000dd4e <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x4d6>
2000da3a:	bf00      	nop
2000da3c:	39800000 	stmibcc	r0, {}	; <UNPREDICTABLE>
2000da40:	469c4000 	ldrmi	r4, [ip], r0
2000da44:	3e99999a 			; <UNDEFINED> instruction: 0x3e99999a
2000da48:	461c4000 	ldrmi	r4, [ip], -r0
2000da4c:	46abe000 	strtmi	lr, [fp], r0
2000da50:	4b000000 	blmi	2000da58 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1e0>
2000da54:	30000000 	andcc	r0, r0, r0
2000da58:	9b00      	ldr	r3, [sp, #0]
2000da5a:	2200      	movs	r2, #0
2000da5c:	5885      	ldr	r5, [r0, r2]
2000da5e:	188e      	adds	r6, r1, r2
2000da60:	022d      	lsls	r5, r5, #8
2000da62:	ee00 5a10 	vmov	s0, r5
2000da66:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000da6a:	ee20 0a28 	vmul.f32	s0, s0, s17
2000da6e:	1884      	adds	r4, r0, r2
2000da70:	ed86 0a00 	vstr	s0, [r6]
2000da74:	6865      	ldr	r5, [r4, #4]
2000da76:	3b04      	subs	r3, #4
2000da78:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000da7c:	ee00 5a10 	vmov	s0, r5
2000da80:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000da84:	ee20 0a28 	vmul.f32	s0, s0, s17
2000da88:	ed86 0a01 	vstr	s0, [r6, #4]
2000da8c:	68a5      	ldr	r5, [r4, #8]
2000da8e:	f102 0240 	add.w	r2, r2, #64	; 0x40
2000da92:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000da96:	ee00 5a10 	vmov	s0, r5
2000da9a:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000da9e:	ee20 0a28 	vmul.f32	s0, s0, s17
2000daa2:	ed86 0a02 	vstr	s0, [r6, #8]
2000daa6:	68e5      	ldr	r5, [r4, #12]
2000daa8:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000daac:	ee00 5a10 	vmov	s0, r5
2000dab0:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dab4:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dab8:	ed86 0a03 	vstr	s0, [r6, #12]
2000dabc:	6925      	ldr	r5, [r4, #16]
2000dabe:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000dac2:	ee00 5a10 	vmov	s0, r5
2000dac6:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000daca:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dace:	ed86 0a04 	vstr	s0, [r6, #16]
2000dad2:	6965      	ldr	r5, [r4, #20]
2000dad4:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000dad8:	ee00 5a10 	vmov	s0, r5
2000dadc:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dae0:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dae4:	ed86 0a05 	vstr	s0, [r6, #20]
2000dae8:	69a5      	ldr	r5, [r4, #24]
2000daea:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000daee:	ee00 5a10 	vmov	s0, r5
2000daf2:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000daf6:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dafa:	ed86 0a06 	vstr	s0, [r6, #24]
2000dafe:	69e5      	ldr	r5, [r4, #28]
2000db00:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db04:	ee00 5a10 	vmov	s0, r5
2000db08:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db0c:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db10:	ed86 0a07 	vstr	s0, [r6, #28]
2000db14:	6a25      	ldr	r5, [r4, #32]
2000db16:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db1a:	ee00 5a10 	vmov	s0, r5
2000db1e:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db22:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db26:	ed86 0a08 	vstr	s0, [r6, #32]
2000db2a:	6a65      	ldr	r5, [r4, #36]	; 0x24
2000db2c:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db30:	ee00 5a10 	vmov	s0, r5
2000db34:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db38:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db3c:	ed86 0a09 	vstr	s0, [r6, #36]	; 0x24
2000db40:	6aa5      	ldr	r5, [r4, #40]	; 0x28
2000db42:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db46:	ee00 5a10 	vmov	s0, r5
2000db4a:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db4e:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db52:	ed86 0a0a 	vstr	s0, [r6, #40]	; 0x28
2000db56:	6ae5      	ldr	r5, [r4, #44]	; 0x2c
2000db58:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db5c:	ee00 5a10 	vmov	s0, r5
2000db60:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db64:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db68:	ed86 0a0b 	vstr	s0, [r6, #44]	; 0x2c
2000db6c:	6b25      	ldr	r5, [r4, #48]	; 0x30
2000db6e:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db72:	ee00 5a10 	vmov	s0, r5
2000db76:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db7a:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db7e:	ed86 0a0c 	vstr	s0, [r6, #48]	; 0x30
2000db82:	6b65      	ldr	r5, [r4, #52]	; 0x34
2000db84:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db88:	ee00 5a10 	vmov	s0, r5
2000db8c:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000db90:	ee20 0a28 	vmul.f32	s0, s0, s17
2000db94:	ed86 0a0d 	vstr	s0, [r6, #52]	; 0x34
2000db98:	6ba5      	ldr	r5, [r4, #56]	; 0x38
2000db9a:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000db9e:	ee00 5a10 	vmov	s0, r5
2000dba2:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dba6:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dbaa:	ed86 0a0e 	vstr	s0, [r6, #56]	; 0x38
2000dbae:	6be5      	ldr	r5, [r4, #60]	; 0x3c
2000dbb0:	ea4f 2505 	mov.w	r5, r5, lsl #8
2000dbb4:	ee00 5a10 	vmov	s0, r5
2000dbb8:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dbbc:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dbc0:	ed86 0a0f 	vstr	s0, [r6, #60]	; 0x3c
2000dbc4:	f47f af4a 	bne.w	2000da5c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x1e4>
2000dbc8:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
2000dbca:	e9dd 3403 	ldrd	r3, r4, [sp, #12]
2000dbce:	4694      	mov	ip, r2
2000dbd0:	2b00      	cmp	r3, #0
2000dbd2:	4613      	mov	r3, r2
2000dbd4:	920b      	str	r2, [sp, #44]	; 0x2c
2000dbd6:	f000 80ba 	beq.w	2000dd4e <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x4d6>
2000dbda:	f850 302c 	ldr.w	r3, [r0, ip, lsl #2]
2000dbde:	eb01 068c 	add.w	r6, r1, ip, lsl #2
2000dbe2:	021b      	lsls	r3, r3, #8
2000dbe4:	ee00 3a10 	vmov	s0, r3
2000dbe8:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dbec:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dbf0:	ed86 0a00 	vstr	s0, [r6]
2000dbf4:	f04c 0301 	orr.w	r3, ip, #1
2000dbf8:	f850 6023 	ldr.w	r6, [r0, r3, lsl #2]
2000dbfc:	eb01 0383 	add.w	r3, r1, r3, lsl #2
2000dc00:	0236      	lsls	r6, r6, #8
2000dc02:	ee00 6a10 	vmov	s0, r6
2000dc06:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dc0a:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dc0e:	ed83 0a00 	vstr	s0, [r3]
2000dc12:	f04c 0302 	orr.w	r3, ip, #2
2000dc16:	f850 6023 	ldr.w	r6, [r0, r3, lsl #2]
2000dc1a:	eb01 0383 	add.w	r3, r1, r3, lsl #2
2000dc1e:	0236      	lsls	r6, r6, #8
2000dc20:	ee00 6a10 	vmov	s0, r6
2000dc24:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dc28:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dc2c:	ed83 0a00 	vstr	s0, [r3]
2000dc30:	f04c 0303 	orr.w	r3, ip, #3
2000dc34:	f850 5023 	ldr.w	r5, [r0, r3, lsl #2]
2000dc38:	9c03      	ldr	r4, [sp, #12]
2000dc3a:	022d      	lsls	r5, r5, #8
2000dc3c:	ee00 5a10 	vmov	s0, r5
2000dc40:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dc44:	eb01 0683 	add.w	r6, r1, r3, lsl #2
2000dc48:	f10c 0304 	add.w	r3, ip, #4
2000dc4c:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dc50:	2c01      	cmp	r4, #1
2000dc52:	ed86 0a00 	vstr	s0, [r6]
2000dc56:	d079      	beq.n	2000dd4c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x4d4>
2000dc58:	f850 6023 	ldr.w	r6, [r0, r3, lsl #2]
2000dc5c:	eb01 0583 	add.w	r5, r1, r3, lsl #2
2000dc60:	0236      	lsls	r6, r6, #8
2000dc62:	ee00 6a10 	vmov	s0, r6
2000dc66:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dc6a:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dc6e:	ed85 0a00 	vstr	s0, [r5]
2000dc72:	f043 0601 	orr.w	r6, r3, #1
2000dc76:	f850 5026 	ldr.w	r5, [r0, r6, lsl #2]
2000dc7a:	eb01 0686 	add.w	r6, r1, r6, lsl #2
2000dc7e:	022d      	lsls	r5, r5, #8
2000dc80:	ee00 5a10 	vmov	s0, r5
2000dc84:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dc88:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dc8c:	ed86 0a00 	vstr	s0, [r6]
2000dc90:	f043 0602 	orr.w	r6, r3, #2
2000dc94:	f850 5026 	ldr.w	r5, [r0, r6, lsl #2]
2000dc98:	eb01 0686 	add.w	r6, r1, r6, lsl #2
2000dc9c:	022d      	lsls	r5, r5, #8
2000dc9e:	ee00 5a10 	vmov	s0, r5
2000dca2:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dca6:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dcaa:	ed86 0a00 	vstr	s0, [r6]
2000dcae:	f043 0303 	orr.w	r3, r3, #3
2000dcb2:	f850 5023 	ldr.w	r5, [r0, r3, lsl #2]
2000dcb6:	eb01 0683 	add.w	r6, r1, r3, lsl #2
2000dcba:	022d      	lsls	r5, r5, #8
2000dcbc:	ee00 5a10 	vmov	s0, r5
2000dcc0:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dcc4:	f10c 0308 	add.w	r3, ip, #8
2000dcc8:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dccc:	2c02      	cmp	r4, #2
2000dcce:	ed86 0a00 	vstr	s0, [r6]
2000dcd2:	d03b      	beq.n	2000dd4c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x4d4>
2000dcd4:	f850 6023 	ldr.w	r6, [r0, r3, lsl #2]
2000dcd8:	eb01 0583 	add.w	r5, r1, r3, lsl #2
2000dcdc:	0236      	lsls	r6, r6, #8
2000dcde:	ee00 6a10 	vmov	s0, r6
2000dce2:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dce6:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dcea:	ed85 0a00 	vstr	s0, [r5]
2000dcee:	f043 0601 	orr.w	r6, r3, #1
2000dcf2:	f850 5026 	ldr.w	r5, [r0, r6, lsl #2]
2000dcf6:	eb01 0686 	add.w	r6, r1, r6, lsl #2
2000dcfa:	022d      	lsls	r5, r5, #8
2000dcfc:	ee00 5a10 	vmov	s0, r5
2000dd00:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dd04:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dd08:	ed86 0a00 	vstr	s0, [r6]
2000dd0c:	f043 0602 	orr.w	r6, r3, #2
2000dd10:	f850 5026 	ldr.w	r5, [r0, r6, lsl #2]
2000dd14:	eb01 0686 	add.w	r6, r1, r6, lsl #2
2000dd18:	022d      	lsls	r5, r5, #8
2000dd1a:	ee00 5a10 	vmov	s0, r5
2000dd1e:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dd22:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dd26:	ed86 0a00 	vstr	s0, [r6]
2000dd2a:	f043 0303 	orr.w	r3, r3, #3
2000dd2e:	f850 5023 	ldr.w	r5, [r0, r3, lsl #2]
2000dd32:	eb01 0683 	add.w	r6, r1, r3, lsl #2
2000dd36:	022a      	lsls	r2, r5, #8
2000dd38:	ee00 2a10 	vmov	s0, r2
2000dd3c:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dd40:	f10c 030c 	add.w	r3, ip, #12
2000dd44:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dd48:	ed86 0a00 	vstr	s0, [r6]
2000dd4c:	9c04      	ldr	r4, [sp, #16]
2000dd4e:	9a0d      	ldr	r2, [sp, #52]	; 0x34
2000dd50:	b372      	cbz	r2, 2000ddb0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x538>
2000dd52:	f850 2023 	ldr.w	r2, [r0, r3, lsl #2]
2000dd56:	eb01 0683 	add.w	r6, r1, r3, lsl #2
2000dd5a:	0212      	lsls	r2, r2, #8
2000dd5c:	ee00 2a10 	vmov	s0, r2
2000dd60:	9a0d      	ldr	r2, [sp, #52]	; 0x34
2000dd62:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dd66:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dd6a:	2a01      	cmp	r2, #1
2000dd6c:	ed86 0a00 	vstr	s0, [r6]
2000dd70:	d01e      	beq.n	2000ddb0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x538>
2000dd72:	1c5a      	adds	r2, r3, #1
2000dd74:	f850 6022 	ldr.w	r6, [r0, r2, lsl #2]
2000dd78:	eb01 0282 	add.w	r2, r1, r2, lsl #2
2000dd7c:	0236      	lsls	r6, r6, #8
2000dd7e:	ee00 6a10 	vmov	s0, r6
2000dd82:	9e0d      	ldr	r6, [sp, #52]	; 0x34
2000dd84:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dd88:	ee20 0a28 	vmul.f32	s0, s0, s17
2000dd8c:	2e02      	cmp	r6, #2
2000dd8e:	ed82 0a00 	vstr	s0, [r2]
2000dd92:	d00d      	beq.n	2000ddb0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x538>
2000dd94:	1c9a      	adds	r2, r3, #2
2000dd96:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
2000dd9a:	eb01 0182 	add.w	r1, r1, r2, lsl #2
2000dd9e:	0200      	lsls	r0, r0, #8
2000dda0:	ee00 0a10 	vmov	s0, r0
2000dda4:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000dda8:	ee20 0a28 	vmul.f32	s0, s0, s17
2000ddac:	ed81 0a00 	vstr	s0, [r1]
2000ddb0:	4622      	mov	r2, r4
2000ddb2:	f8d8 4008 	ldr.w	r4, [r8, #8]
2000ddb6:	2c00      	cmp	r4, #0
2000ddb8:	f000 81e2 	beq.w	2000e180 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x908>
2000ddbc:	4640      	mov	r0, r8
2000ddbe:	f8d8 8004 	ldr.w	r8, [r8, #4]
2000ddc2:	f1b8 0f00 	cmp.w	r8, #0
2000ddc6:	f43f adab 	beq.w	2000d920 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xa8>
2000ddca:	f8d0 9000 	ldr.w	r9, [r0]
2000ddce:	4605      	mov	r5, r0
2000ddd0:	f8cd e030 	str.w	lr, [sp, #48]	; 0x30
2000ddd4:	ec99 0a02 	vldmia	r9, {s0-s1}
2000ddd8:	4626      	mov	r6, r4
2000ddda:	a812      	add	r0, sp, #72	; 0x48
2000dddc:	4651      	mov	r1, sl
2000ddde:	45a0      	cmp	r8, r4
2000dde0:	bf38      	it	cc
2000dde2:	4646      	movcc	r6, r8
2000dde4:	f7ff faf0 	bl	2000d3c8 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E>
2000dde8:	e9dd 2312 	ldrd	r2, r3, [sp, #72]	; 0x48
2000ddec:	a80e      	add	r0, sp, #56	; 0x38
2000ddee:	4659      	mov	r1, fp
2000ddf0:	f7ff f8de 	bl	2000cfb0 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E>
2000ddf4:	2e02      	cmp	r6, #2
2000ddf6:	f040 819f 	bne.w	2000e138 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8c0>
2000ddfa:	e9dd 010e 	ldrd	r0, r1, [sp, #56]	; 0x38
2000ddfe:	f1b8 0802 	subs.w	r8, r8, #2
2000de02:	e8e9 0102 	strd	r0, r1, [r9], #8
2000de06:	d1e5      	bne.n	2000ddd4 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x55c>
2000de08:	e9d5 0100 	ldrd	r0, r1, [r5]
2000de0c:	f8dd 9008 	ldr.w	r9, [sp, #8]
2000de10:	46a8      	mov	r8, r5
2000de12:	9c04      	ldr	r4, [sp, #16]
2000de14:	9d0c      	ldr	r5, [sp, #48]	; 0x30
2000de16:	4589      	cmp	r9, r1
2000de18:	f8cd 9044 	str.w	r9, [sp, #68]	; 0x44
2000de1c:	910e      	str	r1, [sp, #56]	; 0x38
2000de1e:	f040 818f 	bne.w	2000e140 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8c8>
2000de22:	f1b9 0f00 	cmp.w	r9, #0
2000de26:	f43f ad86 	beq.w	2000d936 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xbe>
2000de2a:	f1b9 0f04 	cmp.w	r9, #4
2000de2e:	d201      	bcs.n	2000de34 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x5bc>
2000de30:	2200      	movs	r2, #0
2000de32:	e14d      	b.n	2000e0d0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x858>
2000de34:	9901      	ldr	r1, [sp, #4]
2000de36:	290c      	cmp	r1, #12
2000de38:	d208      	bcs.n	2000de4c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x5d4>
2000de3a:	9a03      	ldr	r2, [sp, #12]
2000de3c:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
2000de3e:	2100      	movs	r1, #0
2000de40:	2a00      	cmp	r2, #0
2000de42:	461a      	mov	r2, r3
2000de44:	930b      	str	r3, [sp, #44]	; 0x2c
2000de46:	f040 8094 	bne.w	2000df72 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x6fa>
2000de4a:	e141      	b.n	2000e0d0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x858>
2000de4c:	9a00      	ldr	r2, [sp, #0]
2000de4e:	2100      	movs	r1, #0
2000de50:	1843      	adds	r3, r0, r1
2000de52:	ed93 0a00 	vldr	s0, [r3]
2000de56:	3a04      	subs	r2, #4
2000de58:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000de5c:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000de60:	ee10 6a10 	vmov	r6, s0
2000de64:	506e      	str	r6, [r5, r1]
2000de66:	ed93 0a01 	vldr	s0, [r3, #4]
2000de6a:	eb05 0601 	add.w	r6, r5, r1
2000de6e:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000de72:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000de76:	ed86 0a01 	vstr	s0, [r6, #4]
2000de7a:	ed93 0a02 	vldr	s0, [r3, #8]
2000de7e:	f101 0140 	add.w	r1, r1, #64	; 0x40
2000de82:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000de86:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000de8a:	ed86 0a02 	vstr	s0, [r6, #8]
2000de8e:	ed93 0a03 	vldr	s0, [r3, #12]
2000de92:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000de96:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000de9a:	ed86 0a03 	vstr	s0, [r6, #12]
2000de9e:	ed93 0a04 	vldr	s0, [r3, #16]
2000dea2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000dea6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000deaa:	ed86 0a04 	vstr	s0, [r6, #16]
2000deae:	ed93 0a05 	vldr	s0, [r3, #20]
2000deb2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000deb6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000deba:	ed86 0a05 	vstr	s0, [r6, #20]
2000debe:	ed93 0a06 	vldr	s0, [r3, #24]
2000dec2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000dec6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000deca:	ed86 0a06 	vstr	s0, [r6, #24]
2000dece:	ed93 0a07 	vldr	s0, [r3, #28]
2000ded2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000ded6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000deda:	ed86 0a07 	vstr	s0, [r6, #28]
2000dede:	ed93 0a08 	vldr	s0, [r3, #32]
2000dee2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000dee6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000deea:	ed86 0a08 	vstr	s0, [r6, #32]
2000deee:	ed93 0a09 	vldr	s0, [r3, #36]	; 0x24
2000def2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000def6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000defa:	ed86 0a09 	vstr	s0, [r6, #36]	; 0x24
2000defe:	ed93 0a0a 	vldr	s0, [r3, #40]	; 0x28
2000df02:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df06:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df0a:	ed86 0a0a 	vstr	s0, [r6, #40]	; 0x28
2000df0e:	ed93 0a0b 	vldr	s0, [r3, #44]	; 0x2c
2000df12:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df16:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df1a:	ed86 0a0b 	vstr	s0, [r6, #44]	; 0x2c
2000df1e:	ed93 0a0c 	vldr	s0, [r3, #48]	; 0x30
2000df22:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df26:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df2a:	ed86 0a0c 	vstr	s0, [r6, #48]	; 0x30
2000df2e:	ed93 0a0d 	vldr	s0, [r3, #52]	; 0x34
2000df32:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df36:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df3a:	ed86 0a0d 	vstr	s0, [r6, #52]	; 0x34
2000df3e:	ed93 0a0e 	vldr	s0, [r3, #56]	; 0x38
2000df42:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df46:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df4a:	ed86 0a0e 	vstr	s0, [r6, #56]	; 0x38
2000df4e:	ed93 0a0f 	vldr	s0, [r3, #60]	; 0x3c
2000df52:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df56:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df5a:	ed86 0a0f 	vstr	s0, [r6, #60]	; 0x3c
2000df5e:	f47f af77 	bne.w	2000de50 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x5d8>
2000df62:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
2000df64:	9a03      	ldr	r2, [sp, #12]
2000df66:	4619      	mov	r1, r3
2000df68:	2a00      	cmp	r2, #0
2000df6a:	461a      	mov	r2, r3
2000df6c:	930b      	str	r3, [sp, #44]	; 0x2c
2000df6e:	f000 80af 	beq.w	2000e0d0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x858>
2000df72:	eb00 0281 	add.w	r2, r0, r1, lsl #2
2000df76:	ed92 0a00 	vldr	s0, [r2]
2000df7a:	46a4      	mov	ip, r4
2000df7c:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df80:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000df84:	ee10 2a10 	vmov	r2, s0
2000df88:	f845 2021 	str.w	r2, [r5, r1, lsl #2]
2000df8c:	f041 0201 	orr.w	r2, r1, #1
2000df90:	eb00 0382 	add.w	r3, r0, r2, lsl #2
2000df94:	ed93 0a00 	vldr	s0, [r3]
2000df98:	9c03      	ldr	r4, [sp, #12]
2000df9a:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000df9e:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000dfa2:	ee10 3a10 	vmov	r3, s0
2000dfa6:	f845 3022 	str.w	r3, [r5, r2, lsl #2]
2000dfaa:	f041 0202 	orr.w	r2, r1, #2
2000dfae:	eb00 0382 	add.w	r3, r0, r2, lsl #2
2000dfb2:	ed93 0a00 	vldr	s0, [r3]
2000dfb6:	2c01      	cmp	r4, #1
2000dfb8:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000dfbc:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000dfc0:	ee10 3a10 	vmov	r3, s0
2000dfc4:	f845 3022 	str.w	r3, [r5, r2, lsl #2]
2000dfc8:	f041 0303 	orr.w	r3, r1, #3
2000dfcc:	eb00 0283 	add.w	r2, r0, r3, lsl #2
2000dfd0:	ed92 0a00 	vldr	s0, [r2]
2000dfd4:	f101 0204 	add.w	r2, r1, #4
2000dfd8:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000dfdc:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000dfe0:	ee10 6a10 	vmov	r6, s0
2000dfe4:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
2000dfe8:	d071      	beq.n	2000e0ce <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x856>
2000dfea:	eb00 0382 	add.w	r3, r0, r2, lsl #2
2000dfee:	ed93 0a00 	vldr	s0, [r3]
2000dff2:	2c02      	cmp	r4, #2
2000dff4:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000dff8:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000dffc:	ee10 3a10 	vmov	r3, s0
2000e000:	f845 3022 	str.w	r3, [r5, r2, lsl #2]
2000e004:	f042 0301 	orr.w	r3, r2, #1
2000e008:	eb00 0683 	add.w	r6, r0, r3, lsl #2
2000e00c:	ed96 0a00 	vldr	s0, [r6]
2000e010:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e014:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e018:	ee10 6a10 	vmov	r6, s0
2000e01c:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
2000e020:	f042 0302 	orr.w	r3, r2, #2
2000e024:	eb00 0683 	add.w	r6, r0, r3, lsl #2
2000e028:	ed96 0a00 	vldr	s0, [r6]
2000e02c:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e030:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e034:	ee10 6a10 	vmov	r6, s0
2000e038:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
2000e03c:	f042 0303 	orr.w	r3, r2, #3
2000e040:	eb00 0283 	add.w	r2, r0, r3, lsl #2
2000e044:	ed92 0a00 	vldr	s0, [r2]
2000e048:	f101 0208 	add.w	r2, r1, #8
2000e04c:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e050:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e054:	ee10 6a10 	vmov	r6, s0
2000e058:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
2000e05c:	d037      	beq.n	2000e0ce <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x856>
2000e05e:	eb00 0382 	add.w	r3, r0, r2, lsl #2
2000e062:	ed93 0a00 	vldr	s0, [r3]
2000e066:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e06a:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e06e:	ee10 3a10 	vmov	r3, s0
2000e072:	f845 3022 	str.w	r3, [r5, r2, lsl #2]
2000e076:	f042 0301 	orr.w	r3, r2, #1
2000e07a:	eb00 0683 	add.w	r6, r0, r3, lsl #2
2000e07e:	ed96 0a00 	vldr	s0, [r6]
2000e082:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e086:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e08a:	ee10 6a10 	vmov	r6, s0
2000e08e:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
2000e092:	f042 0302 	orr.w	r3, r2, #2
2000e096:	eb00 0683 	add.w	r6, r0, r3, lsl #2
2000e09a:	ed96 0a00 	vldr	s0, [r6]
2000e09e:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e0a2:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e0a6:	ee10 6a10 	vmov	r6, s0
2000e0aa:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
2000e0ae:	f042 0303 	orr.w	r3, r2, #3
2000e0b2:	eb00 0283 	add.w	r2, r0, r3, lsl #2
2000e0b6:	ed92 0a00 	vldr	s0, [r2]
2000e0ba:	f101 020c 	add.w	r2, r1, #12
2000e0be:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e0c2:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e0c6:	ee10 1a10 	vmov	r1, s0
2000e0ca:	f845 1023 	str.w	r1, [r5, r3, lsl #2]
2000e0ce:	4664      	mov	r4, ip
2000e0d0:	990d      	ldr	r1, [sp, #52]	; 0x34
2000e0d2:	2900      	cmp	r1, #0
2000e0d4:	f43f ac2f 	beq.w	2000d936 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xbe>
2000e0d8:	eb00 0182 	add.w	r1, r0, r2, lsl #2
2000e0dc:	ed91 0a00 	vldr	s0, [r1]
2000e0e0:	9b0d      	ldr	r3, [sp, #52]	; 0x34
2000e0e2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e0e6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e0ea:	ee10 1a10 	vmov	r1, s0
2000e0ee:	2b01      	cmp	r3, #1
2000e0f0:	f845 1022 	str.w	r1, [r5, r2, lsl #2]
2000e0f4:	f43f ac1f 	beq.w	2000d936 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xbe>
2000e0f8:	1c51      	adds	r1, r2, #1
2000e0fa:	eb00 0381 	add.w	r3, r0, r1, lsl #2
2000e0fe:	ed93 0a00 	vldr	s0, [r3]
2000e102:	9e0d      	ldr	r6, [sp, #52]	; 0x34
2000e104:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e108:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e10c:	ee10 3a10 	vmov	r3, s0
2000e110:	2e02      	cmp	r6, #2
2000e112:	f845 3021 	str.w	r3, [r5, r1, lsl #2]
2000e116:	f43f ac0e 	beq.w	2000d936 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xbe>
2000e11a:	1c91      	adds	r1, r2, #2
2000e11c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
2000e120:	ed90 0a00 	vldr	s0, [r0]
2000e124:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e128:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e12c:	ee10 0a10 	vmov	r0, s0
2000e130:	f845 0021 	str.w	r0, [r5, r1, lsl #2]
2000e134:	f7ff bbff 	b.w	2000d936 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0xbe>
2000e138:	4630      	mov	r0, r6
2000e13a:	f003 fcdd 	bl	20011af8 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17hd23e82d5ca525cd3E>
2000e13e:	bf00      	nop
2000e140:	2000      	movs	r0, #0
2000e142:	9012      	str	r0, [sp, #72]	; 0x48
2000e144:	a811      	add	r0, sp, #68	; 0x44
2000e146:	a90e      	add	r1, sp, #56	; 0x38
2000e148:	aa12      	add	r2, sp, #72	; 0x48
2000e14a:	f7fd ffa1 	bl	2000c090 <_ZN4core9panicking13assert_failed17h1a41b77201a27e65E>
2000e14e:	bf00      	nop
2000e150:	f645 624c 	movw	r2, #24140	; 0x5e4c
2000e154:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e158:	2000      	movs	r0, #0
2000e15a:	2100      	movs	r1, #0
2000e15c:	f002 fa8e 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000e160:	f645 624c 	movw	r2, #24140	; 0x5e4c
2000e164:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e168:	2001      	movs	r0, #1
2000e16a:	f002 fa87 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000e16e:	bf00      	nop
2000e170:	f645 624c 	movw	r2, #24140	; 0x5e4c
2000e174:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e178:	2002      	movs	r0, #2
2000e17a:	f002 fa7f 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000e17e:	bf00      	nop
2000e180:	f645 00b0 	movw	r0, #22704	; 0x58b0
2000e184:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e188:	9012      	str	r0, [sp, #72]	; 0x48
2000e18a:	2001      	movs	r0, #1
2000e18c:	9013      	str	r0, [sp, #76]	; 0x4c
2000e18e:	2000      	movs	r0, #0
2000e190:	2104      	movs	r1, #4
2000e192:	e9cd 1014 	strd	r1, r0, [sp, #80]	; 0x50
2000e196:	f645 01b8 	movw	r1, #22712	; 0x58b8
2000e19a:	9016      	str	r0, [sp, #88]	; 0x58
2000e19c:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e1a0:	a812      	add	r0, sp, #72	; 0x48
2000e1a2:	f002 fa38 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e1a6:	d4d4      	bmi.n	2000e152 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE+0x8da>

2000e1a8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE>:
2000e1a8:	b580      	push	{r7, lr}
2000e1aa:	466f      	mov	r7, sp
2000e1ac:	b098      	sub	sp, #96	; 0x60
2000e1ae:	6802      	ldr	r2, [r0, #0]
2000e1b0:	9208      	str	r2, [sp, #32]
2000e1b2:	b99a      	cbnz	r2, 2000e1dc <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x34>
2000e1b4:	f645 0024 	movw	r0, #22564	; 0x5824
2000e1b8:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e1bc:	9012      	str	r0, [sp, #72]	; 0x48
2000e1be:	2001      	movs	r0, #1
2000e1c0:	9013      	str	r0, [sp, #76]	; 0x4c
2000e1c2:	2000      	movs	r0, #0
2000e1c4:	2104      	movs	r1, #4
2000e1c6:	e9cd 1014 	strd	r1, r0, [sp, #80]	; 0x50
2000e1ca:	f645 0168 	movw	r1, #22632	; 0x5868
2000e1ce:	9016      	str	r0, [sp, #88]	; 0x58
2000e1d0:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e1d4:	a812      	add	r0, sp, #72	; 0x48
2000e1d6:	f002 fa1e 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e1da:	bf00      	nop
2000e1dc:	e9d0 2304 	ldrd	r2, r3, [r0, #16]
2000e1e0:	e9d0 6001 	ldrd	r6, r0, [r0, #4]
2000e1e4:	fb03 f902 	mul.w	r9, r3, r2
2000e1e8:	e9cd 0606 	strd	r0, r6, [sp, #24]
2000e1ec:	e9d1 5000 	ldrd	r5, r0, [r1]
2000e1f0:	ed9f 8ae7 	vldr	s16, [pc, #924]	; 2000e590 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x3e8>
2000e1f4:	9005      	str	r0, [sp, #20]
2000e1f6:	6888      	ldr	r0, [r1, #8]
2000e1f8:	ed9f 9ae6 	vldr	s18, [pc, #920]	; 2000e594 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x3ec>
2000e1fc:	9004      	str	r0, [sp, #16]
2000e1fe:	68c8      	ldr	r0, [r1, #12]
2000e200:	ed9f bae5 	vldr	s22, [pc, #916]	; 2000e598 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x3f0>
2000e204:	9003      	str	r0, [sp, #12]
2000e206:	e9d1 8004 	ldrd	r8, r0, [r1, #16]
2000e20a:	f1a9 0104 	sub.w	r1, r9, #4
2000e20e:	900d      	str	r0, [sp, #52]	; 0x34
2000e210:	f500 5b88 	add.w	fp, r0, #4352	; 0x1100
2000e214:	f009 0003 	and.w	r0, r9, #3
2000e218:	900c      	str	r0, [sp, #48]	; 0x30
2000e21a:	2001      	movs	r0, #1
2000e21c:	eb00 0091 	add.w	r0, r0, r1, lsr #2
2000e220:	f020 0001 	bic.w	r0, r0, #1
2000e224:	ed9f cadd 	vldr	s24, [pc, #884]	; 2000e59c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x3f4>
2000e228:	ed9f eadd 	vldr	s28, [pc, #884]	; 2000e5a0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x3f8>
2000e22c:	ed9f fadd 	vldr	s30, [pc, #884]	; 2000e5a4 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x3fc>
2000e230:	eddf 8add 	vldr	s17, [pc, #884]	; 2000e5a8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x400>
2000e234:	9001      	str	r0, [sp, #4]
2000e236:	0080      	lsls	r0, r0, #2
2000e238:	eeb3 aa0e 	vmov.f32	s20, #62	; 0x41f00000  30.0
2000e23c:	eeb3 da04 	vmov.f32	s26, #52	; 0x41a00000  20.0
2000e240:	910a      	str	r1, [sp, #40]	; 0x28
2000e242:	9009      	str	r0, [sp, #36]	; 0x24
2000e244:	9502      	str	r5, [sp, #8]
2000e246:	e009      	b.n	2000e25c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xb4>
2000e248:	f1b9 0f00 	cmp.w	r9, #0
2000e24c:	f04f 0100 	mov.w	r1, #0
2000e250:	4680      	mov	r8, r0
2000e252:	f8cd 9044 	str.w	r9, [sp, #68]	; 0x44
2000e256:	910e      	str	r1, [sp, #56]	; 0x38
2000e258:	f040 8296 	bne.w	2000e788 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x5e0>
2000e25c:	9808      	ldr	r0, [sp, #32]
2000e25e:	4780      	blx	r0
2000e260:	6869      	ldr	r1, [r5, #4]
2000e262:	2900      	cmp	r1, #0
2000e264:	f000 8298 	beq.w	2000e798 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x5f0>
2000e268:	2901      	cmp	r1, #1
2000e26a:	f000 829d 	beq.w	2000e7a8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x600>
2000e26e:	2902      	cmp	r1, #2
2000e270:	f240 82a2 	bls.w	2000e7b8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x610>
2000e274:	6829      	ldr	r1, [r5, #0]
2000e276:	f9b1 0000 	ldrsh.w	r0, [r1]
2000e27a:	ee00 0a10 	vmov	s0, r0
2000e27e:	f9b1 0004 	ldrsh.w	r0, [r1, #4]
2000e282:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e286:	ee01 0a10 	vmov	s2, r0
2000e28a:	ee20 0a08 	vmul.f32	s0, s0, s16
2000e28e:	eeb8 1ac1 	vcvt.f32.s32	s2, s2
2000e292:	ee20 0a00 	vmul.f32	s0, s0, s0
2000e296:	ee21 1a08 	vmul.f32	s2, s2, s16
2000e29a:	ee20 0a09 	vmul.f32	s0, s0, s18
2000e29e:	ee21 1a0c 	vmul.f32	s2, s2, s24
2000e2a2:	ee30 2a01 	vadd.f32	s4, s0, s2
2000e2a6:	eeb4 2a4d 	vcmp.f32	s4, s26
2000e2aa:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000e2ae:	bf48      	it	mi
2000e2b0:	eeb0 2a4d 	vmovmi.f32	s4, s26
2000e2b4:	eeb4 2a4e 	vcmp.f32	s4, s28
2000e2b8:	ee30 0a41 	vsub.f32	s0, s0, s2
2000e2bc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000e2c0:	eeb4 0a4d 	vcmp.f32	s0, s26
2000e2c4:	bfc8      	it	gt
2000e2c6:	eeb0 2a4e 	vmovgt.f32	s4, s28
2000e2ca:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000e2ce:	bf48      	it	mi
2000e2d0:	eeb0 0a4d 	vmovmi.f32	s0, s26
2000e2d4:	eeb4 0a4e 	vcmp.f32	s0, s28
2000e2d8:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
2000e2dc:	bfc8      	it	gt
2000e2de:	eeb0 0a4e 	vmovgt.f32	s0, s28
2000e2e2:	9e06      	ldr	r6, [sp, #24]
2000e2e4:	9807      	ldr	r0, [sp, #28]
2000e2e6:	f8d6 c000 	ldr.w	ip, [r6]
2000e2ea:	9e05      	ldr	r6, [sp, #20]
2000e2ec:	ee12 2a10 	vmov	r2, s4
2000e2f0:	6836      	ldr	r6, [r6, #0]
2000e2f2:	f9b1 1002 	ldrsh.w	r1, [r1, #2]
2000e2f6:	6800      	ldr	r0, [r0, #0]
2000e2f8:	60b2      	str	r2, [r6, #8]
2000e2fa:	ee10 3a10 	vmov	r3, s0
2000e2fe:	ee00 1a10 	vmov	s0, r1
2000e302:	9904      	ldr	r1, [sp, #16]
2000e304:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e308:	6809      	ldr	r1, [r1, #0]
2000e30a:	ee20 0a08 	vmul.f32	s0, s0, s16
2000e30e:	608b      	str	r3, [r1, #8]
2000e310:	9903      	ldr	r1, [sp, #12]
2000e312:	ee20 0a0a 	vmul.f32	s0, s0, s20
2000e316:	ee30 0a0b 	vadd.f32	s0, s0, s22
2000e31a:	6809      	ldr	r1, [r1, #0]
2000e31c:	ee10 2a10 	vmov	r2, s0
2000e320:	608a      	str	r2, [r1, #8]
2000e322:	e9d8 1200 	ldrd	r1, r2, [r8]
2000e326:	f8cd 9038 	str.w	r9, [sp, #56]	; 0x38
2000e32a:	454a      	cmp	r2, r9
2000e32c:	9211      	str	r2, [sp, #68]	; 0x44
2000e32e:	f040 822b 	bne.w	2000e788 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x5e0>
2000e332:	f1b9 0f00 	cmp.w	r9, #0
2000e336:	f000 80e9 	beq.w	2000e50c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x364>
2000e33a:	f1b9 0f04 	cmp.w	r9, #4
2000e33e:	d201      	bcs.n	2000e344 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x19c>
2000e340:	2200      	movs	r2, #0
2000e342:	e0ae      	b.n	2000e4a2 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x2fa>
2000e344:	9a0a      	ldr	r2, [sp, #40]	; 0x28
2000e346:	2a04      	cmp	r2, #4
2000e348:	d202      	bcs.n	2000e350 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x1a8>
2000e34a:	9b09      	ldr	r3, [sp, #36]	; 0x24
2000e34c:	2400      	movs	r4, #0
2000e34e:	e062      	b.n	2000e416 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x26e>
2000e350:	9b01      	ldr	r3, [sp, #4]
2000e352:	2200      	movs	r2, #0
2000e354:	5885      	ldr	r5, [r0, r2]
2000e356:	188e      	adds	r6, r1, r2
2000e358:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e35c:	ee00 5a10 	vmov	s0, r5
2000e360:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e364:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e368:	1884      	adds	r4, r0, r2
2000e36a:	ed86 0a00 	vstr	s0, [r6]
2000e36e:	6865      	ldr	r5, [r4, #4]
2000e370:	3b02      	subs	r3, #2
2000e372:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e376:	ee00 5a10 	vmov	s0, r5
2000e37a:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e37e:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e382:	ed86 0a01 	vstr	s0, [r6, #4]
2000e386:	68a5      	ldr	r5, [r4, #8]
2000e388:	f102 0220 	add.w	r2, r2, #32
2000e38c:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e390:	ee00 5a10 	vmov	s0, r5
2000e394:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e398:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e39c:	ed86 0a02 	vstr	s0, [r6, #8]
2000e3a0:	68e5      	ldr	r5, [r4, #12]
2000e3a2:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e3a6:	ee00 5a10 	vmov	s0, r5
2000e3aa:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e3ae:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e3b2:	ed86 0a03 	vstr	s0, [r6, #12]
2000e3b6:	6925      	ldr	r5, [r4, #16]
2000e3b8:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e3bc:	ee00 5a10 	vmov	s0, r5
2000e3c0:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e3c4:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e3c8:	ed86 0a04 	vstr	s0, [r6, #16]
2000e3cc:	6965      	ldr	r5, [r4, #20]
2000e3ce:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e3d2:	ee00 5a10 	vmov	s0, r5
2000e3d6:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e3da:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e3de:	ed86 0a05 	vstr	s0, [r6, #20]
2000e3e2:	69a5      	ldr	r5, [r4, #24]
2000e3e4:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e3e8:	ee00 5a10 	vmov	s0, r5
2000e3ec:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e3f0:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e3f4:	ed86 0a06 	vstr	s0, [r6, #24]
2000e3f8:	69e5      	ldr	r5, [r4, #28]
2000e3fa:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e3fe:	ee00 5a10 	vmov	s0, r5
2000e402:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e406:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e40a:	ed86 0a07 	vstr	s0, [r6, #28]
2000e40e:	d1a1      	bne.n	2000e354 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x1ac>
2000e410:	9b09      	ldr	r3, [sp, #36]	; 0x24
2000e412:	9d02      	ldr	r5, [sp, #8]
2000e414:	461c      	mov	r4, r3
2000e416:	9a0a      	ldr	r2, [sp, #40]	; 0x28
2000e418:	9309      	str	r3, [sp, #36]	; 0x24
2000e41a:	0752      	lsls	r2, r2, #29
2000e41c:	461a      	mov	r2, r3
2000e41e:	d440      	bmi.n	2000e4a2 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x2fa>
2000e420:	f850 2024 	ldr.w	r2, [r0, r4, lsl #2]
2000e424:	eb01 0684 	add.w	r6, r1, r4, lsl #2
2000e428:	ea4f 4232 	mov.w	r2, r2, ror #16
2000e42c:	ee00 2a10 	vmov	s0, r2
2000e430:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e434:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e438:	ed86 0a00 	vstr	s0, [r6]
2000e43c:	f044 0201 	orr.w	r2, r4, #1
2000e440:	f850 6022 	ldr.w	r6, [r0, r2, lsl #2]
2000e444:	eb01 0282 	add.w	r2, r1, r2, lsl #2
2000e448:	ea4f 4636 	mov.w	r6, r6, ror #16
2000e44c:	ee00 6a10 	vmov	s0, r6
2000e450:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e454:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e458:	ed82 0a00 	vstr	s0, [r2]
2000e45c:	f044 0202 	orr.w	r2, r4, #2
2000e460:	f850 6022 	ldr.w	r6, [r0, r2, lsl #2]
2000e464:	eb01 0282 	add.w	r2, r1, r2, lsl #2
2000e468:	ea4f 4636 	mov.w	r6, r6, ror #16
2000e46c:	ee00 6a10 	vmov	s0, r6
2000e470:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e474:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e478:	ed82 0a00 	vstr	s0, [r2]
2000e47c:	f044 0203 	orr.w	r2, r4, #3
2000e480:	462e      	mov	r6, r5
2000e482:	f850 5022 	ldr.w	r5, [r0, r2, lsl #2]
2000e486:	eb01 0e82 	add.w	lr, r1, r2, lsl #2
2000e48a:	ea4f 4335 	mov.w	r3, r5, ror #16
2000e48e:	ee00 3a10 	vmov	s0, r3
2000e492:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e496:	1d22      	adds	r2, r4, #4
2000e498:	4635      	mov	r5, r6
2000e49a:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e49e:	ed8e 0a00 	vstr	s0, [lr]
2000e4a2:	9b0c      	ldr	r3, [sp, #48]	; 0x30
2000e4a4:	b393      	cbz	r3, 2000e50c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x364>
2000e4a6:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
2000e4aa:	eb01 0682 	add.w	r6, r1, r2, lsl #2
2000e4ae:	ea4f 4333 	mov.w	r3, r3, ror #16
2000e4b2:	ee00 3a10 	vmov	s0, r3
2000e4b6:	9b0c      	ldr	r3, [sp, #48]	; 0x30
2000e4b8:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e4bc:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e4c0:	2b01      	cmp	r3, #1
2000e4c2:	ed86 0a00 	vstr	s0, [r6]
2000e4c6:	d021      	beq.n	2000e50c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x364>
2000e4c8:	1c53      	adds	r3, r2, #1
2000e4ca:	f850 6023 	ldr.w	r6, [r0, r3, lsl #2]
2000e4ce:	eb01 0383 	add.w	r3, r1, r3, lsl #2
2000e4d2:	ea4f 4636 	mov.w	r6, r6, ror #16
2000e4d6:	ee00 6a10 	vmov	s0, r6
2000e4da:	9e0c      	ldr	r6, [sp, #48]	; 0x30
2000e4dc:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e4e0:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e4e4:	2e02      	cmp	r6, #2
2000e4e6:	ed83 0a00 	vstr	s0, [r3]
2000e4ea:	d00f      	beq.n	2000e50c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x364>
2000e4ec:	3202      	adds	r2, #2
2000e4ee:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
2000e4f2:	eb01 0182 	add.w	r1, r1, r2, lsl #2
2000e4f6:	ea4f 4030 	mov.w	r0, r0, ror #16
2000e4fa:	ee00 0a10 	vmov	s0, r0
2000e4fe:	eeb8 0ac0 	vcvt.f32.s32	s0, s0
2000e502:	ee20 0a28 	vmul.f32	s0, s0, s17
2000e506:	ed81 0a00 	vstr	s0, [r1]
2000e50a:	bf00      	nop
2000e50c:	f8d8 a008 	ldr.w	sl, [r8, #8]
2000e510:	f1ba 0f00 	cmp.w	sl, #0
2000e514:	f000 8158 	beq.w	2000e7c8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x620>
2000e518:	4640      	mov	r0, r8
2000e51a:	f8d8 8004 	ldr.w	r8, [r8, #4]
2000e51e:	f1b8 0f00 	cmp.w	r8, #0
2000e522:	f43f ae91 	beq.w	2000e248 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xa0>
2000e526:	464c      	mov	r4, r9
2000e528:	f8d0 9000 	ldr.w	r9, [r0]
2000e52c:	4605      	mov	r5, r0
2000e52e:	f8cd c02c 	str.w	ip, [sp, #44]	; 0x2c
2000e532:	bf00      	nop
2000e534:	4656      	mov	r6, sl
2000e536:	45d0      	cmp	r8, sl
2000e538:	ec99 0a02 	vldmia	r9, {s0-s1}
2000e53c:	bf38      	it	cc
2000e53e:	4646      	movcc	r6, r8
2000e540:	990d      	ldr	r1, [sp, #52]	; 0x34
2000e542:	a812      	add	r0, sp, #72	; 0x48
2000e544:	f7fe ff40 	bl	2000d3c8 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h37134158e0159948E>
2000e548:	e9dd 2312 	ldrd	r2, r3, [sp, #72]	; 0x48
2000e54c:	a80e      	add	r0, sp, #56	; 0x38
2000e54e:	4659      	mov	r1, fp
2000e550:	f7fe fd2e 	bl	2000cfb0 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$4tick17h4f9bf0d64b7ab8b2E>
2000e554:	2e02      	cmp	r6, #2
2000e556:	f040 8113 	bne.w	2000e780 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x5d8>
2000e55a:	e9dd 010e 	ldrd	r0, r1, [sp, #56]	; 0x38
2000e55e:	f1b8 0802 	subs.w	r8, r8, #2
2000e562:	e8e9 0102 	strd	r0, r1, [r9], #8
2000e566:	d1e5      	bne.n	2000e534 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x38c>
2000e568:	e9d5 0100 	ldrd	r0, r1, [r5]
2000e56c:	46a8      	mov	r8, r5
2000e56e:	46a1      	mov	r9, r4
2000e570:	9411      	str	r4, [sp, #68]	; 0x44
2000e572:	428c      	cmp	r4, r1
2000e574:	9d02      	ldr	r5, [sp, #8]
2000e576:	9c0b      	ldr	r4, [sp, #44]	; 0x2c
2000e578:	910e      	str	r1, [sp, #56]	; 0x38
2000e57a:	f040 8105 	bne.w	2000e788 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x5e0>
2000e57e:	f1b9 0f00 	cmp.w	r9, #0
2000e582:	f43f ae6b 	beq.w	2000e25c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xb4>
2000e586:	f1b9 0f04 	cmp.w	r9, #4
2000e58a:	d20f      	bcs.n	2000e5ac <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x404>
2000e58c:	2100      	movs	r1, #0
2000e58e:	e0bd      	b.n	2000e70c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x564>
2000e590:	39800000 	stmibcc	r0, {}	; <UNPREDICTABLE>
2000e594:	469c4000 	ldrmi	r4, [ip], r0
2000e598:	3e99999a 			; <UNDEFINED> instruction: 0x3e99999a
2000e59c:	461c4000 	ldrmi	r4, [ip], -r0
2000e5a0:	46abe000 	strtmi	lr, [fp], r0
2000e5a4:	4b000000 	blmi	2000e5ac <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x404>
2000e5a8:	30000000 	andcc	r0, r0, r0
2000e5ac:	990a      	ldr	r1, [sp, #40]	; 0x28
2000e5ae:	2904      	cmp	r1, #4
2000e5b0:	d202      	bcs.n	2000e5b8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x410>
2000e5b2:	9b09      	ldr	r3, [sp, #36]	; 0x24
2000e5b4:	2200      	movs	r2, #0
2000e5b6:	e065      	b.n	2000e684 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x4dc>
2000e5b8:	9a01      	ldr	r2, [sp, #4]
2000e5ba:	46ac      	mov	ip, r5
2000e5bc:	2100      	movs	r1, #0
2000e5be:	bf00      	nop
2000e5c0:	1843      	adds	r3, r0, r1
2000e5c2:	ed93 0a00 	vldr	s0, [r3]
2000e5c6:	3a02      	subs	r2, #2
2000e5c8:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e5cc:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e5d0:	ee10 6a10 	vmov	r6, s0
2000e5d4:	ea4f 4636 	mov.w	r6, r6, ror #16
2000e5d8:	5066      	str	r6, [r4, r1]
2000e5da:	ed93 0a01 	vldr	s0, [r3, #4]
2000e5de:	eb04 0601 	add.w	r6, r4, r1
2000e5e2:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e5e6:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e5ea:	ee10 5a10 	vmov	r5, s0
2000e5ee:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e5f2:	6075      	str	r5, [r6, #4]
2000e5f4:	ed93 0a02 	vldr	s0, [r3, #8]
2000e5f8:	f101 0120 	add.w	r1, r1, #32
2000e5fc:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e600:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e604:	ee10 5a10 	vmov	r5, s0
2000e608:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e60c:	60b5      	str	r5, [r6, #8]
2000e60e:	ed93 0a03 	vldr	s0, [r3, #12]
2000e612:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e616:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e61a:	ee10 5a10 	vmov	r5, s0
2000e61e:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e622:	60f5      	str	r5, [r6, #12]
2000e624:	ed93 0a04 	vldr	s0, [r3, #16]
2000e628:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e62c:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e630:	ee10 5a10 	vmov	r5, s0
2000e634:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e638:	6135      	str	r5, [r6, #16]
2000e63a:	ed93 0a05 	vldr	s0, [r3, #20]
2000e63e:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e642:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e646:	ee10 5a10 	vmov	r5, s0
2000e64a:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e64e:	6175      	str	r5, [r6, #20]
2000e650:	ed93 0a06 	vldr	s0, [r3, #24]
2000e654:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e658:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e65c:	ee10 5a10 	vmov	r5, s0
2000e660:	ea4f 4535 	mov.w	r5, r5, ror #16
2000e664:	61b5      	str	r5, [r6, #24]
2000e666:	ed93 0a07 	vldr	s0, [r3, #28]
2000e66a:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e66e:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e672:	ee10 3a10 	vmov	r3, s0
2000e676:	ea4f 4333 	mov.w	r3, r3, ror #16
2000e67a:	61f3      	str	r3, [r6, #28]
2000e67c:	d1a0      	bne.n	2000e5c0 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x418>
2000e67e:	9b09      	ldr	r3, [sp, #36]	; 0x24
2000e680:	4665      	mov	r5, ip
2000e682:	461a      	mov	r2, r3
2000e684:	990a      	ldr	r1, [sp, #40]	; 0x28
2000e686:	9309      	str	r3, [sp, #36]	; 0x24
2000e688:	0749      	lsls	r1, r1, #29
2000e68a:	4619      	mov	r1, r3
2000e68c:	d43e      	bmi.n	2000e70c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x564>
2000e68e:	eb00 0182 	add.w	r1, r0, r2, lsl #2
2000e692:	ed91 0a00 	vldr	s0, [r1]
2000e696:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e69a:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e69e:	ee10 1a10 	vmov	r1, s0
2000e6a2:	ea4f 4131 	mov.w	r1, r1, ror #16
2000e6a6:	f844 1022 	str.w	r1, [r4, r2, lsl #2]
2000e6aa:	f042 0101 	orr.w	r1, r2, #1
2000e6ae:	eb00 0381 	add.w	r3, r0, r1, lsl #2
2000e6b2:	ed93 0a00 	vldr	s0, [r3]
2000e6b6:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e6ba:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e6be:	ee10 3a10 	vmov	r3, s0
2000e6c2:	ea4f 4333 	mov.w	r3, r3, ror #16
2000e6c6:	f844 3021 	str.w	r3, [r4, r1, lsl #2]
2000e6ca:	f042 0102 	orr.w	r1, r2, #2
2000e6ce:	eb00 0381 	add.w	r3, r0, r1, lsl #2
2000e6d2:	ed93 0a00 	vldr	s0, [r3]
2000e6d6:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e6da:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e6de:	ee10 3a10 	vmov	r3, s0
2000e6e2:	ea4f 4333 	mov.w	r3, r3, ror #16
2000e6e6:	f844 3021 	str.w	r3, [r4, r1, lsl #2]
2000e6ea:	f042 0303 	orr.w	r3, r2, #3
2000e6ee:	eb00 0183 	add.w	r1, r0, r3, lsl #2
2000e6f2:	ed91 0a00 	vldr	s0, [r1]
2000e6f6:	1d11      	adds	r1, r2, #4
2000e6f8:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e6fc:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e700:	ee10 2a10 	vmov	r2, s0
2000e704:	ea4f 4232 	mov.w	r2, r2, ror #16
2000e708:	f844 2023 	str.w	r2, [r4, r3, lsl #2]
2000e70c:	9a0c      	ldr	r2, [sp, #48]	; 0x30
2000e70e:	2a00      	cmp	r2, #0
2000e710:	f43f ada4 	beq.w	2000e25c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xb4>
2000e714:	eb00 0281 	add.w	r2, r0, r1, lsl #2
2000e718:	ed92 0a00 	vldr	s0, [r2]
2000e71c:	9b0c      	ldr	r3, [sp, #48]	; 0x30
2000e71e:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e722:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e726:	ee10 2a10 	vmov	r2, s0
2000e72a:	ea4f 4232 	mov.w	r2, r2, ror #16
2000e72e:	2b01      	cmp	r3, #1
2000e730:	f844 2021 	str.w	r2, [r4, r1, lsl #2]
2000e734:	f43f ad92 	beq.w	2000e25c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xb4>
2000e738:	1c4a      	adds	r2, r1, #1
2000e73a:	eb00 0382 	add.w	r3, r0, r2, lsl #2
2000e73e:	ed93 0a00 	vldr	s0, [r3]
2000e742:	9e0c      	ldr	r6, [sp, #48]	; 0x30
2000e744:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e748:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e74c:	ee10 3a10 	vmov	r3, s0
2000e750:	ea4f 4333 	mov.w	r3, r3, ror #16
2000e754:	2e02      	cmp	r6, #2
2000e756:	f844 3022 	str.w	r3, [r4, r2, lsl #2]
2000e75a:	f43f ad7f 	beq.w	2000e25c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xb4>
2000e75e:	3102      	adds	r1, #2
2000e760:	eb00 0081 	add.w	r0, r0, r1, lsl #2
2000e764:	ed90 0a00 	vldr	s0, [r0]
2000e768:	ee20 0a0f 	vmul.f32	s0, s0, s30
2000e76c:	eebd 0ac0 	vcvt.s32.f32	s0, s0
2000e770:	ee10 0a10 	vmov	r0, s0
2000e774:	ea4f 4030 	mov.w	r0, r0, ror #16
2000e778:	f844 0021 	str.w	r0, [r4, r1, lsl #2]
2000e77c:	e56e      	b.n	2000e25c <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0xb4>
2000e77e:	bf00      	nop
2000e780:	4630      	mov	r0, r6
2000e782:	f003 f9b9 	bl	20011af8 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17hd23e82d5ca525cd3E>
2000e786:	bf00      	nop
2000e788:	2000      	movs	r0, #0
2000e78a:	9012      	str	r0, [sp, #72]	; 0x48
2000e78c:	a811      	add	r0, sp, #68	; 0x44
2000e78e:	a90e      	add	r1, sp, #56	; 0x38
2000e790:	aa12      	add	r2, sp, #72	; 0x48
2000e792:	f7fd fc7d 	bl	2000c090 <_ZN4core9panicking13assert_failed17h1a41b77201a27e65E>
2000e796:	bf00      	nop
2000e798:	f645 624c 	movw	r2, #24140	; 0x5e4c
2000e79c:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e7a0:	2000      	movs	r0, #0
2000e7a2:	2100      	movs	r1, #0
2000e7a4:	f001 ff6a 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000e7a8:	f645 624c 	movw	r2, #24140	; 0x5e4c
2000e7ac:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e7b0:	2001      	movs	r0, #1
2000e7b2:	f001 ff63 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000e7b6:	bf00      	nop
2000e7b8:	f645 624c 	movw	r2, #24140	; 0x5e4c
2000e7bc:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e7c0:	2002      	movs	r0, #2
2000e7c2:	f001 ff5b 	bl	2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>
2000e7c6:	bf00      	nop
2000e7c8:	f645 00b0 	movw	r0, #22704	; 0x58b0
2000e7cc:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e7d0:	9012      	str	r0, [sp, #72]	; 0x48
2000e7d2:	2001      	movs	r0, #1
2000e7d4:	9013      	str	r0, [sp, #76]	; 0x4c
2000e7d6:	2000      	movs	r0, #0
2000e7d8:	2104      	movs	r1, #4
2000e7da:	e9cd 1014 	strd	r1, r0, [sp, #80]	; 0x50
2000e7de:	f645 01b8 	movw	r1, #22712	; 0x58b8
2000e7e2:	9016      	str	r0, [sp, #88]	; 0x58
2000e7e4:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e7e8:	a812      	add	r0, sp, #72	; 0x48
2000e7ea:	f001 ff14 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e7ee:	d4d4      	bmi.n	2000e79a <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE+0x5f2>

2000e7f0 <main>:
2000e7f0:	b580      	push	{r7, lr}
2000e7f2:	466f      	mov	r7, sp
2000e7f4:	b096      	sub	sp, #88	; 0x58
2000e7f6:	f246 00e0 	movw	r0, #24800	; 0x60e0
2000e7fa:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e7fe:	2101      	movs	r1, #1
2000e800:	e8d0 2f4f 	ldrexb	r2, [r0]
2000e804:	e8c0 1f43 	strexb	r3, r1, [r0]
2000e808:	2b00      	cmp	r3, #0
2000e80a:	d1f9      	bne.n	2000e800 <main+0x10>
2000e80c:	b9d2      	cbnz	r2, 2000e844 <main+0x54>
2000e80e:	f246 1250 	movw	r2, #24912	; 0x6150
2000e812:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000e816:	7810      	ldrb	r0, [r2, #0]
2000e818:	2840      	cmp	r0, #64	; 0x40
2000e81a:	d227      	bcs.n	2000e86c <main+0x7c>
2000e81c:	f645 7050 	movw	r0, #24400	; 0x5f50
2000e820:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e824:	9010      	str	r0, [sp, #64]	; 0x40
2000e826:	2001      	movs	r0, #1
2000e828:	9011      	str	r0, [sp, #68]	; 0x44
2000e82a:	2000      	movs	r0, #0
2000e82c:	2104      	movs	r1, #4
2000e82e:	e9cd 1012 	strd	r1, r0, [sp, #72]	; 0x48
2000e832:	f645 7174 	movw	r1, #24436	; 0x5f74
2000e836:	9014      	str	r0, [sp, #80]	; 0x50
2000e838:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e83c:	a810      	add	r0, sp, #64	; 0x40
2000e83e:	f001 feea 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e842:	bf00      	nop
2000e844:	f645 70a0 	movw	r0, #24480	; 0x5fa0
2000e848:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e84c:	9010      	str	r0, [sp, #64]	; 0x40
2000e84e:	2001      	movs	r0, #1
2000e850:	9011      	str	r0, [sp, #68]	; 0x44
2000e852:	2000      	movs	r0, #0
2000e854:	2104      	movs	r1, #4
2000e856:	e9cd 1012 	strd	r1, r0, [sp, #72]	; 0x48
2000e85a:	f645 71a8 	movw	r1, #24488	; 0x5fa8
2000e85e:	9014      	str	r0, [sp, #80]	; 0x50
2000e860:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e864:	a810      	add	r0, sp, #64	; 0x40
2000e866:	f001 fed6 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e86a:	bf00      	nop
2000e86c:	f246 0690 	movw	r6, #24720	; 0x6090
2000e870:	f2c2 0601 	movt	r6, #8193	; 0x2001
2000e874:	e8d6 0f4f 	ldrexb	r0, [r6]
2000e878:	b120      	cbz	r0, 2000e884 <main+0x94>
2000e87a:	f3bf 8f2f 	clrex
2000e87e:	7830      	ldrb	r0, [r6, #0]
2000e880:	b938      	cbnz	r0, 2000e892 <main+0xa2>
2000e882:	e7f7      	b.n	2000e874 <main+0x84>
2000e884:	2001      	movs	r0, #1
2000e886:	e8c6 0f41 	strexb	r1, r0, [r6]
2000e88a:	b199      	cbz	r1, 2000e8b4 <main+0xc4>
2000e88c:	7830      	ldrb	r0, [r6, #0]
2000e88e:	2800      	cmp	r0, #0
2000e890:	d0f0      	beq.n	2000e874 <main+0x84>
2000e892:	bf10      	yield
2000e894:	7830      	ldrb	r0, [r6, #0]
2000e896:	2800      	cmp	r0, #0
2000e898:	d0ec      	beq.n	2000e874 <main+0x84>
2000e89a:	bf10      	yield
2000e89c:	7830      	ldrb	r0, [r6, #0]
2000e89e:	2800      	cmp	r0, #0
2000e8a0:	d0e8      	beq.n	2000e874 <main+0x84>
2000e8a2:	bf10      	yield
2000e8a4:	7830      	ldrb	r0, [r6, #0]
2000e8a6:	2800      	cmp	r0, #0
2000e8a8:	d0e4      	beq.n	2000e874 <main+0x84>
2000e8aa:	bf10      	yield
2000e8ac:	7830      	ldrb	r0, [r6, #0]
2000e8ae:	2800      	cmp	r0, #0
2000e8b0:	d1ef      	bne.n	2000e892 <main+0xa2>
2000e8b2:	e7df      	b.n	2000e874 <main+0x84>
2000e8b4:	f3bf 8f5f 	dmb	sy
2000e8b8:	7810      	ldrb	r0, [r2, #0]
2000e8ba:	2851      	cmp	r0, #81	; 0x51
2000e8bc:	d212      	bcs.n	2000e8e4 <main+0xf4>
2000e8be:	f645 70f4 	movw	r0, #24564	; 0x5ff4
2000e8c2:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e8c6:	9010      	str	r0, [sp, #64]	; 0x40
2000e8c8:	2001      	movs	r0, #1
2000e8ca:	9011      	str	r0, [sp, #68]	; 0x44
2000e8cc:	2000      	movs	r0, #0
2000e8ce:	2104      	movs	r1, #4
2000e8d0:	e9cd 1012 	strd	r1, r0, [sp, #72]	; 0x48
2000e8d4:	f645 71fc 	movw	r1, #24572	; 0x5ffc
2000e8d8:	9014      	str	r0, [sp, #80]	; 0x50
2000e8da:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e8de:	a810      	add	r0, sp, #64	; 0x40
2000e8e0:	f001 fe99 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e8e4:	6cd5      	ldr	r5, [r2, #76]	; 0x4c
2000e8e6:	b10d      	cbz	r5, 2000e8ec <main+0xfc>
2000e8e8:	6828      	ldr	r0, [r5, #0]
2000e8ea:	b998      	cbnz	r0, 2000e914 <main+0x124>
2000e8ec:	f645 70d0 	movw	r0, #24528	; 0x5fd0
2000e8f0:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000e8f4:	9010      	str	r0, [sp, #64]	; 0x40
2000e8f6:	2001      	movs	r0, #1
2000e8f8:	9011      	str	r0, [sp, #68]	; 0x44
2000e8fa:	2000      	movs	r0, #0
2000e8fc:	2104      	movs	r1, #4
2000e8fe:	e9cd 1012 	strd	r1, r0, [sp, #72]	; 0x48
2000e902:	f645 71d8 	movw	r1, #24536	; 0x5fd8
2000e906:	9014      	str	r0, [sp, #80]	; 0x50
2000e908:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000e90c:	a810      	add	r0, sp, #64	; 0x40
2000e90e:	f001 fe82 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000e912:	bf00      	nop
2000e914:	68a8      	ldr	r0, [r5, #8]
2000e916:	2800      	cmp	r0, #0
2000e918:	f04f 0001 	mov.w	r0, #1
2000e91c:	d00d      	beq.n	2000e93a <main+0x14a>
2000e91e:	6928      	ldr	r0, [r5, #16]
2000e920:	b910      	cbnz	r0, 2000e928 <main+0x138>
2000e922:	2002      	movs	r0, #2
2000e924:	e009      	b.n	2000e93a <main+0x14a>
2000e926:	bf00      	nop
2000e928:	69a8      	ldr	r0, [r5, #24]
2000e92a:	b908      	cbnz	r0, 2000e930 <main+0x140>
2000e92c:	2003      	movs	r0, #3
2000e92e:	e004      	b.n	2000e93a <main+0x14a>
2000e930:	6a29      	ldr	r1, [r5, #32]
2000e932:	2005      	movs	r0, #5
2000e934:	2900      	cmp	r1, #0
2000e936:	bf08      	it	eq
2000e938:	2004      	moveq	r0, #4
2000e93a:	eb05 0ac0 	add.w	sl, r5, r0, lsl #3
2000e93e:	6b30      	ldr	r0, [r6, #48]	; 0x30
2000e940:	e9d6 ec0e 	ldrd	lr, ip, [r6, #56]	; 0x38
2000e944:	9005      	str	r0, [sp, #20]
2000e946:	6b70      	ldr	r0, [r6, #52]	; 0x34
2000e948:	e9d6 2406 	ldrd	r2, r4, [r6, #24]
2000e94c:	9006      	str	r0, [sp, #24]
2000e94e:	6c30      	ldr	r0, [r6, #64]	; 0x40
2000e950:	f8cd a008 	str.w	sl, [sp, #8]
2000e954:	9001      	str	r0, [sp, #4]
2000e956:	6c70      	ldr	r0, [r6, #68]	; 0x44
2000e958:	9000      	str	r0, [sp, #0]
2000e95a:	6cb0      	ldr	r0, [r6, #72]	; 0x48
2000e95c:	900b      	str	r0, [sp, #44]	; 0x2c
2000e95e:	e9d6 3008 	ldrd	r3, r0, [r6, #32]
2000e962:	900a      	str	r0, [sp, #40]	; 0x28
2000e964:	e006      	b.n	2000e974 <main+0x184>
2000e966:	bf00      	nop
2000e968:	2000      	movs	r0, #0
2000e96a:	900b      	str	r0, [sp, #44]	; 0x2c
2000e96c:	3508      	adds	r5, #8
2000e96e:	4555      	cmp	r5, sl
2000e970:	f000 8118 	beq.w	2000eba4 <main+0x3b4>
2000e974:	e9d5 0100 	ldrd	r0, r1, [r5]
2000e978:	4401      	add	r1, r0
2000e97a:	b910      	cbnz	r0, 2000e982 <main+0x192>
2000e97c:	2900      	cmp	r1, #0
2000e97e:	f040 80fd 	bne.w	2000eb7c <main+0x38c>
2000e982:	f110 0f05 	cmn.w	r0, #5
2000e986:	d8f1      	bhi.n	2000e96c <main+0x17c>
2000e988:	3003      	adds	r0, #3
2000e98a:	f020 0b03 	bic.w	fp, r0, #3
2000e98e:	f021 0803 	bic.w	r8, r1, #3
2000e992:	45d8      	cmp	r8, fp
2000e994:	d9ea      	bls.n	2000e96c <main+0x17c>
2000e996:	980b      	ldr	r0, [sp, #44]	; 0x2c
2000e998:	eba8 090b 	sub.w	r9, r8, fp
2000e99c:	b190      	cbz	r0, 2000e9c4 <main+0x1d4>
2000e99e:	f1b9 0f0f 	cmp.w	r9, #15
2000e9a2:	d9e3      	bls.n	2000e96c <main+0x17c>
2000e9a4:	4659      	mov	r1, fp
2000e9a6:	2003      	movs	r0, #3
2000e9a8:	f841 0b04 	str.w	r0, [r1], #4
2000e9ac:	eba8 0001 	sub.w	r0, r8, r1
2000e9b0:	2840      	cmp	r0, #64	; 0x40
2000e9b2:	9307      	str	r3, [sp, #28]
2000e9b4:	e9cd 4208 	strd	r4, r2, [sp, #32]
2000e9b8:	d228      	bcs.n	2000ea0c <main+0x21c>
2000e9ba:	f1a0 020c 	sub.w	r2, r0, #12
2000e9be:	0893      	lsrs	r3, r2, #2
2000e9c0:	e04b      	b.n	2000ea5a <main+0x26a>
2000e9c2:	bf00      	nop
2000e9c4:	ea4f 00d9 	mov.w	r0, r9, lsr #3
2000e9c8:	2820      	cmp	r0, #32
2000e9ca:	d9cd      	bls.n	2000e968 <main+0x178>
2000e9cc:	46da      	mov	sl, fp
2000e9ce:	2001      	movs	r0, #1
2000e9d0:	f84a 0b04 	str.w	r0, [sl], #4
2000e9d4:	4650      	mov	r0, sl
2000e9d6:	f44f 7180 	mov.w	r1, #256	; 0x100
2000e9da:	e9cd 3407 	strd	r3, r4, [sp, #28]
2000e9de:	9209      	str	r2, [sp, #36]	; 0x24
2000e9e0:	e9cd ce03 	strd	ip, lr, [sp, #12]
2000e9e4:	f006 fb1c 	bl	20015020 <__aeabi_memclr4>
2000e9e8:	f50b 7484 	add.w	r4, fp, #264	; 0x108
2000e9ec:	eba8 0004 	sub.w	r0, r8, r4
2000e9f0:	280b      	cmp	r0, #11
2000e9f2:	f8cd a02c 	str.w	sl, [sp, #44]	; 0x2c
2000e9f6:	f8c6 a048 	str.w	sl, [r6, #72]	; 0x48
2000e9fa:	d90d      	bls.n	2000ea18 <main+0x228>
2000e9fc:	2840      	cmp	r0, #64	; 0x40
2000e9fe:	d25b      	bcs.n	2000eab8 <main+0x2c8>
2000ea00:	f1a0 010c 	sub.w	r1, r0, #12
2000ea04:	f8dd a008 	ldr.w	sl, [sp, #8]
2000ea08:	088b      	lsrs	r3, r1, #2
2000ea0a:	e06c      	b.n	2000eae6 <main+0x2f6>
2000ea0c:	2880      	cmp	r0, #128	; 0x80
2000ea0e:	d215      	bcs.n	2000ea3c <main+0x24c>
2000ea10:	2205      	movs	r2, #5
2000ea12:	eb02 03d0 	add.w	r3, r2, r0, lsr #3
2000ea16:	e020      	b.n	2000ea5a <main+0x26a>
2000ea18:	f50b 7182 	add.w	r1, fp, #260	; 0x104
2000ea1c:	f1a8 0004 	sub.w	r0, r8, #4
2000ea20:	4288      	cmp	r0, r1
2000ea22:	f8dd e010 	ldr.w	lr, [sp, #16]
2000ea26:	9a09      	ldr	r2, [sp, #36]	; 0x24
2000ea28:	e9dd 3407 	ldrd	r3, r4, [sp, #28]
2000ea2c:	bf18      	it	ne
2000ea2e:	6008      	strne	r0, [r1, #0]
2000ea30:	f10b 0101 	add.w	r1, fp, #1
2000ea34:	e9dd ac02 	ldrd	sl, ip, [sp, #8]
2000ea38:	6001      	str	r1, [r0, #0]
2000ea3a:	e08c      	b.n	2000eb56 <main+0x366>
2000ea3c:	fab0 f280 	clz	r2, r0
2000ea40:	f1c2 031e 	rsb	r3, r2, #30
2000ea44:	fa20 f303 	lsr.w	r3, r0, r3
2000ea48:	eba3 0242 	sub.w	r2, r3, r2, lsl #1
2000ea4c:	f102 0343 	add.w	r3, r2, #67	; 0x43
2000ea50:	2b3f      	cmp	r3, #63	; 0x3f
2000ea52:	f04f 023f 	mov.w	r2, #63	; 0x3f
2000ea56:	bf28      	it	cs
2000ea58:	4613      	movcs	r3, r2
2000ea5a:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
2000ea5c:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
2000ea60:	eb02 0283 	add.w	r2, r2, r3, lsl #2
2000ea64:	b124      	cbz	r4, 2000ea70 <main+0x280>
2000ea66:	e9cb 4201 	strd	r4, r2, [fp, #4]
2000ea6a:	6011      	str	r1, [r2, #0]
2000ea6c:	1d22      	adds	r2, r4, #4
2000ea6e:	e015      	b.n	2000ea9c <main+0x2ac>
2000ea70:	2b20      	cmp	r3, #32
2000ea72:	d207      	bcs.n	2000ea84 <main+0x294>
2000ea74:	2401      	movs	r4, #1
2000ea76:	fa04 f303 	lsl.w	r3, r4, r3
2000ea7a:	9c01      	ldr	r4, [sp, #4]
2000ea7c:	405c      	eors	r4, r3
2000ea7e:	9401      	str	r4, [sp, #4]
2000ea80:	6434      	str	r4, [r6, #64]	; 0x40
2000ea82:	e008      	b.n	2000ea96 <main+0x2a6>
2000ea84:	f003 031f 	and.w	r3, r3, #31
2000ea88:	2401      	movs	r4, #1
2000ea8a:	fa04 f303 	lsl.w	r3, r4, r3
2000ea8e:	9c00      	ldr	r4, [sp, #0]
2000ea90:	405c      	eors	r4, r3
2000ea92:	9400      	str	r4, [sp, #0]
2000ea94:	6474      	str	r4, [r6, #68]	; 0x44
2000ea96:	2300      	movs	r3, #0
2000ea98:	e9cb 3201 	strd	r3, r2, [fp, #4]
2000ea9c:	9b06      	ldr	r3, [sp, #24]
2000ea9e:	6011      	str	r1, [r2, #0]
2000eaa0:	9905      	ldr	r1, [sp, #20]
2000eaa2:	3301      	adds	r3, #1
2000eaa4:	4401      	add	r1, r0
2000eaa6:	f8cb 000c 	str.w	r0, [fp, #12]
2000eaaa:	f848 0c04 	str.w	r0, [r8, #-4]
2000eaae:	e9cd 1305 	strd	r1, r3, [sp, #20]
2000eab2:	e9c6 130c 	strd	r1, r3, [r6, #48]	; 0x30
2000eab6:	e04b      	b.n	2000eb50 <main+0x360>
2000eab8:	f8dd a008 	ldr.w	sl, [sp, #8]
2000eabc:	2880      	cmp	r0, #128	; 0x80
2000eabe:	d203      	bcs.n	2000eac8 <main+0x2d8>
2000eac0:	2105      	movs	r1, #5
2000eac2:	eb01 03d0 	add.w	r3, r1, r0, lsr #3
2000eac6:	e00e      	b.n	2000eae6 <main+0x2f6>
2000eac8:	fab0 f180 	clz	r1, r0
2000eacc:	f1c1 021e 	rsb	r2, r1, #30
2000ead0:	fa20 f202 	lsr.w	r2, r0, r2
2000ead4:	eba2 0141 	sub.w	r1, r2, r1, lsl #1
2000ead8:	f101 0343 	add.w	r3, r1, #67	; 0x43
2000eadc:	2b3f      	cmp	r3, #63	; 0x3f
2000eade:	f04f 013f 	mov.w	r1, #63	; 0x3f
2000eae2:	bf28      	it	cs
2000eae4:	460b      	movcs	r3, r1
2000eae6:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
2000eae8:	f8dd c00c 	ldr.w	ip, [sp, #12]
2000eaec:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
2000eaf0:	eb02 0283 	add.w	r2, r2, r3, lsl #2
2000eaf4:	b121      	cbz	r1, 2000eb00 <main+0x310>
2000eaf6:	e9cb 1242 	strd	r1, r2, [fp, #264]	; 0x108
2000eafa:	6014      	str	r4, [r2, #0]
2000eafc:	1d0a      	adds	r2, r1, #4
2000eafe:	e015      	b.n	2000eb2c <main+0x33c>
2000eb00:	2b20      	cmp	r3, #32
2000eb02:	d207      	bcs.n	2000eb14 <main+0x324>
2000eb04:	2101      	movs	r1, #1
2000eb06:	4099      	lsls	r1, r3
2000eb08:	9b01      	ldr	r3, [sp, #4]
2000eb0a:	404b      	eors	r3, r1
2000eb0c:	9301      	str	r3, [sp, #4]
2000eb0e:	6433      	str	r3, [r6, #64]	; 0x40
2000eb10:	e009      	b.n	2000eb26 <main+0x336>
2000eb12:	bf00      	nop
2000eb14:	f003 011f 	and.w	r1, r3, #31
2000eb18:	2301      	movs	r3, #1
2000eb1a:	fa03 f101 	lsl.w	r1, r3, r1
2000eb1e:	9b00      	ldr	r3, [sp, #0]
2000eb20:	404b      	eors	r3, r1
2000eb22:	9300      	str	r3, [sp, #0]
2000eb24:	6473      	str	r3, [r6, #68]	; 0x44
2000eb26:	2100      	movs	r1, #0
2000eb28:	e9cb 1242 	strd	r1, r2, [fp, #264]	; 0x108
2000eb2c:	e9dd e104 	ldrd	lr, r1, [sp, #16]
2000eb30:	6014      	str	r4, [r2, #0]
2000eb32:	f8cb 0110 	str.w	r0, [fp, #272]	; 0x110
2000eb36:	f848 0c04 	str.w	r0, [r8, #-4]
2000eb3a:	4401      	add	r1, r0
2000eb3c:	9806      	ldr	r0, [sp, #24]
2000eb3e:	3001      	adds	r0, #1
2000eb40:	e9cd 1005 	strd	r1, r0, [sp, #20]
2000eb44:	e9c6 100c 	strd	r1, r0, [r6, #48]	; 0x30
2000eb48:	f10b 0003 	add.w	r0, fp, #3
2000eb4c:	f8cb 0104 	str.w	r0, [fp, #260]	; 0x104
2000eb50:	9a09      	ldr	r2, [sp, #36]	; 0x24
2000eb52:	e9dd 3407 	ldrd	r3, r4, [sp, #28]
2000eb56:	3201      	adds	r2, #1
2000eb58:	980a      	ldr	r0, [sp, #40]	; 0x28
2000eb5a:	f144 0400 	adc.w	r4, r4, #0
2000eb5e:	eb13 0309 	adds.w	r3, r3, r9
2000eb62:	f10e 0e01 	add.w	lr, lr, #1
2000eb66:	44cc      	add	ip, r9
2000eb68:	f140 0000 	adc.w	r0, r0, #0
2000eb6c:	e9c6 ec0e 	strd	lr, ip, [r6, #56]	; 0x38
2000eb70:	e9c6 2406 	strd	r2, r4, [r6, #24]
2000eb74:	6233      	str	r3, [r6, #32]
2000eb76:	900a      	str	r0, [sp, #40]	; 0x28
2000eb78:	6270      	str	r0, [r6, #36]	; 0x24
2000eb7a:	e6f7      	b.n	2000e96c <main+0x17c>
2000eb7c:	f245 7048 	movw	r0, #22344	; 0x5748
2000eb80:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000eb84:	9010      	str	r0, [sp, #64]	; 0x40
2000eb86:	2001      	movs	r0, #1
2000eb88:	9011      	str	r0, [sp, #68]	; 0x44
2000eb8a:	2000      	movs	r0, #0
2000eb8c:	2104      	movs	r1, #4
2000eb8e:	e9cd 1012 	strd	r1, r0, [sp, #72]	; 0x48
2000eb92:	f245 7150 	movw	r1, #22352	; 0x5750
2000eb96:	9014      	str	r0, [sp, #80]	; 0x50
2000eb98:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000eb9c:	a810      	add	r0, sp, #64	; 0x40
2000eb9e:	f001 fd3a 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000eba2:	bf00      	nop
2000eba4:	2000      	movs	r0, #0
2000eba6:	f246 1350 	movw	r3, #24912	; 0x6150
2000ebaa:	f3bf 8f5f 	dmb	sy
2000ebae:	7030      	strb	r0, [r6, #0]
2000ebb0:	f2c2 0301 	movt	r3, #8193	; 0x2001
2000ebb4:	7b19      	ldrb	r1, [r3, #12]
2000ebb6:	f001 02f0 	and.w	r2, r1, #240	; 0xf0
2000ebba:	2a10      	cmp	r2, #16
2000ebbc:	d002      	beq.n	2000ebc4 <main+0x3d4>
2000ebbe:	2a20      	cmp	r2, #32
2000ebc0:	d114      	bne.n	2000ebec <main+0x3fc>
2000ebc2:	2001      	movs	r0, #1
2000ebc4:	f011 010f 	ands.w	r1, r1, #15
2000ebc8:	bf08      	it	eq
2000ebca:	2102      	moveq	r1, #2
2000ebcc:	691a      	ldr	r2, [r3, #16]
2000ebce:	89db      	ldrh	r3, [r3, #14]
2000ebd0:	2800      	cmp	r0, #0
2000ebd2:	f88d 003c 	strb.w	r0, [sp, #60]	; 0x3c
2000ebd6:	f246 1050 	movw	r0, #24912	; 0x6150
2000ebda:	910e      	str	r1, [sp, #56]	; 0x38
2000ebdc:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000ebe0:	a90c      	add	r1, sp, #48	; 0x30
2000ebe2:	e9cd 230c 	strd	r2, r3, [sp, #48]	; 0x30
2000ebe6:	d015      	beq.n	2000ec14 <main+0x424>
2000ebe8:	f000 f816 	bl	2000ec18 <_ZN6fundsp3run17h5ececde0afe5496cE>
2000ebec:	f645 50d0 	movw	r0, #24016	; 0x5dd0
2000ebf0:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000ebf4:	9010      	str	r0, [sp, #64]	; 0x40
2000ebf6:	2001      	movs	r0, #1
2000ebf8:	9011      	str	r0, [sp, #68]	; 0x44
2000ebfa:	2000      	movs	r0, #0
2000ebfc:	2104      	movs	r1, #4
2000ebfe:	e9cd 1012 	strd	r1, r0, [sp, #72]	; 0x48
2000ec02:	f645 51f4 	movw	r1, #24052	; 0x5df4
2000ec06:	9014      	str	r0, [sp, #80]	; 0x50
2000ec08:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000ec0c:	a810      	add	r0, sp, #64	; 0x40
2000ec0e:	f001 fd02 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000ec12:	bf00      	nop
2000ec14:	f000 fc80 	bl	2000f518 <_ZN6fundsp3run17h8f36925f4f62106eE>

2000ec18 <_ZN6fundsp3run17h5ececde0afe5496cE>:
2000ec18:	b5f0      	push	{r4, r5, r6, r7, lr}
2000ec1a:	af03      	add	r7, sp, #12
2000ec1c:	f5ad 5d86 	sub.w	sp, sp, #4288	; 0x10c0
2000ec20:	b083      	sub	sp, #12
2000ec22:	466c      	mov	r4, sp
2000ec24:	f36f 0404 	bfc	r4, #0, #5
2000ec28:	46a5      	mov	sp, r4
2000ec2a:	e9d1 9501 	ldrd	r9, r5, [r1, #4]
2000ec2e:	f246 04e0 	movw	r4, #24800	; 0x60e0
2000ec32:	fb09 fa05 	mul.w	sl, r9, r5
2000ec36:	f246 0b90 	movw	fp, #24720	; 0x6090
2000ec3a:	f1ba 0f00 	cmp.w	sl, #0
2000ec3e:	f2c2 0401 	movt	r4, #8193	; 0x2001
2000ec42:	f2c2 0b01 	movt	fp, #8193	; 0x2001
2000ec46:	9005      	str	r0, [sp, #20]
2000ec48:	9104      	str	r1, [sp, #16]
2000ec4a:	d101      	bne.n	2000ec50 <_ZN6fundsp3run17h5ececde0afe5496cE+0x38>
2000ec4c:	2604      	movs	r6, #4
2000ec4e:	e034      	b.n	2000ecba <_ZN6fundsp3run17h5ececde0afe5496cE+0xa2>
2000ec50:	ea5f 705a 	movs.w	r0, sl, lsr #29
2000ec54:	ea4f 068a 	mov.w	r6, sl, lsl #2
2000ec58:	f040 8120 	bne.w	2000ee9c <_ZN6fundsp3run17h5ececde0afe5496cE+0x284>
2000ec5c:	7862      	ldrb	r2, [r4, #1]
2000ec5e:	fab0 f080 	clz	r0, r0
2000ec62:	e8db 2f4f 	ldrexb	r2, [fp]
2000ec66:	0940      	lsrs	r0, r0, #5
2000ec68:	2a00      	cmp	r2, #0
2000ec6a:	ea4f 0080 	mov.w	r0, r0, lsl #2
2000ec6e:	f040 8136 	bne.w	2000eede <_ZN6fundsp3run17h5ececde0afe5496cE+0x2c6>
2000ec72:	2301      	movs	r3, #1
2000ec74:	e8cb 3f42 	strexb	r2, r3, [fp]
2000ec78:	2a00      	cmp	r2, #0
2000ec7a:	f040 8133 	bne.w	2000eee4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x2cc>
2000ec7e:	4631      	mov	r1, r6
2000ec80:	f3bf 8f5f 	dmb	sy
2000ec84:	46b0      	mov	r8, r6
2000ec86:	9003      	str	r0, [sp, #12]
2000ec88:	f7fd fb16 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000ec8c:	4606      	mov	r6, r0
2000ec8e:	2000      	movs	r0, #0
2000ec90:	2e00      	cmp	r6, #0
2000ec92:	f3bf 8f5f 	dmb	sy
2000ec96:	f88b 0000 	strb.w	r0, [fp]
2000ec9a:	f000 8102 	beq.w	2000eea2 <_ZN6fundsp3run17h5ececde0afe5496cE+0x28a>
2000ec9e:	f1ba 0f01 	cmp.w	sl, #1
2000eca2:	4630      	mov	r0, r6
2000eca4:	d007      	beq.n	2000ecb6 <_ZN6fundsp3run17h5ececde0afe5496cE+0x9e>
2000eca6:	f1a8 0804 	sub.w	r8, r8, #4
2000ecaa:	4630      	mov	r0, r6
2000ecac:	4641      	mov	r1, r8
2000ecae:	f006 f9b7 	bl	20015020 <__aeabi_memclr4>
2000ecb2:	eb08 0006 	add.w	r0, r8, r6
2000ecb6:	2100      	movs	r1, #0
2000ecb8:	6001      	str	r1, [r0, #0]
2000ecba:	e9cd 5908 	strd	r5, r9, [sp, #32]
2000ecbe:	9d05      	ldr	r5, [sp, #20]
2000ecc0:	e9cd 6a06 	strd	r6, sl, [sp, #24]
2000ecc4:	4628      	mov	r0, r5
2000ecc6:	f005 fa63 	bl	20014190 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E>
2000ecca:	7b28      	ldrb	r0, [r5, #12]
2000eccc:	f000 01f0 	and.w	r1, r0, #240	; 0xf0
2000ecd0:	2910      	cmp	r1, #16
2000ecd2:	d005      	beq.n	2000ece0 <_ZN6fundsp3run17h5ececde0afe5496cE+0xc8>
2000ecd4:	2920      	cmp	r1, #32
2000ecd6:	f040 80e9 	bne.w	2000eeac <_ZN6fundsp3run17h5ececde0afe5496cE+0x294>
2000ecda:	f04f 0801 	mov.w	r8, #1
2000ecde:	e001      	b.n	2000ece4 <_ZN6fundsp3run17h5ececde0afe5496cE+0xcc>
2000ece0:	f04f 0800 	mov.w	r8, #0
2000ece4:	f010 060f 	ands.w	r6, r0, #15
2000ece8:	bf08      	it	eq
2000ecea:	2602      	moveq	r6, #2
2000ecec:	9805      	ldr	r0, [sp, #20]
2000ecee:	6b03      	ldr	r3, [r0, #48]	; 0x30
2000ecf0:	f8d0 9010 	ldr.w	r9, [r0, #16]
2000ecf4:	f8b0 a00e 	ldrh.w	sl, [r0, #14]
2000ecf8:	b1db      	cbz	r3, 2000ed32 <_ZN6fundsp3run17h5ececde0afe5496cE+0x11a>
2000ecfa:	f244 001d 	movw	r0, #16413	; 0x401d
2000ecfe:	f645 3510 	movw	r5, #23312	; 0x5b10
2000ed02:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000ed06:	f2c2 0501 	movt	r5, #8193	; 0x2001
2000ed0a:	9021      	str	r0, [sp, #132]	; 0x84
2000ed0c:	a920      	add	r1, sp, #128	; 0x80
2000ed0e:	f44f 5088 	mov.w	r0, #4352	; 0x1100
2000ed12:	2202      	movs	r2, #2
2000ed14:	9520      	str	r5, [sp, #128]	; 0x80
2000ed16:	4798      	blx	r3
2000ed18:	9805      	ldr	r0, [sp, #20]
2000ed1a:	6b03      	ldr	r3, [r0, #48]	; 0x30
2000ed1c:	b14b      	cbz	r3, 2000ed32 <_ZN6fundsp3run17h5ececde0afe5496cE+0x11a>
2000ed1e:	2000      	movs	r0, #0
2000ed20:	900a      	str	r0, [sp, #40]	; 0x28
2000ed22:	a80a      	add	r0, sp, #40	; 0x28
2000ed24:	9021      	str	r0, [sp, #132]	; 0x84
2000ed26:	a920      	add	r1, sp, #128	; 0x80
2000ed28:	f241 1001 	movw	r0, #4353	; 0x1101
2000ed2c:	2202      	movs	r2, #2
2000ed2e:	9520      	str	r5, [sp, #128]	; 0x80
2000ed30:	4798      	blx	r3
2000ed32:	f104 0024 	add.w	r0, r4, #36	; 0x24
2000ed36:	bf00      	nop
2000ed38:	e8d0 1f4f 	ldrexb	r1, [r0]
2000ed3c:	b131      	cbz	r1, 2000ed4c <_ZN6fundsp3run17h5ececde0afe5496cE+0x134>
2000ed3e:	f3bf 8f2f 	clrex
2000ed42:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000ed46:	b949      	cbnz	r1, 2000ed5c <_ZN6fundsp3run17h5ececde0afe5496cE+0x144>
2000ed48:	e7f6      	b.n	2000ed38 <_ZN6fundsp3run17h5ececde0afe5496cE+0x120>
2000ed4a:	bf00      	nop
2000ed4c:	2101      	movs	r1, #1
2000ed4e:	e8c0 1f42 	strexb	r2, r1, [r0]
2000ed52:	b1ca      	cbz	r2, 2000ed88 <_ZN6fundsp3run17h5ececde0afe5496cE+0x170>
2000ed54:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000ed58:	2900      	cmp	r1, #0
2000ed5a:	d0ed      	beq.n	2000ed38 <_ZN6fundsp3run17h5ececde0afe5496cE+0x120>
2000ed5c:	bf10      	yield
2000ed5e:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000ed62:	2900      	cmp	r1, #0
2000ed64:	d0e8      	beq.n	2000ed38 <_ZN6fundsp3run17h5ececde0afe5496cE+0x120>
2000ed66:	bf10      	yield
2000ed68:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000ed6c:	2900      	cmp	r1, #0
2000ed6e:	d0e3      	beq.n	2000ed38 <_ZN6fundsp3run17h5ececde0afe5496cE+0x120>
2000ed70:	bf10      	yield
2000ed72:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000ed76:	2900      	cmp	r1, #0
2000ed78:	d0de      	beq.n	2000ed38 <_ZN6fundsp3run17h5ececde0afe5496cE+0x120>
2000ed7a:	bf10      	yield
2000ed7c:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000ed80:	2900      	cmp	r1, #0
2000ed82:	d1eb      	bne.n	2000ed5c <_ZN6fundsp3run17h5ececde0afe5496cE+0x144>
2000ed84:	e7d8      	b.n	2000ed38 <_ZN6fundsp3run17h5ececde0afe5496cE+0x120>
2000ed86:	bf00      	nop
2000ed88:	f3bf 8f5f 	dmb	sy
2000ed8c:	6aa0      	ldr	r0, [r4, #40]	; 0x28
2000ed8e:	2800      	cmp	r0, #0
2000ed90:	f040 807e 	bne.w	2000ee90 <_ZN6fundsp3run17h5ececde0afe5496cE+0x278>
2000ed94:	9d05      	ldr	r5, [sp, #20]
2000ed96:	2140      	movs	r1, #64	; 0x40
2000ed98:	f105 003c 	add.w	r0, r5, #60	; 0x3c
2000ed9c:	62e0      	str	r0, [r4, #44]	; 0x2c
2000ed9e:	f104 0030 	add.w	r0, r4, #48	; 0x30
2000eda2:	f006 f93d 	bl	20015020 <__aeabi_memclr4>
2000eda6:	2000      	movs	r0, #0
2000eda8:	f3bf 8f5f 	dmb	sy
2000edac:	f884 0024 	strb.w	r0, [r4, #36]	; 0x24
2000edb0:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	; 0x24
2000edb4:	f643 62a5 	movw	r2, #16037	; 0x3ea5
2000edb8:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000edbc:	910a      	str	r1, [sp, #40]	; 0x28
2000edbe:	1d29      	adds	r1, r5, #4
2000edc0:	64aa      	str	r2, [r5, #72]	; 0x48
2000edc2:	910b      	str	r1, [sp, #44]	; 0x2c
2000edc4:	f105 0108 	add.w	r1, r5, #8
2000edc8:	aa0c      	add	r2, sp, #48	; 0x30
2000edca:	e882 0602 	stmia.w	r2, {r1, r9, sl}
2000edce:	f8bd 1080 	ldrh.w	r1, [sp, #128]	; 0x80
2000edd2:	696a      	ldr	r2, [r5, #20]
2000edd4:	f8ad 1041 	strh.w	r1, [sp, #65]	; 0x41
2000edd8:	f89d 1082 	ldrb.w	r1, [sp, #130]	; 0x82
2000eddc:	9211      	str	r2, [sp, #68]	; 0x44
2000edde:	f88d 1043 	strb.w	r1, [sp, #67]	; 0x43
2000ede2:	7e29      	ldrb	r1, [r5, #24]
2000ede4:	f105 021a 	add.w	r2, r5, #26
2000ede8:	ab14      	add	r3, sp, #80	; 0x50
2000edea:	960f      	str	r6, [sp, #60]	; 0x3c
2000edec:	f88d 8040 	strb.w	r8, [sp, #64]	; 0x40
2000edf0:	e9cd 1212 	strd	r1, r2, [sp, #72]	; 0x48
2000edf4:	e9d5 2110 	ldrd	r2, r1, [r5, #64]	; 0x40
2000edf8:	c307      	stmia	r3!, {r0, r1, r2}
2000edfa:	7860      	ldrb	r0, [r4, #1]
2000edfc:	e8db 0f4f 	ldrexb	r0, [fp]
2000ee00:	b130      	cbz	r0, 2000ee10 <_ZN6fundsp3run17h5ececde0afe5496cE+0x1f8>
2000ee02:	f3bf 8f2f 	clrex
2000ee06:	f89b 0000 	ldrb.w	r0, [fp]
2000ee0a:	b948      	cbnz	r0, 2000ee20 <_ZN6fundsp3run17h5ececde0afe5496cE+0x208>
2000ee0c:	e7f6      	b.n	2000edfc <_ZN6fundsp3run17h5ececde0afe5496cE+0x1e4>
2000ee0e:	bf00      	nop
2000ee10:	2001      	movs	r0, #1
2000ee12:	e8cb 0f41 	strexb	r1, r0, [fp]
2000ee16:	b1c9      	cbz	r1, 2000ee4c <_ZN6fundsp3run17h5ececde0afe5496cE+0x234>
2000ee18:	f89b 0000 	ldrb.w	r0, [fp]
2000ee1c:	2800      	cmp	r0, #0
2000ee1e:	d0ed      	beq.n	2000edfc <_ZN6fundsp3run17h5ececde0afe5496cE+0x1e4>
2000ee20:	bf10      	yield
2000ee22:	f89b 0000 	ldrb.w	r0, [fp]
2000ee26:	2800      	cmp	r0, #0
2000ee28:	d0e8      	beq.n	2000edfc <_ZN6fundsp3run17h5ececde0afe5496cE+0x1e4>
2000ee2a:	bf10      	yield
2000ee2c:	f89b 0000 	ldrb.w	r0, [fp]
2000ee30:	2800      	cmp	r0, #0
2000ee32:	d0e3      	beq.n	2000edfc <_ZN6fundsp3run17h5ececde0afe5496cE+0x1e4>
2000ee34:	bf10      	yield
2000ee36:	f89b 0000 	ldrb.w	r0, [fp]
2000ee3a:	2800      	cmp	r0, #0
2000ee3c:	d0de      	beq.n	2000edfc <_ZN6fundsp3run17h5ececde0afe5496cE+0x1e4>
2000ee3e:	bf10      	yield
2000ee40:	f89b 0000 	ldrb.w	r0, [fp]
2000ee44:	2800      	cmp	r0, #0
2000ee46:	d1eb      	bne.n	2000ee20 <_ZN6fundsp3run17h5ececde0afe5496cE+0x208>
2000ee48:	e7d8      	b.n	2000edfc <_ZN6fundsp3run17h5ececde0afe5496cE+0x1e4>
2000ee4a:	bf00      	nop
2000ee4c:	2004      	movs	r0, #4
2000ee4e:	210c      	movs	r1, #12
2000ee50:	f3bf 8f5f 	dmb	sy
2000ee54:	f7fd fa30 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000ee58:	2100      	movs	r1, #0
2000ee5a:	2800      	cmp	r0, #0
2000ee5c:	f3bf 8f5f 	dmb	sy
2000ee60:	f88b 1000 	strb.w	r1, [fp]
2000ee64:	d058      	beq.n	2000ef18 <_ZN6fundsp3run17h5ececde0afe5496cE+0x300>
2000ee66:	f244 0600 	movw	r6, #16384	; 0x4000
2000ee6a:	2101      	movs	r1, #1
2000ee6c:	f2c4 661c 	movt	r6, #17948	; 0x461c
2000ee70:	e9c0 1100 	strd	r1, r1, [r0]
2000ee74:	6086      	str	r6, [r0, #8]
2000ee76:	9017      	str	r0, [sp, #92]	; 0x5c
2000ee78:	7860      	ldrb	r0, [r4, #1]
2000ee7a:	e8db 0f4f 	ldrexb	r0, [fp]
2000ee7e:	2800      	cmp	r0, #0
2000ee80:	f040 82e6 	bne.w	2000f450 <_ZN6fundsp3run17h5ececde0afe5496cE+0x838>
2000ee84:	e8cb 1f40 	strexb	r0, r1, [fp]
2000ee88:	2800      	cmp	r0, #0
2000ee8a:	f040 82c5 	bne.w	2000f418 <_ZN6fundsp3run17h5ececde0afe5496cE+0x800>
2000ee8e:	e047      	b.n	2000ef20 <_ZN6fundsp3run17h5ececde0afe5496cE+0x308>
2000ee90:	f645 60f4 	movw	r0, #24308	; 0x5ef4
2000ee94:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000ee98:	f002 fa69 	bl	2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>
2000ee9c:	46b0      	mov	r8, r6
2000ee9e:	2000      	movs	r0, #0
2000eea0:	9003      	str	r0, [sp, #12]
2000eea2:	9803      	ldr	r0, [sp, #12]
2000eea4:	4641      	mov	r1, r8
2000eea6:	f001 fa6d 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>
2000eeaa:	bf00      	nop
2000eeac:	f645 50d0 	movw	r0, #24016	; 0x5dd0
2000eeb0:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000eeb4:	9020      	str	r0, [sp, #128]	; 0x80
2000eeb6:	2001      	movs	r0, #1
2000eeb8:	9021      	str	r0, [sp, #132]	; 0x84
2000eeba:	2000      	movs	r0, #0
2000eebc:	2104      	movs	r1, #4
2000eebe:	e9cd 1022 	strd	r1, r0, [sp, #136]	; 0x88
2000eec2:	f645 51f4 	movw	r1, #24052	; 0x5df4
2000eec6:	9024      	str	r0, [sp, #144]	; 0x90
2000eec8:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000eecc:	a820      	add	r0, sp, #128	; 0x80
2000eece:	f001 fba2 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000eed2:	bf00      	nop
2000eed4:	e8db 2f4f 	ldrexb	r2, [fp]
2000eed8:	2a00      	cmp	r2, #0
2000eeda:	f43f aeca 	beq.w	2000ec72 <_ZN6fundsp3run17h5ececde0afe5496cE+0x5a>
2000eede:	f3bf 8f2f 	clrex
2000eee2:	bf00      	nop
2000eee4:	f89b 2000 	ldrb.w	r2, [fp]
2000eee8:	2a00      	cmp	r2, #0
2000eeea:	d0f3      	beq.n	2000eed4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x2bc>
2000eeec:	bf10      	yield
2000eeee:	f89b 2000 	ldrb.w	r2, [fp]
2000eef2:	2a00      	cmp	r2, #0
2000eef4:	d0ee      	beq.n	2000eed4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x2bc>
2000eef6:	bf10      	yield
2000eef8:	f89b 2000 	ldrb.w	r2, [fp]
2000eefc:	2a00      	cmp	r2, #0
2000eefe:	d0e9      	beq.n	2000eed4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x2bc>
2000ef00:	bf10      	yield
2000ef02:	f89b 2000 	ldrb.w	r2, [fp]
2000ef06:	2a00      	cmp	r2, #0
2000ef08:	d0e4      	beq.n	2000eed4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x2bc>
2000ef0a:	bf10      	yield
2000ef0c:	f89b 2000 	ldrb.w	r2, [fp]
2000ef10:	2a00      	cmp	r2, #0
2000ef12:	d1eb      	bne.n	2000eeec <_ZN6fundsp3run17h5ececde0afe5496cE+0x2d4>
2000ef14:	e7de      	b.n	2000eed4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x2bc>
2000ef16:	bf00      	nop
2000ef18:	2004      	movs	r0, #4
2000ef1a:	210c      	movs	r1, #12
2000ef1c:	f001 fa51 	bl	200103c2 <_ZN5alloc5alloc18handle_alloc_error17h4a68d13483ed3ec2E>
2000ef20:	2004      	movs	r0, #4
2000ef22:	210c      	movs	r1, #12
2000ef24:	f3bf 8f5f 	dmb	sy
2000ef28:	f7fd f9c6 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000ef2c:	2100      	movs	r1, #0
2000ef2e:	2800      	cmp	r0, #0
2000ef30:	f3bf 8f5f 	dmb	sy
2000ef34:	f88b 1000 	strb.w	r1, [fp]
2000ef38:	d0ee      	beq.n	2000ef18 <_ZN6fundsp3run17h5ececde0afe5496cE+0x300>
2000ef3a:	2101      	movs	r1, #1
2000ef3c:	e9c0 1100 	strd	r1, r1, [r0]
2000ef40:	6086      	str	r6, [r0, #8]
2000ef42:	9018      	str	r0, [sp, #96]	; 0x60
2000ef44:	7860      	ldrb	r0, [r4, #1]
2000ef46:	e8db 0f4f 	ldrexb	r0, [fp]
2000ef4a:	2800      	cmp	r0, #0
2000ef4c:	f040 82a0 	bne.w	2000f490 <_ZN6fundsp3run17h5ececde0afe5496cE+0x878>
2000ef50:	e8cb 1f40 	strexb	r0, r1, [fp]
2000ef54:	2800      	cmp	r0, #0
2000ef56:	f040 827f 	bne.w	2000f458 <_ZN6fundsp3run17h5ececde0afe5496cE+0x840>
2000ef5a:	2004      	movs	r0, #4
2000ef5c:	210c      	movs	r1, #12
2000ef5e:	f3bf 8f5f 	dmb	sy
2000ef62:	f7fd f9a9 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000ef66:	4606      	mov	r6, r0
2000ef68:	2000      	movs	r0, #0
2000ef6a:	2e00      	cmp	r6, #0
2000ef6c:	f3bf 8f5f 	dmb	sy
2000ef70:	f88b 0000 	strb.w	r0, [fp]
2000ef74:	d0d0      	beq.n	2000ef18 <_ZN6fundsp3run17h5ececde0afe5496cE+0x300>
2000ef76:	f10d 0e10 	add.w	lr, sp, #16
2000ef7a:	f243 3133 	movw	r1, #13107	; 0x3333
2000ef7e:	f8dd a05c 	ldr.w	sl, [sp, #92]	; 0x5c
2000ef82:	f50e 5584 	add.w	r5, lr, #4224	; 0x1080
2000ef86:	2001      	movs	r0, #1
2000ef88:	f6c3 7133 	movt	r1, #16179	; 0x3f33
2000ef8c:	e9c6 0000 	strd	r0, r0, [r6]
2000ef90:	60b1      	str	r1, [r6, #8]
2000ef92:	9619      	str	r6, [sp, #100]	; 0x64
2000ef94:	e85a 0f00 	ldrex	r0, [sl]
2000ef98:	1c41      	adds	r1, r0, #1
2000ef9a:	e84a 1200 	strex	r2, r1, [sl]
2000ef9e:	2a00      	cmp	r2, #0
2000efa0:	d1f8      	bne.n	2000ef94 <_ZN6fundsp3run17h5ececde0afe5496cE+0x37c>
2000efa2:	2800      	cmp	r0, #0
2000efa4:	f100 80ac 	bmi.w	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000efa8:	e856 0f00 	ldrex	r0, [r6]
2000efac:	1c41      	adds	r1, r0, #1
2000efae:	e846 1200 	strex	r2, r1, [r6]
2000efb2:	2a00      	cmp	r2, #0
2000efb4:	d1f8      	bne.n	2000efa8 <_ZN6fundsp3run17h5ececde0afe5496cE+0x390>
2000efb6:	2800      	cmp	r0, #0
2000efb8:	f100 80a2 	bmi.w	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000efbc:	e85a 0f00 	ldrex	r0, [sl]
2000efc0:	1c41      	adds	r1, r0, #1
2000efc2:	e84a 1200 	strex	r2, r1, [sl]
2000efc6:	2a00      	cmp	r2, #0
2000efc8:	d1f8      	bne.n	2000efbc <_ZN6fundsp3run17h5ececde0afe5496cE+0x3a4>
2000efca:	2800      	cmp	r0, #0
2000efcc:	f100 8098 	bmi.w	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000efd0:	e856 0f00 	ldrex	r0, [r6]
2000efd4:	1c41      	adds	r1, r0, #1
2000efd6:	e846 1200 	strex	r2, r1, [r6]
2000efda:	2a00      	cmp	r2, #0
2000efdc:	d1f8      	bne.n	2000efd0 <_ZN6fundsp3run17h5ececde0afe5496cE+0x3b8>
2000efde:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
2000efe2:	f340 808d 	ble.w	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000efe6:	a8a0      	add	r0, sp, #640	; 0x280
2000efe8:	f44f 7140 	mov.w	r1, #768	; 0x300
2000efec:	f006 faf2 	bl	200155d4 <__aeabi_memclr8>
2000eff0:	f8dd 9060 	ldr.w	r9, [sp, #96]	; 0x60
2000eff4:	e859 0f00 	ldrex	r0, [r9]
2000eff8:	1c41      	adds	r1, r0, #1
2000effa:	e849 1200 	strex	r2, r1, [r9]
2000effe:	2a00      	cmp	r2, #0
2000f000:	d1f8      	bne.n	2000eff4 <_ZN6fundsp3run17h5ececde0afe5496cE+0x3dc>
2000f002:	2800      	cmp	r0, #0
2000f004:	d47c      	bmi.n	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000f006:	bf00      	nop
2000f008:	e856 0f00 	ldrex	r0, [r6]
2000f00c:	1c41      	adds	r1, r0, #1
2000f00e:	e846 1200 	strex	r2, r1, [r6]
2000f012:	2a00      	cmp	r2, #0
2000f014:	d1f8      	bne.n	2000f008 <_ZN6fundsp3run17h5ececde0afe5496cE+0x3f0>
2000f016:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
2000f01a:	dd71      	ble.n	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000f01c:	f50d 60b0 	add.w	r0, sp, #1408	; 0x580
2000f020:	f44f 7140 	mov.w	r1, #768	; 0x300
2000f024:	f006 fad6 	bl	200155d4 <__aeabi_memclr8>
2000f028:	e859 0f00 	ldrex	r0, [r9]
2000f02c:	1c41      	adds	r1, r0, #1
2000f02e:	e849 1200 	strex	r2, r1, [r9]
2000f032:	2a00      	cmp	r2, #0
2000f034:	d1f8      	bne.n	2000f028 <_ZN6fundsp3run17h5ececde0afe5496cE+0x410>
2000f036:	2800      	cmp	r0, #0
2000f038:	d462      	bmi.n	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000f03a:	bf00      	nop
2000f03c:	e856 0f00 	ldrex	r0, [r6]
2000f040:	1c41      	adds	r1, r0, #1
2000f042:	e846 1200 	strex	r2, r1, [r6]
2000f046:	2a00      	cmp	r2, #0
2000f048:	d1f8      	bne.n	2000f03c <_ZN6fundsp3run17h5ececde0afe5496cE+0x424>
2000f04a:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
2000f04e:	dd57      	ble.n	2000f100 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4e8>
2000f050:	f50d 6008 	add.w	r0, sp, #2176	; 0x880
2000f054:	f44f 7140 	mov.w	r1, #768	; 0x300
2000f058:	f006 fabc 	bl	200155d4 <__aeabi_memclr8>
2000f05c:	f50d 6038 	add.w	r0, sp, #2944	; 0xb80
2000f060:	f44f 61a0 	mov.w	r1, #1280	; 0x500
2000f064:	f006 fab6 	bl	200155d4 <__aeabi_memclr8>
2000f068:	f24d 700b 	movw	r0, #55051	; 0xd70b
2000f06c:	f04f 0800 	mov.w	r8, #0
2000f070:	f6c3 5023 	movt	r0, #15651	; 0x3d23
2000f074:	e9c5 0804 	strd	r0, r8, [r5, #16]
2000f078:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000f07c:	e9c5 8000 	strd	r8, r0, [r5]
2000f080:	e9c5 0802 	strd	r0, r8, [r5, #8]
2000f084:	f50d 5084 	add.w	r0, sp, #4224	; 0x1080
2000f088:	e945 8804 	strd	r8, r8, [r5, #-16]
2000f08c:	e945 8802 	strd	r8, r8, [r5, #-8]
2000f090:	f002 feee 	bl	20011e70 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E>
2000f094:	f50d 5084 	add.w	r0, sp, #4224	; 0x1080
2000f098:	f002 feea 	bl	20011e70 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E>
2000f09c:	2000      	movs	r0, #0
2000f09e:	f2c4 7070 	movt	r0, #18288	; 0x4770
2000f0a2:	e9cd 8020 	strd	r8, r0, [sp, #128]	; 0x80
2000f0a6:	2004      	movs	r0, #4
2000f0a8:	2101      	movs	r1, #1
2000f0aa:	f10d 0e0c 	add.w	lr, sp, #12
2000f0ae:	ed9d 0b20 	vldr	d0, [sp, #128]	; 0x80
2000f0b2:	e9c5 8007 	strd	r8, r0, [r5, #28]
2000f0b6:	e9c5 8109 	strd	r8, r1, [r5, #36]	; 0x24
2000f0ba:	62e9      	str	r1, [r5, #44]	; 0x2c
2000f0bc:	f50e 5085 	add.w	r0, lr, #4256	; 0x10a0
2000f0c0:	2103      	movs	r1, #3
2000f0c2:	9003      	str	r0, [sp, #12]
2000f0c4:	f002 fea6 	bl	20011e14 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h09ffcda3328b2eb7E>
2000f0c8:	e9d5 0108 	ldrd	r0, r1, [r5, #32]
2000f0cc:	eb00 0281 	add.w	r2, r0, r1, lsl #2
2000f0d0:	f840 8021 	str.w	r8, [r0, r1, lsl #2]
2000f0d4:	1cc8      	adds	r0, r1, #3
2000f0d6:	6268      	str	r0, [r5, #36]	; 0x24
2000f0d8:	a820      	add	r0, sp, #128	; 0x80
2000f0da:	f44f 7100 	mov.w	r1, #512	; 0x200
2000f0de:	e9c2 8801 	strd	r8, r8, [r2, #4]
2000f0e2:	f006 fa77 	bl	200155d4 <__aeabi_memclr8>
2000f0e6:	7860      	ldrb	r0, [r4, #1]
2000f0e8:	e8db 0f4f 	ldrexb	r0, [fp]
2000f0ec:	2800      	cmp	r0, #0
2000f0ee:	f040 81ef 	bne.w	2000f4d0 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8b8>
2000f0f2:	2101      	movs	r1, #1
2000f0f4:	e8cb 1f40 	strexb	r0, r1, [fp]
2000f0f8:	2800      	cmp	r0, #0
2000f0fa:	f040 81cd 	bne.w	2000f498 <_ZN6fundsp3run17h5ececde0afe5496cE+0x880>
2000f0fe:	e001      	b.n	2000f104 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4ec>
2000f100:	defe      	udf	#254	; 0xfe
2000f102:	bf00      	nop
2000f104:	2020      	movs	r0, #32
2000f106:	f44f 518c 	mov.w	r1, #4480	; 0x1180
2000f10a:	f3bf 8f5f 	dmb	sy
2000f10e:	f7fd f8d3 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000f112:	2400      	movs	r4, #0
2000f114:	f3bf 8f5f 	dmb	sy
2000f118:	f88b 4000 	strb.w	r4, [fp]
2000f11c:	b920      	cbnz	r0, 2000f128 <_ZN6fundsp3run17h5ececde0afe5496cE+0x510>
2000f11e:	2020      	movs	r0, #32
2000f120:	f44f 518c 	mov.w	r1, #4480	; 0x1180
2000f124:	f001 f94d 	bl	200103c2 <_ZN5alloc5alloc18handle_alloc_error17h4a68d13483ed3ec2E>
2000f128:	f50d 6138 	add.w	r1, sp, #2944	; 0xb80
2000f12c:	f44f 62a0 	mov.w	r2, #1280	; 0x500
2000f130:	f500 68a0 	add.w	r8, r0, #1280	; 0x500
2000f134:	4605      	mov	r5, r0
2000f136:	f005 fc13 	bl	20014960 <__aeabi_memcpy8>
2000f13a:	f244 4300 	movw	r3, #17408	; 0x4400
2000f13e:	2000      	movs	r0, #0
2000f140:	f24a 623c 	movw	r2, #42556	; 0xa63c
2000f144:	f2c4 732c 	movt	r3, #18220	; 0x472c
2000f148:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000f14c:	f04f 517e 	mov.w	r1, #1065353216	; 0x3f800000
2000f150:	f64f 3c13 	movw	ip, #64275	; 0xfb13
2000f154:	f24d 0e4c 	movw	lr, #53324	; 0xd04c
2000f158:	f6c3 2279 	movt	r2, #14969	; 0x3a79
2000f15c:	f6c3 7c77 	movt	ip, #16247	; 0x3f77
2000f160:	f6c3 4ef8 	movt	lr, #15608	; 0x3cf8
2000f164:	e9c8 3000 	strd	r3, r0, [r8]
2000f168:	e9c8 1102 	strd	r1, r1, [r8, #8]
2000f16c:	e9c8 2406 	strd	r2, r4, [r8, #24]
2000f170:	e9c8 4108 	strd	r4, r1, [r8, #32]
2000f174:	f505 60a8 	add.w	r0, r5, #1344	; 0x540
2000f178:	a9a0      	add	r1, sp, #640	; 0x280
2000f17a:	f44f 7240 	mov.w	r2, #768	; 0x300
2000f17e:	e9c8 ce04 	strd	ip, lr, [r8, #16]
2000f182:	e9c8 440a 	strd	r4, r4, [r8, #40]	; 0x28
2000f186:	f8c5 a530 	str.w	sl, [r5, #1328]	; 0x530
2000f18a:	f8c5 6534 	str.w	r6, [r5, #1332]	; 0x534
2000f18e:	f005 fbe7 	bl	20014960 <__aeabi_memcpy8>
2000f192:	f64f 3113 	movw	r1, #64275	; 0xfb13
2000f196:	f244 4000 	movw	r0, #17408	; 0x4400
2000f19a:	f6c3 7177 	movt	r1, #16247	; 0x3f77
2000f19e:	f2c4 702c 	movt	r0, #18220	; 0x472c
2000f1a2:	f8c8 1350 	str.w	r1, [r8, #848]	; 0x350
2000f1a6:	f24d 014c 	movw	r1, #53324	; 0xd04c
2000f1aa:	f8c8 0340 	str.w	r0, [r8, #832]	; 0x340
2000f1ae:	2000      	movs	r0, #0
2000f1b0:	f6c3 41f8 	movt	r1, #15608	; 0x3cf8
2000f1b4:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000f1b8:	f8c8 1354 	str.w	r1, [r8, #852]	; 0x354
2000f1bc:	f24a 613c 	movw	r1, #42556	; 0xa63c
2000f1c0:	f8c8 0344 	str.w	r0, [r8, #836]	; 0x344
2000f1c4:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000f1c8:	f6c3 2179 	movt	r1, #14969	; 0x3a79
2000f1cc:	e9c8 00d2 	strd	r0, r0, [r8, #840]	; 0x348
2000f1d0:	e9c8 14d6 	strd	r1, r4, [r8, #856]	; 0x358
2000f1d4:	e9c8 40d8 	strd	r4, r0, [r8, #864]	; 0x360
2000f1d8:	f505 6008 	add.w	r0, r5, #2176	; 0x880
2000f1dc:	f50d 61b0 	add.w	r1, sp, #1408	; 0x580
2000f1e0:	f44f 7240 	mov.w	r2, #768	; 0x300
2000f1e4:	e9c8 44da 	strd	r4, r4, [r8, #872]	; 0x368
2000f1e8:	f8c5 a870 	str.w	sl, [r5, #2160]	; 0x870
2000f1ec:	f8c5 6874 	str.w	r6, [r5, #2164]	; 0x874
2000f1f0:	f005 fbb6 	bl	20014960 <__aeabi_memcpy8>
2000f1f4:	f64f 3113 	movw	r1, #64275	; 0xfb13
2000f1f8:	f244 4000 	movw	r0, #17408	; 0x4400
2000f1fc:	f6c3 7177 	movt	r1, #16247	; 0x3f77
2000f200:	f2c4 702c 	movt	r0, #18220	; 0x472c
2000f204:	f8c8 1690 	str.w	r1, [r8, #1680]	; 0x690
2000f208:	f24d 014c 	movw	r1, #53324	; 0xd04c
2000f20c:	f8c8 0680 	str.w	r0, [r8, #1664]	; 0x680
2000f210:	2000      	movs	r0, #0
2000f212:	f6c3 41f8 	movt	r1, #15608	; 0x3cf8
2000f216:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000f21a:	f8c8 1694 	str.w	r1, [r8, #1684]	; 0x694
2000f21e:	f24a 613c 	movw	r1, #42556	; 0xa63c
2000f222:	f8c8 0684 	str.w	r0, [r8, #1668]	; 0x684
2000f226:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000f22a:	f6c3 2179 	movt	r1, #14969	; 0x3a79
2000f22e:	f240 0a00 	movw	sl, #0
2000f232:	f8c8 0688 	str.w	r0, [r8, #1672]	; 0x688
2000f236:	f8c8 068c 	str.w	r0, [r8, #1676]	; 0x68c
2000f23a:	f8c8 1698 	str.w	r1, [r8, #1688]	; 0x698
2000f23e:	f8c8 069c 	str.w	r0, [r8, #1692]	; 0x69c
2000f242:	f6cb 7a80 	movt	sl, #49024	; 0xbf80
2000f246:	f505 603c 	add.w	r0, r5, #3008	; 0xbc0
2000f24a:	f50d 6108 	add.w	r1, sp, #2176	; 0x880
2000f24e:	f44f 7240 	mov.w	r2, #768	; 0x300
2000f252:	f8c8 a6a0 	str.w	sl, [r8, #1696]	; 0x6a0
2000f256:	f8c8 a6a4 	str.w	sl, [r8, #1700]	; 0x6a4
2000f25a:	f8c8 46a8 	str.w	r4, [r8, #1704]	; 0x6a8
2000f25e:	f8c8 46ac 	str.w	r4, [r8, #1708]	; 0x6ac
2000f262:	f8c5 9bb0 	str.w	r9, [r5, #2992]	; 0xbb0
2000f266:	f8c5 6bb4 	str.w	r6, [r5, #2996]	; 0xbb4
2000f26a:	f005 fb79 	bl	20014960 <__aeabi_memcpy8>
2000f26e:	f64f 3113 	movw	r1, #64275	; 0xfb13
2000f272:	f244 4000 	movw	r0, #17408	; 0x4400
2000f276:	f6c3 7177 	movt	r1, #16247	; 0x3f77
2000f27a:	f2c4 702c 	movt	r0, #18220	; 0x472c
2000f27e:	f8c8 19d0 	str.w	r1, [r8, #2512]	; 0x9d0
2000f282:	f24d 014c 	movw	r1, #53324	; 0xd04c
2000f286:	f8c8 09c0 	str.w	r0, [r8, #2496]	; 0x9c0
2000f28a:	2000      	movs	r0, #0
2000f28c:	f6c3 41f8 	movt	r1, #15608	; 0x3cf8
2000f290:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000f294:	f8c8 19d4 	str.w	r1, [r8, #2516]	; 0x9d4
2000f298:	f24a 613c 	movw	r1, #42556	; 0xa63c
2000f29c:	f8c8 09c4 	str.w	r0, [r8, #2500]	; 0x9c4
2000f2a0:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000f2a4:	f6c3 2179 	movt	r1, #14969	; 0x3a79
2000f2a8:	f8c8 09c8 	str.w	r0, [r8, #2504]	; 0x9c8
2000f2ac:	f8c8 09cc 	str.w	r0, [r8, #2508]	; 0x9cc
2000f2b0:	f8c8 19d8 	str.w	r1, [r8, #2520]	; 0x9d8
2000f2b4:	f8c8 09dc 	str.w	r0, [r8, #2524]	; 0x9dc
2000f2b8:	f505 6070 	add.w	r0, r5, #3840	; 0xf00
2000f2bc:	a920      	add	r1, sp, #128	; 0x80
2000f2be:	f44f 7200 	mov.w	r2, #512	; 0x200
2000f2c2:	f8c8 a9e0 	str.w	sl, [r8, #2528]	; 0x9e0
2000f2c6:	f8c8 a9e4 	str.w	sl, [r8, #2532]	; 0x9e4
2000f2ca:	f8c8 49e8 	str.w	r4, [r8, #2536]	; 0x9e8
2000f2ce:	f8c8 49ec 	str.w	r4, [r8, #2540]	; 0x9ec
2000f2d2:	f8c5 9ef0 	str.w	r9, [r5, #3824]	; 0xef0
2000f2d6:	f8c5 6ef4 	str.w	r6, [r5, #3828]	; 0xef4
2000f2da:	46aa      	mov	sl, r5
2000f2dc:	f005 fb40 	bl	20014960 <__aeabi_memcpy8>
2000f2e0:	f649 1099 	movw	r0, #39321	; 0x9999
2000f2e4:	f6c3 70b9 	movt	r0, #16313	; 0x3fb9
2000f2e8:	f648 0280 	movw	r2, #34944	; 0x8880
2000f2ec:	f04f 4120 	mov.w	r1, #2684354560	; 0xa0000000
2000f2f0:	f2c4 02e5 	movt	r2, #16613	; 0x40e5
2000f2f4:	f8c8 0c0c 	str.w	r0, [r8, #3084]	; 0xc0c
2000f2f8:	f241 1018 	movw	r0, #4376	; 0x1118
2000f2fc:	f8c8 4c00 	str.w	r4, [r8, #3072]	; 0xc00
2000f300:	f8c8 4c04 	str.w	r4, [r8, #3076]	; 0xc04
2000f304:	f8c8 1c08 	str.w	r1, [r8, #3080]	; 0xc08
2000f308:	f8c8 4c10 	str.w	r4, [r8, #3088]	; 0xc10
2000f30c:	f8c8 2c14 	str.w	r2, [r8, #3092]	; 0xc14
2000f310:	4428      	add	r0, r5
2000f312:	f50d 5584 	add.w	r5, sp, #4224	; 0x1080
2000f316:	cd5e      	ldmia	r5!, {r1, r2, r3, r4, r6}
2000f318:	f04f 0c00 	mov.w	ip, #0
2000f31c:	c05e      	stmia	r0!, {r1, r2, r3, r4, r6}
2000f31e:	e895 005e 	ldmia.w	r5, {r1, r2, r3, r4, r6}
2000f322:	46d1      	mov	r9, sl
2000f324:	c05e      	stmia	r0!, {r1, r2, r3, r4, r6}
2000f326:	9d03      	ldr	r5, [sp, #12]
2000f328:	f8c8 cc40 	str.w	ip, [r8, #3136]	; 0xc40
2000f32c:	f241 1044 	movw	r0, #4420	; 0x1144
2000f330:	e895 005e 	ldmia.w	r5, {r1, r2, r3, r4, r6}
2000f334:	4450      	add	r0, sl
2000f336:	c05e      	stmia	r0!, {r1, r2, r3, r4, r6}
2000f338:	2004      	movs	r0, #4
2000f33a:	f8c8 cc58 	str.w	ip, [r8, #3160]	; 0xc58
2000f33e:	f8c8 0c5c 	str.w	r0, [r8, #3164]	; 0xc5c
2000f342:	f8c8 cc60 	str.w	ip, [r8, #3168]	; 0xc60
2000f346:	f241 1068 	movw	r0, #4456	; 0x1168
2000f34a:	a91a      	add	r1, sp, #104	; 0x68
2000f34c:	eb0a 0c00 	add.w	ip, sl, r0
2000f350:	e891 007d 	ldmia.w	r1, {r0, r2, r3, r4, r5, r6}
2000f354:	e88c 007d 	stmia.w	ip, {r0, r2, r3, r4, r5, r6}
2000f358:	f8d8 2c50 	ldr.w	r2, [r8, #3152]	; 0xc50
2000f35c:	f508 6440 	add.w	r4, r8, #3072	; 0xc00
2000f360:	b122      	cbz	r2, 2000f36c <_ZN6fundsp3run17h5ececde0afe5496cE+0x754>
2000f362:	f608 4058 	addw	r0, r8, #3160	; 0xc58
2000f366:	2100      	movs	r1, #0
2000f368:	f7fd fafe 	bl	2000c968 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E>
2000f36c:	9804      	ldr	r0, [sp, #16]
2000f36e:	6800      	ldr	r0, [r0, #0]
2000f370:	f005 fba6 	bl	20014ac0 <__aeabi_ui2d>
2000f374:	ec41 0b18 	vmov	d8, r0, r1
2000f378:	4648      	mov	r0, r9
2000f37a:	eeb0 0a48 	vmov.f32	s0, s16
2000f37e:	eef0 0a68 	vmov.f32	s1, s17
2000f382:	464d      	mov	r5, r9
2000f384:	f7fd ff46 	bl	2000d214 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17h6b0c7d5dc341a399E>
2000f388:	eeb0 0a48 	vmov.f32	s0, s16
2000f38c:	4620      	mov	r0, r4
2000f38e:	eef0 0a68 	vmov.f32	s1, s17
2000f392:	f7fd fb81 	bl	2000ca98 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E>
2000f396:	9c14      	ldr	r4, [sp, #80]	; 0x50
2000f398:	f645 0286 	movw	r2, #22662	; 0x5886
2000f39c:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000f3a0:	4620      	mov	r0, r4
2000f3a2:	2100      	movs	r1, #0
2000f3a4:	2306      	movs	r3, #6
2000f3a6:	f004 fc9b 	bl	20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>
2000f3aa:	f645 028c 	movw	r2, #22668	; 0x588c
2000f3ae:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000f3b2:	4620      	mov	r0, r4
2000f3b4:	2101      	movs	r1, #1
2000f3b6:	2303      	movs	r3, #3
2000f3b8:	2601      	movs	r6, #1
2000f3ba:	f004 fc91 	bl	20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>
2000f3be:	f645 028f 	movw	r2, #22671	; 0x588f
2000f3c2:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000f3c6:	4620      	mov	r0, r4
2000f3c8:	2102      	movs	r1, #2
2000f3ca:	2305      	movs	r3, #5
2000f3cc:	f004 fc88 	bl	20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>
2000f3d0:	e8db 0f4f 	ldrexb	r0, [fp]
2000f3d4:	2800      	cmp	r0, #0
2000f3d6:	f040 809b 	bne.w	2000f510 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8f8>
2000f3da:	e8cb 6f40 	strexb	r0, r6, [fp]
2000f3de:	2800      	cmp	r0, #0
2000f3e0:	d17a      	bne.n	2000f4d8 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8c0>
2000f3e2:	f3bf 8f5f 	dmb	sy
2000f3e6:	f8db 0010 	ldr.w	r0, [fp, #16]
2000f3ea:	9905      	ldr	r1, [sp, #20]
2000f3ec:	6388      	str	r0, [r1, #56]	; 0x38
2000f3ee:	2000      	movs	r0, #0
2000f3f0:	f3bf 8f5f 	dmb	sy
2000f3f4:	f88b 0000 	strb.w	r0, [fp]
2000f3f8:	a811      	add	r0, sp, #68	; 0x44
2000f3fa:	9020      	str	r0, [sp, #128]	; 0x80
2000f3fc:	a817      	add	r0, sp, #92	; 0x5c
2000f3fe:	9021      	str	r0, [sp, #132]	; 0x84
2000f400:	a818      	add	r0, sp, #96	; 0x60
2000f402:	9022      	str	r0, [sp, #136]	; 0x88
2000f404:	a819      	add	r0, sp, #100	; 0x64
2000f406:	9023      	str	r0, [sp, #140]	; 0x8c
2000f408:	a806      	add	r0, sp, #24
2000f40a:	e9cd 0524 	strd	r0, r5, [sp, #144]	; 0x90
2000f40e:	a80a      	add	r0, sp, #40	; 0x28
2000f410:	a920      	add	r1, sp, #128	; 0x80
2000f412:	f7fe fa31 	bl	2000d878 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hb8b894ba2d4e6b5fE>
2000f416:	bf00      	nop
2000f418:	f89b 0000 	ldrb.w	r0, [fp]
2000f41c:	b170      	cbz	r0, 2000f43c <_ZN6fundsp3run17h5ececde0afe5496cE+0x824>
2000f41e:	bf10      	yield
2000f420:	f89b 0000 	ldrb.w	r0, [fp]
2000f424:	b150      	cbz	r0, 2000f43c <_ZN6fundsp3run17h5ececde0afe5496cE+0x824>
2000f426:	bf10      	yield
2000f428:	f89b 0000 	ldrb.w	r0, [fp]
2000f42c:	b130      	cbz	r0, 2000f43c <_ZN6fundsp3run17h5ececde0afe5496cE+0x824>
2000f42e:	bf10      	yield
2000f430:	f89b 0000 	ldrb.w	r0, [fp]
2000f434:	b110      	cbz	r0, 2000f43c <_ZN6fundsp3run17h5ececde0afe5496cE+0x824>
2000f436:	bf10      	yield
2000f438:	e7ee      	b.n	2000f418 <_ZN6fundsp3run17h5ececde0afe5496cE+0x800>
2000f43a:	bf00      	nop
2000f43c:	e8db 0f4f 	ldrexb	r0, [fp]
2000f440:	b930      	cbnz	r0, 2000f450 <_ZN6fundsp3run17h5ececde0afe5496cE+0x838>
2000f442:	2001      	movs	r0, #1
2000f444:	e8cb 0f41 	strexb	r1, r0, [fp]
2000f448:	2900      	cmp	r1, #0
2000f44a:	d1e5      	bne.n	2000f418 <_ZN6fundsp3run17h5ececde0afe5496cE+0x800>
2000f44c:	e568      	b.n	2000ef20 <_ZN6fundsp3run17h5ececde0afe5496cE+0x308>
2000f44e:	bf00      	nop
2000f450:	f3bf 8f2f 	clrex
2000f454:	e7e0      	b.n	2000f418 <_ZN6fundsp3run17h5ececde0afe5496cE+0x800>
2000f456:	bf00      	nop
2000f458:	f89b 0000 	ldrb.w	r0, [fp]
2000f45c:	b170      	cbz	r0, 2000f47c <_ZN6fundsp3run17h5ececde0afe5496cE+0x864>
2000f45e:	bf10      	yield
2000f460:	f89b 0000 	ldrb.w	r0, [fp]
2000f464:	b150      	cbz	r0, 2000f47c <_ZN6fundsp3run17h5ececde0afe5496cE+0x864>
2000f466:	bf10      	yield
2000f468:	f89b 0000 	ldrb.w	r0, [fp]
2000f46c:	b130      	cbz	r0, 2000f47c <_ZN6fundsp3run17h5ececde0afe5496cE+0x864>
2000f46e:	bf10      	yield
2000f470:	f89b 0000 	ldrb.w	r0, [fp]
2000f474:	b110      	cbz	r0, 2000f47c <_ZN6fundsp3run17h5ececde0afe5496cE+0x864>
2000f476:	bf10      	yield
2000f478:	e7ee      	b.n	2000f458 <_ZN6fundsp3run17h5ececde0afe5496cE+0x840>
2000f47a:	bf00      	nop
2000f47c:	e8db 0f4f 	ldrexb	r0, [fp]
2000f480:	b930      	cbnz	r0, 2000f490 <_ZN6fundsp3run17h5ececde0afe5496cE+0x878>
2000f482:	2001      	movs	r0, #1
2000f484:	e8cb 0f41 	strexb	r1, r0, [fp]
2000f488:	2900      	cmp	r1, #0
2000f48a:	d1e5      	bne.n	2000f458 <_ZN6fundsp3run17h5ececde0afe5496cE+0x840>
2000f48c:	e565      	b.n	2000ef5a <_ZN6fundsp3run17h5ececde0afe5496cE+0x342>
2000f48e:	bf00      	nop
2000f490:	f3bf 8f2f 	clrex
2000f494:	e7e0      	b.n	2000f458 <_ZN6fundsp3run17h5ececde0afe5496cE+0x840>
2000f496:	bf00      	nop
2000f498:	f89b 0000 	ldrb.w	r0, [fp]
2000f49c:	b170      	cbz	r0, 2000f4bc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8a4>
2000f49e:	bf10      	yield
2000f4a0:	f89b 0000 	ldrb.w	r0, [fp]
2000f4a4:	b150      	cbz	r0, 2000f4bc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8a4>
2000f4a6:	bf10      	yield
2000f4a8:	f89b 0000 	ldrb.w	r0, [fp]
2000f4ac:	b130      	cbz	r0, 2000f4bc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8a4>
2000f4ae:	bf10      	yield
2000f4b0:	f89b 0000 	ldrb.w	r0, [fp]
2000f4b4:	b110      	cbz	r0, 2000f4bc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8a4>
2000f4b6:	bf10      	yield
2000f4b8:	e7ee      	b.n	2000f498 <_ZN6fundsp3run17h5ececde0afe5496cE+0x880>
2000f4ba:	bf00      	nop
2000f4bc:	e8db 0f4f 	ldrexb	r0, [fp]
2000f4c0:	b930      	cbnz	r0, 2000f4d0 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8b8>
2000f4c2:	2001      	movs	r0, #1
2000f4c4:	e8cb 0f41 	strexb	r1, r0, [fp]
2000f4c8:	2900      	cmp	r1, #0
2000f4ca:	d1e5      	bne.n	2000f498 <_ZN6fundsp3run17h5ececde0afe5496cE+0x880>
2000f4cc:	e61a      	b.n	2000f104 <_ZN6fundsp3run17h5ececde0afe5496cE+0x4ec>
2000f4ce:	bf00      	nop
2000f4d0:	f3bf 8f2f 	clrex
2000f4d4:	e7e0      	b.n	2000f498 <_ZN6fundsp3run17h5ececde0afe5496cE+0x880>
2000f4d6:	bf00      	nop
2000f4d8:	f89b 0000 	ldrb.w	r0, [fp]
2000f4dc:	b170      	cbz	r0, 2000f4fc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8e4>
2000f4de:	bf10      	yield
2000f4e0:	f89b 0000 	ldrb.w	r0, [fp]
2000f4e4:	b150      	cbz	r0, 2000f4fc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8e4>
2000f4e6:	bf10      	yield
2000f4e8:	f89b 0000 	ldrb.w	r0, [fp]
2000f4ec:	b130      	cbz	r0, 2000f4fc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8e4>
2000f4ee:	bf10      	yield
2000f4f0:	f89b 0000 	ldrb.w	r0, [fp]
2000f4f4:	b110      	cbz	r0, 2000f4fc <_ZN6fundsp3run17h5ececde0afe5496cE+0x8e4>
2000f4f6:	bf10      	yield
2000f4f8:	e7ee      	b.n	2000f4d8 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8c0>
2000f4fa:	bf00      	nop
2000f4fc:	e8db 0f4f 	ldrexb	r0, [fp]
2000f500:	b930      	cbnz	r0, 2000f510 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8f8>
2000f502:	2001      	movs	r0, #1
2000f504:	e8cb 0f41 	strexb	r1, r0, [fp]
2000f508:	2900      	cmp	r1, #0
2000f50a:	d1e5      	bne.n	2000f4d8 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8c0>
2000f50c:	e769      	b.n	2000f3e2 <_ZN6fundsp3run17h5ececde0afe5496cE+0x7ca>
2000f50e:	bf00      	nop
2000f510:	f3bf 8f2f 	clrex
2000f514:	e7e0      	b.n	2000f4d8 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8c0>
2000f516:	d4d4      	bmi.n	2000f4c2 <_ZN6fundsp3run17h5ececde0afe5496cE+0x8aa>

2000f518 <_ZN6fundsp3run17h8f36925f4f62106eE>:
2000f518:	b5f0      	push	{r4, r5, r6, r7, lr}
2000f51a:	af03      	add	r7, sp, #12
2000f51c:	f5ad 5d86 	sub.w	sp, sp, #4288	; 0x10c0
2000f520:	b083      	sub	sp, #12
2000f522:	466c      	mov	r4, sp
2000f524:	f36f 0404 	bfc	r4, #0, #5
2000f528:	46a5      	mov	sp, r4
2000f52a:	e9d1 9501 	ldrd	r9, r5, [r1, #4]
2000f52e:	f246 04e0 	movw	r4, #24800	; 0x60e0
2000f532:	fb09 fa05 	mul.w	sl, r9, r5
2000f536:	f246 0b90 	movw	fp, #24720	; 0x6090
2000f53a:	f1ba 0f00 	cmp.w	sl, #0
2000f53e:	f2c2 0401 	movt	r4, #8193	; 0x2001
2000f542:	f2c2 0b01 	movt	fp, #8193	; 0x2001
2000f546:	9005      	str	r0, [sp, #20]
2000f548:	9104      	str	r1, [sp, #16]
2000f54a:	d101      	bne.n	2000f550 <_ZN6fundsp3run17h8f36925f4f62106eE+0x38>
2000f54c:	2604      	movs	r6, #4
2000f54e:	e034      	b.n	2000f5ba <_ZN6fundsp3run17h8f36925f4f62106eE+0xa2>
2000f550:	ea5f 705a 	movs.w	r0, sl, lsr #29
2000f554:	ea4f 068a 	mov.w	r6, sl, lsl #2
2000f558:	f040 8120 	bne.w	2000f79c <_ZN6fundsp3run17h8f36925f4f62106eE+0x284>
2000f55c:	7862      	ldrb	r2, [r4, #1]
2000f55e:	fab0 f080 	clz	r0, r0
2000f562:	e8db 2f4f 	ldrexb	r2, [fp]
2000f566:	0940      	lsrs	r0, r0, #5
2000f568:	2a00      	cmp	r2, #0
2000f56a:	ea4f 0080 	mov.w	r0, r0, lsl #2
2000f56e:	f040 8136 	bne.w	2000f7de <_ZN6fundsp3run17h8f36925f4f62106eE+0x2c6>
2000f572:	2301      	movs	r3, #1
2000f574:	e8cb 3f42 	strexb	r2, r3, [fp]
2000f578:	2a00      	cmp	r2, #0
2000f57a:	f040 8133 	bne.w	2000f7e4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x2cc>
2000f57e:	4631      	mov	r1, r6
2000f580:	f3bf 8f5f 	dmb	sy
2000f584:	46b0      	mov	r8, r6
2000f586:	9003      	str	r0, [sp, #12]
2000f588:	f7fc fe96 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000f58c:	4606      	mov	r6, r0
2000f58e:	2000      	movs	r0, #0
2000f590:	2e00      	cmp	r6, #0
2000f592:	f3bf 8f5f 	dmb	sy
2000f596:	f88b 0000 	strb.w	r0, [fp]
2000f59a:	f000 8102 	beq.w	2000f7a2 <_ZN6fundsp3run17h8f36925f4f62106eE+0x28a>
2000f59e:	f1ba 0f01 	cmp.w	sl, #1
2000f5a2:	4630      	mov	r0, r6
2000f5a4:	d007      	beq.n	2000f5b6 <_ZN6fundsp3run17h8f36925f4f62106eE+0x9e>
2000f5a6:	f1a8 0804 	sub.w	r8, r8, #4
2000f5aa:	4630      	mov	r0, r6
2000f5ac:	4641      	mov	r1, r8
2000f5ae:	f005 fd37 	bl	20015020 <__aeabi_memclr4>
2000f5b2:	eb08 0006 	add.w	r0, r8, r6
2000f5b6:	2100      	movs	r1, #0
2000f5b8:	6001      	str	r1, [r0, #0]
2000f5ba:	e9cd 5908 	strd	r5, r9, [sp, #32]
2000f5be:	9d05      	ldr	r5, [sp, #20]
2000f5c0:	e9cd 6a06 	strd	r6, sl, [sp, #24]
2000f5c4:	4628      	mov	r0, r5
2000f5c6:	f004 fde3 	bl	20014190 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E>
2000f5ca:	7b28      	ldrb	r0, [r5, #12]
2000f5cc:	f000 01f0 	and.w	r1, r0, #240	; 0xf0
2000f5d0:	2910      	cmp	r1, #16
2000f5d2:	d005      	beq.n	2000f5e0 <_ZN6fundsp3run17h8f36925f4f62106eE+0xc8>
2000f5d4:	2920      	cmp	r1, #32
2000f5d6:	f040 80e9 	bne.w	2000f7ac <_ZN6fundsp3run17h8f36925f4f62106eE+0x294>
2000f5da:	f04f 0801 	mov.w	r8, #1
2000f5de:	e001      	b.n	2000f5e4 <_ZN6fundsp3run17h8f36925f4f62106eE+0xcc>
2000f5e0:	f04f 0800 	mov.w	r8, #0
2000f5e4:	f010 060f 	ands.w	r6, r0, #15
2000f5e8:	bf08      	it	eq
2000f5ea:	2602      	moveq	r6, #2
2000f5ec:	9805      	ldr	r0, [sp, #20]
2000f5ee:	6b03      	ldr	r3, [r0, #48]	; 0x30
2000f5f0:	f8d0 9010 	ldr.w	r9, [r0, #16]
2000f5f4:	f8b0 a00e 	ldrh.w	sl, [r0, #14]
2000f5f8:	b1db      	cbz	r3, 2000f632 <_ZN6fundsp3run17h8f36925f4f62106eE+0x11a>
2000f5fa:	f244 001d 	movw	r0, #16413	; 0x401d
2000f5fe:	f645 3510 	movw	r5, #23312	; 0x5b10
2000f602:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000f606:	f2c2 0501 	movt	r5, #8193	; 0x2001
2000f60a:	9021      	str	r0, [sp, #132]	; 0x84
2000f60c:	a920      	add	r1, sp, #128	; 0x80
2000f60e:	f44f 5088 	mov.w	r0, #4352	; 0x1100
2000f612:	2202      	movs	r2, #2
2000f614:	9520      	str	r5, [sp, #128]	; 0x80
2000f616:	4798      	blx	r3
2000f618:	9805      	ldr	r0, [sp, #20]
2000f61a:	6b03      	ldr	r3, [r0, #48]	; 0x30
2000f61c:	b14b      	cbz	r3, 2000f632 <_ZN6fundsp3run17h8f36925f4f62106eE+0x11a>
2000f61e:	2000      	movs	r0, #0
2000f620:	900a      	str	r0, [sp, #40]	; 0x28
2000f622:	a80a      	add	r0, sp, #40	; 0x28
2000f624:	9021      	str	r0, [sp, #132]	; 0x84
2000f626:	a920      	add	r1, sp, #128	; 0x80
2000f628:	f241 1001 	movw	r0, #4353	; 0x1101
2000f62c:	2202      	movs	r2, #2
2000f62e:	9520      	str	r5, [sp, #128]	; 0x80
2000f630:	4798      	blx	r3
2000f632:	f104 0024 	add.w	r0, r4, #36	; 0x24
2000f636:	bf00      	nop
2000f638:	e8d0 1f4f 	ldrexb	r1, [r0]
2000f63c:	b131      	cbz	r1, 2000f64c <_ZN6fundsp3run17h8f36925f4f62106eE+0x134>
2000f63e:	f3bf 8f2f 	clrex
2000f642:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000f646:	b949      	cbnz	r1, 2000f65c <_ZN6fundsp3run17h8f36925f4f62106eE+0x144>
2000f648:	e7f6      	b.n	2000f638 <_ZN6fundsp3run17h8f36925f4f62106eE+0x120>
2000f64a:	bf00      	nop
2000f64c:	2101      	movs	r1, #1
2000f64e:	e8c0 1f42 	strexb	r2, r1, [r0]
2000f652:	b1ca      	cbz	r2, 2000f688 <_ZN6fundsp3run17h8f36925f4f62106eE+0x170>
2000f654:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000f658:	2900      	cmp	r1, #0
2000f65a:	d0ed      	beq.n	2000f638 <_ZN6fundsp3run17h8f36925f4f62106eE+0x120>
2000f65c:	bf10      	yield
2000f65e:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000f662:	2900      	cmp	r1, #0
2000f664:	d0e8      	beq.n	2000f638 <_ZN6fundsp3run17h8f36925f4f62106eE+0x120>
2000f666:	bf10      	yield
2000f668:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000f66c:	2900      	cmp	r1, #0
2000f66e:	d0e3      	beq.n	2000f638 <_ZN6fundsp3run17h8f36925f4f62106eE+0x120>
2000f670:	bf10      	yield
2000f672:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000f676:	2900      	cmp	r1, #0
2000f678:	d0de      	beq.n	2000f638 <_ZN6fundsp3run17h8f36925f4f62106eE+0x120>
2000f67a:	bf10      	yield
2000f67c:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
2000f680:	2900      	cmp	r1, #0
2000f682:	d1eb      	bne.n	2000f65c <_ZN6fundsp3run17h8f36925f4f62106eE+0x144>
2000f684:	e7d8      	b.n	2000f638 <_ZN6fundsp3run17h8f36925f4f62106eE+0x120>
2000f686:	bf00      	nop
2000f688:	f3bf 8f5f 	dmb	sy
2000f68c:	6aa0      	ldr	r0, [r4, #40]	; 0x28
2000f68e:	2800      	cmp	r0, #0
2000f690:	f040 807e 	bne.w	2000f790 <_ZN6fundsp3run17h8f36925f4f62106eE+0x278>
2000f694:	9d05      	ldr	r5, [sp, #20]
2000f696:	2140      	movs	r1, #64	; 0x40
2000f698:	f105 003c 	add.w	r0, r5, #60	; 0x3c
2000f69c:	62e0      	str	r0, [r4, #44]	; 0x2c
2000f69e:	f104 0030 	add.w	r0, r4, #48	; 0x30
2000f6a2:	f005 fcbd 	bl	20015020 <__aeabi_memclr4>
2000f6a6:	2000      	movs	r0, #0
2000f6a8:	f3bf 8f5f 	dmb	sy
2000f6ac:	f884 0024 	strb.w	r0, [r4, #36]	; 0x24
2000f6b0:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	; 0x24
2000f6b4:	f643 62a5 	movw	r2, #16037	; 0x3ea5
2000f6b8:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000f6bc:	910a      	str	r1, [sp, #40]	; 0x28
2000f6be:	1d29      	adds	r1, r5, #4
2000f6c0:	64aa      	str	r2, [r5, #72]	; 0x48
2000f6c2:	910b      	str	r1, [sp, #44]	; 0x2c
2000f6c4:	f105 0108 	add.w	r1, r5, #8
2000f6c8:	aa0c      	add	r2, sp, #48	; 0x30
2000f6ca:	e882 0602 	stmia.w	r2, {r1, r9, sl}
2000f6ce:	f8bd 1080 	ldrh.w	r1, [sp, #128]	; 0x80
2000f6d2:	696a      	ldr	r2, [r5, #20]
2000f6d4:	f8ad 1041 	strh.w	r1, [sp, #65]	; 0x41
2000f6d8:	f89d 1082 	ldrb.w	r1, [sp, #130]	; 0x82
2000f6dc:	9211      	str	r2, [sp, #68]	; 0x44
2000f6de:	f88d 1043 	strb.w	r1, [sp, #67]	; 0x43
2000f6e2:	7e29      	ldrb	r1, [r5, #24]
2000f6e4:	f105 021a 	add.w	r2, r5, #26
2000f6e8:	ab14      	add	r3, sp, #80	; 0x50
2000f6ea:	960f      	str	r6, [sp, #60]	; 0x3c
2000f6ec:	f88d 8040 	strb.w	r8, [sp, #64]	; 0x40
2000f6f0:	e9cd 1212 	strd	r1, r2, [sp, #72]	; 0x48
2000f6f4:	e9d5 2110 	ldrd	r2, r1, [r5, #64]	; 0x40
2000f6f8:	c307      	stmia	r3!, {r0, r1, r2}
2000f6fa:	7860      	ldrb	r0, [r4, #1]
2000f6fc:	e8db 0f4f 	ldrexb	r0, [fp]
2000f700:	b130      	cbz	r0, 2000f710 <_ZN6fundsp3run17h8f36925f4f62106eE+0x1f8>
2000f702:	f3bf 8f2f 	clrex
2000f706:	f89b 0000 	ldrb.w	r0, [fp]
2000f70a:	b948      	cbnz	r0, 2000f720 <_ZN6fundsp3run17h8f36925f4f62106eE+0x208>
2000f70c:	e7f6      	b.n	2000f6fc <_ZN6fundsp3run17h8f36925f4f62106eE+0x1e4>
2000f70e:	bf00      	nop
2000f710:	2001      	movs	r0, #1
2000f712:	e8cb 0f41 	strexb	r1, r0, [fp]
2000f716:	b1c9      	cbz	r1, 2000f74c <_ZN6fundsp3run17h8f36925f4f62106eE+0x234>
2000f718:	f89b 0000 	ldrb.w	r0, [fp]
2000f71c:	2800      	cmp	r0, #0
2000f71e:	d0ed      	beq.n	2000f6fc <_ZN6fundsp3run17h8f36925f4f62106eE+0x1e4>
2000f720:	bf10      	yield
2000f722:	f89b 0000 	ldrb.w	r0, [fp]
2000f726:	2800      	cmp	r0, #0
2000f728:	d0e8      	beq.n	2000f6fc <_ZN6fundsp3run17h8f36925f4f62106eE+0x1e4>
2000f72a:	bf10      	yield
2000f72c:	f89b 0000 	ldrb.w	r0, [fp]
2000f730:	2800      	cmp	r0, #0
2000f732:	d0e3      	beq.n	2000f6fc <_ZN6fundsp3run17h8f36925f4f62106eE+0x1e4>
2000f734:	bf10      	yield
2000f736:	f89b 0000 	ldrb.w	r0, [fp]
2000f73a:	2800      	cmp	r0, #0
2000f73c:	d0de      	beq.n	2000f6fc <_ZN6fundsp3run17h8f36925f4f62106eE+0x1e4>
2000f73e:	bf10      	yield
2000f740:	f89b 0000 	ldrb.w	r0, [fp]
2000f744:	2800      	cmp	r0, #0
2000f746:	d1eb      	bne.n	2000f720 <_ZN6fundsp3run17h8f36925f4f62106eE+0x208>
2000f748:	e7d8      	b.n	2000f6fc <_ZN6fundsp3run17h8f36925f4f62106eE+0x1e4>
2000f74a:	bf00      	nop
2000f74c:	2004      	movs	r0, #4
2000f74e:	210c      	movs	r1, #12
2000f750:	f3bf 8f5f 	dmb	sy
2000f754:	f7fc fdb0 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000f758:	2100      	movs	r1, #0
2000f75a:	2800      	cmp	r0, #0
2000f75c:	f3bf 8f5f 	dmb	sy
2000f760:	f88b 1000 	strb.w	r1, [fp]
2000f764:	d058      	beq.n	2000f818 <_ZN6fundsp3run17h8f36925f4f62106eE+0x300>
2000f766:	f244 0600 	movw	r6, #16384	; 0x4000
2000f76a:	2101      	movs	r1, #1
2000f76c:	f2c4 661c 	movt	r6, #17948	; 0x461c
2000f770:	e9c0 1100 	strd	r1, r1, [r0]
2000f774:	6086      	str	r6, [r0, #8]
2000f776:	9017      	str	r0, [sp, #92]	; 0x5c
2000f778:	7860      	ldrb	r0, [r4, #1]
2000f77a:	e8db 0f4f 	ldrexb	r0, [fp]
2000f77e:	2800      	cmp	r0, #0
2000f780:	f040 82e6 	bne.w	2000fd50 <_ZN6fundsp3run17h8f36925f4f62106eE+0x838>
2000f784:	e8cb 1f40 	strexb	r0, r1, [fp]
2000f788:	2800      	cmp	r0, #0
2000f78a:	f040 82c5 	bne.w	2000fd18 <_ZN6fundsp3run17h8f36925f4f62106eE+0x800>
2000f78e:	e047      	b.n	2000f820 <_ZN6fundsp3run17h8f36925f4f62106eE+0x308>
2000f790:	f645 60f4 	movw	r0, #24308	; 0x5ef4
2000f794:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000f798:	f001 fde9 	bl	2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>
2000f79c:	46b0      	mov	r8, r6
2000f79e:	2000      	movs	r0, #0
2000f7a0:	9003      	str	r0, [sp, #12]
2000f7a2:	9803      	ldr	r0, [sp, #12]
2000f7a4:	4641      	mov	r1, r8
2000f7a6:	f000 fded 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>
2000f7aa:	bf00      	nop
2000f7ac:	f645 50d0 	movw	r0, #24016	; 0x5dd0
2000f7b0:	f2c2 0001 	movt	r0, #8193	; 0x2001
2000f7b4:	9020      	str	r0, [sp, #128]	; 0x80
2000f7b6:	2001      	movs	r0, #1
2000f7b8:	9021      	str	r0, [sp, #132]	; 0x84
2000f7ba:	2000      	movs	r0, #0
2000f7bc:	2104      	movs	r1, #4
2000f7be:	e9cd 1022 	strd	r1, r0, [sp, #136]	; 0x88
2000f7c2:	f645 51f4 	movw	r1, #24052	; 0x5df4
2000f7c6:	9024      	str	r0, [sp, #144]	; 0x90
2000f7c8:	f2c2 0101 	movt	r1, #8193	; 0x2001
2000f7cc:	a820      	add	r0, sp, #128	; 0x80
2000f7ce:	f000 ff22 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
2000f7d2:	bf00      	nop
2000f7d4:	e8db 2f4f 	ldrexb	r2, [fp]
2000f7d8:	2a00      	cmp	r2, #0
2000f7da:	f43f aeca 	beq.w	2000f572 <_ZN6fundsp3run17h8f36925f4f62106eE+0x5a>
2000f7de:	f3bf 8f2f 	clrex
2000f7e2:	bf00      	nop
2000f7e4:	f89b 2000 	ldrb.w	r2, [fp]
2000f7e8:	2a00      	cmp	r2, #0
2000f7ea:	d0f3      	beq.n	2000f7d4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x2bc>
2000f7ec:	bf10      	yield
2000f7ee:	f89b 2000 	ldrb.w	r2, [fp]
2000f7f2:	2a00      	cmp	r2, #0
2000f7f4:	d0ee      	beq.n	2000f7d4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x2bc>
2000f7f6:	bf10      	yield
2000f7f8:	f89b 2000 	ldrb.w	r2, [fp]
2000f7fc:	2a00      	cmp	r2, #0
2000f7fe:	d0e9      	beq.n	2000f7d4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x2bc>
2000f800:	bf10      	yield
2000f802:	f89b 2000 	ldrb.w	r2, [fp]
2000f806:	2a00      	cmp	r2, #0
2000f808:	d0e4      	beq.n	2000f7d4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x2bc>
2000f80a:	bf10      	yield
2000f80c:	f89b 2000 	ldrb.w	r2, [fp]
2000f810:	2a00      	cmp	r2, #0
2000f812:	d1eb      	bne.n	2000f7ec <_ZN6fundsp3run17h8f36925f4f62106eE+0x2d4>
2000f814:	e7de      	b.n	2000f7d4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x2bc>
2000f816:	bf00      	nop
2000f818:	2004      	movs	r0, #4
2000f81a:	210c      	movs	r1, #12
2000f81c:	f000 fdd1 	bl	200103c2 <_ZN5alloc5alloc18handle_alloc_error17h4a68d13483ed3ec2E>
2000f820:	2004      	movs	r0, #4
2000f822:	210c      	movs	r1, #12
2000f824:	f3bf 8f5f 	dmb	sy
2000f828:	f7fc fd46 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000f82c:	2100      	movs	r1, #0
2000f82e:	2800      	cmp	r0, #0
2000f830:	f3bf 8f5f 	dmb	sy
2000f834:	f88b 1000 	strb.w	r1, [fp]
2000f838:	d0ee      	beq.n	2000f818 <_ZN6fundsp3run17h8f36925f4f62106eE+0x300>
2000f83a:	2101      	movs	r1, #1
2000f83c:	e9c0 1100 	strd	r1, r1, [r0]
2000f840:	6086      	str	r6, [r0, #8]
2000f842:	9018      	str	r0, [sp, #96]	; 0x60
2000f844:	7860      	ldrb	r0, [r4, #1]
2000f846:	e8db 0f4f 	ldrexb	r0, [fp]
2000f84a:	2800      	cmp	r0, #0
2000f84c:	f040 82a0 	bne.w	2000fd90 <_ZN6fundsp3run17h8f36925f4f62106eE+0x878>
2000f850:	e8cb 1f40 	strexb	r0, r1, [fp]
2000f854:	2800      	cmp	r0, #0
2000f856:	f040 827f 	bne.w	2000fd58 <_ZN6fundsp3run17h8f36925f4f62106eE+0x840>
2000f85a:	2004      	movs	r0, #4
2000f85c:	210c      	movs	r1, #12
2000f85e:	f3bf 8f5f 	dmb	sy
2000f862:	f7fc fd29 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000f866:	4606      	mov	r6, r0
2000f868:	2000      	movs	r0, #0
2000f86a:	2e00      	cmp	r6, #0
2000f86c:	f3bf 8f5f 	dmb	sy
2000f870:	f88b 0000 	strb.w	r0, [fp]
2000f874:	d0d0      	beq.n	2000f818 <_ZN6fundsp3run17h8f36925f4f62106eE+0x300>
2000f876:	f10d 0e10 	add.w	lr, sp, #16
2000f87a:	f243 3133 	movw	r1, #13107	; 0x3333
2000f87e:	f8dd a05c 	ldr.w	sl, [sp, #92]	; 0x5c
2000f882:	f50e 5584 	add.w	r5, lr, #4224	; 0x1080
2000f886:	2001      	movs	r0, #1
2000f888:	f6c3 7133 	movt	r1, #16179	; 0x3f33
2000f88c:	e9c6 0000 	strd	r0, r0, [r6]
2000f890:	60b1      	str	r1, [r6, #8]
2000f892:	9619      	str	r6, [sp, #100]	; 0x64
2000f894:	e85a 0f00 	ldrex	r0, [sl]
2000f898:	1c41      	adds	r1, r0, #1
2000f89a:	e84a 1200 	strex	r2, r1, [sl]
2000f89e:	2a00      	cmp	r2, #0
2000f8a0:	d1f8      	bne.n	2000f894 <_ZN6fundsp3run17h8f36925f4f62106eE+0x37c>
2000f8a2:	2800      	cmp	r0, #0
2000f8a4:	f100 80ac 	bmi.w	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f8a8:	e856 0f00 	ldrex	r0, [r6]
2000f8ac:	1c41      	adds	r1, r0, #1
2000f8ae:	e846 1200 	strex	r2, r1, [r6]
2000f8b2:	2a00      	cmp	r2, #0
2000f8b4:	d1f8      	bne.n	2000f8a8 <_ZN6fundsp3run17h8f36925f4f62106eE+0x390>
2000f8b6:	2800      	cmp	r0, #0
2000f8b8:	f100 80a2 	bmi.w	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f8bc:	e85a 0f00 	ldrex	r0, [sl]
2000f8c0:	1c41      	adds	r1, r0, #1
2000f8c2:	e84a 1200 	strex	r2, r1, [sl]
2000f8c6:	2a00      	cmp	r2, #0
2000f8c8:	d1f8      	bne.n	2000f8bc <_ZN6fundsp3run17h8f36925f4f62106eE+0x3a4>
2000f8ca:	2800      	cmp	r0, #0
2000f8cc:	f100 8098 	bmi.w	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f8d0:	e856 0f00 	ldrex	r0, [r6]
2000f8d4:	1c41      	adds	r1, r0, #1
2000f8d6:	e846 1200 	strex	r2, r1, [r6]
2000f8da:	2a00      	cmp	r2, #0
2000f8dc:	d1f8      	bne.n	2000f8d0 <_ZN6fundsp3run17h8f36925f4f62106eE+0x3b8>
2000f8de:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
2000f8e2:	f340 808d 	ble.w	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f8e6:	a8a0      	add	r0, sp, #640	; 0x280
2000f8e8:	f44f 7140 	mov.w	r1, #768	; 0x300
2000f8ec:	f005 fe72 	bl	200155d4 <__aeabi_memclr8>
2000f8f0:	f8dd 9060 	ldr.w	r9, [sp, #96]	; 0x60
2000f8f4:	e859 0f00 	ldrex	r0, [r9]
2000f8f8:	1c41      	adds	r1, r0, #1
2000f8fa:	e849 1200 	strex	r2, r1, [r9]
2000f8fe:	2a00      	cmp	r2, #0
2000f900:	d1f8      	bne.n	2000f8f4 <_ZN6fundsp3run17h8f36925f4f62106eE+0x3dc>
2000f902:	2800      	cmp	r0, #0
2000f904:	d47c      	bmi.n	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f906:	bf00      	nop
2000f908:	e856 0f00 	ldrex	r0, [r6]
2000f90c:	1c41      	adds	r1, r0, #1
2000f90e:	e846 1200 	strex	r2, r1, [r6]
2000f912:	2a00      	cmp	r2, #0
2000f914:	d1f8      	bne.n	2000f908 <_ZN6fundsp3run17h8f36925f4f62106eE+0x3f0>
2000f916:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
2000f91a:	dd71      	ble.n	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f91c:	f50d 60b0 	add.w	r0, sp, #1408	; 0x580
2000f920:	f44f 7140 	mov.w	r1, #768	; 0x300
2000f924:	f005 fe56 	bl	200155d4 <__aeabi_memclr8>
2000f928:	e859 0f00 	ldrex	r0, [r9]
2000f92c:	1c41      	adds	r1, r0, #1
2000f92e:	e849 1200 	strex	r2, r1, [r9]
2000f932:	2a00      	cmp	r2, #0
2000f934:	d1f8      	bne.n	2000f928 <_ZN6fundsp3run17h8f36925f4f62106eE+0x410>
2000f936:	2800      	cmp	r0, #0
2000f938:	d462      	bmi.n	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f93a:	bf00      	nop
2000f93c:	e856 0f00 	ldrex	r0, [r6]
2000f940:	1c41      	adds	r1, r0, #1
2000f942:	e846 1200 	strex	r2, r1, [r6]
2000f946:	2a00      	cmp	r2, #0
2000f948:	d1f8      	bne.n	2000f93c <_ZN6fundsp3run17h8f36925f4f62106eE+0x424>
2000f94a:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
2000f94e:	dd57      	ble.n	2000fa00 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4e8>
2000f950:	f50d 6008 	add.w	r0, sp, #2176	; 0x880
2000f954:	f44f 7140 	mov.w	r1, #768	; 0x300
2000f958:	f005 fe3c 	bl	200155d4 <__aeabi_memclr8>
2000f95c:	f50d 6038 	add.w	r0, sp, #2944	; 0xb80
2000f960:	f44f 61a0 	mov.w	r1, #1280	; 0x500
2000f964:	f005 fe36 	bl	200155d4 <__aeabi_memclr8>
2000f968:	f24d 700b 	movw	r0, #55051	; 0xd70b
2000f96c:	f04f 0800 	mov.w	r8, #0
2000f970:	f6c3 5023 	movt	r0, #15651	; 0x3d23
2000f974:	e9c5 0804 	strd	r0, r8, [r5, #16]
2000f978:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000f97c:	e9c5 8000 	strd	r8, r0, [r5]
2000f980:	e9c5 0802 	strd	r0, r8, [r5, #8]
2000f984:	f50d 5084 	add.w	r0, sp, #4224	; 0x1080
2000f988:	e945 8804 	strd	r8, r8, [r5, #-16]
2000f98c:	e945 8802 	strd	r8, r8, [r5, #-8]
2000f990:	f002 fa6e 	bl	20011e70 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E>
2000f994:	f50d 5084 	add.w	r0, sp, #4224	; 0x1080
2000f998:	f002 fa6a 	bl	20011e70 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E>
2000f99c:	2000      	movs	r0, #0
2000f99e:	f2c4 7070 	movt	r0, #18288	; 0x4770
2000f9a2:	e9cd 8020 	strd	r8, r0, [sp, #128]	; 0x80
2000f9a6:	2004      	movs	r0, #4
2000f9a8:	2101      	movs	r1, #1
2000f9aa:	f10d 0e0c 	add.w	lr, sp, #12
2000f9ae:	ed9d 0b20 	vldr	d0, [sp, #128]	; 0x80
2000f9b2:	e9c5 8007 	strd	r8, r0, [r5, #28]
2000f9b6:	e9c5 8109 	strd	r8, r1, [r5, #36]	; 0x24
2000f9ba:	62e9      	str	r1, [r5, #44]	; 0x2c
2000f9bc:	f50e 5085 	add.w	r0, lr, #4256	; 0x10a0
2000f9c0:	2103      	movs	r1, #3
2000f9c2:	9003      	str	r0, [sp, #12]
2000f9c4:	f002 fa26 	bl	20011e14 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h09ffcda3328b2eb7E>
2000f9c8:	e9d5 0108 	ldrd	r0, r1, [r5, #32]
2000f9cc:	eb00 0281 	add.w	r2, r0, r1, lsl #2
2000f9d0:	f840 8021 	str.w	r8, [r0, r1, lsl #2]
2000f9d4:	1cc8      	adds	r0, r1, #3
2000f9d6:	6268      	str	r0, [r5, #36]	; 0x24
2000f9d8:	a820      	add	r0, sp, #128	; 0x80
2000f9da:	f44f 7100 	mov.w	r1, #512	; 0x200
2000f9de:	e9c2 8801 	strd	r8, r8, [r2, #4]
2000f9e2:	f005 fdf7 	bl	200155d4 <__aeabi_memclr8>
2000f9e6:	7860      	ldrb	r0, [r4, #1]
2000f9e8:	e8db 0f4f 	ldrexb	r0, [fp]
2000f9ec:	2800      	cmp	r0, #0
2000f9ee:	f040 81ef 	bne.w	2000fdd0 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8b8>
2000f9f2:	2101      	movs	r1, #1
2000f9f4:	e8cb 1f40 	strexb	r0, r1, [fp]
2000f9f8:	2800      	cmp	r0, #0
2000f9fa:	f040 81cd 	bne.w	2000fd98 <_ZN6fundsp3run17h8f36925f4f62106eE+0x880>
2000f9fe:	e001      	b.n	2000fa04 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4ec>
2000fa00:	defe      	udf	#254	; 0xfe
2000fa02:	bf00      	nop
2000fa04:	2020      	movs	r0, #32
2000fa06:	f44f 518c 	mov.w	r1, #4480	; 0x1180
2000fa0a:	f3bf 8f5f 	dmb	sy
2000fa0e:	f7fc fc53 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000fa12:	2400      	movs	r4, #0
2000fa14:	f3bf 8f5f 	dmb	sy
2000fa18:	f88b 4000 	strb.w	r4, [fp]
2000fa1c:	b920      	cbnz	r0, 2000fa28 <_ZN6fundsp3run17h8f36925f4f62106eE+0x510>
2000fa1e:	2020      	movs	r0, #32
2000fa20:	f44f 518c 	mov.w	r1, #4480	; 0x1180
2000fa24:	f000 fccd 	bl	200103c2 <_ZN5alloc5alloc18handle_alloc_error17h4a68d13483ed3ec2E>
2000fa28:	f50d 6138 	add.w	r1, sp, #2944	; 0xb80
2000fa2c:	f44f 62a0 	mov.w	r2, #1280	; 0x500
2000fa30:	f500 68a0 	add.w	r8, r0, #1280	; 0x500
2000fa34:	4605      	mov	r5, r0
2000fa36:	f004 ff93 	bl	20014960 <__aeabi_memcpy8>
2000fa3a:	f244 4300 	movw	r3, #17408	; 0x4400
2000fa3e:	2000      	movs	r0, #0
2000fa40:	f24a 623c 	movw	r2, #42556	; 0xa63c
2000fa44:	f2c4 732c 	movt	r3, #18220	; 0x472c
2000fa48:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000fa4c:	f04f 517e 	mov.w	r1, #1065353216	; 0x3f800000
2000fa50:	f64f 3c13 	movw	ip, #64275	; 0xfb13
2000fa54:	f24d 0e4c 	movw	lr, #53324	; 0xd04c
2000fa58:	f6c3 2279 	movt	r2, #14969	; 0x3a79
2000fa5c:	f6c3 7c77 	movt	ip, #16247	; 0x3f77
2000fa60:	f6c3 4ef8 	movt	lr, #15608	; 0x3cf8
2000fa64:	e9c8 3000 	strd	r3, r0, [r8]
2000fa68:	e9c8 1102 	strd	r1, r1, [r8, #8]
2000fa6c:	e9c8 2406 	strd	r2, r4, [r8, #24]
2000fa70:	e9c8 4108 	strd	r4, r1, [r8, #32]
2000fa74:	f505 60a8 	add.w	r0, r5, #1344	; 0x540
2000fa78:	a9a0      	add	r1, sp, #640	; 0x280
2000fa7a:	f44f 7240 	mov.w	r2, #768	; 0x300
2000fa7e:	e9c8 ce04 	strd	ip, lr, [r8, #16]
2000fa82:	e9c8 440a 	strd	r4, r4, [r8, #40]	; 0x28
2000fa86:	f8c5 a530 	str.w	sl, [r5, #1328]	; 0x530
2000fa8a:	f8c5 6534 	str.w	r6, [r5, #1332]	; 0x534
2000fa8e:	f004 ff67 	bl	20014960 <__aeabi_memcpy8>
2000fa92:	f64f 3113 	movw	r1, #64275	; 0xfb13
2000fa96:	f244 4000 	movw	r0, #17408	; 0x4400
2000fa9a:	f6c3 7177 	movt	r1, #16247	; 0x3f77
2000fa9e:	f2c4 702c 	movt	r0, #18220	; 0x472c
2000faa2:	f8c8 1350 	str.w	r1, [r8, #848]	; 0x350
2000faa6:	f24d 014c 	movw	r1, #53324	; 0xd04c
2000faaa:	f8c8 0340 	str.w	r0, [r8, #832]	; 0x340
2000faae:	2000      	movs	r0, #0
2000fab0:	f6c3 41f8 	movt	r1, #15608	; 0x3cf8
2000fab4:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000fab8:	f8c8 1354 	str.w	r1, [r8, #852]	; 0x354
2000fabc:	f24a 613c 	movw	r1, #42556	; 0xa63c
2000fac0:	f8c8 0344 	str.w	r0, [r8, #836]	; 0x344
2000fac4:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000fac8:	f6c3 2179 	movt	r1, #14969	; 0x3a79
2000facc:	e9c8 00d2 	strd	r0, r0, [r8, #840]	; 0x348
2000fad0:	e9c8 14d6 	strd	r1, r4, [r8, #856]	; 0x358
2000fad4:	e9c8 40d8 	strd	r4, r0, [r8, #864]	; 0x360
2000fad8:	f505 6008 	add.w	r0, r5, #2176	; 0x880
2000fadc:	f50d 61b0 	add.w	r1, sp, #1408	; 0x580
2000fae0:	f44f 7240 	mov.w	r2, #768	; 0x300
2000fae4:	e9c8 44da 	strd	r4, r4, [r8, #872]	; 0x368
2000fae8:	f8c5 a870 	str.w	sl, [r5, #2160]	; 0x870
2000faec:	f8c5 6874 	str.w	r6, [r5, #2164]	; 0x874
2000faf0:	f004 ff36 	bl	20014960 <__aeabi_memcpy8>
2000faf4:	f64f 3113 	movw	r1, #64275	; 0xfb13
2000faf8:	f244 4000 	movw	r0, #17408	; 0x4400
2000fafc:	f6c3 7177 	movt	r1, #16247	; 0x3f77
2000fb00:	f2c4 702c 	movt	r0, #18220	; 0x472c
2000fb04:	f8c8 1690 	str.w	r1, [r8, #1680]	; 0x690
2000fb08:	f24d 014c 	movw	r1, #53324	; 0xd04c
2000fb0c:	f8c8 0680 	str.w	r0, [r8, #1664]	; 0x680
2000fb10:	2000      	movs	r0, #0
2000fb12:	f6c3 41f8 	movt	r1, #15608	; 0x3cf8
2000fb16:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000fb1a:	f8c8 1694 	str.w	r1, [r8, #1684]	; 0x694
2000fb1e:	f24a 613c 	movw	r1, #42556	; 0xa63c
2000fb22:	f8c8 0684 	str.w	r0, [r8, #1668]	; 0x684
2000fb26:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000fb2a:	f6c3 2179 	movt	r1, #14969	; 0x3a79
2000fb2e:	f240 0a00 	movw	sl, #0
2000fb32:	f8c8 0688 	str.w	r0, [r8, #1672]	; 0x688
2000fb36:	f8c8 068c 	str.w	r0, [r8, #1676]	; 0x68c
2000fb3a:	f8c8 1698 	str.w	r1, [r8, #1688]	; 0x698
2000fb3e:	f8c8 069c 	str.w	r0, [r8, #1692]	; 0x69c
2000fb42:	f6cb 7a80 	movt	sl, #49024	; 0xbf80
2000fb46:	f505 603c 	add.w	r0, r5, #3008	; 0xbc0
2000fb4a:	f50d 6108 	add.w	r1, sp, #2176	; 0x880
2000fb4e:	f44f 7240 	mov.w	r2, #768	; 0x300
2000fb52:	f8c8 a6a0 	str.w	sl, [r8, #1696]	; 0x6a0
2000fb56:	f8c8 a6a4 	str.w	sl, [r8, #1700]	; 0x6a4
2000fb5a:	f8c8 46a8 	str.w	r4, [r8, #1704]	; 0x6a8
2000fb5e:	f8c8 46ac 	str.w	r4, [r8, #1708]	; 0x6ac
2000fb62:	f8c5 9bb0 	str.w	r9, [r5, #2992]	; 0xbb0
2000fb66:	f8c5 6bb4 	str.w	r6, [r5, #2996]	; 0xbb4
2000fb6a:	f004 fef9 	bl	20014960 <__aeabi_memcpy8>
2000fb6e:	f64f 3113 	movw	r1, #64275	; 0xfb13
2000fb72:	f244 4000 	movw	r0, #17408	; 0x4400
2000fb76:	f6c3 7177 	movt	r1, #16247	; 0x3f77
2000fb7a:	f2c4 702c 	movt	r0, #18220	; 0x472c
2000fb7e:	f8c8 19d0 	str.w	r1, [r8, #2512]	; 0x9d0
2000fb82:	f24d 014c 	movw	r1, #53324	; 0xd04c
2000fb86:	f8c8 09c0 	str.w	r0, [r8, #2496]	; 0x9c0
2000fb8a:	2000      	movs	r0, #0
2000fb8c:	f6c3 41f8 	movt	r1, #15608	; 0x3cf8
2000fb90:	f2c4 30dc 	movt	r0, #17372	; 0x43dc
2000fb94:	f8c8 19d4 	str.w	r1, [r8, #2516]	; 0x9d4
2000fb98:	f24a 613c 	movw	r1, #42556	; 0xa63c
2000fb9c:	f8c8 09c4 	str.w	r0, [r8, #2500]	; 0x9c4
2000fba0:	f04f 507e 	mov.w	r0, #1065353216	; 0x3f800000
2000fba4:	f6c3 2179 	movt	r1, #14969	; 0x3a79
2000fba8:	f8c8 09c8 	str.w	r0, [r8, #2504]	; 0x9c8
2000fbac:	f8c8 09cc 	str.w	r0, [r8, #2508]	; 0x9cc
2000fbb0:	f8c8 19d8 	str.w	r1, [r8, #2520]	; 0x9d8
2000fbb4:	f8c8 09dc 	str.w	r0, [r8, #2524]	; 0x9dc
2000fbb8:	f505 6070 	add.w	r0, r5, #3840	; 0xf00
2000fbbc:	a920      	add	r1, sp, #128	; 0x80
2000fbbe:	f44f 7200 	mov.w	r2, #512	; 0x200
2000fbc2:	f8c8 a9e0 	str.w	sl, [r8, #2528]	; 0x9e0
2000fbc6:	f8c8 a9e4 	str.w	sl, [r8, #2532]	; 0x9e4
2000fbca:	f8c8 49e8 	str.w	r4, [r8, #2536]	; 0x9e8
2000fbce:	f8c8 49ec 	str.w	r4, [r8, #2540]	; 0x9ec
2000fbd2:	f8c5 9ef0 	str.w	r9, [r5, #3824]	; 0xef0
2000fbd6:	f8c5 6ef4 	str.w	r6, [r5, #3828]	; 0xef4
2000fbda:	46aa      	mov	sl, r5
2000fbdc:	f004 fec0 	bl	20014960 <__aeabi_memcpy8>
2000fbe0:	f649 1099 	movw	r0, #39321	; 0x9999
2000fbe4:	f6c3 70b9 	movt	r0, #16313	; 0x3fb9
2000fbe8:	f648 0280 	movw	r2, #34944	; 0x8880
2000fbec:	f04f 4120 	mov.w	r1, #2684354560	; 0xa0000000
2000fbf0:	f2c4 02e5 	movt	r2, #16613	; 0x40e5
2000fbf4:	f8c8 0c0c 	str.w	r0, [r8, #3084]	; 0xc0c
2000fbf8:	f241 1018 	movw	r0, #4376	; 0x1118
2000fbfc:	f8c8 4c00 	str.w	r4, [r8, #3072]	; 0xc00
2000fc00:	f8c8 4c04 	str.w	r4, [r8, #3076]	; 0xc04
2000fc04:	f8c8 1c08 	str.w	r1, [r8, #3080]	; 0xc08
2000fc08:	f8c8 4c10 	str.w	r4, [r8, #3088]	; 0xc10
2000fc0c:	f8c8 2c14 	str.w	r2, [r8, #3092]	; 0xc14
2000fc10:	4428      	add	r0, r5
2000fc12:	f50d 5584 	add.w	r5, sp, #4224	; 0x1080
2000fc16:	cd5e      	ldmia	r5!, {r1, r2, r3, r4, r6}
2000fc18:	f04f 0c00 	mov.w	ip, #0
2000fc1c:	c05e      	stmia	r0!, {r1, r2, r3, r4, r6}
2000fc1e:	e895 005e 	ldmia.w	r5, {r1, r2, r3, r4, r6}
2000fc22:	46d1      	mov	r9, sl
2000fc24:	c05e      	stmia	r0!, {r1, r2, r3, r4, r6}
2000fc26:	9d03      	ldr	r5, [sp, #12]
2000fc28:	f8c8 cc40 	str.w	ip, [r8, #3136]	; 0xc40
2000fc2c:	f241 1044 	movw	r0, #4420	; 0x1144
2000fc30:	e895 005e 	ldmia.w	r5, {r1, r2, r3, r4, r6}
2000fc34:	4450      	add	r0, sl
2000fc36:	c05e      	stmia	r0!, {r1, r2, r3, r4, r6}
2000fc38:	2004      	movs	r0, #4
2000fc3a:	f8c8 cc58 	str.w	ip, [r8, #3160]	; 0xc58
2000fc3e:	f8c8 0c5c 	str.w	r0, [r8, #3164]	; 0xc5c
2000fc42:	f8c8 cc60 	str.w	ip, [r8, #3168]	; 0xc60
2000fc46:	f241 1068 	movw	r0, #4456	; 0x1168
2000fc4a:	a91a      	add	r1, sp, #104	; 0x68
2000fc4c:	eb0a 0c00 	add.w	ip, sl, r0
2000fc50:	e891 007d 	ldmia.w	r1, {r0, r2, r3, r4, r5, r6}
2000fc54:	e88c 007d 	stmia.w	ip, {r0, r2, r3, r4, r5, r6}
2000fc58:	f8d8 2c50 	ldr.w	r2, [r8, #3152]	; 0xc50
2000fc5c:	f508 6440 	add.w	r4, r8, #3072	; 0xc00
2000fc60:	b122      	cbz	r2, 2000fc6c <_ZN6fundsp3run17h8f36925f4f62106eE+0x754>
2000fc62:	f608 4058 	addw	r0, r8, #3160	; 0xc58
2000fc66:	2100      	movs	r1, #0
2000fc68:	f7fc fe7e 	bl	2000c968 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hafa66ba596c3a2b2E>
2000fc6c:	9804      	ldr	r0, [sp, #16]
2000fc6e:	6800      	ldr	r0, [r0, #0]
2000fc70:	f004 ff26 	bl	20014ac0 <__aeabi_ui2d>
2000fc74:	ec41 0b18 	vmov	d8, r0, r1
2000fc78:	4648      	mov	r0, r9
2000fc7a:	eeb0 0a48 	vmov.f32	s0, s16
2000fc7e:	eef0 0a68 	vmov.f32	s1, s17
2000fc82:	464d      	mov	r5, r9
2000fc84:	f7fd fac6 	bl	2000d214 <_ZN85_$LT$fundsp..audionode..Pipe$LT$X$C$Y$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17h6b0c7d5dc341a399E>
2000fc88:	eeb0 0a48 	vmov.f32	s0, s16
2000fc8c:	4620      	mov	r0, r4
2000fc8e:	eef0 0a68 	vmov.f32	s1, s17
2000fc92:	f7fc ff01 	bl	2000ca98 <_ZN83_$LT$fundsp..dynamics..Limiter$LT$N$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17he9604a6a97fe6240E>
2000fc96:	9c14      	ldr	r4, [sp, #80]	; 0x50
2000fc98:	f645 0286 	movw	r2, #22662	; 0x5886
2000fc9c:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000fca0:	4620      	mov	r0, r4
2000fca2:	2100      	movs	r1, #0
2000fca4:	2306      	movs	r3, #6
2000fca6:	f004 f81b 	bl	20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>
2000fcaa:	f645 028c 	movw	r2, #22668	; 0x588c
2000fcae:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000fcb2:	4620      	mov	r0, r4
2000fcb4:	2101      	movs	r1, #1
2000fcb6:	2303      	movs	r3, #3
2000fcb8:	2601      	movs	r6, #1
2000fcba:	f004 f811 	bl	20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>
2000fcbe:	f645 028f 	movw	r2, #22671	; 0x588f
2000fcc2:	f2c2 0201 	movt	r2, #8193	; 0x2001
2000fcc6:	4620      	mov	r0, r4
2000fcc8:	2102      	movs	r1, #2
2000fcca:	2305      	movs	r3, #5
2000fccc:	f004 f808 	bl	20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>
2000fcd0:	e8db 0f4f 	ldrexb	r0, [fp]
2000fcd4:	2800      	cmp	r0, #0
2000fcd6:	f040 809b 	bne.w	2000fe10 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8f8>
2000fcda:	e8cb 6f40 	strexb	r0, r6, [fp]
2000fcde:	2800      	cmp	r0, #0
2000fce0:	d17a      	bne.n	2000fdd8 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8c0>
2000fce2:	f3bf 8f5f 	dmb	sy
2000fce6:	f8db 0010 	ldr.w	r0, [fp, #16]
2000fcea:	9905      	ldr	r1, [sp, #20]
2000fcec:	6388      	str	r0, [r1, #56]	; 0x38
2000fcee:	2000      	movs	r0, #0
2000fcf0:	f3bf 8f5f 	dmb	sy
2000fcf4:	f88b 0000 	strb.w	r0, [fp]
2000fcf8:	a811      	add	r0, sp, #68	; 0x44
2000fcfa:	9020      	str	r0, [sp, #128]	; 0x80
2000fcfc:	a817      	add	r0, sp, #92	; 0x5c
2000fcfe:	9021      	str	r0, [sp, #132]	; 0x84
2000fd00:	a818      	add	r0, sp, #96	; 0x60
2000fd02:	9022      	str	r0, [sp, #136]	; 0x88
2000fd04:	a819      	add	r0, sp, #100	; 0x64
2000fd06:	9023      	str	r0, [sp, #140]	; 0x8c
2000fd08:	a806      	add	r0, sp, #24
2000fd0a:	e9cd 0524 	strd	r0, r5, [sp, #144]	; 0x90
2000fd0e:	a80a      	add	r0, sp, #40	; 0x28
2000fd10:	a920      	add	r1, sp, #128	; 0x80
2000fd12:	f7fe fa49 	bl	2000e1a8 <_ZN9owl_patch14program_vector5audio21AudioBuffers$LT$F$GT$3run17hdd09b005a206d74cE>
2000fd16:	bf00      	nop
2000fd18:	f89b 0000 	ldrb.w	r0, [fp]
2000fd1c:	b170      	cbz	r0, 2000fd3c <_ZN6fundsp3run17h8f36925f4f62106eE+0x824>
2000fd1e:	bf10      	yield
2000fd20:	f89b 0000 	ldrb.w	r0, [fp]
2000fd24:	b150      	cbz	r0, 2000fd3c <_ZN6fundsp3run17h8f36925f4f62106eE+0x824>
2000fd26:	bf10      	yield
2000fd28:	f89b 0000 	ldrb.w	r0, [fp]
2000fd2c:	b130      	cbz	r0, 2000fd3c <_ZN6fundsp3run17h8f36925f4f62106eE+0x824>
2000fd2e:	bf10      	yield
2000fd30:	f89b 0000 	ldrb.w	r0, [fp]
2000fd34:	b110      	cbz	r0, 2000fd3c <_ZN6fundsp3run17h8f36925f4f62106eE+0x824>
2000fd36:	bf10      	yield
2000fd38:	e7ee      	b.n	2000fd18 <_ZN6fundsp3run17h8f36925f4f62106eE+0x800>
2000fd3a:	bf00      	nop
2000fd3c:	e8db 0f4f 	ldrexb	r0, [fp]
2000fd40:	b930      	cbnz	r0, 2000fd50 <_ZN6fundsp3run17h8f36925f4f62106eE+0x838>
2000fd42:	2001      	movs	r0, #1
2000fd44:	e8cb 0f41 	strexb	r1, r0, [fp]
2000fd48:	2900      	cmp	r1, #0
2000fd4a:	d1e5      	bne.n	2000fd18 <_ZN6fundsp3run17h8f36925f4f62106eE+0x800>
2000fd4c:	e568      	b.n	2000f820 <_ZN6fundsp3run17h8f36925f4f62106eE+0x308>
2000fd4e:	bf00      	nop
2000fd50:	f3bf 8f2f 	clrex
2000fd54:	e7e0      	b.n	2000fd18 <_ZN6fundsp3run17h8f36925f4f62106eE+0x800>
2000fd56:	bf00      	nop
2000fd58:	f89b 0000 	ldrb.w	r0, [fp]
2000fd5c:	b170      	cbz	r0, 2000fd7c <_ZN6fundsp3run17h8f36925f4f62106eE+0x864>
2000fd5e:	bf10      	yield
2000fd60:	f89b 0000 	ldrb.w	r0, [fp]
2000fd64:	b150      	cbz	r0, 2000fd7c <_ZN6fundsp3run17h8f36925f4f62106eE+0x864>
2000fd66:	bf10      	yield
2000fd68:	f89b 0000 	ldrb.w	r0, [fp]
2000fd6c:	b130      	cbz	r0, 2000fd7c <_ZN6fundsp3run17h8f36925f4f62106eE+0x864>
2000fd6e:	bf10      	yield
2000fd70:	f89b 0000 	ldrb.w	r0, [fp]
2000fd74:	b110      	cbz	r0, 2000fd7c <_ZN6fundsp3run17h8f36925f4f62106eE+0x864>
2000fd76:	bf10      	yield
2000fd78:	e7ee      	b.n	2000fd58 <_ZN6fundsp3run17h8f36925f4f62106eE+0x840>
2000fd7a:	bf00      	nop
2000fd7c:	e8db 0f4f 	ldrexb	r0, [fp]
2000fd80:	b930      	cbnz	r0, 2000fd90 <_ZN6fundsp3run17h8f36925f4f62106eE+0x878>
2000fd82:	2001      	movs	r0, #1
2000fd84:	e8cb 0f41 	strexb	r1, r0, [fp]
2000fd88:	2900      	cmp	r1, #0
2000fd8a:	d1e5      	bne.n	2000fd58 <_ZN6fundsp3run17h8f36925f4f62106eE+0x840>
2000fd8c:	e565      	b.n	2000f85a <_ZN6fundsp3run17h8f36925f4f62106eE+0x342>
2000fd8e:	bf00      	nop
2000fd90:	f3bf 8f2f 	clrex
2000fd94:	e7e0      	b.n	2000fd58 <_ZN6fundsp3run17h8f36925f4f62106eE+0x840>
2000fd96:	bf00      	nop
2000fd98:	f89b 0000 	ldrb.w	r0, [fp]
2000fd9c:	b170      	cbz	r0, 2000fdbc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8a4>
2000fd9e:	bf10      	yield
2000fda0:	f89b 0000 	ldrb.w	r0, [fp]
2000fda4:	b150      	cbz	r0, 2000fdbc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8a4>
2000fda6:	bf10      	yield
2000fda8:	f89b 0000 	ldrb.w	r0, [fp]
2000fdac:	b130      	cbz	r0, 2000fdbc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8a4>
2000fdae:	bf10      	yield
2000fdb0:	f89b 0000 	ldrb.w	r0, [fp]
2000fdb4:	b110      	cbz	r0, 2000fdbc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8a4>
2000fdb6:	bf10      	yield
2000fdb8:	e7ee      	b.n	2000fd98 <_ZN6fundsp3run17h8f36925f4f62106eE+0x880>
2000fdba:	bf00      	nop
2000fdbc:	e8db 0f4f 	ldrexb	r0, [fp]
2000fdc0:	b930      	cbnz	r0, 2000fdd0 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8b8>
2000fdc2:	2001      	movs	r0, #1
2000fdc4:	e8cb 0f41 	strexb	r1, r0, [fp]
2000fdc8:	2900      	cmp	r1, #0
2000fdca:	d1e5      	bne.n	2000fd98 <_ZN6fundsp3run17h8f36925f4f62106eE+0x880>
2000fdcc:	e61a      	b.n	2000fa04 <_ZN6fundsp3run17h8f36925f4f62106eE+0x4ec>
2000fdce:	bf00      	nop
2000fdd0:	f3bf 8f2f 	clrex
2000fdd4:	e7e0      	b.n	2000fd98 <_ZN6fundsp3run17h8f36925f4f62106eE+0x880>
2000fdd6:	bf00      	nop
2000fdd8:	f89b 0000 	ldrb.w	r0, [fp]
2000fddc:	b170      	cbz	r0, 2000fdfc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8e4>
2000fdde:	bf10      	yield
2000fde0:	f89b 0000 	ldrb.w	r0, [fp]
2000fde4:	b150      	cbz	r0, 2000fdfc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8e4>
2000fde6:	bf10      	yield
2000fde8:	f89b 0000 	ldrb.w	r0, [fp]
2000fdec:	b130      	cbz	r0, 2000fdfc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8e4>
2000fdee:	bf10      	yield
2000fdf0:	f89b 0000 	ldrb.w	r0, [fp]
2000fdf4:	b110      	cbz	r0, 2000fdfc <_ZN6fundsp3run17h8f36925f4f62106eE+0x8e4>
2000fdf6:	bf10      	yield
2000fdf8:	e7ee      	b.n	2000fdd8 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8c0>
2000fdfa:	bf00      	nop
2000fdfc:	e8db 0f4f 	ldrexb	r0, [fp]
2000fe00:	b930      	cbnz	r0, 2000fe10 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8f8>
2000fe02:	2001      	movs	r0, #1
2000fe04:	e8cb 0f41 	strexb	r1, r0, [fp]
2000fe08:	2900      	cmp	r1, #0
2000fe0a:	d1e5      	bne.n	2000fdd8 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8c0>
2000fe0c:	e769      	b.n	2000fce2 <_ZN6fundsp3run17h8f36925f4f62106eE+0x7ca>
2000fe0e:	bf00      	nop
2000fe10:	f3bf 8f2f 	clrex
2000fe14:	e7e0      	b.n	2000fdd8 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8c0>
2000fe16:	d4d4      	bmi.n	2000fdc2 <_ZN6fundsp3run17h8f36925f4f62106eE+0x8aa>

2000fe18 <__rust_alloc>:
2000fe18:	b5d0      	push	{r4, r6, r7, lr}
2000fe1a:	af02      	add	r7, sp, #8
2000fe1c:	f246 0490 	movw	r4, #24720	; 0x6090
2000fe20:	f2c2 0401 	movt	r4, #8193	; 0x2001
2000fe24:	e8d4 2f4f 	ldrexb	r2, [r4]
2000fe28:	2a00      	cmp	r2, #0
2000fe2a:	4602      	mov	r2, r0
2000fe2c:	d112      	bne.n	2000fe54 <__rust_alloc+0x3c>
2000fe2e:	2001      	movs	r0, #1
2000fe30:	e8c4 0f43 	strexb	r3, r0, [r4]
2000fe34:	b983      	cbnz	r3, 2000fe58 <__rust_alloc+0x40>
2000fe36:	4608      	mov	r0, r1
2000fe38:	4611      	mov	r1, r2
2000fe3a:	f3bf 8f5f 	dmb	sy
2000fe3e:	f7fc fa3b 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000fe42:	2100      	movs	r1, #0
2000fe44:	f3bf 8f5f 	dmb	sy
2000fe48:	7021      	strb	r1, [r4, #0]
2000fe4a:	bdd0      	pop	{r4, r6, r7, pc}
2000fe4c:	e8d4 0f4f 	ldrexb	r0, [r4]
2000fe50:	2800      	cmp	r0, #0
2000fe52:	d0ec      	beq.n	2000fe2e <__rust_alloc+0x16>
2000fe54:	f3bf 8f2f 	clrex
2000fe58:	7820      	ldrb	r0, [r4, #0]
2000fe5a:	2800      	cmp	r0, #0
2000fe5c:	d0f6      	beq.n	2000fe4c <__rust_alloc+0x34>
2000fe5e:	bf10      	yield
2000fe60:	7820      	ldrb	r0, [r4, #0]
2000fe62:	2800      	cmp	r0, #0
2000fe64:	d0f2      	beq.n	2000fe4c <__rust_alloc+0x34>
2000fe66:	bf10      	yield
2000fe68:	7820      	ldrb	r0, [r4, #0]
2000fe6a:	2800      	cmp	r0, #0
2000fe6c:	d0ee      	beq.n	2000fe4c <__rust_alloc+0x34>
2000fe6e:	bf10      	yield
2000fe70:	7820      	ldrb	r0, [r4, #0]
2000fe72:	2800      	cmp	r0, #0
2000fe74:	d0ea      	beq.n	2000fe4c <__rust_alloc+0x34>
2000fe76:	bf10      	yield
2000fe78:	7820      	ldrb	r0, [r4, #0]
2000fe7a:	2800      	cmp	r0, #0
2000fe7c:	d1ef      	bne.n	2000fe5e <__rust_alloc+0x46>
2000fe7e:	e7e5      	b.n	2000fe4c <__rust_alloc+0x34>

2000fe80 <__rust_realloc>:
2000fe80:	b5f0      	push	{r4, r5, r6, r7, lr}
2000fe82:	af03      	add	r7, sp, #12
2000fe84:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
2000fe88:	b083      	sub	sp, #12
2000fe8a:	1a5e      	subs	r6, r3, r1
2000fe8c:	bf18      	it	ne
2000fe8e:	2601      	movne	r6, #1
2000fe90:	428b      	cmp	r3, r1
2000fe92:	bf38      	it	cc
2000fe94:	f04f 36ff 	movcc.w	r6, #4294967295	; 0xffffffff
2000fe98:	2e00      	cmp	r6, #0
2000fe9a:	f000 818c 	beq.w	200101b6 <__rust_realloc+0x336>
2000fe9e:	b2f6      	uxtb	r6, r6
2000fea0:	f246 0490 	movw	r4, #24720	; 0x6090
2000fea4:	2e01      	cmp	r6, #1
2000fea6:	f2c2 0401 	movt	r4, #8193	; 0x2001
2000feaa:	d130      	bne.n	2000ff0e <__rust_realloc+0x8e>
2000feac:	e8d4 6f4f 	ldrexb	r6, [r4]
2000feb0:	b126      	cbz	r6, 2000febc <__rust_realloc+0x3c>
2000feb2:	f3bf 8f2f 	clrex
2000feb6:	7826      	ldrb	r6, [r4, #0]
2000feb8:	b94e      	cbnz	r6, 2000fece <__rust_realloc+0x4e>
2000feba:	e7f7      	b.n	2000feac <__rust_realloc+0x2c>
2000febc:	2601      	movs	r6, #1
2000febe:	e8c4 6f45 	strexb	r5, r6, [r4]
2000fec2:	2d00      	cmp	r5, #0
2000fec4:	d060      	beq.n	2000ff88 <__rust_realloc+0x108>
2000fec6:	bf00      	nop
2000fec8:	7826      	ldrb	r6, [r4, #0]
2000feca:	2e00      	cmp	r6, #0
2000fecc:	d0ee      	beq.n	2000feac <__rust_realloc+0x2c>
2000fece:	bf10      	yield
2000fed0:	7826      	ldrb	r6, [r4, #0]
2000fed2:	2e00      	cmp	r6, #0
2000fed4:	d0ea      	beq.n	2000feac <__rust_realloc+0x2c>
2000fed6:	bf10      	yield
2000fed8:	7826      	ldrb	r6, [r4, #0]
2000feda:	2e00      	cmp	r6, #0
2000fedc:	d0e6      	beq.n	2000feac <__rust_realloc+0x2c>
2000fede:	bf10      	yield
2000fee0:	7826      	ldrb	r6, [r4, #0]
2000fee2:	2e00      	cmp	r6, #0
2000fee4:	d0e2      	beq.n	2000feac <__rust_realloc+0x2c>
2000fee6:	bf10      	yield
2000fee8:	7826      	ldrb	r6, [r4, #0]
2000feea:	2e00      	cmp	r6, #0
2000feec:	d1ef      	bne.n	2000fece <__rust_realloc+0x4e>
2000feee:	e7dd      	b.n	2000feac <__rust_realloc+0x2c>
2000fef0:	7822      	ldrb	r2, [r4, #0]
2000fef2:	b162      	cbz	r2, 2000ff0e <__rust_realloc+0x8e>
2000fef4:	bf10      	yield
2000fef6:	7822      	ldrb	r2, [r4, #0]
2000fef8:	b14a      	cbz	r2, 2000ff0e <__rust_realloc+0x8e>
2000fefa:	bf10      	yield
2000fefc:	7822      	ldrb	r2, [r4, #0]
2000fefe:	b132      	cbz	r2, 2000ff0e <__rust_realloc+0x8e>
2000ff00:	bf10      	yield
2000ff02:	7822      	ldrb	r2, [r4, #0]
2000ff04:	b11a      	cbz	r2, 2000ff0e <__rust_realloc+0x8e>
2000ff06:	bf10      	yield
2000ff08:	7822      	ldrb	r2, [r4, #0]
2000ff0a:	2a00      	cmp	r2, #0
2000ff0c:	d1f2      	bne.n	2000fef4 <__rust_realloc+0x74>
2000ff0e:	e8d4 2f4f 	ldrexb	r2, [r4]
2000ff12:	b12a      	cbz	r2, 2000ff20 <__rust_realloc+0xa0>
2000ff14:	f3bf 8f2f 	clrex
2000ff18:	7822      	ldrb	r2, [r4, #0]
2000ff1a:	2a00      	cmp	r2, #0
2000ff1c:	d1ea      	bne.n	2000fef4 <__rust_realloc+0x74>
2000ff1e:	e7f6      	b.n	2000ff0e <__rust_realloc+0x8e>
2000ff20:	2201      	movs	r2, #1
2000ff22:	e8c4 2f46 	strexb	r6, r2, [r4]
2000ff26:	2e00      	cmp	r6, #0
2000ff28:	d1e2      	bne.n	2000fef0 <__rust_realloc+0x70>
2000ff2a:	1842      	adds	r2, r0, r1
2000ff2c:	3203      	adds	r2, #3
2000ff2e:	f3bf 8f5f 	dmb	sy
2000ff32:	f022 0503 	bic.w	r5, r2, #3
2000ff36:	682a      	ldr	r2, [r5, #0]
2000ff38:	42aa      	cmp	r2, r5
2000ff3a:	d902      	bls.n	2000ff42 <__rust_realloc+0xc2>
2000ff3c:	6816      	ldr	r6, [r2, #0]
2000ff3e:	4615      	mov	r5, r2
2000ff40:	4632      	mov	r2, r6
2000ff42:	18c6      	adds	r6, r0, r3
2000ff44:	f022 0803 	bic.w	r8, r2, #3
2000ff48:	3603      	adds	r6, #3
2000ff4a:	f026 0b03 	bic.w	fp, r6, #3
2000ff4e:	f108 0e08 	add.w	lr, r8, #8
2000ff52:	45de      	cmp	lr, fp
2000ff54:	bf98      	it	ls
2000ff56:	46de      	movls	lr, fp
2000ff58:	eba5 060e 	sub.w	r6, r5, lr
2000ff5c:	2e0c      	cmp	r6, #12
2000ff5e:	d361      	bcc.n	20010024 <__rust_realloc+0x1a4>
2000ff60:	0792      	lsls	r2, r2, #30
2000ff62:	f105 0c04 	add.w	ip, r5, #4
2000ff66:	f10e 0204 	add.w	r2, lr, #4
2000ff6a:	9202      	str	r2, [sp, #8]
2000ff6c:	f140 80be 	bpl.w	200100ec <__rust_realloc+0x26c>
2000ff70:	f8d5 900c 	ldr.w	r9, [r5, #12]
2000ff74:	f8cd c004 	str.w	ip, [sp, #4]
2000ff78:	f1b9 0f40 	cmp.w	r9, #64	; 0x40
2000ff7c:	d262      	bcs.n	20010044 <__rust_realloc+0x1c4>
2000ff7e:	f1a9 020c 	sub.w	r2, r9, #12
2000ff82:	ea4f 0a92 	mov.w	sl, r2, lsr #2
2000ff86:	e088      	b.n	2001009a <__rust_realloc+0x21a>
2000ff88:	1846      	adds	r6, r0, r1
2000ff8a:	3603      	adds	r6, #3
2000ff8c:	f026 0503 	bic.w	r5, r6, #3
2000ff90:	18c6      	adds	r6, r0, r3
2000ff92:	3603      	adds	r6, #3
2000ff94:	f026 0b03 	bic.w	fp, r6, #3
2000ff98:	455d      	cmp	r5, fp
2000ff9a:	f3bf 8f5f 	dmb	sy
2000ff9e:	d046      	beq.n	2001002e <__rust_realloc+0x1ae>
2000ffa0:	682e      	ldr	r6, [r5, #0]
2000ffa2:	42ae      	cmp	r6, r5
2000ffa4:	bf8e      	itee	hi
2000ffa6:	f8d6 e000 	ldrhi.w	lr, [r6]
2000ffaa:	46b6      	movls	lr, r6
2000ffac:	462e      	movls	r6, r5
2000ffae:	45b3      	cmp	fp, r6
2000ffb0:	d93a      	bls.n	20010028 <__rust_realloc+0x1a8>
2000ffb2:	ea5f 758e 	movs.w	r5, lr, lsl #30
2000ffb6:	d505      	bpl.n	2000ffc4 <__rust_realloc+0x144>
2000ffb8:	f8d6 800c 	ldr.w	r8, [r6, #12]
2000ffbc:	eb06 0c08 	add.w	ip, r6, r8
2000ffc0:	45e3      	cmp	fp, ip
2000ffc2:	d949      	bls.n	20010058 <__rust_realloc+0x1d8>
2000ffc4:	2600      	movs	r6, #0
2000ffc6:	f3bf 8f5f 	dmb	sy
2000ffca:	7026      	strb	r6, [r4, #0]
2000ffcc:	e8d4 6f4f 	ldrexb	r6, [r4]
2000ffd0:	460d      	mov	r5, r1
2000ffd2:	2e00      	cmp	r6, #0
2000ffd4:	f040 81c0 	bne.w	20010358 <__rust_realloc+0x4d8>
2000ffd8:	2101      	movs	r1, #1
2000ffda:	e8c4 1f46 	strexb	r6, r1, [r4]
2000ffde:	2e00      	cmp	r6, #0
2000ffe0:	f040 81bc 	bne.w	2001035c <__rust_realloc+0x4dc>
2000ffe4:	4606      	mov	r6, r0
2000ffe6:	4610      	mov	r0, r2
2000ffe8:	4619      	mov	r1, r3
2000ffea:	f3bf 8f5f 	dmb	sy
2000ffee:	f7fc f963 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
2000fff2:	b378      	cbz	r0, 20010054 <__rust_realloc+0x1d4>
2000fff4:	4680      	mov	r8, r0
2000fff6:	f5b5 3f80 	cmp.w	r5, #65536	; 0x10000
2000fffa:	d937      	bls.n	2001006c <__rust_realloc+0x1ec>
2000fffc:	2000      	movs	r0, #0
2000fffe:	f3bf 8f5f 	dmb	sy
20010002:	7020      	strb	r0, [r4, #0]
20010004:	4640      	mov	r0, r8
20010006:	4631      	mov	r1, r6
20010008:	462a      	mov	r2, r5
2001000a:	f004 f9d8 	bl	200143be <__aeabi_memcpy>
2001000e:	e8d4 0f4f 	ldrexb	r0, [r4]
20010012:	2800      	cmp	r0, #0
20010014:	f000 80dc 	beq.w	200101d0 <__rust_realloc+0x350>
20010018:	f3bf 8f2f 	clrex
2001001c:	4630      	mov	r0, r6
2001001e:	4629      	mov	r1, r5
20010020:	e0e4      	b.n	200101ec <__rust_realloc+0x36c>
20010022:	bf00      	nop
20010024:	46ae      	mov	lr, r5
20010026:	e0b3      	b.n	20010190 <__rust_realloc+0x310>
20010028:	bf38      	it	cc
2001002a:	f8cb 6000 	strcc.w	r6, [fp]
2001002e:	1a59      	subs	r1, r3, r1
20010030:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
20010032:	e9d4 3604 	ldrd	r3, r6, [r4, #16]
20010036:	440a      	add	r2, r1
20010038:	18c9      	adds	r1, r1, r3
2001003a:	62e2      	str	r2, [r4, #44]	; 0x2c
2001003c:	f146 0200 	adc.w	r2, r6, #0
20010040:	e0b3      	b.n	200101aa <__rust_realloc+0x32a>
20010042:	bf00      	nop
20010044:	f1b9 0f80 	cmp.w	r9, #128	; 0x80
20010048:	d218      	bcs.n	2001007c <__rust_realloc+0x1fc>
2001004a:	2205      	movs	r2, #5
2001004c:	eb02 0ad9 	add.w	sl, r2, r9, lsr #3
20010050:	e023      	b.n	2001009a <__rust_realloc+0x21a>
20010052:	bf00      	nop
20010054:	2000      	movs	r0, #0
20010056:	e0aa      	b.n	200101ae <__rust_realloc+0x32e>
20010058:	f1b8 0f40 	cmp.w	r8, #64	; 0x40
2001005c:	f080 80b0 	bcs.w	200101c0 <__rust_realloc+0x340>
20010060:	f1a8 020c 	sub.w	r2, r8, #12
20010064:	ea4f 0a92 	mov.w	sl, r2, lsr #2
20010068:	e0ed      	b.n	20010246 <__rust_realloc+0x3c6>
2001006a:	bf00      	nop
2001006c:	4640      	mov	r0, r8
2001006e:	4631      	mov	r1, r6
20010070:	462a      	mov	r2, r5
20010072:	f004 f9a4 	bl	200143be <__aeabi_memcpy>
20010076:	4629      	mov	r1, r5
20010078:	4630      	mov	r0, r6
2001007a:	e0d0      	b.n	2001021e <__rust_realloc+0x39e>
2001007c:	fab9 fa89 	clz	sl, r9
20010080:	f1ca 021e 	rsb	r2, sl, #30
20010084:	fa29 f202 	lsr.w	r2, r9, r2
20010088:	eba2 024a 	sub.w	r2, r2, sl, lsl #1
2001008c:	f102 0a43 	add.w	sl, r2, #67	; 0x43
20010090:	f1ba 0f3f 	cmp.w	sl, #63	; 0x3f
20010094:	bf28      	it	cs
20010096:	f04f 0a3f 	movcs.w	sl, #63	; 0x3f
2001009a:	e9d4 260c 	ldrd	r2, r6, [r4, #48]	; 0x30
2001009e:	eba2 0c09 	sub.w	ip, r2, r9
200100a2:	e9d5 2501 	ldrd	r2, r5, [r5, #4]
200100a6:	3e01      	subs	r6, #1
200100a8:	e9c4 c60c 	strd	ip, r6, [r4, #48]	; 0x30
200100ac:	2a00      	cmp	r2, #0
200100ae:	602a      	str	r2, [r5, #0]
200100b0:	bf18      	it	ne
200100b2:	6055      	strne	r5, [r2, #4]
200100b4:	6ca2      	ldr	r2, [r4, #72]	; 0x48
200100b6:	f852 202a 	ldr.w	r2, [r2, sl, lsl #2]
200100ba:	2a00      	cmp	r2, #0
200100bc:	e9dd c201 	ldrd	ip, r2, [sp, #4]
200100c0:	d113      	bne.n	200100ea <__rust_realloc+0x26a>
200100c2:	f1ba 0f20 	cmp.w	sl, #32
200100c6:	d207      	bcs.n	200100d8 <__rust_realloc+0x258>
200100c8:	2201      	movs	r2, #1
200100ca:	6c26      	ldr	r6, [r4, #64]	; 0x40
200100cc:	fa02 f20a 	lsl.w	r2, r2, sl
200100d0:	4072      	eors	r2, r6
200100d2:	6422      	str	r2, [r4, #64]	; 0x40
200100d4:	e008      	b.n	200100e8 <__rust_realloc+0x268>
200100d6:	bf00      	nop
200100d8:	f00a 021f 	and.w	r2, sl, #31
200100dc:	2601      	movs	r6, #1
200100de:	6c65      	ldr	r5, [r4, #68]	; 0x44
200100e0:	fa06 f202 	lsl.w	r2, r6, r2
200100e4:	406a      	eors	r2, r5
200100e6:	6462      	str	r2, [r4, #68]	; 0x44
200100e8:	9a02      	ldr	r2, [sp, #8]
200100ea:	44cc      	add	ip, r9
200100ec:	ebac 0902 	sub.w	r9, ip, r2
200100f0:	f1b9 0f40 	cmp.w	r9, #64	; 0x40
200100f4:	d204      	bcs.n	20010100 <__rust_realloc+0x280>
200100f6:	f1a9 020c 	sub.w	r2, r9, #12
200100fa:	0895      	lsrs	r5, r2, #2
200100fc:	e015      	b.n	2001012a <__rust_realloc+0x2aa>
200100fe:	bf00      	nop
20010100:	f1b9 0f80 	cmp.w	r9, #128	; 0x80
20010104:	d204      	bcs.n	20010110 <__rust_realloc+0x290>
20010106:	2205      	movs	r2, #5
20010108:	eb02 05d9 	add.w	r5, r2, r9, lsr #3
2001010c:	e00d      	b.n	2001012a <__rust_realloc+0x2aa>
2001010e:	bf00      	nop
20010110:	fab9 f289 	clz	r2, r9
20010114:	f1c2 061e 	rsb	r6, r2, #30
20010118:	fa29 f606 	lsr.w	r6, r9, r6
2001011c:	eba6 0242 	sub.w	r2, r6, r2, lsl #1
20010120:	f102 0543 	add.w	r5, r2, #67	; 0x43
20010124:	2d3f      	cmp	r5, #63	; 0x3f
20010126:	bf28      	it	cs
20010128:	253f      	movcs	r5, #63	; 0x3f
2001012a:	6ca6      	ldr	r6, [r4, #72]	; 0x48
2001012c:	f856 2025 	ldr.w	r2, [r6, r5, lsl #2]
20010130:	eb06 0a85 	add.w	sl, r6, r5, lsl #2
20010134:	b142      	cbz	r2, 20010148 <__rust_realloc+0x2c8>
20010136:	9d02      	ldr	r5, [sp, #8]
20010138:	e9ce 2a01 	strd	r2, sl, [lr, #4]
2001013c:	f8ca 5000 	str.w	r5, [sl]
20010140:	f102 0a04 	add.w	sl, r2, #4
20010144:	e014      	b.n	20010170 <__rust_realloc+0x2f0>
20010146:	bf00      	nop
20010148:	2d20      	cmp	r5, #32
2001014a:	d205      	bcs.n	20010158 <__rust_realloc+0x2d8>
2001014c:	2201      	movs	r2, #1
2001014e:	6c26      	ldr	r6, [r4, #64]	; 0x40
20010150:	40aa      	lsls	r2, r5
20010152:	4072      	eors	r2, r6
20010154:	6422      	str	r2, [r4, #64]	; 0x40
20010156:	e007      	b.n	20010168 <__rust_realloc+0x2e8>
20010158:	f005 021f 	and.w	r2, r5, #31
2001015c:	2601      	movs	r6, #1
2001015e:	6c65      	ldr	r5, [r4, #68]	; 0x44
20010160:	fa06 f202 	lsl.w	r2, r6, r2
20010164:	406a      	eors	r2, r5
20010166:	6462      	str	r2, [r4, #68]	; 0x44
20010168:	2200      	movs	r2, #0
2001016a:	9d02      	ldr	r5, [sp, #8]
2001016c:	e9ce 2a01 	strd	r2, sl, [lr, #4]
20010170:	e9d4 260c 	ldrd	r2, r6, [r4, #48]	; 0x30
20010174:	f8ca 5000 	str.w	r5, [sl]
20010178:	444a      	add	r2, r9
2001017a:	3601      	adds	r6, #1
2001017c:	e9c4 260c 	strd	r2, r6, [r4, #48]	; 0x30
20010180:	f108 0203 	add.w	r2, r8, #3
20010184:	f8ce 900c 	str.w	r9, [lr, #12]
20010188:	f84c 9c04 	str.w	r9, [ip, #-4]
2001018c:	f8ce 2000 	str.w	r2, [lr]
20010190:	45de      	cmp	lr, fp
20010192:	bf18      	it	ne
20010194:	f8cb e000 	strne.w	lr, [fp]
20010198:	1ac9      	subs	r1, r1, r3
2001019a:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
2001019c:	e9d4 3604 	ldrd	r3, r6, [r4, #16]
200101a0:	1a52      	subs	r2, r2, r1
200101a2:	1a59      	subs	r1, r3, r1
200101a4:	62e2      	str	r2, [r4, #44]	; 0x2c
200101a6:	f166 0200 	sbc.w	r2, r6, #0
200101aa:	e9c4 1204 	strd	r1, r2, [r4, #16]
200101ae:	2100      	movs	r1, #0
200101b0:	f3bf 8f5f 	dmb	sy
200101b4:	7021      	strb	r1, [r4, #0]
200101b6:	b003      	add	sp, #12
200101b8:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200101bc:	bdf0      	pop	{r4, r5, r6, r7, pc}
200101be:	bf00      	nop
200101c0:	f1b8 0f80 	cmp.w	r8, #128	; 0x80
200101c4:	d230      	bcs.n	20010228 <__rust_realloc+0x3a8>
200101c6:	2205      	movs	r2, #5
200101c8:	eb02 0ad8 	add.w	sl, r2, r8, lsr #3
200101cc:	e03b      	b.n	20010246 <__rust_realloc+0x3c6>
200101ce:	bf00      	nop
200101d0:	2001      	movs	r0, #1
200101d2:	e8c4 0f41 	strexb	r1, r0, [r4]
200101d6:	2900      	cmp	r1, #0
200101d8:	4630      	mov	r0, r6
200101da:	4629      	mov	r1, r5
200101dc:	d106      	bne.n	200101ec <__rust_realloc+0x36c>
200101de:	e01c      	b.n	2001021a <__rust_realloc+0x39a>
200101e0:	e8d4 2f4f 	ldrexb	r2, [r4]
200101e4:	b1a2      	cbz	r2, 20010210 <__rust_realloc+0x390>
200101e6:	f3bf 8f2f 	clrex
200101ea:	bf00      	nop
200101ec:	7822      	ldrb	r2, [r4, #0]
200101ee:	2a00      	cmp	r2, #0
200101f0:	d0f6      	beq.n	200101e0 <__rust_realloc+0x360>
200101f2:	bf10      	yield
200101f4:	7822      	ldrb	r2, [r4, #0]
200101f6:	2a00      	cmp	r2, #0
200101f8:	d0f2      	beq.n	200101e0 <__rust_realloc+0x360>
200101fa:	bf10      	yield
200101fc:	7822      	ldrb	r2, [r4, #0]
200101fe:	2a00      	cmp	r2, #0
20010200:	d0ee      	beq.n	200101e0 <__rust_realloc+0x360>
20010202:	bf10      	yield
20010204:	7822      	ldrb	r2, [r4, #0]
20010206:	2a00      	cmp	r2, #0
20010208:	d0ea      	beq.n	200101e0 <__rust_realloc+0x360>
2001020a:	bf10      	yield
2001020c:	e7ee      	b.n	200101ec <__rust_realloc+0x36c>
2001020e:	bf00      	nop
20010210:	2201      	movs	r2, #1
20010212:	e8c4 2f43 	strexb	r3, r2, [r4]
20010216:	2b00      	cmp	r3, #0
20010218:	d1e8      	bne.n	200101ec <__rust_realloc+0x36c>
2001021a:	f3bf 8f5f 	dmb	sy
2001021e:	f7fb ff3f 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
20010222:	4640      	mov	r0, r8
20010224:	e7c3      	b.n	200101ae <__rust_realloc+0x32e>
20010226:	bf00      	nop
20010228:	fab8 f288 	clz	r2, r8
2001022c:	f1c2 051e 	rsb	r5, r2, #30
20010230:	fa28 f505 	lsr.w	r5, r8, r5
20010234:	eba5 0242 	sub.w	r2, r5, r2, lsl #1
20010238:	f102 0a43 	add.w	sl, r2, #67	; 0x43
2001023c:	f1ba 0f3f 	cmp.w	sl, #63	; 0x3f
20010240:	bf28      	it	cs
20010242:	f04f 0a3f 	movcs.w	sl, #63	; 0x3f
20010246:	e9d4 520c 	ldrd	r5, r2, [r4, #48]	; 0x30
2001024a:	eba5 0808 	sub.w	r8, r5, r8
2001024e:	e9d6 5601 	ldrd	r5, r6, [r6, #4]
20010252:	3a01      	subs	r2, #1
20010254:	e9c4 820c 	strd	r8, r2, [r4, #48]	; 0x30
20010258:	2d00      	cmp	r5, #0
2001025a:	6035      	str	r5, [r6, #0]
2001025c:	bf18      	it	ne
2001025e:	606e      	strne	r6, [r5, #4]
20010260:	f8d4 9048 	ldr.w	r9, [r4, #72]	; 0x48
20010264:	f859 202a 	ldr.w	r2, [r9, sl, lsl #2]
20010268:	b992      	cbnz	r2, 20010290 <__rust_realloc+0x410>
2001026a:	f1ba 0f20 	cmp.w	sl, #32
2001026e:	d207      	bcs.n	20010280 <__rust_realloc+0x400>
20010270:	2201      	movs	r2, #1
20010272:	6c25      	ldr	r5, [r4, #64]	; 0x40
20010274:	fa02 f20a 	lsl.w	r2, r2, sl
20010278:	406a      	eors	r2, r5
2001027a:	6422      	str	r2, [r4, #64]	; 0x40
2001027c:	e008      	b.n	20010290 <__rust_realloc+0x410>
2001027e:	bf00      	nop
20010280:	f00a 021f 	and.w	r2, sl, #31
20010284:	2501      	movs	r5, #1
20010286:	6c66      	ldr	r6, [r4, #68]	; 0x44
20010288:	fa05 f202 	lsl.w	r2, r5, r2
2001028c:	4072      	eors	r2, r6
2001028e:	6462      	str	r2, [r4, #68]	; 0x44
20010290:	ebac 020b 	sub.w	r2, ip, fp
20010294:	2a0b      	cmp	r2, #11
20010296:	f02e 0e03 	bic.w	lr, lr, #3
2001029a:	d90d      	bls.n	200102b8 <__rust_realloc+0x438>
2001029c:	f10b 0804 	add.w	r8, fp, #4
200102a0:	ebac 0208 	sub.w	r2, ip, r8
200102a4:	f102 0a04 	add.w	sl, r2, #4
200102a8:	f1ba 0f40 	cmp.w	sl, #64	; 0x40
200102ac:	d20c      	bcs.n	200102c8 <__rust_realloc+0x448>
200102ae:	f1aa 020c 	sub.w	r2, sl, #12
200102b2:	0895      	lsrs	r5, r2, #2
200102b4:	e01d      	b.n	200102f2 <__rust_realloc+0x472>
200102b6:	bf00      	nop
200102b8:	f10e 0201 	add.w	r2, lr, #1
200102bc:	45e3      	cmp	fp, ip
200102be:	4666      	mov	r6, ip
200102c0:	f8cc 2000 	str.w	r2, [ip]
200102c4:	d144      	bne.n	20010350 <__rust_realloc+0x4d0>
200102c6:	e6b2      	b.n	2001002e <__rust_realloc+0x1ae>
200102c8:	f1ba 0f80 	cmp.w	sl, #128	; 0x80
200102cc:	d204      	bcs.n	200102d8 <__rust_realloc+0x458>
200102ce:	2205      	movs	r2, #5
200102d0:	eb02 05da 	add.w	r5, r2, sl, lsr #3
200102d4:	e00d      	b.n	200102f2 <__rust_realloc+0x472>
200102d6:	bf00      	nop
200102d8:	faba f28a 	clz	r2, sl
200102dc:	f1c2 051e 	rsb	r5, r2, #30
200102e0:	fa2a f505 	lsr.w	r5, sl, r5
200102e4:	eba5 0242 	sub.w	r2, r5, r2, lsl #1
200102e8:	f102 0543 	add.w	r5, r2, #67	; 0x43
200102ec:	2d3f      	cmp	r5, #63	; 0x3f
200102ee:	bf28      	it	cs
200102f0:	253f      	movcs	r5, #63	; 0x3f
200102f2:	f859 6025 	ldr.w	r6, [r9, r5, lsl #2]
200102f6:	eb09 0285 	add.w	r2, r9, r5, lsl #2
200102fa:	b12e      	cbz	r6, 20010308 <__rust_realloc+0x488>
200102fc:	e9cb 6201 	strd	r6, r2, [fp, #4]
20010300:	f8c2 8000 	str.w	r8, [r2]
20010304:	1d32      	adds	r2, r6, #4
20010306:	e015      	b.n	20010334 <__rust_realloc+0x4b4>
20010308:	2d20      	cmp	r5, #32
2001030a:	d207      	bcs.n	2001031c <__rust_realloc+0x49c>
2001030c:	f04f 0901 	mov.w	r9, #1
20010310:	6c26      	ldr	r6, [r4, #64]	; 0x40
20010312:	fa09 f505 	lsl.w	r5, r9, r5
20010316:	4075      	eors	r5, r6
20010318:	6425      	str	r5, [r4, #64]	; 0x40
2001031a:	e008      	b.n	2001032e <__rust_realloc+0x4ae>
2001031c:	f005 051f 	and.w	r5, r5, #31
20010320:	f04f 0901 	mov.w	r9, #1
20010324:	6c66      	ldr	r6, [r4, #68]	; 0x44
20010326:	fa09 f505 	lsl.w	r5, r9, r5
2001032a:	4075      	eors	r5, r6
2001032c:	6465      	str	r5, [r4, #68]	; 0x44
2001032e:	2500      	movs	r5, #0
20010330:	e9cb 5201 	strd	r5, r2, [fp, #4]
20010334:	f8c2 8000 	str.w	r8, [r2]
20010338:	e9d4 250c 	ldrd	r2, r5, [r4, #48]	; 0x30
2001033c:	f8cb a00c 	str.w	sl, [fp, #12]
20010340:	4452      	add	r2, sl
20010342:	1c6e      	adds	r6, r5, #1
20010344:	e9c4 260c 	strd	r2, r6, [r4, #48]	; 0x30
20010348:	f10e 0603 	add.w	r6, lr, #3
2001034c:	f8cc a000 	str.w	sl, [ip]
20010350:	f8cb 6000 	str.w	r6, [fp]
20010354:	e66b      	b.n	2001002e <__rust_realloc+0x1ae>
20010356:	bf00      	nop
20010358:	f3bf 8f2f 	clrex
2001035c:	7821      	ldrb	r1, [r4, #0]
2001035e:	b161      	cbz	r1, 2001037a <__rust_realloc+0x4fa>
20010360:	bf10      	yield
20010362:	7821      	ldrb	r1, [r4, #0]
20010364:	b149      	cbz	r1, 2001037a <__rust_realloc+0x4fa>
20010366:	bf10      	yield
20010368:	7821      	ldrb	r1, [r4, #0]
2001036a:	b131      	cbz	r1, 2001037a <__rust_realloc+0x4fa>
2001036c:	bf10      	yield
2001036e:	7821      	ldrb	r1, [r4, #0]
20010370:	b119      	cbz	r1, 2001037a <__rust_realloc+0x4fa>
20010372:	bf10      	yield
20010374:	7821      	ldrb	r1, [r4, #0]
20010376:	2900      	cmp	r1, #0
20010378:	d1f2      	bne.n	20010360 <__rust_realloc+0x4e0>
2001037a:	e8d4 1f4f 	ldrexb	r1, [r4]
2001037e:	2900      	cmp	r1, #0
20010380:	d1ea      	bne.n	20010358 <__rust_realloc+0x4d8>
20010382:	e629      	b.n	2000ffd8 <__rust_realloc+0x158>

20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>:
20010384:	b580      	push	{r7, lr}
20010386:	466f      	mov	r7, sp
20010388:	2800      	cmp	r0, #0
2001038a:	bf08      	it	eq
2001038c:	f000 f803 	bleq	20010396 <_ZN5alloc7raw_vec17capacity_overflow17h2f2db40888588023E>
20010390:	4608      	mov	r0, r1
20010392:	f001 fca1 	bl	20011cd8 <__rust_alloc_error_handler>

20010396 <_ZN5alloc7raw_vec17capacity_overflow17h2f2db40888588023E>:
20010396:	b580      	push	{r7, lr}
20010398:	466f      	mov	r7, sp
2001039a:	b086      	sub	sp, #24
2001039c:	2101      	movs	r1, #1
2001039e:	2000      	movs	r0, #0
200103a0:	9101      	str	r1, [sp, #4]
200103a2:	f645 1100 	movw	r1, #22784	; 0x5900
200103a6:	f2c2 0101 	movt	r1, #8193	; 0x2001
200103aa:	9004      	str	r0, [sp, #16]
200103ac:	9100      	str	r1, [sp, #0]
200103ae:	f645 111c 	movw	r1, #22812	; 0x591c
200103b2:	9003      	str	r0, [sp, #12]
200103b4:	2004      	movs	r0, #4
200103b6:	9002      	str	r0, [sp, #8]
200103b8:	f2c2 0101 	movt	r1, #8193	; 0x2001
200103bc:	4668      	mov	r0, sp
200103be:	f000 f92a 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

200103c2 <_ZN5alloc5alloc18handle_alloc_error17h4a68d13483ed3ec2E>:
200103c2:	b580      	push	{r7, lr}
200103c4:	466f      	mov	r7, sp
200103c6:	4608      	mov	r0, r1
200103c8:	f001 fc86 	bl	20011cd8 <__rust_alloc_error_handler>

200103cc <__rdl_oom>:
200103cc:	b580      	push	{r7, lr}
200103ce:	466f      	mov	r7, sp
200103d0:	b08a      	sub	sp, #40	; 0x28
200103d2:	9001      	str	r0, [sp, #4]
200103d4:	2000      	movs	r0, #0
200103d6:	9006      	str	r0, [sp, #24]
200103d8:	2002      	movs	r0, #2
200103da:	9003      	str	r0, [sp, #12]
200103dc:	f645 1060 	movw	r0, #22880	; 0x5960
200103e0:	f2c2 0001 	movt	r0, #8193	; 0x2001
200103e4:	9002      	str	r0, [sp, #8]
200103e6:	2001      	movs	r0, #1
200103e8:	9005      	str	r0, [sp, #20]
200103ea:	a808      	add	r0, sp, #32
200103ec:	9004      	str	r0, [sp, #16]
200103ee:	f240 60bb 	movw	r0, #1723	; 0x6bb
200103f2:	f2c2 0001 	movt	r0, #8193	; 0x2001
200103f6:	9009      	str	r0, [sp, #36]	; 0x24
200103f8:	a801      	add	r0, sp, #4
200103fa:	9008      	str	r0, [sp, #32]
200103fc:	a802      	add	r0, sp, #8
200103fe:	f001 f98f 	bl	20011720 <_ZN4core9panicking18panic_nounwind_fmt17h47c6b4851b525e00E>

20010402 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E>:
20010402:	b5f0      	push	{r4, r5, r6, r7, lr}
20010404:	af03      	add	r7, sp, #12
20010406:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
2001040a:	4682      	mov	sl, r0
2001040c:	f246 00e0 	movw	r0, #24800	; 0x60e0
20010410:	f2c2 0001 	movt	r0, #8193	; 0x2001
20010414:	f102 0801 	add.w	r8, r2, #1
20010418:	7840      	ldrb	r0, [r0, #1]
2001041a:	460e      	mov	r6, r1
2001041c:	4640      	mov	r0, r8
2001041e:	2101      	movs	r1, #1
20010420:	4615      	mov	r5, r2
20010422:	f7ff fcf9 	bl	2000fe18 <__rust_alloc>
20010426:	2800      	cmp	r0, #0
20010428:	f000 80f2 	beq.w	20010610 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x20e>
2001042c:	4631      	mov	r1, r6
2001042e:	462a      	mov	r2, r5
20010430:	4681      	mov	r9, r0
20010432:	f003 ffc4 	bl	200143be <__aeabi_memcpy>
20010436:	2d07      	cmp	r5, #7
20010438:	d828      	bhi.n	2001048c <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x8a>
2001043a:	7830      	ldrb	r0, [r6, #0]
2001043c:	2800      	cmp	r0, #0
2001043e:	d071      	beq.n	20010524 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x122>
20010440:	7870      	ldrb	r0, [r6, #1]
20010442:	2800      	cmp	r0, #0
20010444:	f000 8091 	beq.w	2001056a <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x168>
20010448:	78b0      	ldrb	r0, [r6, #2]
2001044a:	2800      	cmp	r0, #0
2001044c:	f000 809b 	beq.w	20010586 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x184>
20010450:	2d03      	cmp	r5, #3
20010452:	d039      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
20010454:	78f0      	ldrb	r0, [r6, #3]
20010456:	2800      	cmp	r0, #0
20010458:	f000 80b7 	beq.w	200105ca <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1c8>
2001045c:	2d04      	cmp	r5, #4
2001045e:	d033      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
20010460:	7930      	ldrb	r0, [r6, #4]
20010462:	2800      	cmp	r0, #0
20010464:	f000 80c4 	beq.w	200105f0 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1ee>
20010468:	2d05      	cmp	r5, #5
2001046a:	d02d      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
2001046c:	7970      	ldrb	r0, [r6, #5]
2001046e:	2800      	cmp	r0, #0
20010470:	f000 80c6 	beq.w	20010600 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1fe>
20010474:	2d06      	cmp	r5, #6
20010476:	d027      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
20010478:	79b0      	ldrb	r0, [r6, #6]
2001047a:	bb28      	cbnz	r0, 200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
2001047c:	2106      	movs	r1, #6
2001047e:	e9ca 8900 	strd	r8, r9, [sl]
20010482:	e9ca 5102 	strd	r5, r1, [sl, #8]
20010486:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
2001048a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001048c:	1cf0      	adds	r0, r6, #3
2001048e:	f020 0103 	bic.w	r1, r0, #3
20010492:	42b1      	cmp	r1, r6
20010494:	d124      	bne.n	200104e0 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xde>
20010496:	f04f 0c00 	mov.w	ip, #0
2001049a:	eb06 020c 	add.w	r2, r6, ip
2001049e:	f856 100c 	ldr.w	r1, [r6, ip]
200104a2:	f240 1300 	movw	r3, #256	; 0x100
200104a6:	6852      	ldr	r2, [r2, #4]
200104a8:	f2c0 1301 	movt	r3, #257	; 0x101
200104ac:	1a5c      	subs	r4, r3, r1
200104ae:	1a9b      	subs	r3, r3, r2
200104b0:	4321      	orrs	r1, r4
200104b2:	431a      	orrs	r2, r3
200104b4:	4011      	ands	r1, r2
200104b6:	f021 317f 	bic.w	r1, r1, #2139062143	; 0x7f7f7f7f
200104ba:	f1b1 3f80 	cmp.w	r1, #2155905152	; 0x80808080
200104be:	bf08      	it	eq
200104c0:	f04c 0c08 	orreq.w	ip, ip, #8
200104c4:	45ac      	cmp	ip, r5
200104c6:	d135      	bne.n	20010534 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x132>
200104c8:	2000      	movs	r0, #0
200104ca:	f8ca 8008 	str.w	r8, [sl, #8]
200104ce:	f809 0005 	strb.w	r0, [r9, r5]
200104d2:	f04f 4000 	mov.w	r0, #2147483648	; 0x80000000
200104d6:	e9ca 0900 	strd	r0, r9, [sl]
200104da:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200104de:	bdf0      	pop	{r4, r5, r6, r7, pc}
200104e0:	eba1 0c06 	sub.w	ip, r1, r6
200104e4:	1a72      	subs	r2, r6, r1
200104e6:	2100      	movs	r1, #0
200104e8:	5c70      	ldrb	r0, [r6, r1]
200104ea:	b1a0      	cbz	r0, 20010516 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x114>
200104ec:	1853      	adds	r3, r2, r1
200104ee:	1c58      	adds	r0, r3, #1
200104f0:	d043      	beq.n	2001057a <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x178>
200104f2:	1874      	adds	r4, r6, r1
200104f4:	7860      	ldrb	r0, [r4, #1]
200104f6:	2800      	cmp	r0, #0
200104f8:	d04d      	beq.n	20010596 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x194>
200104fa:	1c98      	adds	r0, r3, #2
200104fc:	d03d      	beq.n	2001057a <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x178>
200104fe:	78a0      	ldrb	r0, [r4, #2]
20010500:	2800      	cmp	r0, #0
20010502:	d050      	beq.n	200105a6 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1a4>
20010504:	1cd8      	adds	r0, r3, #3
20010506:	d038      	beq.n	2001057a <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x178>
20010508:	78e0      	ldrb	r0, [r4, #3]
2001050a:	2800      	cmp	r0, #0
2001050c:	d053      	beq.n	200105b6 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1b4>
2001050e:	3104      	adds	r1, #4
20010510:	5c70      	ldrb	r0, [r6, r1]
20010512:	2800      	cmp	r0, #0
20010514:	d1ea      	bne.n	200104ec <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xea>
20010516:	e9ca 8900 	strd	r8, r9, [sl]
2001051a:	e9ca 5102 	strd	r5, r1, [sl, #8]
2001051e:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20010522:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010524:	2100      	movs	r1, #0
20010526:	e9ca 8900 	strd	r8, r9, [sl]
2001052a:	e9ca 5102 	strd	r5, r1, [sl, #8]
2001052e:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20010532:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010534:	eb06 020c 	add.w	r2, r6, ip
20010538:	ebac 0305 	sub.w	r3, ip, r5
2001053c:	2100      	movs	r1, #0
2001053e:	5c56      	ldrb	r6, [r2, r1]
20010540:	2e00      	cmp	r6, #0
20010542:	d04d      	beq.n	200105e0 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1de>
20010544:	185e      	adds	r6, r3, r1
20010546:	1c74      	adds	r4, r6, #1
20010548:	d0be      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
2001054a:	1854      	adds	r4, r2, r1
2001054c:	7860      	ldrb	r0, [r4, #1]
2001054e:	b3d0      	cbz	r0, 200105c6 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1c4>
20010550:	1cb0      	adds	r0, r6, #2
20010552:	d0b9      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
20010554:	78a0      	ldrb	r0, [r4, #2]
20010556:	2800      	cmp	r0, #0
20010558:	d03f      	beq.n	200105da <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1d8>
2001055a:	1cf0      	adds	r0, r6, #3
2001055c:	d0b4      	beq.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
2001055e:	78e0      	ldrb	r0, [r4, #3]
20010560:	b3e8      	cbz	r0, 200105de <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1dc>
20010562:	3104      	adds	r1, #4
20010564:	1858      	adds	r0, r3, r1
20010566:	d1ea      	bne.n	2001053e <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x13c>
20010568:	e7ae      	b.n	200104c8 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc6>
2001056a:	2101      	movs	r1, #1
2001056c:	e9ca 8900 	strd	r8, r9, [sl]
20010570:	e9ca 5102 	strd	r5, r1, [sl, #8]
20010574:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20010578:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001057a:	f1a5 0108 	sub.w	r1, r5, #8
2001057e:	458c      	cmp	ip, r1
20010580:	f67f af8b 	bls.w	2001049a <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x98>
20010584:	e79e      	b.n	200104c4 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0xc2>
20010586:	2102      	movs	r1, #2
20010588:	e9ca 8900 	strd	r8, r9, [sl]
2001058c:	e9ca 5102 	strd	r5, r1, [sl, #8]
20010590:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20010594:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010596:	3101      	adds	r1, #1
20010598:	e9ca 8900 	strd	r8, r9, [sl]
2001059c:	e9ca 5102 	strd	r5, r1, [sl, #8]
200105a0:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200105a4:	bdf0      	pop	{r4, r5, r6, r7, pc}
200105a6:	3102      	adds	r1, #2
200105a8:	e9ca 8900 	strd	r8, r9, [sl]
200105ac:	e9ca 5102 	strd	r5, r1, [sl, #8]
200105b0:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200105b4:	bdf0      	pop	{r4, r5, r6, r7, pc}
200105b6:	3103      	adds	r1, #3
200105b8:	e9ca 8900 	strd	r8, r9, [sl]
200105bc:	e9ca 5102 	strd	r5, r1, [sl, #8]
200105c0:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200105c4:	bdf0      	pop	{r4, r5, r6, r7, pc}
200105c6:	3101      	adds	r1, #1
200105c8:	e00a      	b.n	200105e0 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1de>
200105ca:	2103      	movs	r1, #3
200105cc:	e9ca 8900 	strd	r8, r9, [sl]
200105d0:	e9ca 5102 	strd	r5, r1, [sl, #8]
200105d4:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200105d8:	bdf0      	pop	{r4, r5, r6, r7, pc}
200105da:	3102      	adds	r1, #2
200105dc:	e000      	b.n	200105e0 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E+0x1de>
200105de:	3103      	adds	r1, #3
200105e0:	4461      	add	r1, ip
200105e2:	e9ca 8900 	strd	r8, r9, [sl]
200105e6:	e9ca 5102 	strd	r5, r1, [sl, #8]
200105ea:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200105ee:	bdf0      	pop	{r4, r5, r6, r7, pc}
200105f0:	2104      	movs	r1, #4
200105f2:	e9ca 8900 	strd	r8, r9, [sl]
200105f6:	e9ca 5102 	strd	r5, r1, [sl, #8]
200105fa:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200105fe:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010600:	2105      	movs	r1, #5
20010602:	e9ca 8900 	strd	r8, r9, [sl]
20010606:	e9ca 5102 	strd	r5, r1, [sl, #8]
2001060a:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
2001060e:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010610:	4640      	mov	r0, r8
20010612:	f001 fb61 	bl	20011cd8 <__rust_alloc_error_handler>

20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>:
20010616:	b580      	push	{r7, lr}
20010618:	466f      	mov	r7, sp
2001061a:	b088      	sub	sp, #32
2001061c:	e890 4174 	ldmia.w	r0, {r2, r4, r5, r6, r8, lr}
20010620:	46ec      	mov	ip, sp
20010622:	4663      	mov	r3, ip
20010624:	2001      	movs	r0, #1
20010626:	e883 4174 	stmia.w	r3, {r2, r4, r5, r6, r8, lr}
2001062a:	f8ad 001c 	strh.w	r0, [sp, #28]
2001062e:	4660      	mov	r0, ip
20010630:	9106      	str	r1, [sp, #24]
20010632:	f003 fe0f 	bl	20014254 <rust_begin_unwind>

20010636 <_ZN4core5slice5index26slice_start_index_len_fail17h51498c6c96bae4bbE>:
20010636:	b580      	push	{r7, lr}
20010638:	466f      	mov	r7, sp
2001063a:	b08c      	sub	sp, #48	; 0x30
2001063c:	9000      	str	r0, [sp, #0]
2001063e:	2080      	movs	r0, #128	; 0x80
20010640:	9001      	str	r0, [sp, #4]
20010642:	2000      	movs	r0, #0
20010644:	f645 4148 	movw	r1, #23624	; 0x5c48
20010648:	9006      	str	r0, [sp, #24]
2001064a:	2002      	movs	r0, #2
2001064c:	f2c2 0101 	movt	r1, #8193	; 0x2001
20010650:	9003      	str	r0, [sp, #12]
20010652:	9005      	str	r0, [sp, #20]
20010654:	a808      	add	r0, sp, #32
20010656:	9102      	str	r1, [sp, #8]
20010658:	a901      	add	r1, sp, #4
2001065a:	9004      	str	r0, [sp, #16]
2001065c:	f240 60bb 	movw	r0, #1723	; 0x6bb
20010660:	f2c2 0001 	movt	r0, #8193	; 0x2001
20010664:	e9cd 0109 	strd	r0, r1, [sp, #36]	; 0x24
20010668:	f645 3138 	movw	r1, #23352	; 0x5b38
2001066c:	900b      	str	r0, [sp, #44]	; 0x2c
2001066e:	4668      	mov	r0, sp
20010670:	9008      	str	r0, [sp, #32]
20010672:	a802      	add	r0, sp, #8
20010674:	f2c2 0101 	movt	r1, #8193	; 0x2001
20010678:	f7ff ffcd 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

2001067c <_ZN4core9panicking18panic_bounds_check17h742a559b220316ccE>:
2001067c:	b580      	push	{r7, lr}
2001067e:	466f      	mov	r7, sp
20010680:	b08c      	sub	sp, #48	; 0x30
20010682:	e9cd 0100 	strd	r0, r1, [sp]
20010686:	2000      	movs	r0, #0
20010688:	9006      	str	r0, [sp, #24]
2001068a:	2002      	movs	r0, #2
2001068c:	f645 212c 	movw	r1, #23084	; 0x5a2c
20010690:	9003      	str	r0, [sp, #12]
20010692:	9005      	str	r0, [sp, #20]
20010694:	a808      	add	r0, sp, #32
20010696:	f2c2 0101 	movt	r1, #8193	; 0x2001
2001069a:	9004      	str	r0, [sp, #16]
2001069c:	f240 60bb 	movw	r0, #1723	; 0x6bb
200106a0:	9102      	str	r1, [sp, #8]
200106a2:	f2c2 0001 	movt	r0, #8193	; 0x2001
200106a6:	4669      	mov	r1, sp
200106a8:	e9cd 0109 	strd	r0, r1, [sp, #36]	; 0x24
200106ac:	4611      	mov	r1, r2
200106ae:	900b      	str	r0, [sp, #44]	; 0x2c
200106b0:	a801      	add	r0, sp, #4
200106b2:	9008      	str	r0, [sp, #32]
200106b4:	a802      	add	r0, sp, #8
200106b6:	f7ff ffae 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

200106ba <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE>:
200106ba:	b5f0      	push	{r4, r5, r6, r7, lr}
200106bc:	af03      	add	r7, sp, #12
200106be:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
200106c2:	b08d      	sub	sp, #52	; 0x34
200106c4:	6804      	ldr	r4, [r0, #0]
200106c6:	f242 7010 	movw	r0, #10000	; 0x2710
200106ca:	460d      	mov	r5, r1
200106cc:	f64f 7e9c 	movw	lr, #65436	; 0xff9c
200106d0:	4284      	cmp	r4, r0
200106d2:	f645 304a 	movw	r0, #23370	; 0x5b4a
200106d6:	f2c2 0001 	movt	r0, #8193	; 0x2001
200106da:	d33c      	bcc.n	20010756 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0x9c>
200106dc:	f241 7859 	movw	r8, #5977	; 0x1759
200106e0:	f24e 02ff 	movw	r2, #57599	; 0xe0ff
200106e4:	f1a7 0b43 	sub.w	fp, r7, #67	; 0x43
200106e8:	2100      	movs	r1, #0
200106ea:	f2cd 18b7 	movt	r8, #53687	; 0xd1b7
200106ee:	f64d 09f0 	movw	r9, #55536	; 0xd8f0
200106f2:	f241 4a7b 	movw	sl, #5243	; 0x147b
200106f6:	f2c0 52f5 	movt	r2, #1525	; 0x5f5
200106fa:	9502      	str	r5, [sp, #8]
200106fc:	fba4 3508 	umull	r3, r5, r4, r8
20010700:	eb0b 0c01 	add.w	ip, fp, r1
20010704:	3904      	subs	r1, #4
20010706:	4294      	cmp	r4, r2
20010708:	ea4f 3355 	mov.w	r3, r5, lsr #13
2001070c:	fb03 4509 	mla	r5, r3, r9, r4
20010710:	461c      	mov	r4, r3
20010712:	b2ae      	uxth	r6, r5
20010714:	ea4f 0696 	mov.w	r6, r6, lsr #2
20010718:	fb06 f60a 	mul.w	r6, r6, sl
2001071c:	ea4f 4656 	mov.w	r6, r6, lsr #17
20010720:	fb06 550e 	mla	r5, r6, lr, r5
20010724:	f830 6016 	ldrh.w	r6, [r0, r6, lsl #1]
20010728:	f8ac 6023 	strh.w	r6, [ip, #35]	; 0x23
2001072c:	b2ad      	uxth	r5, r5
2001072e:	f830 5015 	ldrh.w	r5, [r0, r5, lsl #1]
20010732:	f8ac 5025 	strh.w	r5, [ip, #37]	; 0x25
20010736:	d8e1      	bhi.n	200106fc <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0x42>
20010738:	9d02      	ldr	r5, [sp, #8]
2001073a:	3127      	adds	r1, #39	; 0x27
2001073c:	461c      	mov	r4, r3
2001073e:	2c63      	cmp	r4, #99	; 0x63
20010740:	d80c      	bhi.n	2001075c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0xa2>
20010742:	4622      	mov	r2, r4
20010744:	2a0a      	cmp	r2, #10
20010746:	d31a      	bcc.n	2001077e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0xc4>
20010748:	f830 0012 	ldrh.w	r0, [r0, r2, lsl #1]
2001074c:	3902      	subs	r1, #2
2001074e:	f1a7 0243 	sub.w	r2, r7, #67	; 0x43
20010752:	5250      	strh	r0, [r2, r1]
20010754:	e019      	b.n	2001078a <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0xd0>
20010756:	2127      	movs	r1, #39	; 0x27
20010758:	2c63      	cmp	r4, #99	; 0x63
2001075a:	d9f2      	bls.n	20010742 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0x88>
2001075c:	b2a2      	uxth	r2, r4
2001075e:	f241 437b 	movw	r3, #5243	; 0x147b
20010762:	0892      	lsrs	r2, r2, #2
20010764:	3902      	subs	r1, #2
20010766:	435a      	muls	r2, r3
20010768:	f1a7 0643 	sub.w	r6, r7, #67	; 0x43
2001076c:	0c52      	lsrs	r2, r2, #17
2001076e:	fb02 430e 	mla	r3, r2, lr, r4
20010772:	b29b      	uxth	r3, r3
20010774:	f830 3013 	ldrh.w	r3, [r0, r3, lsl #1]
20010778:	5273      	strh	r3, [r6, r1]
2001077a:	2a0a      	cmp	r2, #10
2001077c:	d2e4      	bcs.n	20010748 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE+0x8e>
2001077e:	3901      	subs	r1, #1
20010780:	f042 0030 	orr.w	r0, r2, #48	; 0x30
20010784:	f1a7 0243 	sub.w	r2, r7, #67	; 0x43
20010788:	5450      	strb	r0, [r2, r1]
2001078a:	f1c1 0027 	rsb	r0, r1, #39	; 0x27
2001078e:	9000      	str	r0, [sp, #0]
20010790:	f1a7 0043 	sub.w	r0, r7, #67	; 0x43
20010794:	2200      	movs	r2, #0
20010796:	1843      	adds	r3, r0, r1
20010798:	4628      	mov	r0, r5
2001079a:	2101      	movs	r1, #1
2001079c:	f000 f804 	bl	200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>
200107a0:	b00d      	add	sp, #52	; 0x34
200107a2:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200107a6:	bdf0      	pop	{r4, r5, r6, r7, pc}

200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>:
200107a8:	b5f0      	push	{r4, r5, r6, r7, lr}
200107aa:	af03      	add	r7, sp, #12
200107ac:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
200107b0:	b085      	sub	sp, #20
200107b2:	460c      	mov	r4, r1
200107b4:	69c1      	ldr	r1, [r0, #28]
200107b6:	f8d7 8008 	ldr.w	r8, [r7, #8]
200107ba:	4693      	mov	fp, r2
200107bc:	f011 0201 	ands.w	r2, r1, #1
200107c0:	f04f 0a2b 	mov.w	sl, #43	; 0x2b
200107c4:	eb02 0508 	add.w	r5, r2, r8
200107c8:	bf08      	it	eq
200107ca:	f44f 1a88 	moveq.w	sl, #1114112	; 0x110000
200107ce:	4699      	mov	r9, r3
200107d0:	074a      	lsls	r2, r1, #29
200107d2:	d412      	bmi.n	200107fa <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x52>
200107d4:	2400      	movs	r4, #0
200107d6:	6802      	ldr	r2, [r0, #0]
200107d8:	bb7a      	cbnz	r2, 2001083a <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x92>
200107da:	e9d0 5605 	ldrd	r5, r6, [r0, #20]
200107de:	4652      	mov	r2, sl
200107e0:	4631      	mov	r1, r6
200107e2:	4623      	mov	r3, r4
200107e4:	f8cd b000 	str.w	fp, [sp]
200107e8:	4628      	mov	r0, r5
200107ea:	f000 f8e0 	bl	200109ae <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E>
200107ee:	b1d0      	cbz	r0, 20010826 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x7e>
200107f0:	2001      	movs	r0, #1
200107f2:	b005      	add	sp, #20
200107f4:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200107f8:	bdf0      	pop	{r4, r5, r6, r7, pc}
200107fa:	f1bb 0f00 	cmp.w	fp, #0
200107fe:	d016      	beq.n	2001082e <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x86>
20010800:	f01b 0303 	ands.w	r3, fp, #3
20010804:	d015      	beq.n	20010832 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x8a>
20010806:	f994 6000 	ldrsb.w	r6, [r4]
2001080a:	2200      	movs	r2, #0
2001080c:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010810:	bfc8      	it	gt
20010812:	2201      	movgt	r2, #1
20010814:	2b01      	cmp	r3, #1
20010816:	d00c      	beq.n	20010832 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x8a>
20010818:	f994 3001 	ldrsb.w	r3, [r4, #1]
2001081c:	f113 0f41 	cmn.w	r3, #65	; 0x41
20010820:	bfc8      	it	gt
20010822:	3201      	addgt	r2, #1
20010824:	e005      	b.n	20010832 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x8a>
20010826:	68f3      	ldr	r3, [r6, #12]
20010828:	4628      	mov	r0, r5
2001082a:	4649      	mov	r1, r9
2001082c:	e05a      	b.n	200108e4 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x13c>
2001082e:	2200      	movs	r2, #0
20010830:	e7ff      	b.n	20010832 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x8a>
20010832:	4415      	add	r5, r2
20010834:	6802      	ldr	r2, [r0, #0]
20010836:	2a00      	cmp	r2, #0
20010838:	d0cf      	beq.n	200107da <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x32>
2001083a:	f8cd 9010 	str.w	r9, [sp, #16]
2001083e:	f8d0 9004 	ldr.w	r9, [r0, #4]
20010842:	45a9      	cmp	r9, r5
20010844:	d910      	bls.n	20010868 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0xc0>
20010846:	0709      	lsls	r1, r1, #28
20010848:	f8cd 800c 	str.w	r8, [sp, #12]
2001084c:	d41c      	bmi.n	20010888 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0xe0>
2001084e:	f890 1020 	ldrb.w	r1, [r0, #32]
20010852:	eba9 0905 	sub.w	r9, r9, r5
20010856:	9402      	str	r4, [sp, #8]
20010858:	e8df f001 	tbb	[pc, r1]
2001085c:	0256025c 	subseq	r0, r6, #92, 4	; 0xc0000005
20010860:	4649      	mov	r1, r9
20010862:	f04f 0900 	mov.w	r9, #0
20010866:	e055      	b.n	20010914 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x16c>
20010868:	e9d0 5605 	ldrd	r5, r6, [r0, #20]
2001086c:	4652      	mov	r2, sl
2001086e:	4631      	mov	r1, r6
20010870:	4623      	mov	r3, r4
20010872:	f8cd b000 	str.w	fp, [sp]
20010876:	4628      	mov	r0, r5
20010878:	f000 f899 	bl	200109ae <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E>
2001087c:	b378      	cbz	r0, 200108de <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x136>
2001087e:	2001      	movs	r0, #1
20010880:	b005      	add	sp, #20
20010882:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20010886:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010888:	6901      	ldr	r1, [r0, #16]
2001088a:	4623      	mov	r3, r4
2001088c:	e9d0 8605 	ldrd	r8, r6, [r0, #20]
20010890:	4652      	mov	r2, sl
20010892:	9101      	str	r1, [sp, #4]
20010894:	2130      	movs	r1, #48	; 0x30
20010896:	6101      	str	r1, [r0, #16]
20010898:	2101      	movs	r1, #1
2001089a:	f890 4020 	ldrb.w	r4, [r0, #32]
2001089e:	f880 1020 	strb.w	r1, [r0, #32]
200108a2:	4631      	mov	r1, r6
200108a4:	9002      	str	r0, [sp, #8]
200108a6:	4640      	mov	r0, r8
200108a8:	f8cd b000 	str.w	fp, [sp]
200108ac:	f000 f87f 	bl	200109ae <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E>
200108b0:	4601      	mov	r1, r0
200108b2:	2001      	movs	r0, #1
200108b4:	2900      	cmp	r1, #0
200108b6:	d19c      	bne.n	200107f2 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x4a>
200108b8:	f8dd a010 	ldr.w	sl, [sp, #16]
200108bc:	eba9 0005 	sub.w	r0, r9, r5
200108c0:	46a3      	mov	fp, r4
200108c2:	1c44      	adds	r4, r0, #1
200108c4:	3c01      	subs	r4, #1
200108c6:	d014      	beq.n	200108f2 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x14a>
200108c8:	6932      	ldr	r2, [r6, #16]
200108ca:	4640      	mov	r0, r8
200108cc:	2130      	movs	r1, #48	; 0x30
200108ce:	4790      	blx	r2
200108d0:	2800      	cmp	r0, #0
200108d2:	d0f7      	beq.n	200108c4 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x11c>
200108d4:	2001      	movs	r0, #1
200108d6:	b005      	add	sp, #20
200108d8:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200108dc:	bdf0      	pop	{r4, r5, r6, r7, pc}
200108de:	68f3      	ldr	r3, [r6, #12]
200108e0:	4628      	mov	r0, r5
200108e2:	9904      	ldr	r1, [sp, #16]
200108e4:	4642      	mov	r2, r8
200108e6:	b005      	add	sp, #20
200108e8:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200108ec:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
200108f0:	4718      	bx	r3
200108f2:	68f3      	ldr	r3, [r6, #12]
200108f4:	4640      	mov	r0, r8
200108f6:	9a03      	ldr	r2, [sp, #12]
200108f8:	4651      	mov	r1, sl
200108fa:	4798      	blx	r3
200108fc:	b3b8      	cbz	r0, 2001096e <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x1c6>
200108fe:	2001      	movs	r0, #1
20010900:	b005      	add	sp, #20
20010902:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20010906:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010908:	f109 0201 	add.w	r2, r9, #1
2001090c:	ea4f 0159 	mov.w	r1, r9, lsr #1
20010910:	ea4f 0952 	mov.w	r9, r2, lsr #1
20010914:	e9d0 6504 	ldrd	r6, r5, [r0, #16]
20010918:	1c4c      	adds	r4, r1, #1
2001091a:	f8d0 8018 	ldr.w	r8, [r0, #24]
2001091e:	3c01      	subs	r4, #1
20010920:	d00b      	beq.n	2001093a <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x192>
20010922:	f8d8 2010 	ldr.w	r2, [r8, #16]
20010926:	4628      	mov	r0, r5
20010928:	4631      	mov	r1, r6
2001092a:	4790      	blx	r2
2001092c:	2800      	cmp	r0, #0
2001092e:	d0f6      	beq.n	2001091e <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x176>
20010930:	2001      	movs	r0, #1
20010932:	b005      	add	sp, #20
20010934:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20010938:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001093a:	f8cd b000 	str.w	fp, [sp]
2001093e:	4628      	mov	r0, r5
20010940:	9b02      	ldr	r3, [sp, #8]
20010942:	4641      	mov	r1, r8
20010944:	4652      	mov	r2, sl
20010946:	f000 f832 	bl	200109ae <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E>
2001094a:	b120      	cbz	r0, 20010956 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x1ae>
2001094c:	2001      	movs	r0, #1
2001094e:	b005      	add	sp, #20
20010950:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20010954:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010956:	f8d8 300c 	ldr.w	r3, [r8, #12]
2001095a:	4628      	mov	r0, r5
2001095c:	e9dd 2103 	ldrd	r2, r1, [sp, #12]
20010960:	4798      	blx	r3
20010962:	b170      	cbz	r0, 20010982 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x1da>
20010964:	2001      	movs	r0, #1
20010966:	b005      	add	sp, #20
20010968:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2001096c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001096e:	9802      	ldr	r0, [sp, #8]
20010970:	9901      	ldr	r1, [sp, #4]
20010972:	f880 b020 	strb.w	fp, [r0, #32]
20010976:	6101      	str	r1, [r0, #16]
20010978:	2000      	movs	r0, #0
2001097a:	b005      	add	sp, #20
2001097c:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20010980:	bdf0      	pop	{r4, r5, r6, r7, pc}
20010982:	2400      	movs	r4, #0
20010984:	45a1      	cmp	r9, r4
20010986:	d009      	beq.n	2001099c <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x1f4>
20010988:	f8d8 2010 	ldr.w	r2, [r8, #16]
2001098c:	4628      	mov	r0, r5
2001098e:	4631      	mov	r1, r6
20010990:	4790      	blx	r2
20010992:	3401      	adds	r4, #1
20010994:	2800      	cmp	r0, #0
20010996:	d0f5      	beq.n	20010984 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x1dc>
20010998:	1e61      	subs	r1, r4, #1
2001099a:	e000      	b.n	2001099e <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE+0x1f6>
2001099c:	4649      	mov	r1, r9
2001099e:	2000      	movs	r0, #0
200109a0:	4549      	cmp	r1, r9
200109a2:	bf38      	it	cc
200109a4:	2001      	movcc	r0, #1
200109a6:	b005      	add	sp, #20
200109a8:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200109ac:	bdf0      	pop	{r4, r5, r6, r7, pc}

200109ae <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E>:
200109ae:	b5f0      	push	{r4, r5, r6, r7, lr}
200109b0:	af03      	add	r7, sp, #12
200109b2:	f84d 8d04 	str.w	r8, [sp, #-4]!
200109b6:	f8d7 8008 	ldr.w	r8, [r7, #8]
200109ba:	461c      	mov	r4, r3
200109bc:	460e      	mov	r6, r1
200109be:	f5b2 1f88 	cmp.w	r2, #1114112	; 0x110000
200109c2:	d00a      	beq.n	200109da <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E+0x2c>
200109c4:	6933      	ldr	r3, [r6, #16]
200109c6:	4611      	mov	r1, r2
200109c8:	4605      	mov	r5, r0
200109ca:	4798      	blx	r3
200109cc:	4601      	mov	r1, r0
200109ce:	4628      	mov	r0, r5
200109d0:	b119      	cbz	r1, 200109da <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E+0x2c>
200109d2:	2001      	movs	r0, #1
200109d4:	f85d 8b04 	ldr.w	r8, [sp], #4
200109d8:	bdf0      	pop	{r4, r5, r6, r7, pc}
200109da:	b13c      	cbz	r4, 200109ec <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h67adb46d81be32a9E+0x3e>
200109dc:	68f3      	ldr	r3, [r6, #12]
200109de:	4621      	mov	r1, r4
200109e0:	4642      	mov	r2, r8
200109e2:	f85d 8b04 	ldr.w	r8, [sp], #4
200109e6:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
200109ea:	4718      	bx	r3
200109ec:	2000      	movs	r0, #0
200109ee:	f85d 8b04 	ldr.w	r8, [sp], #4
200109f2:	bdf0      	pop	{r4, r5, r6, r7, pc}

200109f4 <_ZN4core9panicking5panic17hecf8dc16aef0cc30E>:
200109f4:	b580      	push	{r7, lr}
200109f6:	466f      	mov	r7, sp
200109f8:	b088      	sub	sp, #32
200109fa:	4694      	mov	ip, r2
200109fc:	2201      	movs	r2, #1
200109fe:	9201      	str	r2, [sp, #4]
20010a00:	aa06      	add	r2, sp, #24
20010a02:	2300      	movs	r3, #0
20010a04:	e9cd 0106 	strd	r0, r1, [sp, #24]
20010a08:	9200      	str	r2, [sp, #0]
20010a0a:	2204      	movs	r2, #4
20010a0c:	4668      	mov	r0, sp
20010a0e:	4661      	mov	r1, ip
20010a10:	9304      	str	r3, [sp, #16]
20010a12:	9303      	str	r3, [sp, #12]
20010a14:	9202      	str	r2, [sp, #8]
20010a16:	f7ff fdfe 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

20010a1a <_ZN4core9panicking19assert_failed_inner17h6552fb528287fcd7E>:
20010a1a:	b580      	push	{r7, lr}
20010a1c:	466f      	mov	r7, sp
20010a1e:	b09a      	sub	sp, #104	; 0x68
20010a20:	f245 63c0 	movw	r3, #22208	; 0x56c0
20010a24:	f2c2 0301 	movt	r3, #8193	; 0x2001
20010a28:	e9cd 0300 	strd	r0, r3, [sp]
20010a2c:	2002      	movs	r0, #2
20010a2e:	9005      	str	r0, [sp, #20]
20010a30:	6810      	ldr	r0, [r2, #0]
20010a32:	e9cd 1302 	strd	r1, r3, [sp, #8]
20010a36:	f645 213c 	movw	r1, #23100	; 0x5a3c
20010a3a:	f2c2 0101 	movt	r1, #8193	; 0x2001
20010a3e:	9104      	str	r1, [sp, #16]
20010a40:	b9b0      	cbnz	r0, 20010a70 <_ZN4core9panicking19assert_failed_inner17h6552fb528287fcd7E+0x56>
20010a42:	2000      	movs	r0, #0
20010a44:	f645 21a0 	movw	r1, #23200	; 0x5aa0
20010a48:	9018      	str	r0, [sp, #96]	; 0x60
20010a4a:	2003      	movs	r0, #3
20010a4c:	f2c2 0101 	movt	r1, #8193	; 0x2001
20010a50:	9015      	str	r0, [sp, #84]	; 0x54
20010a52:	9017      	str	r0, [sp, #92]	; 0x5c
20010a54:	a80c      	add	r0, sp, #48	; 0x30
20010a56:	9114      	str	r1, [sp, #80]	; 0x50
20010a58:	a902      	add	r1, sp, #8
20010a5a:	9016      	str	r0, [sp, #88]	; 0x58
20010a5c:	f241 10cf 	movw	r0, #4559	; 0x11cf
20010a60:	f2c2 0001 	movt	r0, #8193	; 0x2001
20010a64:	9011      	str	r0, [sp, #68]	; 0x44
20010a66:	e9cd 010f 	strd	r0, r1, [sp, #60]	; 0x3c
20010a6a:	4668      	mov	r0, sp
20010a6c:	900e      	str	r0, [sp, #56]	; 0x38
20010a6e:	e022      	b.n	20010ab6 <_ZN4core9panicking19assert_failed_inner17h6552fb528287fcd7E+0x9c>
20010a70:	f10d 0c18 	add.w	ip, sp, #24
20010a74:	e892 4079 	ldmia.w	r2, {r0, r3, r4, r5, r6, lr}
20010a78:	4661      	mov	r1, ip
20010a7a:	e881 4079 	stmia.w	r1, {r0, r3, r4, r5, r6, lr}
20010a7e:	2000      	movs	r0, #0
20010a80:	f645 21c4 	movw	r1, #23236	; 0x5ac4
20010a84:	9018      	str	r0, [sp, #96]	; 0x60
20010a86:	2004      	movs	r0, #4
20010a88:	f2c2 0101 	movt	r1, #8193	; 0x2001
20010a8c:	9015      	str	r0, [sp, #84]	; 0x54
20010a8e:	9017      	str	r0, [sp, #92]	; 0x5c
20010a90:	a80c      	add	r0, sp, #48	; 0x30
20010a92:	9114      	str	r1, [sp, #80]	; 0x50
20010a94:	a902      	add	r1, sp, #8
20010a96:	9016      	str	r0, [sp, #88]	; 0x58
20010a98:	f241 10cf 	movw	r0, #4559	; 0x11cf
20010a9c:	f2c2 0001 	movt	r0, #8193	; 0x2001
20010aa0:	9013      	str	r0, [sp, #76]	; 0x4c
20010aa2:	e9cd 0111 	strd	r0, r1, [sp, #68]	; 0x44
20010aa6:	4668      	mov	r0, sp
20010aa8:	9010      	str	r0, [sp, #64]	; 0x40
20010aaa:	f241 10d7 	movw	r0, #4567	; 0x11d7
20010aae:	f2c2 0001 	movt	r0, #8193	; 0x2001
20010ab2:	e9cd c00e 	strd	ip, r0, [sp, #56]	; 0x38
20010ab6:	f640 20d5 	movw	r0, #2773	; 0xad5
20010aba:	f245 61b0 	movw	r1, #22192	; 0x56b0
20010abe:	f2c2 0001 	movt	r0, #8193	; 0x2001
20010ac2:	f2c2 0101 	movt	r1, #8193	; 0x2001
20010ac6:	900d      	str	r0, [sp, #52]	; 0x34
20010ac8:	a804      	add	r0, sp, #16
20010aca:	900c      	str	r0, [sp, #48]	; 0x30
20010acc:	a814      	add	r0, sp, #80	; 0x50
20010ace:	f7ff fda2 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>
20010ad2:	d4d4      	bmi.n	20010a7e <_ZN4core9panicking19assert_failed_inner17h6552fb528287fcd7E+0x64>

20010ad4 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E>:
20010ad4:	b5f0      	push	{r4, r5, r6, r7, lr}
20010ad6:	af03      	add	r7, sp, #12
20010ad8:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20010adc:	b087      	sub	sp, #28
20010ade:	f8d1 c000 	ldr.w	ip, [r1]
20010ae2:	688b      	ldr	r3, [r1, #8]
20010ae4:	e9d0 b200 	ldrd	fp, r2, [r0]
20010ae8:	f1bc 0f00 	cmp.w	ip, #0
20010aec:	bf08      	it	eq
20010aee:	ea5f 70c3 	movseq.w	r0, r3, lsl #31
20010af2:	d00a      	beq.n	20010b0a <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x36>
20010af4:	07d8      	lsls	r0, r3, #31
20010af6:	d037      	beq.n	20010b68 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x94>
20010af8:	68ce      	ldr	r6, [r1, #12]
20010afa:	eb0b 0e02 	add.w	lr, fp, r2
20010afe:	f04f 0800 	mov.w	r8, #0
20010b02:	b1de      	cbz	r6, 20010b3c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x68>
20010b04:	2500      	movs	r5, #0
20010b06:	465b      	mov	r3, fp
20010b08:	e00b      	b.n	20010b22 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x4e>
20010b0a:	e9d1 0105 	ldrd	r0, r1, [r1, #20]
20010b0e:	e323      	b.n	20011158 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x684>
20010b10:	28f0      	cmp	r0, #240	; 0xf0
20010b12:	bf2c      	ite	cs
20010b14:	1d23      	addcs	r3, r4, #4
20010b16:	1ce3      	addcc	r3, r4, #3
20010b18:	1b18      	subs	r0, r3, r4
20010b1a:	3501      	adds	r5, #1
20010b1c:	4480      	add	r8, r0
20010b1e:	42ae      	cmp	r6, r5
20010b20:	d00d      	beq.n	20010b3e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6a>
20010b22:	4573      	cmp	r3, lr
20010b24:	d020      	beq.n	20010b68 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x94>
20010b26:	461c      	mov	r4, r3
20010b28:	f913 0b01 	ldrsb.w	r0, [r3], #1
20010b2c:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
20010b30:	dcf2      	bgt.n	20010b18 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x44>
20010b32:	b2c0      	uxtb	r0, r0
20010b34:	28e0      	cmp	r0, #224	; 0xe0
20010b36:	d2eb      	bcs.n	20010b10 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x3c>
20010b38:	1ca3      	adds	r3, r4, #2
20010b3a:	e7ed      	b.n	20010b18 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x44>
20010b3c:	465b      	mov	r3, fp
20010b3e:	4573      	cmp	r3, lr
20010b40:	d012      	beq.n	20010b68 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x94>
20010b42:	f993 0000 	ldrsb.w	r0, [r3]
20010b46:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
20010b4a:	bfdc      	itt	le
20010b4c:	b2c0      	uxtble	r0, r0
20010b4e:	28e0      	cmple	r0, #224	; 0xe0
20010b50:	f1b8 0f00 	cmp.w	r8, #0
20010b54:	d00e      	beq.n	20010b74 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0xa0>
20010b56:	4590      	cmp	r8, r2
20010b58:	d20b      	bcs.n	20010b72 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x9e>
20010b5a:	f91b 0008 	ldrsb.w	r0, [fp, r8]
20010b5e:	f110 0f41 	cmn.w	r0, #65	; 0x41
20010b62:	dc07      	bgt.n	20010b74 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0xa0>
20010b64:	2000      	movs	r0, #0
20010b66:	e006      	b.n	20010b76 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0xa2>
20010b68:	4690      	mov	r8, r2
20010b6a:	f1bc 0f00 	cmp.w	ip, #0
20010b6e:	d10a      	bne.n	20010b86 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0xb2>
20010b70:	e2ef      	b.n	20011152 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x67e>
20010b72:	d1f7      	bne.n	20010b64 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x90>
20010b74:	4658      	mov	r0, fp
20010b76:	2800      	cmp	r0, #0
20010b78:	bf0c      	ite	eq
20010b7a:	4690      	moveq	r8, r2
20010b7c:	4683      	movne	fp, r0
20010b7e:	f1bc 0f00 	cmp.w	ip, #0
20010b82:	f000 82e6 	beq.w	20011152 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x67e>
20010b86:	684c      	ldr	r4, [r1, #4]
20010b88:	f1b8 0f10 	cmp.w	r8, #16
20010b8c:	d20c      	bcs.n	20010ba8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0xd4>
20010b8e:	f1b8 0f00 	cmp.w	r8, #0
20010b92:	d023      	beq.n	20010bdc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x108>
20010b94:	f008 0003 	and.w	r0, r8, #3
20010b98:	2500      	movs	r5, #0
20010b9a:	f1b8 0f04 	cmp.w	r8, #4
20010b9e:	d222      	bcs.n	20010be6 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x112>
20010ba0:	2200      	movs	r2, #0
20010ba2:	2800      	cmp	r0, #0
20010ba4:	d172      	bne.n	20010c8c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x1b8>
20010ba6:	e290      	b.n	200110ca <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5f6>
20010ba8:	f10b 0003 	add.w	r0, fp, #3
20010bac:	9401      	str	r4, [sp, #4]
20010bae:	f020 0903 	bic.w	r9, r0, #3
20010bb2:	f8cd 800c 	str.w	r8, [sp, #12]
20010bb6:	ebb9 000b 	subs.w	r0, r9, fp
20010bba:	9102      	str	r1, [sp, #8]
20010bbc:	eba8 0800 	sub.w	r8, r8, r0
20010bc0:	f008 0303 	and.w	r3, r8, #3
20010bc4:	d101      	bne.n	20010bca <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0xf6>
20010bc6:	2000      	movs	r0, #0
20010bc8:	e0fe      	b.n	20010dc8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x2f4>
20010bca:	e9cd 0305 	strd	r0, r3, [sp, #20]
20010bce:	ebab 0009 	sub.w	r0, fp, r9
20010bd2:	f110 0f04 	cmn.w	r0, #4
20010bd6:	d979      	bls.n	20010ccc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x1f8>
20010bd8:	2000      	movs	r0, #0
20010bda:	e0dd      	b.n	20010d98 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x2c4>
20010bdc:	2500      	movs	r5, #0
20010bde:	42ac      	cmp	r4, r5
20010be0:	f200 8275 	bhi.w	200110ce <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5fa>
20010be4:	e2b5      	b.n	20011152 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x67e>
20010be6:	f99b 2001 	ldrsb.w	r2, [fp, #1]
20010bea:	468c      	mov	ip, r1
20010bec:	f99b 6000 	ldrsb.w	r6, [fp]
20010bf0:	f112 0f41 	cmn.w	r2, #65	; 0x41
20010bf4:	f99b 3002 	ldrsb.w	r3, [fp, #2]
20010bf8:	f99b 1003 	ldrsb.w	r1, [fp, #3]
20010bfc:	bfc8      	it	gt
20010bfe:	2501      	movgt	r5, #1
20010c00:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010c04:	bfc8      	it	gt
20010c06:	3501      	addgt	r5, #1
20010c08:	f113 0f41 	cmn.w	r3, #65	; 0x41
20010c0c:	bfc8      	it	gt
20010c0e:	3501      	addgt	r5, #1
20010c10:	f111 0f41 	cmn.w	r1, #65	; 0x41
20010c14:	f008 020c 	and.w	r2, r8, #12
20010c18:	bfc8      	it	gt
20010c1a:	3501      	addgt	r5, #1
20010c1c:	2a04      	cmp	r2, #4
20010c1e:	d031      	beq.n	20010c84 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x1b0>
20010c20:	f99b 6004 	ldrsb.w	r6, [fp, #4]
20010c24:	f99b 3005 	ldrsb.w	r3, [fp, #5]
20010c28:	f99b 1006 	ldrsb.w	r1, [fp, #6]
20010c2c:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010c30:	f99b e007 	ldrsb.w	lr, [fp, #7]
20010c34:	bfc8      	it	gt
20010c36:	3501      	addgt	r5, #1
20010c38:	f113 0f41 	cmn.w	r3, #65	; 0x41
20010c3c:	bfc8      	it	gt
20010c3e:	3501      	addgt	r5, #1
20010c40:	f111 0f41 	cmn.w	r1, #65	; 0x41
20010c44:	bfc8      	it	gt
20010c46:	3501      	addgt	r5, #1
20010c48:	f11e 0f41 	cmn.w	lr, #65	; 0x41
20010c4c:	bfc8      	it	gt
20010c4e:	3501      	addgt	r5, #1
20010c50:	2a08      	cmp	r2, #8
20010c52:	d017      	beq.n	20010c84 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x1b0>
20010c54:	f99b 6008 	ldrsb.w	r6, [fp, #8]
20010c58:	f99b 3009 	ldrsb.w	r3, [fp, #9]
20010c5c:	f99b 100a 	ldrsb.w	r1, [fp, #10]
20010c60:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010c64:	f99b e00b 	ldrsb.w	lr, [fp, #11]
20010c68:	bfc8      	it	gt
20010c6a:	3501      	addgt	r5, #1
20010c6c:	f113 0f41 	cmn.w	r3, #65	; 0x41
20010c70:	bfc8      	it	gt
20010c72:	3501      	addgt	r5, #1
20010c74:	f111 0f41 	cmn.w	r1, #65	; 0x41
20010c78:	bfc8      	it	gt
20010c7a:	3501      	addgt	r5, #1
20010c7c:	f11e 0f41 	cmn.w	lr, #65	; 0x41
20010c80:	bfc8      	it	gt
20010c82:	3501      	addgt	r5, #1
20010c84:	4661      	mov	r1, ip
20010c86:	2800      	cmp	r0, #0
20010c88:	f000 821f 	beq.w	200110ca <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5f6>
20010c8c:	460b      	mov	r3, r1
20010c8e:	f91b 1002 	ldrsb.w	r1, [fp, r2]
20010c92:	f111 0f41 	cmn.w	r1, #65	; 0x41
20010c96:	bfc8      	it	gt
20010c98:	3501      	addgt	r5, #1
20010c9a:	4619      	mov	r1, r3
20010c9c:	2801      	cmp	r0, #1
20010c9e:	f000 8214 	beq.w	200110ca <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5f6>
20010ca2:	445a      	add	r2, fp
20010ca4:	f992 1001 	ldrsb.w	r1, [r2, #1]
20010ca8:	f111 0f41 	cmn.w	r1, #65	; 0x41
20010cac:	bfc8      	it	gt
20010cae:	3501      	addgt	r5, #1
20010cb0:	4619      	mov	r1, r3
20010cb2:	2802      	cmp	r0, #2
20010cb4:	f000 8209 	beq.w	200110ca <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5f6>
20010cb8:	f992 0002 	ldrsb.w	r0, [r2, #2]
20010cbc:	f110 0f41 	cmn.w	r0, #65	; 0x41
20010cc0:	bfc8      	it	gt
20010cc2:	3501      	addgt	r5, #1
20010cc4:	42ac      	cmp	r4, r5
20010cc6:	f200 8202 	bhi.w	200110ce <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5fa>
20010cca:	e242      	b.n	20011152 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x67e>
20010ccc:	2000      	movs	r0, #0
20010cce:	2500      	movs	r5, #0
20010cd0:	eb0b 0205 	add.w	r2, fp, r5
20010cd4:	f91b c005 	ldrsb.w	ip, [fp, r5]
20010cd8:	f992 e001 	ldrsb.w	lr, [r2, #1]
20010cdc:	f992 a00e 	ldrsb.w	sl, [r2, #14]
20010ce0:	f11c 0f41 	cmn.w	ip, #65	; 0x41
20010ce4:	f992 300d 	ldrsb.w	r3, [r2, #13]
20010ce8:	f992 400c 	ldrsb.w	r4, [r2, #12]
20010cec:	bfc8      	it	gt
20010cee:	3001      	addgt	r0, #1
20010cf0:	f992 6002 	ldrsb.w	r6, [r2, #2]
20010cf4:	f11e 0f41 	cmn.w	lr, #65	; 0x41
20010cf8:	bfc8      	it	gt
20010cfa:	3001      	addgt	r0, #1
20010cfc:	f992 c003 	ldrsb.w	ip, [r2, #3]
20010d00:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010d04:	bfc8      	it	gt
20010d06:	3001      	addgt	r0, #1
20010d08:	f992 6004 	ldrsb.w	r6, [r2, #4]
20010d0c:	f11c 0f41 	cmn.w	ip, #65	; 0x41
20010d10:	bfc8      	it	gt
20010d12:	3001      	addgt	r0, #1
20010d14:	f992 c005 	ldrsb.w	ip, [r2, #5]
20010d18:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010d1c:	bfc8      	it	gt
20010d1e:	3001      	addgt	r0, #1
20010d20:	f992 6006 	ldrsb.w	r6, [r2, #6]
20010d24:	f11c 0f41 	cmn.w	ip, #65	; 0x41
20010d28:	bfc8      	it	gt
20010d2a:	3001      	addgt	r0, #1
20010d2c:	f992 c007 	ldrsb.w	ip, [r2, #7]
20010d30:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010d34:	bfc8      	it	gt
20010d36:	3001      	addgt	r0, #1
20010d38:	f992 6008 	ldrsb.w	r6, [r2, #8]
20010d3c:	f11c 0f41 	cmn.w	ip, #65	; 0x41
20010d40:	bfc8      	it	gt
20010d42:	3001      	addgt	r0, #1
20010d44:	f992 c009 	ldrsb.w	ip, [r2, #9]
20010d48:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010d4c:	bfc8      	it	gt
20010d4e:	3001      	addgt	r0, #1
20010d50:	f992 600b 	ldrsb.w	r6, [r2, #11]
20010d54:	f11c 0f41 	cmn.w	ip, #65	; 0x41
20010d58:	bfc8      	it	gt
20010d5a:	3001      	addgt	r0, #1
20010d5c:	f992 c00f 	ldrsb.w	ip, [r2, #15]
20010d60:	f992 200a 	ldrsb.w	r2, [r2, #10]
20010d64:	f112 0f41 	cmn.w	r2, #65	; 0x41
20010d68:	bfc8      	it	gt
20010d6a:	3001      	addgt	r0, #1
20010d6c:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010d70:	bfc8      	it	gt
20010d72:	3001      	addgt	r0, #1
20010d74:	f114 0f41 	cmn.w	r4, #65	; 0x41
20010d78:	bfc8      	it	gt
20010d7a:	3001      	addgt	r0, #1
20010d7c:	f113 0f41 	cmn.w	r3, #65	; 0x41
20010d80:	bfc8      	it	gt
20010d82:	3001      	addgt	r0, #1
20010d84:	f11a 0f41 	cmn.w	sl, #65	; 0x41
20010d88:	bfc8      	it	gt
20010d8a:	3001      	addgt	r0, #1
20010d8c:	f11c 0f41 	cmn.w	ip, #65	; 0x41
20010d90:	bfc8      	it	gt
20010d92:	3001      	addgt	r0, #1
20010d94:	3510      	adds	r5, #16
20010d96:	d19b      	bne.n	20010cd0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x1fc>
20010d98:	f99b 2000 	ldrsb.w	r2, [fp]
20010d9c:	f112 0f41 	cmn.w	r2, #65	; 0x41
20010da0:	bfc8      	it	gt
20010da2:	3001      	addgt	r0, #1
20010da4:	9905      	ldr	r1, [sp, #20]
20010da6:	9b06      	ldr	r3, [sp, #24]
20010da8:	2901      	cmp	r1, #1
20010daa:	d00d      	beq.n	20010dc8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x2f4>
20010dac:	f99b 2001 	ldrsb.w	r2, [fp, #1]
20010db0:	f112 0f41 	cmn.w	r2, #65	; 0x41
20010db4:	bfc8      	it	gt
20010db6:	3001      	addgt	r0, #1
20010db8:	2902      	cmp	r1, #2
20010dba:	d005      	beq.n	20010dc8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x2f4>
20010dbc:	f99b 2002 	ldrsb.w	r2, [fp, #2]
20010dc0:	f112 0f41 	cmn.w	r2, #65	; 0x41
20010dc4:	bfc8      	it	gt
20010dc6:	3001      	addgt	r0, #1
20010dc8:	ea4f 0a98 	mov.w	sl, r8, lsr #2
20010dcc:	2200      	movs	r2, #0
20010dce:	f8cd b010 	str.w	fp, [sp, #16]
20010dd2:	b1cb      	cbz	r3, 20010e08 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x334>
20010dd4:	f028 0603 	bic.w	r6, r8, #3
20010dd8:	eb09 0506 	add.w	r5, r9, r6
20010ddc:	f995 6000 	ldrsb.w	r6, [r5]
20010de0:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010de4:	bfc8      	it	gt
20010de6:	2201      	movgt	r2, #1
20010de8:	2b01      	cmp	r3, #1
20010dea:	d00d      	beq.n	20010e08 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x334>
20010dec:	f995 6001 	ldrsb.w	r6, [r5, #1]
20010df0:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010df4:	bfc8      	it	gt
20010df6:	3201      	addgt	r2, #1
20010df8:	2b02      	cmp	r3, #2
20010dfa:	d005      	beq.n	20010e08 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x334>
20010dfc:	f995 6002 	ldrsb.w	r6, [r5, #2]
20010e00:	f116 0f41 	cmn.w	r6, #65	; 0x41
20010e04:	bfc8      	it	gt
20010e06:	3201      	addgt	r2, #1
20010e08:	1815      	adds	r5, r2, r0
20010e0a:	e012      	b.n	20010e32 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x35e>
20010e0c:	f04f 0c00 	mov.w	ip, #0
20010e10:	fa3f f18c 	uxtb16	r1, ip
20010e14:	fa3f f29c 	uxtb16	r2, ip, ror #8
20010e18:	4411      	add	r1, r2
20010e1a:	ebaa 0a0b 	sub.w	sl, sl, fp
20010e1e:	eb08 098b 	add.w	r9, r8, fp, lsl #2
20010e22:	f01b 0003 	ands.w	r0, fp, #3
20010e26:	eb01 4101 	add.w	r1, r1, r1, lsl #16
20010e2a:	eb05 4511 	add.w	r5, r5, r1, lsr #16
20010e2e:	f040 815c 	bne.w	200110ea <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x616>
20010e32:	f1ba 0f00 	cmp.w	sl, #0
20010e36:	f000 8144 	beq.w	200110c2 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5ee>
20010e3a:	f1ba 0fc0 	cmp.w	sl, #192	; 0xc0
20010e3e:	46d3      	mov	fp, sl
20010e40:	bf28      	it	cs
20010e42:	f04f 0bc0 	movcs.w	fp, #192	; 0xc0
20010e46:	46c8      	mov	r8, r9
20010e48:	f1ba 0f04 	cmp.w	sl, #4
20010e4c:	d3de      	bcc.n	20010e0c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x338>
20010e4e:	f06f 000f 	mvn.w	r0, #15
20010e52:	2101      	movs	r1, #1
20010e54:	eb00 008b 	add.w	r0, r0, fp, lsl #2
20010e58:	9506      	str	r5, [sp, #24]
20010e5a:	2830      	cmp	r0, #48	; 0x30
20010e5c:	eb01 1110 	add.w	r1, r1, r0, lsr #4
20010e60:	9105      	str	r1, [sp, #20]
20010e62:	d203      	bcs.n	20010e6c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x398>
20010e64:	f04f 0c00 	mov.w	ip, #0
20010e68:	4646      	mov	r6, r8
20010e6a:	e0aa      	b.n	20010fc2 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x4ee>
20010e6c:	f021 0e03 	bic.w	lr, r1, #3
20010e70:	f04f 0c00 	mov.w	ip, #0
20010e74:	4646      	mov	r6, r8
20010e76:	e896 0215 	ldmia.w	r6, {r0, r2, r4, r9}
20010e7a:	f1be 0e04 	subs.w	lr, lr, #4
20010e7e:	69b5      	ldr	r5, [r6, #24]
20010e80:	ea6f 0100 	mvn.w	r1, r0
20010e84:	ea4f 11d1 	mov.w	r1, r1, lsr #7
20010e88:	ea41 1090 	orr.w	r0, r1, r0, lsr #6
20010e8c:	ea6f 0102 	mvn.w	r1, r2
20010e90:	f020 30fe 	bic.w	r0, r0, #4278124286	; 0xfefefefe
20010e94:	ea4f 11d1 	mov.w	r1, r1, lsr #7
20010e98:	4460      	add	r0, ip
20010e9a:	ea41 1192 	orr.w	r1, r1, r2, lsr #6
20010e9e:	6972      	ldr	r2, [r6, #20]
20010ea0:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
20010ea4:	f8d6 c03c 	ldr.w	ip, [r6, #60]	; 0x3c
20010ea8:	4401      	add	r1, r0
20010eaa:	ea6f 0004 	mvn.w	r0, r4
20010eae:	ea4f 13d0 	mov.w	r3, r0, lsr #7
20010eb2:	6bb0      	ldr	r0, [r6, #56]	; 0x38
20010eb4:	ea43 1394 	orr.w	r3, r3, r4, lsr #6
20010eb8:	6934      	ldr	r4, [r6, #16]
20010eba:	f023 33fe 	bic.w	r3, r3, #4278124286	; 0xfefefefe
20010ebe:	4419      	add	r1, r3
20010ec0:	ea6f 0309 	mvn.w	r3, r9
20010ec4:	ea4f 13d3 	mov.w	r3, r3, lsr #7
20010ec8:	ea43 1399 	orr.w	r3, r3, r9, lsr #6
20010ecc:	f023 33fe 	bic.w	r3, r3, #4278124286	; 0xfefefefe
20010ed0:	4419      	add	r1, r3
20010ed2:	ea6f 0304 	mvn.w	r3, r4
20010ed6:	ea4f 13d3 	mov.w	r3, r3, lsr #7
20010eda:	ea43 1394 	orr.w	r3, r3, r4, lsr #6
20010ede:	69f4      	ldr	r4, [r6, #28]
20010ee0:	f023 33fe 	bic.w	r3, r3, #4278124286	; 0xfefefefe
20010ee4:	4419      	add	r1, r3
20010ee6:	ea6f 0302 	mvn.w	r3, r2
20010eea:	ea4f 13d3 	mov.w	r3, r3, lsr #7
20010eee:	ea43 1292 	orr.w	r2, r3, r2, lsr #6
20010ef2:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010ef6:	6a33      	ldr	r3, [r6, #32]
20010ef8:	4411      	add	r1, r2
20010efa:	ea6f 0205 	mvn.w	r2, r5
20010efe:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f02:	ea42 1295 	orr.w	r2, r2, r5, lsr #6
20010f06:	6a75      	ldr	r5, [r6, #36]	; 0x24
20010f08:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f0c:	4411      	add	r1, r2
20010f0e:	ea6f 0204 	mvn.w	r2, r4
20010f12:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f16:	ea42 1294 	orr.w	r2, r2, r4, lsr #6
20010f1a:	6ab4      	ldr	r4, [r6, #40]	; 0x28
20010f1c:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f20:	4411      	add	r1, r2
20010f22:	ea6f 0203 	mvn.w	r2, r3
20010f26:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f2a:	ea42 1293 	orr.w	r2, r2, r3, lsr #6
20010f2e:	6af3      	ldr	r3, [r6, #44]	; 0x2c
20010f30:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f34:	4411      	add	r1, r2
20010f36:	ea6f 0205 	mvn.w	r2, r5
20010f3a:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f3e:	ea42 1295 	orr.w	r2, r2, r5, lsr #6
20010f42:	6b35      	ldr	r5, [r6, #48]	; 0x30
20010f44:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f48:	4411      	add	r1, r2
20010f4a:	ea6f 0204 	mvn.w	r2, r4
20010f4e:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f52:	ea42 1294 	orr.w	r2, r2, r4, lsr #6
20010f56:	6b74      	ldr	r4, [r6, #52]	; 0x34
20010f58:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f5c:	f106 0640 	add.w	r6, r6, #64	; 0x40
20010f60:	4411      	add	r1, r2
20010f62:	ea6f 0203 	mvn.w	r2, r3
20010f66:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f6a:	ea42 1293 	orr.w	r2, r2, r3, lsr #6
20010f6e:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f72:	4411      	add	r1, r2
20010f74:	ea6f 0205 	mvn.w	r2, r5
20010f78:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f7c:	ea42 1295 	orr.w	r2, r2, r5, lsr #6
20010f80:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f84:	4411      	add	r1, r2
20010f86:	ea6f 0204 	mvn.w	r2, r4
20010f8a:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010f8e:	ea42 1294 	orr.w	r2, r2, r4, lsr #6
20010f92:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010f96:	4411      	add	r1, r2
20010f98:	ea6f 0200 	mvn.w	r2, r0
20010f9c:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20010fa0:	ea42 1090 	orr.w	r0, r2, r0, lsr #6
20010fa4:	f020 30fe 	bic.w	r0, r0, #4278124286	; 0xfefefefe
20010fa8:	4408      	add	r0, r1
20010faa:	ea6f 010c 	mvn.w	r1, ip
20010fae:	ea4f 11d1 	mov.w	r1, r1, lsr #7
20010fb2:	ea41 119c 	orr.w	r1, r1, ip, lsr #6
20010fb6:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
20010fba:	eb01 0c00 	add.w	ip, r1, r0
20010fbe:	f47f af5a 	bne.w	20010e76 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x3a2>
20010fc2:	9805      	ldr	r0, [sp, #20]
20010fc4:	9d06      	ldr	r5, [sp, #24]
20010fc6:	f010 0e03 	ands.w	lr, r0, #3
20010fca:	f43f af21 	beq.w	20010e10 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x33c>
20010fce:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
20010fd2:	f1be 0f01 	cmp.w	lr, #1
20010fd6:	68f0      	ldr	r0, [r6, #12]
20010fd8:	ea6f 0401 	mvn.w	r4, r1
20010fdc:	ea4f 14d4 	mov.w	r4, r4, lsr #7
20010fe0:	ea44 1191 	orr.w	r1, r4, r1, lsr #6
20010fe4:	ea6f 0402 	mvn.w	r4, r2
20010fe8:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
20010fec:	ea4f 14d4 	mov.w	r4, r4, lsr #7
20010ff0:	ea44 1292 	orr.w	r2, r4, r2, lsr #6
20010ff4:	4461      	add	r1, ip
20010ff6:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20010ffa:	4411      	add	r1, r2
20010ffc:	ea6f 0203 	mvn.w	r2, r3
20011000:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20011004:	ea42 1293 	orr.w	r2, r2, r3, lsr #6
20011008:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
2001100c:	4411      	add	r1, r2
2001100e:	ea6f 0200 	mvn.w	r2, r0
20011012:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20011016:	ea42 1290 	orr.w	r2, r2, r0, lsr #6
2001101a:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
2001101e:	eb02 0c01 	add.w	ip, r2, r1
20011022:	f43f aef5 	beq.w	20010e10 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x33c>
20011026:	f106 0310 	add.w	r3, r6, #16
2001102a:	69f0      	ldr	r0, [r6, #28]
2001102c:	f1be 0f02 	cmp.w	lr, #2
20011030:	cb0e      	ldmia	r3, {r1, r2, r3}
20011032:	ea6f 0401 	mvn.w	r4, r1
20011036:	ea4f 14d4 	mov.w	r4, r4, lsr #7
2001103a:	ea44 1191 	orr.w	r1, r4, r1, lsr #6
2001103e:	ea6f 0402 	mvn.w	r4, r2
20011042:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
20011046:	ea4f 14d4 	mov.w	r4, r4, lsr #7
2001104a:	ea44 1292 	orr.w	r2, r4, r2, lsr #6
2001104e:	4461      	add	r1, ip
20011050:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20011054:	4411      	add	r1, r2
20011056:	ea6f 0203 	mvn.w	r2, r3
2001105a:	ea4f 12d2 	mov.w	r2, r2, lsr #7
2001105e:	ea42 1293 	orr.w	r2, r2, r3, lsr #6
20011062:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20011066:	4411      	add	r1, r2
20011068:	ea6f 0200 	mvn.w	r2, r0
2001106c:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20011070:	ea42 1290 	orr.w	r2, r2, r0, lsr #6
20011074:	f022 32fe 	bic.w	r2, r2, #4278124286	; 0xfefefefe
20011078:	eb02 0c01 	add.w	ip, r2, r1
2001107c:	f43f aec8 	beq.w	20010e10 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x33c>
20011080:	f106 0320 	add.w	r3, r6, #32
20011084:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
20011086:	43c6      	mvns	r6, r0
20011088:	09f6      	lsrs	r6, r6, #7
2001108a:	ea46 1090 	orr.w	r0, r6, r0, lsr #6
2001108e:	43ce      	mvns	r6, r1
20011090:	f020 30fe 	bic.w	r0, r0, #4278124286	; 0xfefefefe
20011094:	09f6      	lsrs	r6, r6, #7
20011096:	ea46 1191 	orr.w	r1, r6, r1, lsr #6
2001109a:	4460      	add	r0, ip
2001109c:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
200110a0:	4408      	add	r0, r1
200110a2:	43d1      	mvns	r1, r2
200110a4:	09c9      	lsrs	r1, r1, #7
200110a6:	ea41 1192 	orr.w	r1, r1, r2, lsr #6
200110aa:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
200110ae:	4408      	add	r0, r1
200110b0:	43d9      	mvns	r1, r3
200110b2:	09c9      	lsrs	r1, r1, #7
200110b4:	ea41 1193 	orr.w	r1, r1, r3, lsr #6
200110b8:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
200110bc:	eb01 0c00 	add.w	ip, r1, r0
200110c0:	e6a6      	b.n	20010e10 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x33c>
200110c2:	e9dd 8b03 	ldrd	r8, fp, [sp, #12]
200110c6:	e9dd 4101 	ldrd	r4, r1, [sp, #4]
200110ca:	42ac      	cmp	r4, r5
200110cc:	d941      	bls.n	20011152 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x67e>
200110ce:	f891 2020 	ldrb.w	r2, [r1, #32]
200110d2:	460b      	mov	r3, r1
200110d4:	eba4 0905 	sub.w	r9, r4, r5
200110d8:	2000      	movs	r0, #0
200110da:	e8df f002 	tbb	[pc, r2]
200110de:	4b45024b 	blmi	21151a12 <_eram+0x1131a12>
200110e2:	4648      	mov	r0, r9
200110e4:	f04f 0900 	mov.w	r9, #0
200110e8:	e044      	b.n	20011174 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6a0>
200110ea:	f00b 03fc 	and.w	r3, fp, #252	; 0xfc
200110ee:	e9dd 4c01 	ldrd	r4, ip, [sp, #4]
200110f2:	2801      	cmp	r0, #1
200110f4:	f858 1023 	ldr.w	r1, [r8, r3, lsl #2]
200110f8:	ea6f 0201 	mvn.w	r2, r1
200110fc:	ea4f 12d2 	mov.w	r2, r2, lsr #7
20011100:	ea42 1191 	orr.w	r1, r2, r1, lsr #6
20011104:	f021 32fe 	bic.w	r2, r1, #4278124286	; 0xfefefefe
20011108:	d015      	beq.n	20011136 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x662>
2001110a:	eb08 0383 	add.w	r3, r8, r3, lsl #2
2001110e:	2802      	cmp	r0, #2
20011110:	6859      	ldr	r1, [r3, #4]
20011112:	ea6f 0601 	mvn.w	r6, r1
20011116:	ea4f 16d6 	mov.w	r6, r6, lsr #7
2001111a:	ea46 1191 	orr.w	r1, r6, r1, lsr #6
2001111e:	f021 31fe 	bic.w	r1, r1, #4278124286	; 0xfefefefe
20011122:	440a      	add	r2, r1
20011124:	d007      	beq.n	20011136 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x662>
20011126:	6898      	ldr	r0, [r3, #8]
20011128:	43c1      	mvns	r1, r0
2001112a:	09c9      	lsrs	r1, r1, #7
2001112c:	ea41 1090 	orr.w	r0, r1, r0, lsr #6
20011130:	f020 30fe 	bic.w	r0, r0, #4278124286	; 0xfefefefe
20011134:	4402      	add	r2, r0
20011136:	fa3f f082 	uxtb16	r0, r2
2001113a:	fa3f f192 	uxtb16	r1, r2, ror #8
2001113e:	4408      	add	r0, r1
20011140:	e9dd 8b03 	ldrd	r8, fp, [sp, #12]
20011144:	4661      	mov	r1, ip
20011146:	eb00 4000 	add.w	r0, r0, r0, lsl #16
2001114a:	eb05 4510 	add.w	r5, r5, r0, lsr #16
2001114e:	42ac      	cmp	r4, r5
20011150:	d8bd      	bhi.n	200110ce <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x5fa>
20011152:	e9d1 0105 	ldrd	r0, r1, [r1, #20]
20011156:	4642      	mov	r2, r8
20011158:	68cb      	ldr	r3, [r1, #12]
2001115a:	4659      	mov	r1, fp
2001115c:	b007      	add	sp, #28
2001115e:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20011162:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
20011166:	4718      	bx	r3
20011168:	f109 0101 	add.w	r1, r9, #1
2001116c:	ea4f 0059 	mov.w	r0, r9, lsr #1
20011170:	ea4f 0951 	mov.w	r9, r1, lsr #1
20011174:	e9d3 a404 	ldrd	sl, r4, [r3, #16]
20011178:	1c46      	adds	r6, r0, #1
2001117a:	699d      	ldr	r5, [r3, #24]
2001117c:	3e01      	subs	r6, #1
2001117e:	d006      	beq.n	2001118e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6ba>
20011180:	692a      	ldr	r2, [r5, #16]
20011182:	4620      	mov	r0, r4
20011184:	4651      	mov	r1, sl
20011186:	4790      	blx	r2
20011188:	2800      	cmp	r0, #0
2001118a:	d0f7      	beq.n	2001117c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6a8>
2001118c:	e005      	b.n	2001119a <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6c6>
2001118e:	68eb      	ldr	r3, [r5, #12]
20011190:	4620      	mov	r0, r4
20011192:	4659      	mov	r1, fp
20011194:	4642      	mov	r2, r8
20011196:	4798      	blx	r3
20011198:	b120      	cbz	r0, 200111a4 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6d0>
2001119a:	2001      	movs	r0, #1
2001119c:	b007      	add	sp, #28
2001119e:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200111a2:	bdf0      	pop	{r4, r5, r6, r7, pc}
200111a4:	2600      	movs	r6, #0
200111a6:	45b1      	cmp	r9, r6
200111a8:	d008      	beq.n	200111bc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6e8>
200111aa:	692a      	ldr	r2, [r5, #16]
200111ac:	4620      	mov	r0, r4
200111ae:	4651      	mov	r1, sl
200111b0:	4790      	blx	r2
200111b2:	3601      	adds	r6, #1
200111b4:	2800      	cmp	r0, #0
200111b6:	d0f6      	beq.n	200111a6 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6d2>
200111b8:	1e71      	subs	r1, r6, #1
200111ba:	e000      	b.n	200111be <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87c08000a479b1e4E+0x6ea>
200111bc:	4649      	mov	r1, r9
200111be:	2000      	movs	r0, #0
200111c0:	4549      	cmp	r1, r9
200111c2:	bf38      	it	cc
200111c4:	2001      	movcc	r0, #1
200111c6:	b007      	add	sp, #28
200111c8:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200111cc:	bdf0      	pop	{r4, r5, r6, r7, pc}

200111ce <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h386ea3606ec7a72fE>:
200111ce:	e9d0 0200 	ldrd	r0, r2, [r0]
200111d2:	68d2      	ldr	r2, [r2, #12]
200111d4:	4710      	bx	r2

200111d6 <_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h22585ac6bd81d74fE>:
200111d6:	4602      	mov	r2, r0
200111d8:	e9d1 0105 	ldrd	r0, r1, [r1, #20]
200111dc:	f000 b800 	b.w	200111e0 <_ZN4core3fmt5write17h69f52fae072ba4c6E>

200111e0 <_ZN4core3fmt5write17h69f52fae072ba4c6E>:
200111e0:	b5f0      	push	{r4, r5, r6, r7, lr}
200111e2:	af03      	add	r7, sp, #12
200111e4:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
200111e8:	b08d      	sub	sp, #52	; 0x34
200111ea:	2303      	movs	r3, #3
200111ec:	6916      	ldr	r6, [r2, #16]
200111ee:	f88d 3030 	strb.w	r3, [sp, #48]	; 0x30
200111f2:	2320      	movs	r3, #32
200111f4:	9308      	str	r3, [sp, #32]
200111f6:	2300      	movs	r3, #0
200111f8:	2e00      	cmp	r6, #0
200111fa:	e9cd 130a 	strd	r1, r3, [sp, #40]	; 0x28
200111fe:	9009      	str	r0, [sp, #36]	; 0x24
20011200:	9306      	str	r3, [sp, #24]
20011202:	9304      	str	r3, [sp, #16]
20011204:	d067      	beq.n	200112d6 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xf6>
20011206:	6950      	ldr	r0, [r2, #20]
20011208:	2800      	cmp	r0, #0
2001120a:	f000 808d 	beq.w	20011328 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x148>
2001120e:	f8d2 a000 	ldr.w	sl, [r2]
20011212:	0141      	lsls	r1, r0, #5
20011214:	f8d2 b008 	ldr.w	fp, [r2, #8]
20011218:	3801      	subs	r0, #1
2001121a:	f020 4078 	bic.w	r0, r0, #4160749568	; 0xf8000000
2001121e:	f04f 0800 	mov.w	r8, #0
20011222:	f04f 0900 	mov.w	r9, #0
20011226:	3001      	adds	r0, #1
20011228:	9202      	str	r2, [sp, #8]
2001122a:	9103      	str	r1, [sp, #12]
2001122c:	9001      	str	r0, [sp, #4]
2001122e:	eb0a 0109 	add.w	r1, sl, r9
20011232:	684a      	ldr	r2, [r1, #4]
20011234:	b13a      	cbz	r2, 20011246 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x66>
20011236:	e9dd 0309 	ldrd	r0, r3, [sp, #36]	; 0x24
2001123a:	6809      	ldr	r1, [r1, #0]
2001123c:	68db      	ldr	r3, [r3, #12]
2001123e:	4798      	blx	r3
20011240:	2800      	cmp	r0, #0
20011242:	f040 8081 	bne.w	20011348 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x168>
20011246:	eb06 0008 	add.w	r0, r6, r8
2001124a:	6903      	ldr	r3, [r0, #16]
2001124c:	eb06 0089 	add.w	r0, r6, r9, lsl #2
20011250:	e9d0 2102 	ldrd	r2, r1, [r0, #8]
20011254:	7f05      	ldrb	r5, [r0, #28]
20011256:	6984      	ldr	r4, [r0, #24]
20011258:	9308      	str	r3, [sp, #32]
2001125a:	f88d 5030 	strb.w	r5, [sp, #48]	; 0x30
2001125e:	940b      	str	r4, [sp, #44]	; 0x2c
20011260:	b172      	cbz	r2, 20011280 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xa0>
20011262:	2a01      	cmp	r2, #1
20011264:	d103      	bne.n	2001126e <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x8e>
20011266:	eb0b 01c1 	add.w	r1, fp, r1, lsl #3
2001126a:	684a      	ldr	r2, [r1, #4]
2001126c:	b13a      	cbz	r2, 2001127e <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x9e>
2001126e:	2200      	movs	r2, #0
20011270:	f856 3008 	ldr.w	r3, [r6, r8]
20011274:	e9cd 2104 	strd	r2, r1, [sp, #16]
20011278:	2b02      	cmp	r3, #2
2001127a:	d108      	bne.n	2001128e <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xae>
2001127c:	e00e      	b.n	2001129c <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xbc>
2001127e:	6809      	ldr	r1, [r1, #0]
20011280:	2201      	movs	r2, #1
20011282:	f856 3008 	ldr.w	r3, [r6, r8]
20011286:	e9cd 2104 	strd	r2, r1, [sp, #16]
2001128a:	2b02      	cmp	r3, #2
2001128c:	d006      	beq.n	2001129c <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xbc>
2001128e:	6841      	ldr	r1, [r0, #4]
20011290:	2b01      	cmp	r3, #1
20011292:	d106      	bne.n	200112a2 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xc2>
20011294:	eb0b 01c1 	add.w	r1, fp, r1, lsl #3
20011298:	684a      	ldr	r2, [r1, #4]
2001129a:	b10a      	cbz	r2, 200112a0 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xc0>
2001129c:	2200      	movs	r2, #0
2001129e:	e001      	b.n	200112a4 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0xc4>
200112a0:	6809      	ldr	r1, [r1, #0]
200112a2:	2201      	movs	r2, #1
200112a4:	6943      	ldr	r3, [r0, #20]
200112a6:	9107      	str	r1, [sp, #28]
200112a8:	9206      	str	r2, [sp, #24]
200112aa:	eb0b 01c3 	add.w	r1, fp, r3, lsl #3
200112ae:	f85b 0033 	ldr.w	r0, [fp, r3, lsl #3]
200112b2:	684b      	ldr	r3, [r1, #4]
200112b4:	a904      	add	r1, sp, #16
200112b6:	4798      	blx	r3
200112b8:	2800      	cmp	r0, #0
200112ba:	d145      	bne.n	20011348 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x168>
200112bc:	9803      	ldr	r0, [sp, #12]
200112be:	f108 0820 	add.w	r8, r8, #32
200112c2:	f109 0908 	add.w	r9, r9, #8
200112c6:	4540      	cmp	r0, r8
200112c8:	d1b1      	bne.n	2001122e <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x4e>
200112ca:	e9dd b201 	ldrd	fp, r2, [sp, #4]
200112ce:	6850      	ldr	r0, [r2, #4]
200112d0:	4583      	cmp	fp, r0
200112d2:	d32e      	bcc.n	20011332 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x152>
200112d4:	e03d      	b.n	20011352 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x172>
200112d6:	68d0      	ldr	r0, [r2, #12]
200112d8:	b330      	cbz	r0, 20011328 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x148>
200112da:	00c6      	lsls	r6, r0, #3
200112dc:	3801      	subs	r0, #1
200112de:	f020 4060 	bic.w	r0, r0, #3758096384	; 0xe0000000
200112e2:	6894      	ldr	r4, [r2, #8]
200112e4:	f8d2 9000 	ldr.w	r9, [r2]
200112e8:	f100 0b01 	add.w	fp, r0, #1
200112ec:	f10d 0810 	add.w	r8, sp, #16
200112f0:	4692      	mov	sl, r2
200112f2:	2500      	movs	r5, #0
200112f4:	eb09 01c5 	add.w	r1, r9, r5, lsl #3
200112f8:	684a      	ldr	r2, [r1, #4]
200112fa:	b12a      	cbz	r2, 20011308 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x128>
200112fc:	e9dd 0309 	ldrd	r0, r3, [sp, #36]	; 0x24
20011300:	6809      	ldr	r1, [r1, #0]
20011302:	68db      	ldr	r3, [r3, #12]
20011304:	4798      	blx	r3
20011306:	b9f8      	cbnz	r0, 20011348 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x168>
20011308:	eb04 01c5 	add.w	r1, r4, r5, lsl #3
2001130c:	f854 0035 	ldr.w	r0, [r4, r5, lsl #3]
20011310:	684a      	ldr	r2, [r1, #4]
20011312:	4641      	mov	r1, r8
20011314:	4790      	blx	r2
20011316:	b9b8      	cbnz	r0, 20011348 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x168>
20011318:	3501      	adds	r5, #1
2001131a:	3e08      	subs	r6, #8
2001131c:	d1ea      	bne.n	200112f4 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x114>
2001131e:	4652      	mov	r2, sl
20011320:	6850      	ldr	r0, [r2, #4]
20011322:	4583      	cmp	fp, r0
20011324:	d305      	bcc.n	20011332 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x152>
20011326:	e014      	b.n	20011352 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x172>
20011328:	f04f 0b00 	mov.w	fp, #0
2001132c:	6850      	ldr	r0, [r2, #4]
2001132e:	4583      	cmp	fp, r0
20011330:	d20f      	bcs.n	20011352 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x172>
20011332:	6812      	ldr	r2, [r2, #0]
20011334:	e9dd 0109 	ldrd	r0, r1, [sp, #36]	; 0x24
20011338:	68cb      	ldr	r3, [r1, #12]
2001133a:	f852 103b 	ldr.w	r1, [r2, fp, lsl #3]
2001133e:	eb02 02cb 	add.w	r2, r2, fp, lsl #3
20011342:	6852      	ldr	r2, [r2, #4]
20011344:	4798      	blx	r3
20011346:	b120      	cbz	r0, 20011352 <_ZN4core3fmt5write17h69f52fae072ba4c6E+0x172>
20011348:	2001      	movs	r0, #1
2001134a:	b00d      	add	sp, #52	; 0x34
2001134c:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20011350:	bdf0      	pop	{r4, r5, r6, r7, pc}
20011352:	2000      	movs	r0, #0
20011354:	b00d      	add	sp, #52	; 0x34
20011356:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2001135a:	bdf0      	pop	{r4, r5, r6, r7, pc}

2001135c <_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5320b309e8999d0fE>:
2001135c:	e9d1 0205 	ldrd	r0, r2, [r1, #20]
20011360:	f645 1181 	movw	r1, #22913	; 0x5981
20011364:	68d3      	ldr	r3, [r2, #12]
20011366:	f2c2 0101 	movt	r1, #8193	; 0x2001
2001136a:	220e      	movs	r2, #14
2001136c:	4718      	bx	r3

2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>:
2001136e:	b580      	push	{r7, lr}
20011370:	466f      	mov	r7, sp
20011372:	b08a      	sub	sp, #40	; 0x28
20011374:	4601      	mov	r1, r0
20011376:	2000      	movs	r0, #0
20011378:	9005      	str	r0, [sp, #20]
2001137a:	2001      	movs	r0, #1
2001137c:	9002      	str	r0, [sp, #8]
2001137e:	f645 12a4 	movw	r2, #22948	; 0x59a4
20011382:	9004      	str	r0, [sp, #16]
20011384:	a807      	add	r0, sp, #28
20011386:	9003      	str	r0, [sp, #12]
20011388:	f241 305d 	movw	r0, #4957	; 0x135d
2001138c:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011390:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011394:	9008      	str	r0, [sp, #32]
20011396:	1e78      	subs	r0, r7, #1
20011398:	9007      	str	r0, [sp, #28]
2001139a:	a801      	add	r0, sp, #4
2001139c:	9201      	str	r2, [sp, #4]
2001139e:	f7ff f93a 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

200113a2 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E>:
200113a2:	b5f0      	push	{r4, r5, r6, r7, lr}
200113a4:	af03      	add	r7, sp, #12
200113a6:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
200113aa:	b087      	sub	sp, #28
200113ac:	4693      	mov	fp, r2
200113ae:	6802      	ldr	r2, [r0, #0]
200113b0:	9204      	str	r2, [sp, #16]
200113b2:	f04f 0800 	mov.w	r8, #0
200113b6:	6842      	ldr	r2, [r0, #4]
200113b8:	f04f 0900 	mov.w	r9, #0
200113bc:	6880      	ldr	r0, [r0, #8]
200113be:	f04f 0a00 	mov.w	sl, #0
200113c2:	9005      	str	r0, [sp, #20]
200113c4:	1c48      	adds	r0, r1, #1
200113c6:	9000      	str	r0, [sp, #0]
200113c8:	f1cb 0000 	rsb	r0, fp, #0
200113cc:	9002      	str	r0, [sp, #8]
200113ce:	1e48      	subs	r0, r1, #1
200113d0:	9203      	str	r2, [sp, #12]
200113d2:	9106      	str	r1, [sp, #24]
200113d4:	9001      	str	r0, [sp, #4]
200113d6:	e013      	b.n	20011400 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x5e>
200113d8:	9801      	ldr	r0, [sp, #4]
200113da:	5d00      	ldrb	r0, [r0, r4]
200113dc:	380a      	subs	r0, #10
200113de:	fab0 f080 	clz	r0, r0
200113e2:	0940      	lsrs	r0, r0, #5
200113e4:	9b03      	ldr	r3, [sp, #12]
200113e6:	eba4 0208 	sub.w	r2, r4, r8
200113ea:	9d05      	ldr	r5, [sp, #20]
200113ec:	9906      	ldr	r1, [sp, #24]
200113ee:	68db      	ldr	r3, [r3, #12]
200113f0:	7028      	strb	r0, [r5, #0]
200113f2:	4441      	add	r1, r8
200113f4:	9804      	ldr	r0, [sp, #16]
200113f6:	4798      	blx	r3
200113f8:	2800      	cmp	r0, #0
200113fa:	46b0      	mov	r8, r6
200113fc:	f040 80f1 	bne.w	200115e2 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x240>
20011400:	ea5f 70ca 	movs.w	r0, sl, lsl #31
20011404:	f040 80e8 	bne.w	200115d8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x236>
20011408:	45d9      	cmp	r9, fp
2001140a:	f200 80cd 	bhi.w	200115a8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x206>
2001140e:	f240 1a00 	movw	sl, #256	; 0x100
20011412:	f2c0 1a01 	movt	sl, #257	; 0x101
20011416:	e002      	b.n	2001141e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x7c>
20011418:	45d9      	cmp	r9, fp
2001141a:	f200 80c5 	bhi.w	200115a8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x206>
2001141e:	9806      	ldr	r0, [sp, #24]
20011420:	ebab 0e09 	sub.w	lr, fp, r9
20011424:	f1be 0f07 	cmp.w	lr, #7
20011428:	4448      	add	r0, r9
2001142a:	d822      	bhi.n	20011472 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0xd0>
2001142c:	45cb      	cmp	fp, r9
2001142e:	f000 80ba 	beq.w	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011432:	9902      	ldr	r1, [sp, #8]
20011434:	2200      	movs	r2, #0
20011436:	4449      	add	r1, r9
20011438:	5c83      	ldrb	r3, [r0, r2]
2001143a:	2b0a      	cmp	r3, #10
2001143c:	f000 80a0 	beq.w	20011580 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1de>
20011440:	188b      	adds	r3, r1, r2
20011442:	1c5e      	adds	r6, r3, #1
20011444:	f000 80af 	beq.w	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011448:	1886      	adds	r6, r0, r2
2001144a:	7875      	ldrb	r5, [r6, #1]
2001144c:	2d0a      	cmp	r5, #10
2001144e:	f000 8081 	beq.w	20011554 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1b2>
20011452:	1c9d      	adds	r5, r3, #2
20011454:	f000 80a7 	beq.w	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011458:	78b5      	ldrb	r5, [r6, #2]
2001145a:	2d0a      	cmp	r5, #10
2001145c:	d07c      	beq.n	20011558 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1b6>
2001145e:	3303      	adds	r3, #3
20011460:	f000 80a1 	beq.w	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011464:	78f3      	ldrb	r3, [r6, #3]
20011466:	2b0a      	cmp	r3, #10
20011468:	d078      	beq.n	2001155c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1ba>
2001146a:	3204      	adds	r2, #4
2001146c:	188b      	adds	r3, r1, r2
2001146e:	d1e3      	bne.n	20011438 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x96>
20011470:	e099      	b.n	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011472:	1cc1      	adds	r1, r0, #3
20011474:	f021 0c03 	bic.w	ip, r1, #3
20011478:	ebbc 0100 	subs.w	r1, ip, r0
2001147c:	d01c      	beq.n	200114b8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x116>
2001147e:	1e8d      	subs	r5, r1, #2
20011480:	f1a1 0a03 	sub.w	sl, r1, #3
20011484:	1e4c      	subs	r4, r1, #1
20011486:	2200      	movs	r2, #0
20011488:	5c83      	ldrb	r3, [r0, r2]
2001148a:	2b0a      	cmp	r3, #10
2001148c:	d074      	beq.n	20011578 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d6>
2001148e:	4294      	cmp	r4, r2
20011490:	d015      	beq.n	200114be <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x11c>
20011492:	1883      	adds	r3, r0, r2
20011494:	785e      	ldrb	r6, [r3, #1]
20011496:	2e0a      	cmp	r6, #10
20011498:	d062      	beq.n	20011560 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1be>
2001149a:	4295      	cmp	r5, r2
2001149c:	d00f      	beq.n	200114be <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x11c>
2001149e:	789e      	ldrb	r6, [r3, #2]
200114a0:	2e0a      	cmp	r6, #10
200114a2:	d05f      	beq.n	20011564 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1c2>
200114a4:	4592      	cmp	sl, r2
200114a6:	d00a      	beq.n	200114be <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x11c>
200114a8:	78db      	ldrb	r3, [r3, #3]
200114aa:	2b0a      	cmp	r3, #10
200114ac:	d05e      	beq.n	2001156c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1ca>
200114ae:	3204      	adds	r2, #4
200114b0:	5c83      	ldrb	r3, [r0, r2]
200114b2:	2b0a      	cmp	r3, #10
200114b4:	d1eb      	bne.n	2001148e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0xec>
200114b6:	e05f      	b.n	20011578 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d6>
200114b8:	f1ae 0208 	sub.w	r2, lr, #8
200114bc:	e007      	b.n	200114ce <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x12c>
200114be:	f240 1a00 	movw	sl, #256	; 0x100
200114c2:	f1ae 0208 	sub.w	r2, lr, #8
200114c6:	4291      	cmp	r1, r2
200114c8:	f2c0 1a01 	movt	sl, #257	; 0x101
200114cc:	d818      	bhi.n	20011500 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x15e>
200114ce:	2304      	movs	r3, #4
200114d0:	eb03 060c 	add.w	r6, r3, ip
200114d4:	e956 5301 	ldrd	r5, r3, [r6, #-4]
200114d8:	f083 340a 	eor.w	r4, r3, #168430090	; 0xa0a0a0a
200114dc:	ebaa 0404 	sub.w	r4, sl, r4
200114e0:	4323      	orrs	r3, r4
200114e2:	f085 340a 	eor.w	r4, r5, #168430090	; 0xa0a0a0a
200114e6:	ebaa 0404 	sub.w	r4, sl, r4
200114ea:	4325      	orrs	r5, r4
200114ec:	402b      	ands	r3, r5
200114ee:	f023 337f 	bic.w	r3, r3, #2139062143	; 0x7f7f7f7f
200114f2:	f1b3 3f80 	cmp.w	r3, #2155905152	; 0x80808080
200114f6:	d103      	bne.n	20011500 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x15e>
200114f8:	3108      	adds	r1, #8
200114fa:	3608      	adds	r6, #8
200114fc:	4291      	cmp	r1, r2
200114fe:	d9e9      	bls.n	200114d4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x132>
20011500:	4571      	cmp	r1, lr
20011502:	d050      	beq.n	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011504:	9b00      	ldr	r3, [sp, #0]
20011506:	eb01 0209 	add.w	r2, r1, r9
2001150a:	9e02      	ldr	r6, [sp, #8]
2001150c:	4413      	add	r3, r2
2001150e:	eb02 0c06 	add.w	ip, r2, r6
20011512:	ebab 0201 	sub.w	r2, fp, r1
20011516:	eba2 0a09 	sub.w	sl, r2, r9
2001151a:	2200      	movs	r2, #0
2001151c:	f1aa 0e01 	sub.w	lr, sl, #1
20011520:	189e      	adds	r6, r3, r2
20011522:	f816 4c01 	ldrb.w	r4, [r6, #-1]
20011526:	2c0a      	cmp	r4, #10
20011528:	d025      	beq.n	20011576 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d4>
2001152a:	4596      	cmp	lr, r2
2001152c:	d03b      	beq.n	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
2001152e:	5c9c      	ldrb	r4, [r3, r2]
20011530:	2c0a      	cmp	r4, #10
20011532:	d019      	beq.n	20011568 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1c6>
20011534:	eb0c 0402 	add.w	r4, ip, r2
20011538:	1ca5      	adds	r5, r4, #2
2001153a:	d034      	beq.n	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
2001153c:	7875      	ldrb	r5, [r6, #1]
2001153e:	2d0a      	cmp	r5, #10
20011540:	d016      	beq.n	20011570 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1ce>
20011542:	3403      	adds	r4, #3
20011544:	d02f      	beq.n	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011546:	78b4      	ldrb	r4, [r6, #2]
20011548:	2c0a      	cmp	r4, #10
2001154a:	d013      	beq.n	20011574 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d2>
2001154c:	3204      	adds	r2, #4
2001154e:	4592      	cmp	sl, r2
20011550:	d1e6      	bne.n	20011520 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x17e>
20011552:	e028      	b.n	200115a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x204>
20011554:	3201      	adds	r2, #1
20011556:	e013      	b.n	20011580 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1de>
20011558:	3202      	adds	r2, #2
2001155a:	e011      	b.n	20011580 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1de>
2001155c:	3203      	adds	r2, #3
2001155e:	e00f      	b.n	20011580 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1de>
20011560:	3201      	adds	r2, #1
20011562:	e009      	b.n	20011578 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d6>
20011564:	3202      	adds	r2, #2
20011566:	e007      	b.n	20011578 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d6>
20011568:	3201      	adds	r2, #1
2001156a:	e004      	b.n	20011576 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d4>
2001156c:	3203      	adds	r2, #3
2001156e:	e003      	b.n	20011578 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d6>
20011570:	3202      	adds	r2, #2
20011572:	e000      	b.n	20011576 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x1d4>
20011574:	3203      	adds	r2, #3
20011576:	440a      	add	r2, r1
20011578:	f240 1a00 	movw	sl, #256	; 0x100
2001157c:	f2c0 1a01 	movt	sl, #257	; 0x101
20011580:	eb02 0109 	add.w	r1, r2, r9
20011584:	f101 0901 	add.w	r9, r1, #1
20011588:	4559      	cmp	r1, fp
2001158a:	f4bf af45 	bcs.w	20011418 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x76>
2001158e:	5c80      	ldrb	r0, [r0, r2]
20011590:	280a      	cmp	r0, #10
20011592:	f47f af41 	bne.w	20011418 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x76>
20011596:	f04f 0a00 	mov.w	sl, #0
2001159a:	464e      	mov	r6, r9
2001159c:	464c      	mov	r4, r9
2001159e:	9805      	ldr	r0, [sp, #20]
200115a0:	7800      	ldrb	r0, [r0, #0]
200115a2:	b950      	cbnz	r0, 200115ba <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x218>
200115a4:	e013      	b.n	200115ce <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x22c>
200115a6:	46d9      	mov	r9, fp
200115a8:	45d8      	cmp	r8, fp
200115aa:	d015      	beq.n	200115d8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x236>
200115ac:	f04f 0a01 	mov.w	sl, #1
200115b0:	4646      	mov	r6, r8
200115b2:	465c      	mov	r4, fp
200115b4:	9805      	ldr	r0, [sp, #20]
200115b6:	7800      	ldrb	r0, [r0, #0]
200115b8:	b148      	cbz	r0, 200115ce <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x22c>
200115ba:	9803      	ldr	r0, [sp, #12]
200115bc:	f645 3114 	movw	r1, #23316	; 0x5b14
200115c0:	f2c2 0101 	movt	r1, #8193	; 0x2001
200115c4:	2204      	movs	r2, #4
200115c6:	68c3      	ldr	r3, [r0, #12]
200115c8:	9804      	ldr	r0, [sp, #16]
200115ca:	4798      	blx	r3
200115cc:	b948      	cbnz	r0, 200115e2 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x240>
200115ce:	4544      	cmp	r4, r8
200115d0:	f47f af02 	bne.w	200113d8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x36>
200115d4:	2000      	movs	r0, #0
200115d6:	e705      	b.n	200113e4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h127277e685f75407E+0x42>
200115d8:	2000      	movs	r0, #0
200115da:	b007      	add	sp, #28
200115dc:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200115e0:	bdf0      	pop	{r4, r5, r6, r7, pc}
200115e2:	2001      	movs	r0, #1
200115e4:	b007      	add	sp, #28
200115e6:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200115ea:	bdf0      	pop	{r4, r5, r6, r7, pc}

200115ec <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h20ab1bfd71c7933fE>:
200115ec:	b5f0      	push	{r4, r5, r6, r7, lr}
200115ee:	af03      	add	r7, sp, #12
200115f0:	f84d 8d04 	str.w	r8, [sp, #-4]!
200115f4:	6885      	ldr	r5, [r0, #8]
200115f6:	e9d0 4600 	ldrd	r4, r6, [r0]
200115fa:	7828      	ldrb	r0, [r5, #0]
200115fc:	b178      	cbz	r0, 2001161e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h20ab1bfd71c7933fE+0x32>
200115fe:	f645 3214 	movw	r2, #23316	; 0x5b14
20011602:	68f3      	ldr	r3, [r6, #12]
20011604:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011608:	4688      	mov	r8, r1
2001160a:	4611      	mov	r1, r2
2001160c:	4620      	mov	r0, r4
2001160e:	2204      	movs	r2, #4
20011610:	4798      	blx	r3
20011612:	4641      	mov	r1, r8
20011614:	b118      	cbz	r0, 2001161e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h20ab1bfd71c7933fE+0x32>
20011616:	2001      	movs	r0, #1
20011618:	f85d 8b04 	ldr.w	r8, [sp], #4
2001161c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001161e:	f1a1 000a 	sub.w	r0, r1, #10
20011622:	6932      	ldr	r2, [r6, #16]
20011624:	fab0 f080 	clz	r0, r0
20011628:	0940      	lsrs	r0, r0, #5
2001162a:	7028      	strb	r0, [r5, #0]
2001162c:	4620      	mov	r0, r4
2001162e:	f85d 8b04 	ldr.w	r8, [sp], #4
20011632:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
20011636:	4710      	bx	r2

20011638 <_ZN4core3fmt5Write9write_fmt17h89f5dbbc734c8304E>:
20011638:	460a      	mov	r2, r1
2001163a:	f645 21f8 	movw	r1, #23288	; 0x5af8
2001163e:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011642:	f7ff bdcd 	b.w	200111e0 <_ZN4core3fmt5write17h69f52fae072ba4c6E>

20011646 <_ZN4core6result13unwrap_failed17h727c9a6b0cd4ec86E>:
20011646:	b580      	push	{r7, lr}
20011648:	466f      	mov	r7, sp
2001164a:	b08e      	sub	sp, #56	; 0x38
2001164c:	469c      	mov	ip, r3
2001164e:	f645 6304 	movw	r3, #24068	; 0x5e04
20011652:	f2c2 0301 	movt	r3, #8193	; 0x2001
20011656:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
2001165a:	2000      	movs	r0, #0
2001165c:	9008      	str	r0, [sp, #32]
2001165e:	2002      	movs	r0, #2
20011660:	9005      	str	r0, [sp, #20]
20011662:	f645 21e8 	movw	r1, #23272	; 0x5ae8
20011666:	9007      	str	r0, [sp, #28]
20011668:	a80a      	add	r0, sp, #40	; 0x28
2001166a:	9006      	str	r0, [sp, #24]
2001166c:	f241 10cf 	movw	r0, #4559	; 0x11cf
20011670:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011674:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011678:	900d      	str	r0, [sp, #52]	; 0x34
2001167a:	a802      	add	r0, sp, #8
2001167c:	900c      	str	r0, [sp, #48]	; 0x30
2001167e:	f640 20d5 	movw	r0, #2773	; 0xad5
20011682:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011686:	9104      	str	r1, [sp, #16]
20011688:	900b      	str	r0, [sp, #44]	; 0x2c
2001168a:	4668      	mov	r0, sp
2001168c:	900a      	str	r0, [sp, #40]	; 0x28
2001168e:	a804      	add	r0, sp, #16
20011690:	4661      	mov	r1, ip
20011692:	f7fe ffc0 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

20011696 <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd9f7ba0cdf2d97b1E>:
20011696:	b580      	push	{r7, lr}
20011698:	466f      	mov	r7, sp
2001169a:	b08c      	sub	sp, #48	; 0x30
2001169c:	7802      	ldrb	r2, [r0, #0]
2001169e:	2a64      	cmp	r2, #100	; 0x64
200116a0:	d311      	bcc.n	200116c6 <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd9f7ba0cdf2d97b1E+0x30>
200116a2:	2029      	movs	r0, #41	; 0x29
200116a4:	4350      	muls	r0, r2
200116a6:	0b03      	lsrs	r3, r0, #12
200116a8:	f06f 0063 	mvn.w	r0, #99	; 0x63
200116ac:	fb13 2000 	smlabb	r0, r3, r0, r2
200116b0:	f645 324a 	movw	r2, #23370	; 0x5b4a
200116b4:	f2c2 0201 	movt	r2, #8193	; 0x2001
200116b8:	b2c0      	uxtb	r0, r0
200116ba:	f832 0010 	ldrh.w	r0, [r2, r0, lsl #1]
200116be:	f827 0c02 	strh.w	r0, [r7, #-2]
200116c2:	2024      	movs	r0, #36	; 0x24
200116c4:	e003      	b.n	200116ce <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd9f7ba0cdf2d97b1E+0x38>
200116c6:	2a0a      	cmp	r2, #10
200116c8:	d207      	bcs.n	200116da <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd9f7ba0cdf2d97b1E+0x44>
200116ca:	2026      	movs	r0, #38	; 0x26
200116cc:	4613      	mov	r3, r2
200116ce:	f043 0230 	orr.w	r2, r3, #48	; 0x30
200116d2:	f1a7 0327 	sub.w	r3, r7, #39	; 0x27
200116d6:	541a      	strb	r2, [r3, r0]
200116d8:	e008      	b.n	200116ec <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd9f7ba0cdf2d97b1E+0x56>
200116da:	f645 304a 	movw	r0, #23370	; 0x5b4a
200116de:	f2c2 0001 	movt	r0, #8193	; 0x2001
200116e2:	f830 0012 	ldrh.w	r0, [r0, r2, lsl #1]
200116e6:	f827 0c02 	strh.w	r0, [r7, #-2]
200116ea:	2025      	movs	r0, #37	; 0x25
200116ec:	f1c0 0227 	rsb	r2, r0, #39	; 0x27
200116f0:	9200      	str	r2, [sp, #0]
200116f2:	f1a7 0227 	sub.w	r2, r7, #39	; 0x27
200116f6:	1813      	adds	r3, r2, r0
200116f8:	4608      	mov	r0, r1
200116fa:	2101      	movs	r1, #1
200116fc:	2200      	movs	r2, #0
200116fe:	f7ff f853 	bl	200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>
20011702:	b00c      	add	sp, #48	; 0x30
20011704:	bd80      	pop	{r7, pc}

20011706 <_ZN4core6option13unwrap_failed17hb3ca06b9e4ca82c8E>:
20011706:	b580      	push	{r7, lr}
20011708:	466f      	mov	r7, sp
2001170a:	f645 10ad 	movw	r0, #22957	; 0x59ad
2001170e:	f645 62b4 	movw	r2, #24244	; 0x5eb4
20011712:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011716:	f2c2 0201 	movt	r2, #8193	; 0x2001
2001171a:	212b      	movs	r1, #43	; 0x2b
2001171c:	f7ff f96a 	bl	200109f4 <_ZN4core9panicking5panic17hecf8dc16aef0cc30E>

20011720 <_ZN4core9panicking18panic_nounwind_fmt17h47c6b4851b525e00E>:
20011720:	b580      	push	{r7, lr}
20011722:	466f      	mov	r7, sp
20011724:	b088      	sub	sp, #32
20011726:	e890 407a 	ldmia.w	r0, {r1, r3, r4, r5, r6, lr}
2001172a:	46ec      	mov	ip, sp
2001172c:	4662      	mov	r2, ip
2001172e:	2000      	movs	r0, #0
20011730:	e882 407a 	stmia.w	r2, {r1, r3, r4, r5, r6, lr}
20011734:	f8ad 001c 	strh.w	r0, [sp, #28]
20011738:	f645 1070 	movw	r0, #22896	; 0x5970
2001173c:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011740:	9006      	str	r0, [sp, #24]
20011742:	4660      	mov	r0, ip
20011744:	f002 fd86 	bl	20014254 <rust_begin_unwind>

20011748 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E>:
20011748:	b5f0      	push	{r4, r5, r6, r7, lr}
2001174a:	af03      	add	r7, sp, #12
2001174c:	f84d 8d04 	str.w	r8, [sp, #-4]!
20011750:	b0a2      	sub	sp, #136	; 0x88
20011752:	6800      	ldr	r0, [r0, #0]
20011754:	f10d 0c08 	add.w	ip, sp, #8
20011758:	2400      	movs	r4, #0
2001175a:	f04f 0e57 	mov.w	lr, #87	; 0x57
2001175e:	f000 030f 	and.w	r3, r0, #15
20011762:	4622      	mov	r2, r4
20011764:	f103 0557 	add.w	r5, r3, #87	; 0x57
20011768:	2b0a      	cmp	r3, #10
2001176a:	4464      	add	r4, ip
2001176c:	f102 0880 	add.w	r8, r2, #128	; 0x80
20011770:	bf38      	it	cc
20011772:	f103 0530 	addcc.w	r5, r3, #48	; 0x30
20011776:	2810      	cmp	r0, #16
20011778:	f884 507f 	strb.w	r5, [r4, #127]	; 0x7f
2001177c:	d32a      	bcc.n	200117d4 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0x8c>
2001177e:	b2c5      	uxtb	r5, r0
20011780:	2da0      	cmp	r5, #160	; 0xa0
20011782:	eb0e 1615 	add.w	r6, lr, r5, lsr #4
20011786:	ea4f 1315 	mov.w	r3, r5, lsr #4
2001178a:	bf38      	it	cc
2001178c:	f103 0630 	addcc.w	r6, r3, #48	; 0x30
20011790:	0a05      	lsrs	r5, r0, #8
20011792:	f884 607e 	strb.w	r6, [r4, #126]	; 0x7e
20011796:	d020      	beq.n	200117da <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0x92>
20011798:	f005 030f 	and.w	r3, r5, #15
2001179c:	f103 0557 	add.w	r5, r3, #87	; 0x57
200117a0:	2b0a      	cmp	r3, #10
200117a2:	bf38      	it	cc
200117a4:	f103 0530 	addcc.w	r5, r3, #48	; 0x30
200117a8:	f884 507d 	strb.w	r5, [r4, #125]	; 0x7d
200117ac:	0b05      	lsrs	r5, r0, #12
200117ae:	d019      	beq.n	200117e4 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0x9c>
200117b0:	f005 030f 	and.w	r3, r5, #15
200117b4:	f103 0557 	add.w	r5, r3, #87	; 0x57
200117b8:	2b0a      	cmp	r3, #10
200117ba:	bf38      	it	cc
200117bc:	f103 0530 	addcc.w	r5, r3, #48	; 0x30
200117c0:	f884 507c 	strb.w	r5, [r4, #124]	; 0x7c
200117c4:	1f14      	subs	r4, r2, #4
200117c6:	0c00      	lsrs	r0, r0, #16
200117c8:	d1c9      	bne.n	2001175e <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0x16>
200117ca:	f102 007c 	add.w	r0, r2, #124	; 0x7c
200117ce:	f1a8 0803 	sub.w	r8, r8, #3
200117d2:	e00b      	b.n	200117ec <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0xa4>
200117d4:	f1a8 0001 	sub.w	r0, r8, #1
200117d8:	e008      	b.n	200117ec <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0xa4>
200117da:	f1a8 0002 	sub.w	r0, r8, #2
200117de:	f1a8 0801 	sub.w	r8, r8, #1
200117e2:	e003      	b.n	200117ec <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0xa4>
200117e4:	f1a8 0003 	sub.w	r0, r8, #3
200117e8:	f1a8 0802 	sub.w	r8, r8, #2
200117ec:	2881      	cmp	r0, #129	; 0x81
200117ee:	d211      	bcs.n	20011814 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E+0xcc>
200117f0:	f1c8 0281 	rsb	r2, r8, #129	; 0x81
200117f4:	9200      	str	r2, [sp, #0]
200117f6:	f645 3248 	movw	r2, #23368	; 0x5b48
200117fa:	eb0c 0300 	add.w	r3, ip, r0
200117fe:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011802:	4608      	mov	r0, r1
20011804:	4611      	mov	r1, r2
20011806:	2202      	movs	r2, #2
20011808:	f7fe ffce 	bl	200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>
2001180c:	b022      	add	sp, #136	; 0x88
2001180e:	f85d 8b04 	ldr.w	r8, [sp], #4
20011812:	bdf0      	pop	{r4, r5, r6, r7, pc}
20011814:	f7fe ff0f 	bl	20010636 <_ZN4core5slice5index26slice_start_index_len_fail17h51498c6c96bae4bbE>

20011818 <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE>:
20011818:	b5f0      	push	{r4, r5, r6, r7, lr}
2001181a:	af03      	add	r7, sp, #12
2001181c:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
20011820:	b08e      	sub	sp, #56	; 0x38
20011822:	4603      	mov	r3, r0
20011824:	6806      	ldr	r6, [r0, #0]
20011826:	7a00      	ldrb	r0, [r0, #8]
20011828:	b108      	cbz	r0, 2001182e <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0x16>
2001182a:	2001      	movs	r0, #1
2001182c:	e061      	b.n	200118f2 <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0xda>
2001182e:	685c      	ldr	r4, [r3, #4]
20011830:	4698      	mov	r8, r3
20011832:	69e0      	ldr	r0, [r4, #28]
20011834:	0743      	lsls	r3, r0, #29
20011836:	d419      	bmi.n	2001186c <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0x54>
20011838:	460d      	mov	r5, r1
2001183a:	f645 3118 	movw	r1, #23320	; 0x5b18
2001183e:	4691      	mov	r9, r2
20011840:	f645 321c 	movw	r2, #23324	; 0x5b1c
20011844:	e9d4 0305 	ldrd	r0, r3, [r4, #20]
20011848:	f2c2 0101 	movt	r1, #8193	; 0x2001
2001184c:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011850:	2e00      	cmp	r6, #0
20011852:	bf08      	it	eq
20011854:	4611      	moveq	r1, r2
20011856:	68db      	ldr	r3, [r3, #12]
20011858:	f04f 0202 	mov.w	r2, #2
2001185c:	bf08      	it	eq
2001185e:	2201      	moveq	r2, #1
20011860:	4798      	blx	r3
20011862:	bbd0      	cbnz	r0, 200118da <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0xc2>
20011864:	4628      	mov	r0, r5
20011866:	4621      	mov	r1, r4
20011868:	47c8      	blx	r9
2001186a:	e041      	b.n	200118f0 <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0xd8>
2001186c:	b976      	cbnz	r6, 2001188c <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0x74>
2001186e:	4689      	mov	r9, r1
20011870:	e9d4 0105 	ldrd	r0, r1, [r4, #20]
20011874:	68cb      	ldr	r3, [r1, #12]
20011876:	f645 311d 	movw	r1, #23325	; 0x5b1d
2001187a:	4615      	mov	r5, r2
2001187c:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011880:	2202      	movs	r2, #2
20011882:	4798      	blx	r3
20011884:	bb48      	cbnz	r0, 200118da <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0xc2>
20011886:	69e0      	ldr	r0, [r4, #28]
20011888:	462a      	mov	r2, r5
2001188a:	4649      	mov	r1, r9
2001188c:	2301      	movs	r3, #1
2001188e:	f645 25f8 	movw	r5, #23288	; 0x5af8
20011892:	f807 3c3d 	strb.w	r3, [r7, #-61]
20011896:	f1a7 033d 	sub.w	r3, r7, #61	; 0x3d
2001189a:	9303      	str	r3, [sp, #12]
2001189c:	ab01      	add	r3, sp, #4
2001189e:	f2c2 0501 	movt	r5, #8193	; 0x2001
200118a2:	900c      	str	r0, [sp, #48]	; 0x30
200118a4:	930a      	str	r3, [sp, #40]	; 0x28
200118a6:	e9d4 3002 	ldrd	r3, r0, [r4, #8]
200118aa:	e9d4 9a00 	ldrd	r9, sl, [r4]
200118ae:	e9cd 3007 	strd	r3, r0, [sp, #28]
200118b2:	ab05      	add	r3, sp, #20
200118b4:	f8d4 c010 	ldr.w	ip, [r4, #16]
200118b8:	4608      	mov	r0, r1
200118ba:	f894 e020 	ldrb.w	lr, [r4, #32]
200118be:	4619      	mov	r1, r3
200118c0:	950b      	str	r5, [sp, #44]	; 0x2c
200118c2:	6965      	ldr	r5, [r4, #20]
200118c4:	69a4      	ldr	r4, [r4, #24]
200118c6:	f88d e034 	strb.w	lr, [sp, #52]	; 0x34
200118ca:	f8cd c024 	str.w	ip, [sp, #36]	; 0x24
200118ce:	e9cd 5401 	strd	r5, r4, [sp, #4]
200118d2:	e9cd 9a05 	strd	r9, sl, [sp, #20]
200118d6:	4790      	blx	r2
200118d8:	b108      	cbz	r0, 200118de <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0xc6>
200118da:	2001      	movs	r0, #1
200118dc:	e008      	b.n	200118f0 <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE+0xd8>
200118de:	e9dd 010a 	ldrd	r0, r1, [sp, #40]	; 0x28
200118e2:	2202      	movs	r2, #2
200118e4:	68cb      	ldr	r3, [r1, #12]
200118e6:	f645 311a 	movw	r1, #23322	; 0x5b1a
200118ea:	f2c2 0101 	movt	r1, #8193	; 0x2001
200118ee:	4798      	blx	r3
200118f0:	4643      	mov	r3, r8
200118f2:	1c71      	adds	r1, r6, #1
200118f4:	7218      	strb	r0, [r3, #8]
200118f6:	6019      	str	r1, [r3, #0]
200118f8:	4618      	mov	r0, r3
200118fa:	b00e      	add	sp, #56	; 0x38
200118fc:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20011900:	bdf0      	pop	{r4, r5, r6, r7, pc}

20011902 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E>:
20011902:	b5f0      	push	{r4, r5, r6, r7, lr}
20011904:	af03      	add	r7, sp, #12
20011906:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
2001190a:	b08e      	sub	sp, #56	; 0x38
2001190c:	7903      	ldrb	r3, [r0, #4]
2001190e:	f04f 0801 	mov.w	r8, #1
20011912:	2501      	movs	r5, #1
20011914:	2b00      	cmp	r3, #0
20011916:	d164      	bne.n	200119e2 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0xe0>
20011918:	6804      	ldr	r4, [r0, #0]
2001191a:	4681      	mov	r9, r0
2001191c:	7945      	ldrb	r5, [r0, #5]
2001191e:	69e3      	ldr	r3, [r4, #28]
20011920:	075e      	lsls	r6, r3, #29
20011922:	d415      	bmi.n	20011950 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0x4e>
20011924:	b17d      	cbz	r5, 20011946 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0x44>
20011926:	e9d4 0305 	ldrd	r0, r3, [r4, #20]
2001192a:	f645 3618 	movw	r6, #23320	; 0x5b18
2001192e:	68db      	ldr	r3, [r3, #12]
20011930:	f2c2 0601 	movt	r6, #8193	; 0x2001
20011934:	460d      	mov	r5, r1
20011936:	4631      	mov	r1, r6
20011938:	4616      	mov	r6, r2
2001193a:	2202      	movs	r2, #2
2001193c:	4798      	blx	r3
2001193e:	4632      	mov	r2, r6
20011940:	4629      	mov	r1, r5
20011942:	2800      	cmp	r0, #0
20011944:	d140      	bne.n	200119c8 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0xc6>
20011946:	68d2      	ldr	r2, [r2, #12]
20011948:	4608      	mov	r0, r1
2001194a:	4621      	mov	r1, r4
2001194c:	4790      	blx	r2
2001194e:	e046      	b.n	200119de <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0xdc>
20011950:	b995      	cbnz	r5, 20011978 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0x76>
20011952:	e9d4 0305 	ldrd	r0, r3, [r4, #20]
20011956:	f645 3620 	movw	r6, #23328	; 0x5b20
2001195a:	68db      	ldr	r3, [r3, #12]
2001195c:	f2c2 0601 	movt	r6, #8193	; 0x2001
20011960:	468a      	mov	sl, r1
20011962:	4631      	mov	r1, r6
20011964:	4616      	mov	r6, r2
20011966:	2201      	movs	r2, #1
20011968:	2501      	movs	r5, #1
2001196a:	4798      	blx	r3
2001196c:	2800      	cmp	r0, #0
2001196e:	4648      	mov	r0, r9
20011970:	d137      	bne.n	200119e2 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0xe0>
20011972:	69e3      	ldr	r3, [r4, #28]
20011974:	4632      	mov	r2, r6
20011976:	4651      	mov	r1, sl
20011978:	ad01      	add	r5, sp, #4
2001197a:	f645 26f8 	movw	r6, #23288	; 0x5af8
2001197e:	2001      	movs	r0, #1
20011980:	f894 e020 	ldrb.w	lr, [r4, #32]
20011984:	930c      	str	r3, [sp, #48]	; 0x30
20011986:	f2c2 0601 	movt	r6, #8193	; 0x2001
2001198a:	950a      	str	r5, [sp, #40]	; 0x28
2001198c:	e9d4 3502 	ldrd	r3, r5, [r4, #8]
20011990:	f807 0c3d 	strb.w	r0, [r7, #-61]
20011994:	f1a7 003d 	sub.w	r0, r7, #61	; 0x3d
20011998:	f88d e034 	strb.w	lr, [sp, #52]	; 0x34
2001199c:	f10d 0e1c 	add.w	lr, sp, #28
200119a0:	9003      	str	r0, [sp, #12]
200119a2:	e9d4 a000 	ldrd	sl, r0, [r4]
200119a6:	f8d4 c010 	ldr.w	ip, [r4, #16]
200119aa:	960b      	str	r6, [sp, #44]	; 0x2c
200119ac:	6966      	ldr	r6, [r4, #20]
200119ae:	69a4      	ldr	r4, [r4, #24]
200119b0:	e88e 1028 	stmia.w	lr, {r3, r5, ip}
200119b4:	68d3      	ldr	r3, [r2, #12]
200119b6:	aa05      	add	r2, sp, #20
200119b8:	e9cd a005 	strd	sl, r0, [sp, #20]
200119bc:	4608      	mov	r0, r1
200119be:	4611      	mov	r1, r2
200119c0:	e9cd 6401 	strd	r6, r4, [sp, #4]
200119c4:	4798      	blx	r3
200119c6:	b108      	cbz	r0, 200119cc <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0xca>
200119c8:	2501      	movs	r5, #1
200119ca:	e009      	b.n	200119e0 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E+0xde>
200119cc:	e9dd 010a 	ldrd	r0, r1, [sp, #40]	; 0x28
200119d0:	2202      	movs	r2, #2
200119d2:	68cb      	ldr	r3, [r1, #12]
200119d4:	f645 311a 	movw	r1, #23322	; 0x5b1a
200119d8:	f2c2 0101 	movt	r1, #8193	; 0x2001
200119dc:	4798      	blx	r3
200119de:	4605      	mov	r5, r0
200119e0:	4648      	mov	r0, r9
200119e2:	f880 8005 	strb.w	r8, [r0, #5]
200119e6:	7105      	strb	r5, [r0, #4]
200119e8:	b00e      	add	sp, #56	; 0x38
200119ea:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200119ee:	bdf0      	pop	{r4, r5, r6, r7, pc}

200119f0 <_ZN4core3fmt8builders9DebugList6finish17h1edfe174d0080066E>:
200119f0:	b5d0      	push	{r4, r6, r7, lr}
200119f2:	af02      	add	r7, sp, #8
200119f4:	4604      	mov	r4, r0
200119f6:	7900      	ldrb	r0, [r0, #4]
200119f8:	b110      	cbz	r0, 20011a00 <_ZN4core3fmt8builders9DebugList6finish17h1edfe174d0080066E+0x10>
200119fa:	2001      	movs	r0, #1
200119fc:	7120      	strb	r0, [r4, #4]
200119fe:	bdd0      	pop	{r4, r6, r7, pc}
20011a00:	6820      	ldr	r0, [r4, #0]
20011a02:	2201      	movs	r2, #1
20011a04:	e9d0 0105 	ldrd	r0, r1, [r0, #20]
20011a08:	68cb      	ldr	r3, [r1, #12]
20011a0a:	f645 3121 	movw	r1, #23329	; 0x5b21
20011a0e:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011a12:	4798      	blx	r3
20011a14:	7120      	strb	r0, [r4, #4]
20011a16:	bdd0      	pop	{r4, r6, r7, pc}

20011a18 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E>:
20011a18:	b5f0      	push	{r4, r5, r6, r7, lr}
20011a1a:	af03      	add	r7, sp, #12
20011a1c:	f84d bd04 	str.w	fp, [sp, #-4]!
20011a20:	b084      	sub	sp, #16
20011a22:	460d      	mov	r5, r1
20011a24:	4606      	mov	r6, r0
20011a26:	e9d0 0105 	ldrd	r0, r1, [r0, #20]
20011a2a:	4614      	mov	r4, r2
20011a2c:	68cb      	ldr	r3, [r1, #12]
20011a2e:	f645 51c8 	movw	r1, #24008	; 0x5dc8
20011a32:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011a36:	2208      	movs	r2, #8
20011a38:	4798      	blx	r3
20011a3a:	f88d 000c 	strb.w	r0, [sp, #12]
20011a3e:	2000      	movs	r0, #0
20011a40:	f643 628d 	movw	r2, #16013	; 0x3e8d
20011a44:	f88d 000d 	strb.w	r0, [sp, #13]
20011a48:	9001      	str	r0, [sp, #4]
20011a4a:	a801      	add	r0, sp, #4
20011a4c:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011a50:	4629      	mov	r1, r5
20011a52:	9602      	str	r6, [sp, #8]
20011a54:	f7ff fee0 	bl	20011818 <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE>
20011a58:	f643 622d 	movw	r2, #15917	; 0x3e2d
20011a5c:	4621      	mov	r1, r4
20011a5e:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011a62:	f7ff fed9 	bl	20011818 <_ZN4core3fmt8builders10DebugTuple5field17h4d193314c5e3fddfE>
20011a66:	9901      	ldr	r1, [sp, #4]
20011a68:	f89d 200c 	ldrb.w	r2, [sp, #12]
20011a6c:	2900      	cmp	r1, #0
20011a6e:	4608      	mov	r0, r1
20011a70:	bf18      	it	ne
20011a72:	2001      	movne	r0, #1
20011a74:	ea40 0002 	orr.w	r0, r0, r2
20011a78:	d016      	beq.n	20011aa8 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E+0x90>
20011a7a:	07d2      	lsls	r2, r2, #31
20011a7c:	d114      	bne.n	20011aa8 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E+0x90>
20011a7e:	2901      	cmp	r1, #1
20011a80:	d118      	bne.n	20011ab4 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E+0x9c>
20011a82:	f89d 000d 	ldrb.w	r0, [sp, #13]
20011a86:	9c02      	ldr	r4, [sp, #8]
20011a88:	b1a8      	cbz	r0, 20011ab6 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E+0x9e>
20011a8a:	7f20      	ldrb	r0, [r4, #28]
20011a8c:	0740      	lsls	r0, r0, #29
20011a8e:	d412      	bmi.n	20011ab6 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E+0x9e>
20011a90:	e9d4 0105 	ldrd	r0, r1, [r4, #20]
20011a94:	2201      	movs	r2, #1
20011a96:	68cb      	ldr	r3, [r1, #12]
20011a98:	f645 311f 	movw	r1, #23327	; 0x5b1f
20011a9c:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011aa0:	4798      	blx	r3
20011aa2:	4601      	mov	r1, r0
20011aa4:	2001      	movs	r0, #1
20011aa6:	b131      	cbz	r1, 20011ab6 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E+0x9e>
20011aa8:	f000 0001 	and.w	r0, r0, #1
20011aac:	b004      	add	sp, #16
20011aae:	f85d bb04 	ldr.w	fp, [sp], #4
20011ab2:	bdf0      	pop	{r4, r5, r6, r7, pc}
20011ab4:	9c02      	ldr	r4, [sp, #8]
20011ab6:	e9d4 0105 	ldrd	r0, r1, [r4, #20]
20011aba:	2201      	movs	r2, #1
20011abc:	68cb      	ldr	r3, [r1, #12]
20011abe:	f645 1180 	movw	r1, #22912	; 0x5980
20011ac2:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011ac6:	4798      	blx	r3
20011ac8:	f000 0001 	and.w	r0, r0, #1
20011acc:	b004      	add	sp, #16
20011ace:	f85d bb04 	ldr.w	fp, [sp], #4
20011ad2:	bdf0      	pop	{r4, r5, r6, r7, pc}

20011ad4 <_ZN4core3fmt9Formatter10debug_list17h4286591438d2a557E>:
20011ad4:	b5b0      	push	{r4, r5, r7, lr}
20011ad6:	af02      	add	r7, sp, #8
20011ad8:	460c      	mov	r4, r1
20011ada:	4605      	mov	r5, r0
20011adc:	e9d1 0105 	ldrd	r0, r1, [r1, #20]
20011ae0:	2201      	movs	r2, #1
20011ae2:	68cb      	ldr	r3, [r1, #12]
20011ae4:	f645 11ac 	movw	r1, #22956	; 0x59ac
20011ae8:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011aec:	4798      	blx	r3
20011aee:	2100      	movs	r1, #0
20011af0:	7128      	strb	r0, [r5, #4]
20011af2:	7169      	strb	r1, [r5, #5]
20011af4:	602c      	str	r4, [r5, #0]
20011af6:	bdb0      	pop	{r4, r5, r7, pc}

20011af8 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17hd23e82d5ca525cd3E>:
20011af8:	b580      	push	{r7, lr}
20011afa:	466f      	mov	r7, sp
20011afc:	b08c      	sub	sp, #48	; 0x30
20011afe:	2102      	movs	r1, #2
20011b00:	e9cd 0100 	strd	r0, r1, [sp]
20011b04:	2000      	movs	r0, #0
20011b06:	9006      	str	r0, [sp, #24]
20011b08:	2003      	movs	r0, #3
20011b0a:	9003      	str	r0, [sp, #12]
20011b0c:	f645 4098 	movw	r0, #23704	; 0x5c98
20011b10:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011b14:	9105      	str	r1, [sp, #20]
20011b16:	9002      	str	r0, [sp, #8]
20011b18:	a808      	add	r0, sp, #32
20011b1a:	9004      	str	r0, [sp, #16]
20011b1c:	f240 60bb 	movw	r0, #1723	; 0x6bb
20011b20:	f2c2 0001 	movt	r0, #8193	; 0x2001
20011b24:	4669      	mov	r1, sp
20011b26:	e9cd 0109 	strd	r0, r1, [sp, #36]	; 0x24
20011b2a:	f645 01dc 	movw	r1, #22748	; 0x58dc
20011b2e:	900b      	str	r0, [sp, #44]	; 0x2c
20011b30:	a801      	add	r0, sp, #4
20011b32:	9008      	str	r0, [sp, #32]
20011b34:	a802      	add	r0, sp, #8
20011b36:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011b3a:	f7fe fd6c 	bl	20010616 <_ZN4core9panicking9panic_fmt17h3888b6efc65e6ac7E>

20011b3e <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17hcc6b0f23d2c937d6E>:
20011b3e:	b580      	push	{r7, lr}
20011b40:	466f      	mov	r7, sp
20011b42:	b0a2      	sub	sp, #136	; 0x88
20011b44:	7800      	ldrb	r0, [r0, #0]
20011b46:	460a      	mov	r2, r1
20011b48:	f000 010f 	and.w	r1, r0, #15
20011b4c:	f101 0337 	add.w	r3, r1, #55	; 0x37
20011b50:	290a      	cmp	r1, #10
20011b52:	bf38      	it	cc
20011b54:	f101 0330 	addcc.w	r3, r1, #48	; 0x30
20011b58:	2137      	movs	r1, #55	; 0x37
20011b5a:	eb01 1110 	add.w	r1, r1, r0, lsr #4
20011b5e:	f88d 3087 	strb.w	r3, [sp, #135]	; 0x87
20011b62:	0903      	lsrs	r3, r0, #4
20011b64:	28a0      	cmp	r0, #160	; 0xa0
20011b66:	bf38      	it	cc
20011b68:	f103 0130 	addcc.w	r1, r3, #48	; 0x30
20011b6c:	2810      	cmp	r0, #16
20011b6e:	bf38      	it	cc
20011b70:	2100      	movcc	r1, #0
20011b72:	f88d 1086 	strb.w	r1, [sp, #134]	; 0x86
20011b76:	f04f 0102 	mov.w	r1, #2
20011b7a:	bf38      	it	cc
20011b7c:	2101      	movcc	r1, #1
20011b7e:	9100      	str	r1, [sp, #0]
20011b80:	a902      	add	r1, sp, #8
20011b82:	2810      	cmp	r0, #16
20011b84:	f101 037e 	add.w	r3, r1, #126	; 0x7e
20011b88:	4610      	mov	r0, r2
20011b8a:	bf38      	it	cc
20011b8c:	f101 037f 	addcc.w	r3, r1, #127	; 0x7f
20011b90:	f645 3148 	movw	r1, #23368	; 0x5b48
20011b94:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011b98:	2202      	movs	r2, #2
20011b9a:	f7fe fe05 	bl	200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>
20011b9e:	b022      	add	sp, #136	; 0x88
20011ba0:	bd80      	pop	{r7, pc}

20011ba2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17h7a52f995f2c3d7aeE>:
20011ba2:	b580      	push	{r7, lr}
20011ba4:	466f      	mov	r7, sp
20011ba6:	b0a2      	sub	sp, #136	; 0x88
20011ba8:	7800      	ldrb	r0, [r0, #0]
20011baa:	460a      	mov	r2, r1
20011bac:	f000 010f 	and.w	r1, r0, #15
20011bb0:	f101 0357 	add.w	r3, r1, #87	; 0x57
20011bb4:	290a      	cmp	r1, #10
20011bb6:	bf38      	it	cc
20011bb8:	f101 0330 	addcc.w	r3, r1, #48	; 0x30
20011bbc:	2157      	movs	r1, #87	; 0x57
20011bbe:	eb01 1110 	add.w	r1, r1, r0, lsr #4
20011bc2:	f88d 3087 	strb.w	r3, [sp, #135]	; 0x87
20011bc6:	0903      	lsrs	r3, r0, #4
20011bc8:	28a0      	cmp	r0, #160	; 0xa0
20011bca:	bf38      	it	cc
20011bcc:	f103 0130 	addcc.w	r1, r3, #48	; 0x30
20011bd0:	2810      	cmp	r0, #16
20011bd2:	bf38      	it	cc
20011bd4:	2100      	movcc	r1, #0
20011bd6:	f88d 1086 	strb.w	r1, [sp, #134]	; 0x86
20011bda:	f04f 0102 	mov.w	r1, #2
20011bde:	bf38      	it	cc
20011be0:	2101      	movcc	r1, #1
20011be2:	9100      	str	r1, [sp, #0]
20011be4:	a902      	add	r1, sp, #8
20011be6:	2810      	cmp	r0, #16
20011be8:	f101 037e 	add.w	r3, r1, #126	; 0x7e
20011bec:	4610      	mov	r0, r2
20011bee:	bf38      	it	cc
20011bf0:	f101 037f 	addcc.w	r3, r1, #127	; 0x7f
20011bf4:	f645 3148 	movw	r1, #23368	; 0x5b48
20011bf8:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011bfc:	2202      	movs	r2, #2
20011bfe:	f7fe fdd3 	bl	200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>
20011c02:	b022      	add	sp, #136	; 0x88
20011c04:	bd80      	pop	{r7, pc}

20011c06 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E>:
20011c06:	b5f0      	push	{r4, r5, r6, r7, lr}
20011c08:	af03      	add	r7, sp, #12
20011c0a:	f84d 8d04 	str.w	r8, [sp, #-4]!
20011c0e:	b0a2      	sub	sp, #136	; 0x88
20011c10:	6800      	ldr	r0, [r0, #0]
20011c12:	f10d 0c08 	add.w	ip, sp, #8
20011c16:	2400      	movs	r4, #0
20011c18:	f04f 0e37 	mov.w	lr, #55	; 0x37
20011c1c:	f000 030f 	and.w	r3, r0, #15
20011c20:	4622      	mov	r2, r4
20011c22:	f103 0537 	add.w	r5, r3, #55	; 0x37
20011c26:	2b0a      	cmp	r3, #10
20011c28:	4464      	add	r4, ip
20011c2a:	f102 0880 	add.w	r8, r2, #128	; 0x80
20011c2e:	bf38      	it	cc
20011c30:	f103 0530 	addcc.w	r5, r3, #48	; 0x30
20011c34:	2810      	cmp	r0, #16
20011c36:	f884 507f 	strb.w	r5, [r4, #127]	; 0x7f
20011c3a:	d32a      	bcc.n	20011c92 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0x8c>
20011c3c:	b2c5      	uxtb	r5, r0
20011c3e:	2da0      	cmp	r5, #160	; 0xa0
20011c40:	eb0e 1615 	add.w	r6, lr, r5, lsr #4
20011c44:	ea4f 1315 	mov.w	r3, r5, lsr #4
20011c48:	bf38      	it	cc
20011c4a:	f103 0630 	addcc.w	r6, r3, #48	; 0x30
20011c4e:	0a05      	lsrs	r5, r0, #8
20011c50:	f884 607e 	strb.w	r6, [r4, #126]	; 0x7e
20011c54:	d020      	beq.n	20011c98 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0x92>
20011c56:	f005 030f 	and.w	r3, r5, #15
20011c5a:	f103 0537 	add.w	r5, r3, #55	; 0x37
20011c5e:	2b0a      	cmp	r3, #10
20011c60:	bf38      	it	cc
20011c62:	f103 0530 	addcc.w	r5, r3, #48	; 0x30
20011c66:	f884 507d 	strb.w	r5, [r4, #125]	; 0x7d
20011c6a:	0b05      	lsrs	r5, r0, #12
20011c6c:	d019      	beq.n	20011ca2 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0x9c>
20011c6e:	f005 030f 	and.w	r3, r5, #15
20011c72:	f103 0537 	add.w	r5, r3, #55	; 0x37
20011c76:	2b0a      	cmp	r3, #10
20011c78:	bf38      	it	cc
20011c7a:	f103 0530 	addcc.w	r5, r3, #48	; 0x30
20011c7e:	f884 507c 	strb.w	r5, [r4, #124]	; 0x7c
20011c82:	1f14      	subs	r4, r2, #4
20011c84:	0c00      	lsrs	r0, r0, #16
20011c86:	d1c9      	bne.n	20011c1c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0x16>
20011c88:	f102 007c 	add.w	r0, r2, #124	; 0x7c
20011c8c:	f1a8 0803 	sub.w	r8, r8, #3
20011c90:	e00b      	b.n	20011caa <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0xa4>
20011c92:	f1a8 0001 	sub.w	r0, r8, #1
20011c96:	e008      	b.n	20011caa <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0xa4>
20011c98:	f1a8 0002 	sub.w	r0, r8, #2
20011c9c:	f1a8 0801 	sub.w	r8, r8, #1
20011ca0:	e003      	b.n	20011caa <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0xa4>
20011ca2:	f1a8 0003 	sub.w	r0, r8, #3
20011ca6:	f1a8 0802 	sub.w	r8, r8, #2
20011caa:	2881      	cmp	r0, #129	; 0x81
20011cac:	d211      	bcs.n	20011cd2 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0xcc>
20011cae:	f1c8 0281 	rsb	r2, r8, #129	; 0x81
20011cb2:	9200      	str	r2, [sp, #0]
20011cb4:	f645 3248 	movw	r2, #23368	; 0x5b48
20011cb8:	eb0c 0300 	add.w	r3, ip, r0
20011cbc:	f2c2 0201 	movt	r2, #8193	; 0x2001
20011cc0:	4608      	mov	r0, r1
20011cc2:	4611      	mov	r1, r2
20011cc4:	2202      	movs	r2, #2
20011cc6:	f7fe fd6f 	bl	200107a8 <_ZN4core3fmt9Formatter12pad_integral17h03bf425566dae4deE>
20011cca:	b022      	add	sp, #136	; 0x88
20011ccc:	f85d 8b04 	ldr.w	r8, [sp], #4
20011cd0:	bdf0      	pop	{r4, r5, r6, r7, pc}
20011cd2:	f7fe fcb0 	bl	20010636 <_ZN4core5slice5index26slice_start_index_len_fail17h51498c6c96bae4bbE>
20011cd6:	d4d4      	bmi.n	20011c82 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E+0x7c>

20011cd8 <__rust_alloc_error_handler>:
20011cd8:	f7fe fb78 	bl	200103cc <__rdl_oom>

20011cdc <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E>:
20011cdc:	b301      	cbz	r1, 20011d20 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x44>
20011cde:	b5f0      	push	{r4, r5, r6, r7, lr}
20011ce0:	af03      	add	r7, sp, #12
20011ce2:	f84d 8d04 	str.w	r8, [sp, #-4]!
20011ce6:	4614      	mov	r4, r2
20011ce8:	f1b2 3fff 	cmp.w	r2, #4294967295	; 0xffffffff
20011cec:	dd1e      	ble.n	20011d2c <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x50>
20011cee:	460d      	mov	r5, r1
20011cf0:	6859      	ldr	r1, [r3, #4]
20011cf2:	b1f9      	cbz	r1, 20011d34 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x58>
20011cf4:	6899      	ldr	r1, [r3, #8]
20011cf6:	b399      	cbz	r1, 20011d60 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x84>
20011cf8:	681a      	ldr	r2, [r3, #0]
20011cfa:	4606      	mov	r6, r0
20011cfc:	4610      	mov	r0, r2
20011cfe:	462a      	mov	r2, r5
20011d00:	4623      	mov	r3, r4
20011d02:	f7fe f8bd 	bl	2000fe80 <__rust_realloc>
20011d06:	4601      	mov	r1, r0
20011d08:	4630      	mov	r0, r6
20011d0a:	2900      	cmp	r1, #0
20011d0c:	d048      	beq.n	20011da0 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xc4>
20011d0e:	e9c0 1401 	strd	r1, r4, [r0, #4]
20011d12:	2100      	movs	r1, #0
20011d14:	f85d 8b04 	ldr.w	r8, [sp], #4
20011d18:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
20011d1c:	6001      	str	r1, [r0, #0]
20011d1e:	4770      	bx	lr
20011d20:	2100      	movs	r1, #0
20011d22:	6041      	str	r1, [r0, #4]
20011d24:	2101      	movs	r1, #1
20011d26:	6001      	str	r1, [r0, #0]
20011d28:	4770      	bx	lr
20011d2a:	bf00      	nop
20011d2c:	2100      	movs	r1, #0
20011d2e:	6041      	str	r1, [r0, #4]
20011d30:	e038      	b.n	20011da4 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xc8>
20011d32:	bf00      	nop
20011d34:	2c00      	cmp	r4, #0
20011d36:	d03d      	beq.n	20011db4 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xd8>
20011d38:	f246 01e0 	movw	r1, #24800	; 0x60e0
20011d3c:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011d40:	f246 0690 	movw	r6, #24720	; 0x6090
20011d44:	7849      	ldrb	r1, [r1, #1]
20011d46:	f2c2 0601 	movt	r6, #8193	; 0x2001
20011d4a:	e8d6 1f4f 	ldrexb	r1, [r6]
20011d4e:	4680      	mov	r8, r0
20011d50:	2900      	cmp	r1, #0
20011d52:	d149      	bne.n	20011de8 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x10c>
20011d54:	2001      	movs	r0, #1
20011d56:	e8c6 0f41 	strexb	r1, r0, [r6]
20011d5a:	2900      	cmp	r1, #0
20011d5c:	d146      	bne.n	20011dec <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x110>
20011d5e:	e011      	b.n	20011d84 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xa8>
20011d60:	b344      	cbz	r4, 20011db4 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xd8>
20011d62:	f246 01e0 	movw	r1, #24800	; 0x60e0
20011d66:	f2c2 0101 	movt	r1, #8193	; 0x2001
20011d6a:	f246 0690 	movw	r6, #24720	; 0x6090
20011d6e:	7849      	ldrb	r1, [r1, #1]
20011d70:	f2c2 0601 	movt	r6, #8193	; 0x2001
20011d74:	e8d6 1f4f 	ldrexb	r1, [r6]
20011d78:	4680      	mov	r8, r0
20011d7a:	b9f9      	cbnz	r1, 20011dbc <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xe0>
20011d7c:	2001      	movs	r0, #1
20011d7e:	e8c6 0f41 	strexb	r1, r0, [r6]
20011d82:	b9e9      	cbnz	r1, 20011dc0 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xe4>
20011d84:	4628      	mov	r0, r5
20011d86:	4621      	mov	r1, r4
20011d88:	f3bf 8f5f 	dmb	sy
20011d8c:	f7fa fa94 	bl	2000c2b8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17h30fb2e1fa3b3094fE>
20011d90:	4601      	mov	r1, r0
20011d92:	2000      	movs	r0, #0
20011d94:	f3bf 8f5f 	dmb	sy
20011d98:	7030      	strb	r0, [r6, #0]
20011d9a:	4640      	mov	r0, r8
20011d9c:	2900      	cmp	r1, #0
20011d9e:	d1b6      	bne.n	20011d0e <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x32>
20011da0:	e9c0 5401 	strd	r5, r4, [r0, #4]
20011da4:	2101      	movs	r1, #1
20011da6:	f85d 8b04 	ldr.w	r8, [sp], #4
20011daa:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
20011dae:	6001      	str	r1, [r0, #0]
20011db0:	4770      	bx	lr
20011db2:	bf00      	nop
20011db4:	4629      	mov	r1, r5
20011db6:	2900      	cmp	r1, #0
20011db8:	d1a9      	bne.n	20011d0e <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x32>
20011dba:	e7f1      	b.n	20011da0 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xc4>
20011dbc:	f3bf 8f2f 	clrex
20011dc0:	7830      	ldrb	r0, [r6, #0]
20011dc2:	b160      	cbz	r0, 20011dde <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x102>
20011dc4:	bf10      	yield
20011dc6:	7830      	ldrb	r0, [r6, #0]
20011dc8:	b148      	cbz	r0, 20011dde <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x102>
20011dca:	bf10      	yield
20011dcc:	7830      	ldrb	r0, [r6, #0]
20011dce:	b130      	cbz	r0, 20011dde <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x102>
20011dd0:	bf10      	yield
20011dd2:	7830      	ldrb	r0, [r6, #0]
20011dd4:	b118      	cbz	r0, 20011dde <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x102>
20011dd6:	bf10      	yield
20011dd8:	7830      	ldrb	r0, [r6, #0]
20011dda:	2800      	cmp	r0, #0
20011ddc:	d1f2      	bne.n	20011dc4 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xe8>
20011dde:	e8d6 0f4f 	ldrexb	r0, [r6]
20011de2:	2800      	cmp	r0, #0
20011de4:	d1ea      	bne.n	20011dbc <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xe0>
20011de6:	e7c9      	b.n	20011d7c <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0xa0>
20011de8:	f3bf 8f2f 	clrex
20011dec:	7830      	ldrb	r0, [r6, #0]
20011dee:	b160      	cbz	r0, 20011e0a <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x12e>
20011df0:	bf10      	yield
20011df2:	7830      	ldrb	r0, [r6, #0]
20011df4:	b148      	cbz	r0, 20011e0a <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x12e>
20011df6:	bf10      	yield
20011df8:	7830      	ldrb	r0, [r6, #0]
20011dfa:	b130      	cbz	r0, 20011e0a <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x12e>
20011dfc:	bf10      	yield
20011dfe:	7830      	ldrb	r0, [r6, #0]
20011e00:	b118      	cbz	r0, 20011e0a <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x12e>
20011e02:	bf10      	yield
20011e04:	7830      	ldrb	r0, [r6, #0]
20011e06:	2800      	cmp	r0, #0
20011e08:	d1f2      	bne.n	20011df0 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x114>
20011e0a:	e8d6 0f4f 	ldrexb	r0, [r6]
20011e0e:	2800      	cmp	r0, #0
20011e10:	d1ea      	bne.n	20011de8 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x10c>
20011e12:	e79f      	b.n	20011d54 <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E+0x78>

20011e14 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h09ffcda3328b2eb7E>:
20011e14:	b5b0      	push	{r4, r5, r7, lr}
20011e16:	af02      	add	r7, sp, #8
20011e18:	b086      	sub	sp, #24
20011e1a:	4604      	mov	r4, r0
20011e1c:	6800      	ldr	r0, [r0, #0]
20011e1e:	460d      	mov	r5, r1
20011e20:	ebb1 0f40 	cmp.w	r1, r0, lsl #1
20011e24:	bf38      	it	cc
20011e26:	0045      	lslcc	r5, r0, #1
20011e28:	0f69      	lsrs	r1, r5, #29
20011e2a:	fab1 f181 	clz	r1, r1
20011e2e:	2d04      	cmp	r5, #4
20011e30:	ea4f 1151 	mov.w	r1, r1, lsr #5
20011e34:	bf98      	it	ls
20011e36:	2504      	movls	r5, #4
20011e38:	00aa      	lsls	r2, r5, #2
20011e3a:	ea4f 0181 	mov.w	r1, r1, lsl #2
20011e3e:	b128      	cbz	r0, 20011e4c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h09ffcda3328b2eb7E+0x38>
20011e40:	6863      	ldr	r3, [r4, #4]
20011e42:	0080      	lsls	r0, r0, #2
20011e44:	9005      	str	r0, [sp, #20]
20011e46:	2004      	movs	r0, #4
20011e48:	9303      	str	r3, [sp, #12]
20011e4a:	e000      	b.n	20011e4e <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h09ffcda3328b2eb7E+0x3a>
20011e4c:	2000      	movs	r0, #0
20011e4e:	9004      	str	r0, [sp, #16]
20011e50:	4668      	mov	r0, sp
20011e52:	ab03      	add	r3, sp, #12
20011e54:	f7ff ff42 	bl	20011cdc <_ZN5alloc7raw_vec11finish_grow17h1f2e94d8b249db05E>
20011e58:	9800      	ldr	r0, [sp, #0]
20011e5a:	2801      	cmp	r0, #1
20011e5c:	bf1f      	itttt	ne
20011e5e:	9801      	ldrne	r0, [sp, #4]
20011e60:	e9c4 5000 	strdne	r5, r0, [r4]
20011e64:	b006      	addne	sp, #24
20011e66:	bdb0      	popne	{r4, r5, r7, pc}
20011e68:	e9dd 0101 	ldrd	r0, r1, [sp, #4]
20011e6c:	f7fe fa8a 	bl	20010384 <_ZN5alloc7raw_vec12handle_error17hbcd999d43d9fa607E>

20011e70 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E>:
20011e70:	b5f0      	push	{r4, r5, r6, r7, lr}
20011e72:	af03      	add	r7, sp, #12
20011e74:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20011e78:	b081      	sub	sp, #4
20011e7a:	ed2d 8b08 	vpush	{d8-d11}
20011e7e:	b086      	sub	sp, #24
20011e80:	4604      	mov	r4, r0
20011e82:	ed94 0a07 	vldr	s0, [r4, #28]
20011e86:	ed9f aa6e 	vldr	s20, [pc, #440]	; 20012040 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1d0>
20011e8a:	f244 4000 	movw	r0, #17408	; 0x4400
20011e8e:	f2c4 702c 	movt	r0, #18220	; 0x472c
20011e92:	ee20 0a0a 	vmul.f32	s0, s0, s20
20011e96:	6260      	str	r0, [r4, #36]	; 0x24
20011e98:	ed94 ba08 	vldr	s22, [r4, #32]
20011e9c:	ee10 0a10 	vmov	r0, s0
20011ea0:	f003 f910 	bl	200150c4 <__aeabi_f2d>
20011ea4:	ed9f 8b5a 	vldr	d8, [pc, #360]	; 20012010 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1a0>
20011ea8:	ec41 0b10 	vmov	d0, r0, r1
20011eac:	eeb0 1a48 	vmov.f32	s2, s16
20011eb0:	eef0 1a68 	vmov.f32	s3, s17
20011eb4:	f002 fa26 	bl	20014304 <fmax>
20011eb8:	f000 f8c6 	bl	20012048 <_ZN4libm4math3log3log17h32bd796437813eb8E>
20011ebc:	ec51 0b10 	vmov	r0, r1, d0
20011ec0:	ed9f 0b55 	vldr	d0, [pc, #340]	; 20012018 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1a8>
20011ec4:	ec53 2b10 	vmov	r2, r3, d0
20011ec8:	e9cd 2304 	strd	r2, r3, [sp, #16]
20011ecc:	f003 fad4 	bl	20015478 <__aeabi_dadd>
20011ed0:	ed9f 0b53 	vldr	d0, [pc, #332]	; 20012020 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1b0>
20011ed4:	460b      	mov	r3, r1
20011ed6:	ec51 ab10 	vmov	sl, r1, d0
20011eda:	4602      	mov	r2, r0
20011edc:	4650      	mov	r0, sl
20011ede:	9103      	str	r1, [sp, #12]
20011ee0:	f002 feb7 	bl	20014c52 <__aeabi_dsub>
20011ee4:	ec41 0b10 	vmov	d0, r0, r1
20011ee8:	f000 fa22 	bl	20012330 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE>
20011eec:	ec55 6b18 	vmov	r6, r5, d8
20011ef0:	ec51 0b10 	vmov	r0, r1, d0
20011ef4:	4632      	mov	r2, r6
20011ef6:	462b      	mov	r3, r5
20011ef8:	f003 fabe 	bl	20015478 <__aeabi_dadd>
20011efc:	4602      	mov	r2, r0
20011efe:	460b      	mov	r3, r1
20011f00:	4630      	mov	r0, r6
20011f02:	4629      	mov	r1, r5
20011f04:	f002 fb01 	bl	2001450a <__aeabi_ddiv>
20011f08:	ed9f 0b47 	vldr	d0, [pc, #284]	; 20012028 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1b8>
20011f0c:	ec53 9b10 	vmov	r9, r3, d0
20011f10:	464a      	mov	r2, r9
20011f12:	9302      	str	r3, [sp, #8]
20011f14:	f003 f91f 	bl	20015156 <__aeabi_dmul>
20011f18:	ed9f 0b45 	vldr	d0, [pc, #276]	; 20012030 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1c0>
20011f1c:	ec5b 8b10 	vmov	r8, fp, d0
20011f20:	4642      	mov	r2, r8
20011f22:	465b      	mov	r3, fp
20011f24:	f003 faa8 	bl	20015478 <__aeabi_dadd>
20011f28:	ed9f 9b43 	vldr	d9, [pc, #268]	; 20012038 <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x1c8>
20011f2c:	ec41 0b10 	vmov	d0, r0, r1
20011f30:	eeb0 1a49 	vmov.f32	s2, s18
20011f34:	eef0 1a69 	vmov.f32	s3, s19
20011f38:	f002 f9c1 	bl	200142be <fmin>
20011f3c:	ec53 2b10 	vmov	r2, r3, d0
20011f40:	4630      	mov	r0, r6
20011f42:	4629      	mov	r1, r5
20011f44:	f002 fe85 	bl	20014c52 <__aeabi_dsub>
20011f48:	f002 fde2 	bl	20014b10 <__aeabi_d2f>
20011f4c:	ee2b 0a0a 	vmul.f32	s0, s22, s20
20011f50:	9001      	str	r0, [sp, #4]
20011f52:	60e0      	str	r0, [r4, #12]
20011f54:	ee10 0a10 	vmov	r0, s0
20011f58:	f003 f8b4 	bl	200150c4 <__aeabi_f2d>
20011f5c:	ec41 0b10 	vmov	d0, r0, r1
20011f60:	eeb0 1a48 	vmov.f32	s2, s16
20011f64:	eef0 1a68 	vmov.f32	s3, s17
20011f68:	f002 f9cc 	bl	20014304 <fmax>
20011f6c:	f000 f86c 	bl	20012048 <_ZN4libm4math3log3log17h32bd796437813eb8E>
20011f70:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
20011f74:	ec51 0b10 	vmov	r0, r1, d0
20011f78:	f003 fa7e 	bl	20015478 <__aeabi_dadd>
20011f7c:	460b      	mov	r3, r1
20011f7e:	9903      	ldr	r1, [sp, #12]
20011f80:	4602      	mov	r2, r0
20011f82:	4650      	mov	r0, sl
20011f84:	f002 fe65 	bl	20014c52 <__aeabi_dsub>
20011f88:	ec41 0b10 	vmov	d0, r0, r1
20011f8c:	f000 f9d0 	bl	20012330 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE>
20011f90:	ec51 0b10 	vmov	r0, r1, d0
20011f94:	4632      	mov	r2, r6
20011f96:	462b      	mov	r3, r5
20011f98:	f003 fa6e 	bl	20015478 <__aeabi_dadd>
20011f9c:	4602      	mov	r2, r0
20011f9e:	460b      	mov	r3, r1
20011fa0:	4630      	mov	r0, r6
20011fa2:	4629      	mov	r1, r5
20011fa4:	f002 fab1 	bl	2001450a <__aeabi_ddiv>
20011fa8:	9b02      	ldr	r3, [sp, #8]
20011faa:	464a      	mov	r2, r9
20011fac:	f003 f8d3 	bl	20015156 <__aeabi_dmul>
20011fb0:	4642      	mov	r2, r8
20011fb2:	465b      	mov	r3, fp
20011fb4:	f003 fa60 	bl	20015478 <__aeabi_dadd>
20011fb8:	ec41 0b10 	vmov	d0, r0, r1
20011fbc:	eeb0 1a49 	vmov.f32	s2, s18
20011fc0:	eef0 1a69 	vmov.f32	s3, s19
20011fc4:	f002 f97b 	bl	200142be <fmin>
20011fc8:	ec53 2b10 	vmov	r2, r3, d0
20011fcc:	4630      	mov	r0, r6
20011fce:	4629      	mov	r1, r5
20011fd0:	f002 fe3f 	bl	20014c52 <__aeabi_dsub>
20011fd4:	f002 fd9c 	bl	20014b10 <__aeabi_d2f>
20011fd8:	ed94 0a05 	vldr	s0, [r4, #20]
20011fdc:	eeb7 1a00 	vmov.f32	s2, #112	; 0x3f800000  1.0
20011fe0:	eeb4 0a41 	vcmp.f32	s0, s2
20011fe4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
20011fe8:	6120      	str	r0, [r4, #16]
20011fea:	d508      	bpl.n	20011ffe <_ZN81_$LT$fundsp..follow..AFollow$LT$F$GT$$u20$as$u20$fundsp..audionode..AudioNode$GT$15set_sample_rate17ha4ebaa373e9eece6E+0x18e>
20011fec:	9901      	ldr	r1, [sp, #4]
20011fee:	ee01 0a10 	vmov	s2, r0
20011ff2:	ee00 1a10 	vmov	s0, r1
20011ff6:	ed84 0a05 	vstr	s0, [r4, #20]
20011ffa:	ed84 1a06 	vstr	s2, [r4, #24]
20011ffe:	b006      	add	sp, #24
20012000:	ecbd 8b08 	vpop	{d8-d11}
20012004:	b001      	add	sp, #4
20012006:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2001200a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001200c:	bf00      	nop
2001200e:	bf00      	nop
20012010:	00000000 	andeq	r0, r0, r0
20012014:	3ff00000 	svccc	0x00f00000	; IMB
20012018:	bdf4d5a4 	cfldr64lt	mvdx13, [r4, #656]!	; 0x290
2001201c:	bfeb926d 	svclt	0x00eb926d
	...
20012028:	560ac60d 	strpl	ip, [sl], -sp, lsl #12
2001202c:	3ff21dd7 	svccc	0x00f21dd7
20012030:	3f16f152 	svccc	0x0016f152
20012034:	bfc0eeba 	svclt	0x00c0eeba
20012038:	ca501acb 	bgt	21418b6c <_eram+0x13f8b6c>
2001203c:	3fefffff 	svccc	0x00efffff
20012040:	472c4400 	strmi	r4, [ip, -r0, lsl #8]!
20012044:	d4d4d4d4 	ldrble	sp, [r4], #1236	; 0x4d4

20012048 <_ZN4libm4math3log3log17h32bd796437813eb8E>:
20012048:	b5f0      	push	{r4, r5, r6, r7, lr}
2001204a:	af03      	add	r7, sp, #12
2001204c:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20012050:	b087      	sub	sp, #28
20012052:	ec55 4b10 	vmov	r4, r5, d0
20012056:	f64f 79ff 	movw	r9, #65535	; 0xffff
2001205a:	2d00      	cmp	r5, #0
2001205c:	f2c0 090f 	movt	r9, #15
20012060:	d41a      	bmi.n	20012098 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x50>
20012062:	454d      	cmp	r5, r9
20012064:	d918      	bls.n	20012098 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x50>
20012066:	f64f 70ff 	movw	r0, #65535	; 0xffff
2001206a:	f6c7 70ef 	movt	r0, #32751	; 0x7fef
2001206e:	4285      	cmp	r5, r0
20012070:	d80e      	bhi.n	20012090 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x48>
20012072:	f64f 31cb 	movw	r1, #64459	; 0xfbcb
20012076:	f6cf 71ff 	movt	r1, #65535	; 0xffff
2001207a:	2000      	movs	r0, #0
2001207c:	f101 0636 	add.w	r6, r1, #54	; 0x36
20012080:	bbe4      	cbnz	r4, 200120fc <_ZN4libm4math3log3log17h32bd796437813eb8E+0xb4>
20012082:	2100      	movs	r1, #0
20012084:	f6c3 71f0 	movt	r1, #16368	; 0x3ff0
20012088:	428d      	cmp	r5, r1
2001208a:	d137      	bne.n	200120fc <_ZN4libm4math3log3log17h32bd796437813eb8E+0xb4>
2001208c:	ed9f 0b8c 	vldr	d0, [pc, #560]	; 200122c0 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x278>
20012090:	b007      	add	sp, #28
20012092:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20012096:	bdf0      	pop	{r4, r5, r6, r7, pc}
20012098:	ed9f 0b89 	vldr	d0, [pc, #548]	; 200122c0 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x278>
2001209c:	4620      	mov	r0, r4
2001209e:	ec58 6b10 	vmov	r6, r8, d0
200120a2:	4629      	mov	r1, r5
200120a4:	4632      	mov	r2, r6
200120a6:	4643      	mov	r3, r8
200120a8:	f002 fce2 	bl	20014a70 <__aeabi_dcmpeq>
200120ac:	b1a0      	cbz	r0, 200120d8 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x90>
200120ae:	4620      	mov	r0, r4
200120b0:	4629      	mov	r1, r5
200120b2:	4622      	mov	r2, r4
200120b4:	462b      	mov	r3, r5
200120b6:	f003 f84e 	bl	20015156 <__aeabi_dmul>
200120ba:	ed9f 0b85 	vldr	d0, [pc, #532]	; 200122d0 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x288>
200120be:	4602      	mov	r2, r0
200120c0:	460b      	mov	r3, r1
200120c2:	ec51 0b10 	vmov	r0, r1, d0
200120c6:	f002 fa20 	bl	2001450a <__aeabi_ddiv>
200120ca:	ec41 0b10 	vmov	d0, r0, r1
200120ce:	b007      	add	sp, #28
200120d0:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200120d4:	bdf0      	pop	{r4, r5, r6, r7, pc}
200120d6:	bf00      	nop
200120d8:	2d00      	cmp	r5, #0
200120da:	f100 80e7 	bmi.w	200122ac <_ZN4libm4math3log3log17h32bd796437813eb8E+0x264>
200120de:	ed9f 0b7a 	vldr	d0, [pc, #488]	; 200122c8 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x280>
200120e2:	f64f 36cb 	movw	r6, #64459	; 0xfbcb
200120e6:	ec53 2b10 	vmov	r2, r3, d0
200120ea:	4620      	mov	r0, r4
200120ec:	4629      	mov	r1, r5
200120ee:	f6cf 76ff 	movt	r6, #65535	; 0xffff
200120f2:	f003 f830 	bl	20015156 <__aeabi_dmul>
200120f6:	4604      	mov	r4, r0
200120f8:	460d      	mov	r5, r1
200120fa:	2000      	movs	r0, #0
200120fc:	f645 7162 	movw	r1, #24418	; 0x5f62
20012100:	f2c0 0109 	movt	r1, #9
20012104:	4429      	add	r1, r5
20012106:	eb06 5211 	add.w	r2, r6, r1, lsr #20
2001210a:	9205      	str	r2, [sp, #20]
2001210c:	f24a 029e 	movw	r2, #41118	; 0xa09e
20012110:	ea01 0109 	and.w	r1, r1, r9
20012114:	f6c3 72e6 	movt	r2, #16358	; 0x3fe6
20012118:	ed9f 0b6d 	vldr	d0, [pc, #436]	; 200122d0 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x288>
2001211c:	4411      	add	r1, r2
2001211e:	4301      	orrs	r1, r0
20012120:	ec53 2b10 	vmov	r2, r3, d0
20012124:	4620      	mov	r0, r4
20012126:	f003 f9a7 	bl	20015478 <__aeabi_dadd>
2001212a:	ed9f 0b6b 	vldr	d0, [pc, #428]	; 200122d8 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x290>
2001212e:	4683      	mov	fp, r0
20012130:	ec53 2b10 	vmov	r2, r3, d0
20012134:	460c      	mov	r4, r1
20012136:	9106      	str	r1, [sp, #24]
20012138:	f003 f80d 	bl	20015156 <__aeabi_dmul>
2001213c:	4602      	mov	r2, r0
2001213e:	460b      	mov	r3, r1
20012140:	4658      	mov	r0, fp
20012142:	4621      	mov	r1, r4
20012144:	f003 f807 	bl	20015156 <__aeabi_dmul>
20012148:	ed9f 0b65 	vldr	d0, [pc, #404]	; 200122e0 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x298>
2001214c:	e9cd 1003 	strd	r1, r0, [sp, #12]
20012150:	ec53 2b10 	vmov	r2, r3, d0
20012154:	4658      	mov	r0, fp
20012156:	4621      	mov	r1, r4
20012158:	f003 f98e 	bl	20015478 <__aeabi_dadd>
2001215c:	4602      	mov	r2, r0
2001215e:	460b      	mov	r3, r1
20012160:	4658      	mov	r0, fp
20012162:	4621      	mov	r1, r4
20012164:	f002 f9d1 	bl	2001450a <__aeabi_ddiv>
20012168:	4602      	mov	r2, r0
2001216a:	460b      	mov	r3, r1
2001216c:	e9cd 1001 	strd	r1, r0, [sp, #4]
20012170:	f002 fff1 	bl	20015156 <__aeabi_dmul>
20012174:	4602      	mov	r2, r0
20012176:	460b      	mov	r3, r1
20012178:	4681      	mov	r9, r0
2001217a:	4688      	mov	r8, r1
2001217c:	f002 ffeb 	bl	20015156 <__aeabi_dmul>
20012180:	ed9f 0b59 	vldr	d0, [pc, #356]	; 200122e8 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2a0>
20012184:	4682      	mov	sl, r0
20012186:	ec53 2b10 	vmov	r2, r3, d0
2001218a:	460e      	mov	r6, r1
2001218c:	f002 ffe3 	bl	20015156 <__aeabi_dmul>
20012190:	ed9f 0b57 	vldr	d0, [pc, #348]	; 200122f0 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2a8>
20012194:	ec53 2b10 	vmov	r2, r3, d0
20012198:	f003 f96e 	bl	20015478 <__aeabi_dadd>
2001219c:	4602      	mov	r2, r0
2001219e:	460b      	mov	r3, r1
200121a0:	4650      	mov	r0, sl
200121a2:	4631      	mov	r1, r6
200121a4:	f002 ffd7 	bl	20015156 <__aeabi_dmul>
200121a8:	ed9f 0b53 	vldr	d0, [pc, #332]	; 200122f8 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2b0>
200121ac:	ec53 2b10 	vmov	r2, r3, d0
200121b0:	f003 f962 	bl	20015478 <__aeabi_dadd>
200121b4:	4602      	mov	r2, r0
200121b6:	460b      	mov	r3, r1
200121b8:	4650      	mov	r0, sl
200121ba:	4631      	mov	r1, r6
200121bc:	f002 ffcb 	bl	20015156 <__aeabi_dmul>
200121c0:	ed9f 0b4f 	vldr	d0, [pc, #316]	; 20012300 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2b8>
200121c4:	4604      	mov	r4, r0
200121c6:	460d      	mov	r5, r1
200121c8:	ec53 2b10 	vmov	r2, r3, d0
200121cc:	4650      	mov	r0, sl
200121ce:	4631      	mov	r1, r6
200121d0:	f002 ffc1 	bl	20015156 <__aeabi_dmul>
200121d4:	ed9f 0b4c 	vldr	d0, [pc, #304]	; 20012308 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2c0>
200121d8:	ec53 2b10 	vmov	r2, r3, d0
200121dc:	f003 f94c 	bl	20015478 <__aeabi_dadd>
200121e0:	4602      	mov	r2, r0
200121e2:	460b      	mov	r3, r1
200121e4:	4650      	mov	r0, sl
200121e6:	4631      	mov	r1, r6
200121e8:	f002 ffb5 	bl	20015156 <__aeabi_dmul>
200121ec:	ed9f 0b48 	vldr	d0, [pc, #288]	; 20012310 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2c8>
200121f0:	ec53 2b10 	vmov	r2, r3, d0
200121f4:	f003 f940 	bl	20015478 <__aeabi_dadd>
200121f8:	4602      	mov	r2, r0
200121fa:	460b      	mov	r3, r1
200121fc:	4650      	mov	r0, sl
200121fe:	4631      	mov	r1, r6
20012200:	f002 ffa9 	bl	20015156 <__aeabi_dmul>
20012204:	ed9f 0b44 	vldr	d0, [pc, #272]	; 20012318 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2d0>
20012208:	ec53 2b10 	vmov	r2, r3, d0
2001220c:	f003 f934 	bl	20015478 <__aeabi_dadd>
20012210:	4602      	mov	r2, r0
20012212:	460b      	mov	r3, r1
20012214:	4648      	mov	r0, r9
20012216:	4641      	mov	r1, r8
20012218:	f002 ff9d 	bl	20015156 <__aeabi_dmul>
2001221c:	4602      	mov	r2, r0
2001221e:	460b      	mov	r3, r1
20012220:	4620      	mov	r0, r4
20012222:	4629      	mov	r1, r5
20012224:	f003 f928 	bl	20015478 <__aeabi_dadd>
20012228:	4605      	mov	r5, r0
2001222a:	9805      	ldr	r0, [sp, #20]
2001222c:	460c      	mov	r4, r1
2001222e:	f002 fb67 	bl	20014900 <__aeabi_i2d>
20012232:	9e04      	ldr	r6, [sp, #16]
20012234:	f8dd a00c 	ldr.w	sl, [sp, #12]
20012238:	4681      	mov	r9, r0
2001223a:	4688      	mov	r8, r1
2001223c:	4630      	mov	r0, r6
2001223e:	4651      	mov	r1, sl
20012240:	462a      	mov	r2, r5
20012242:	4623      	mov	r3, r4
20012244:	f003 f918 	bl	20015478 <__aeabi_dadd>
20012248:	4602      	mov	r2, r0
2001224a:	460b      	mov	r3, r1
2001224c:	e9dd 1001 	ldrd	r1, r0, [sp, #4]
20012250:	f002 ff81 	bl	20015156 <__aeabi_dmul>
20012254:	ed9f 0b32 	vldr	d0, [pc, #200]	; 20012320 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2d8>
20012258:	4604      	mov	r4, r0
2001225a:	460d      	mov	r5, r1
2001225c:	ec53 2b10 	vmov	r2, r3, d0
20012260:	4648      	mov	r0, r9
20012262:	4641      	mov	r1, r8
20012264:	f002 ff77 	bl	20015156 <__aeabi_dmul>
20012268:	4622      	mov	r2, r4
2001226a:	462b      	mov	r3, r5
2001226c:	f003 f904 	bl	20015478 <__aeabi_dadd>
20012270:	4632      	mov	r2, r6
20012272:	4653      	mov	r3, sl
20012274:	f002 fced 	bl	20014c52 <__aeabi_dsub>
20012278:	460b      	mov	r3, r1
2001227a:	9906      	ldr	r1, [sp, #24]
2001227c:	4602      	mov	r2, r0
2001227e:	4658      	mov	r0, fp
20012280:	f003 f8fa 	bl	20015478 <__aeabi_dadd>
20012284:	ed9f 0b28 	vldr	d0, [pc, #160]	; 20012328 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x2e0>
20012288:	4604      	mov	r4, r0
2001228a:	460d      	mov	r5, r1
2001228c:	ec53 2b10 	vmov	r2, r3, d0
20012290:	4648      	mov	r0, r9
20012292:	4641      	mov	r1, r8
20012294:	f002 ff5f 	bl	20015156 <__aeabi_dmul>
20012298:	4622      	mov	r2, r4
2001229a:	462b      	mov	r3, r5
2001229c:	f003 f8ec 	bl	20015478 <__aeabi_dadd>
200122a0:	ec41 0b10 	vmov	d0, r0, r1
200122a4:	b007      	add	sp, #28
200122a6:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200122aa:	bdf0      	pop	{r4, r5, r6, r7, pc}
200122ac:	4620      	mov	r0, r4
200122ae:	4629      	mov	r1, r5
200122b0:	4622      	mov	r2, r4
200122b2:	462b      	mov	r3, r5
200122b4:	f002 fccd 	bl	20014c52 <__aeabi_dsub>
200122b8:	4632      	mov	r2, r6
200122ba:	4643      	mov	r3, r8
200122bc:	e703      	b.n	200120c6 <_ZN4libm4math3log3log17h32bd796437813eb8E+0x7e>
200122be:	bf00      	nop
	...
200122cc:	43500000 	cmpmi	r0, #0
200122d0:	00000000 	andeq	r0, r0, r0
200122d4:	bff00000 	svclt	0x00f00000	; IMB
200122d8:	00000000 	andeq	r0, r0, r0
200122dc:	3fe00000 	svccc	0x00e00000
200122e0:	00000000 	andeq	r0, r0, r0
200122e4:	40000000 	andmi	r0, r0, r0
200122e8:	d078c69f 			; <UNDEFINED> instruction: 0xd078c69f
200122ec:	3fc39a09 	svccc	0x00c39a09
200122f0:	1d8e78af 	stcne	8, cr7, [lr, #700]	; 0x2bc
200122f4:	3fcc71c5 	svccc	0x00cc71c5
200122f8:	9997fa04 	ldmibls	r7, {r2, r9, fp, ip, sp, lr, pc}
200122fc:	3fd99999 	svccc	0x00d99999
20012300:	df3e5244 	svcle	0x003e5244
20012304:	3fc2f112 	svccc	0x00c2f112
20012308:	96cb03de 			; <UNDEFINED> instruction: 0x96cb03de
2001230c:	3fc74664 	svccc	0x00c74664
20012310:	94229359 	strtls	r9, [r2], #-857	; 0xfffffca7
20012314:	3fd24924 	svccc	0x00d24924
20012318:	55555593 	ldrbpl	r5, [r5, #-1427]	; 0xfffffa6d
2001231c:	3fe55555 	svccc	0x00e55555
20012320:	35793c76 	ldrbcc	r3, [r9, #-3190]!	; 0xfffff38a
20012324:	3dea39ef 			; <UNDEFINED> instruction: 0x3dea39ef
20012328:	fee00000 	cdp2	0, 14, cr0, cr0, cr0, {0}
2001232c:	3fe62e42 	svccc	0x00e62e42

20012330 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE>:
20012330:	b5f0      	push	{r4, r5, r6, r7, lr}
20012332:	af03      	add	r7, sp, #12
20012334:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
20012338:	ed2d 8b04 	vpush	{d8-d9}
2001233c:	b084      	sub	sp, #16
2001233e:	ec55 9b10 	vmov	r9, r5, d0
20012342:	f242 312b 	movw	r1, #9003	; 0x232b
20012346:	eeb0 8a40 	vmov.f32	s16, s0
2001234a:	f025 4000 	bic.w	r0, r5, #2147483648	; 0x80000000
2001234e:	f2c4 0186 	movt	r1, #16518	; 0x4086
20012352:	eef0 8a60 	vmov.f32	s17, s1
20012356:	4288      	cmp	r0, r1
20012358:	ea4f 74d5 	mov.w	r4, r5, lsr #31
2001235c:	d318      	bcc.n	20012390 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x60>
2001235e:	4648      	mov	r0, r9
20012360:	4629      	mov	r1, r5
20012362:	464a      	mov	r2, r9
20012364:	462b      	mov	r3, r5
20012366:	f003 f8f9 	bl	2001555c <__aeabi_dcmpun>
2001236a:	2800      	cmp	r0, #0
2001236c:	f040 8196 	bne.w	2001269c <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x36c>
20012370:	ed9f 0bd5 	vldr	d0, [pc, #852]	; 200126c8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x398>
20012374:	4648      	mov	r0, r9
20012376:	ec53 2b10 	vmov	r2, r3, d0
2001237a:	4629      	mov	r1, r5
2001237c:	f003 f8b8 	bl	200154f0 <__aeabi_dcmpgt>
20012380:	b340      	cbz	r0, 200123d4 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0xa4>
20012382:	ed9f 0bcd 	vldr	d0, [pc, #820]	; 200126b8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x388>
20012386:	4648      	mov	r0, r9
20012388:	ec53 2b10 	vmov	r2, r3, d0
2001238c:	4629      	mov	r1, r5
2001238e:	e181      	b.n	20012694 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x364>
20012390:	f642 6142 	movw	r1, #11842	; 0x2e42
20012394:	f6c3 71d6 	movt	r1, #16342	; 0x3fd6
20012398:	4288      	cmp	r0, r1
2001239a:	d90b      	bls.n	200123b4 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x84>
2001239c:	f24a 21b1 	movw	r1, #41649	; 0xa2b1
200123a0:	f6c3 71f0 	movt	r1, #16368	; 0x3ff0
200123a4:	4288      	cmp	r0, r1
200123a6:	d837      	bhi.n	20012418 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0xe8>
200123a8:	f084 0001 	eor.w	r0, r4, #1
200123ac:	eba0 0804 	sub.w	r8, r0, r4
200123b0:	e06f      	b.n	20012492 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x162>
200123b2:	bf00      	nop
200123b4:	2100      	movs	r1, #0
200123b6:	f6c3 6130 	movt	r1, #15920	; 0x3e30
200123ba:	4288      	cmp	r0, r1
200123bc:	f240 8146 	bls.w	2001264c <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x31c>
200123c0:	ed9f 9bbb 	vldr	d9, [pc, #748]	; 200126b0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x380>
200123c4:	eeb0 0a48 	vmov.f32	s0, s16
200123c8:	f04f 0800 	mov.w	r8, #0
200123cc:	eef0 0a68 	vmov.f32	s1, s17
200123d0:	e086      	b.n	200124e0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x1b0>
200123d2:	bf00      	nop
200123d4:	ed9f 0bbe 	vldr	d0, [pc, #760]	; 200126d0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3a0>
200123d8:	4648      	mov	r0, r9
200123da:	ec53 2b10 	vmov	r2, r3, d0
200123de:	4629      	mov	r1, r5
200123e0:	f002 fb10 	bl	20014a04 <__aeabi_dcmplt>
200123e4:	b1c0      	cbz	r0, 20012418 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0xe8>
200123e6:	ed9f 0bbc 	vldr	d0, [pc, #752]	; 200126d8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3a8>
200123ea:	464a      	mov	r2, r9
200123ec:	ec51 0b10 	vmov	r0, r1, d0
200123f0:	462b      	mov	r3, r5
200123f2:	f002 f88a 	bl	2001450a <__aeabi_ddiv>
200123f6:	f002 fb8b 	bl	20014b10 <__aeabi_d2f>
200123fa:	9001      	str	r0, [sp, #4]
200123fc:	ed9d 0a01 	vldr	s0, [sp, #4]
20012400:	ed9f 0bb7 	vldr	d0, [pc, #732]	; 200126e0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3b0>
20012404:	4648      	mov	r0, r9
20012406:	ec53 2b10 	vmov	r2, r3, d0
2001240a:	4629      	mov	r1, r5
2001240c:	f002 fafa 	bl	20014a04 <__aeabi_dcmplt>
20012410:	b110      	cbz	r0, 20012418 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0xe8>
20012412:	ed9f 8ba7 	vldr	d8, [pc, #668]	; 200126b0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x380>
20012416:	e141      	b.n	2001269c <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x36c>
20012418:	ed9f 0bb3 	vldr	d0, [pc, #716]	; 200126e8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3b8>
2001241c:	4648      	mov	r0, r9
2001241e:	ec53 2b10 	vmov	r2, r3, d0
20012422:	4629      	mov	r1, r5
20012424:	f002 fe97 	bl	20015156 <__aeabi_dmul>
20012428:	f645 2250 	movw	r2, #23120	; 0x5a50
2001242c:	f2c2 0201 	movt	r2, #8193	; 0x2001
20012430:	eb02 02c4 	add.w	r2, r2, r4, lsl #3
20012434:	ed92 0b00 	vldr	d0, [r2]
20012438:	ec53 2b10 	vmov	r2, r3, d0
2001243c:	f003 f81c 	bl	20015478 <__aeabi_dadd>
20012440:	ed9f 0bab 	vldr	d0, [pc, #684]	; 200126f0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3c0>
20012444:	4604      	mov	r4, r0
20012446:	ec53 2b10 	vmov	r2, r3, d0
2001244a:	460e      	mov	r6, r1
2001244c:	f003 f816 	bl	2001547c <__aeabi_dcmpge>
20012450:	4682      	mov	sl, r0
20012452:	4620      	mov	r0, r4
20012454:	4631      	mov	r1, r6
20012456:	f001 ff87 	bl	20014368 <__aeabi_d2iz>
2001245a:	ed9f 0ba7 	vldr	d0, [pc, #668]	; 200126f8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3c8>
2001245e:	4680      	mov	r8, r0
20012460:	ec53 2b10 	vmov	r2, r3, d0
20012464:	4620      	mov	r0, r4
20012466:	4631      	mov	r1, r6
20012468:	f1ba 0f00 	cmp.w	sl, #0
2001246c:	bf08      	it	eq
2001246e:	f04f 4800 	moveq.w	r8, #2147483648	; 0x80000000
20012472:	f003 f83d 	bl	200154f0 <__aeabi_dcmpgt>
20012476:	2800      	cmp	r0, #0
20012478:	4620      	mov	r0, r4
2001247a:	4631      	mov	r1, r6
2001247c:	4622      	mov	r2, r4
2001247e:	4633      	mov	r3, r6
20012480:	bf18      	it	ne
20012482:	f06f 4800 	mvnne.w	r8, #2147483648	; 0x80000000
20012486:	f003 f869 	bl	2001555c <__aeabi_dcmpun>
2001248a:	2800      	cmp	r0, #0
2001248c:	bf18      	it	ne
2001248e:	f04f 0800 	movne.w	r8, #0
20012492:	4640      	mov	r0, r8
20012494:	f002 fa34 	bl	20014900 <__aeabi_i2d>
20012498:	ed9f 0b99 	vldr	d0, [pc, #612]	; 20012700 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3d0>
2001249c:	4682      	mov	sl, r0
2001249e:	ec53 2b10 	vmov	r2, r3, d0
200124a2:	460e      	mov	r6, r1
200124a4:	f002 fe57 	bl	20015156 <__aeabi_dmul>
200124a8:	4602      	mov	r2, r0
200124aa:	460b      	mov	r3, r1
200124ac:	4648      	mov	r0, r9
200124ae:	4629      	mov	r1, r5
200124b0:	f002 ffe2 	bl	20015478 <__aeabi_dadd>
200124b4:	ed9f 0b94 	vldr	d0, [pc, #592]	; 20012708 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3d8>
200124b8:	4605      	mov	r5, r0
200124ba:	460c      	mov	r4, r1
200124bc:	ec41 0b18 	vmov	d8, r0, r1
200124c0:	ec53 2b10 	vmov	r2, r3, d0
200124c4:	4650      	mov	r0, sl
200124c6:	4631      	mov	r1, r6
200124c8:	f002 fe45 	bl	20015156 <__aeabi_dmul>
200124cc:	4602      	mov	r2, r0
200124ce:	460b      	mov	r3, r1
200124d0:	ec41 0b19 	vmov	d9, r0, r1
200124d4:	4628      	mov	r0, r5
200124d6:	4621      	mov	r1, r4
200124d8:	f002 fbbb 	bl	20014c52 <__aeabi_dsub>
200124dc:	ec41 0b10 	vmov	d0, r0, r1
200124e0:	ec59 6b10 	vmov	r6, r9, d0
200124e4:	4630      	mov	r0, r6
200124e6:	4649      	mov	r1, r9
200124e8:	4632      	mov	r2, r6
200124ea:	464b      	mov	r3, r9
200124ec:	f002 fe33 	bl	20015156 <__aeabi_dmul>
200124f0:	ed9f 0b87 	vldr	d0, [pc, #540]	; 20012710 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3e0>
200124f4:	4604      	mov	r4, r0
200124f6:	ec53 2b10 	vmov	r2, r3, d0
200124fa:	460d      	mov	r5, r1
200124fc:	f002 fe2b 	bl	20015156 <__aeabi_dmul>
20012500:	ed9f 0b85 	vldr	d0, [pc, #532]	; 20012718 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3e8>
20012504:	ec53 2b10 	vmov	r2, r3, d0
20012508:	f002 ffb6 	bl	20015478 <__aeabi_dadd>
2001250c:	4602      	mov	r2, r0
2001250e:	460b      	mov	r3, r1
20012510:	4620      	mov	r0, r4
20012512:	4629      	mov	r1, r5
20012514:	f002 fe1f 	bl	20015156 <__aeabi_dmul>
20012518:	ed9f 0b81 	vldr	d0, [pc, #516]	; 20012720 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3f0>
2001251c:	ec53 2b10 	vmov	r2, r3, d0
20012520:	f002 ffaa 	bl	20015478 <__aeabi_dadd>
20012524:	4602      	mov	r2, r0
20012526:	460b      	mov	r3, r1
20012528:	4620      	mov	r0, r4
2001252a:	4629      	mov	r1, r5
2001252c:	f002 fe13 	bl	20015156 <__aeabi_dmul>
20012530:	ed9f 0b7d 	vldr	d0, [pc, #500]	; 20012728 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x3f8>
20012534:	ec53 2b10 	vmov	r2, r3, d0
20012538:	f002 ff9e 	bl	20015478 <__aeabi_dadd>
2001253c:	4602      	mov	r2, r0
2001253e:	460b      	mov	r3, r1
20012540:	4620      	mov	r0, r4
20012542:	4629      	mov	r1, r5
20012544:	f002 fe07 	bl	20015156 <__aeabi_dmul>
20012548:	ed9f 0b79 	vldr	d0, [pc, #484]	; 20012730 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x400>
2001254c:	ec53 2b10 	vmov	r2, r3, d0
20012550:	f002 ff92 	bl	20015478 <__aeabi_dadd>
20012554:	4602      	mov	r2, r0
20012556:	460b      	mov	r3, r1
20012558:	4620      	mov	r0, r4
2001255a:	4629      	mov	r1, r5
2001255c:	f002 fdfb 	bl	20015156 <__aeabi_dmul>
20012560:	4602      	mov	r2, r0
20012562:	460b      	mov	r3, r1
20012564:	4630      	mov	r0, r6
20012566:	4649      	mov	r1, r9
20012568:	f002 fb73 	bl	20014c52 <__aeabi_dsub>
2001256c:	4604      	mov	r4, r0
2001256e:	460d      	mov	r5, r1
20012570:	4630      	mov	r0, r6
20012572:	4649      	mov	r1, r9
20012574:	4622      	mov	r2, r4
20012576:	462b      	mov	r3, r5
20012578:	f002 fded 	bl	20015156 <__aeabi_dmul>
2001257c:	ed9f 0b6e 	vldr	d0, [pc, #440]	; 20012738 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x408>
20012580:	4606      	mov	r6, r0
20012582:	4689      	mov	r9, r1
20012584:	ec51 0b10 	vmov	r0, r1, d0
20012588:	4622      	mov	r2, r4
2001258a:	462b      	mov	r3, r5
2001258c:	f002 fb61 	bl	20014c52 <__aeabi_dsub>
20012590:	4602      	mov	r2, r0
20012592:	460b      	mov	r3, r1
20012594:	4630      	mov	r0, r6
20012596:	4649      	mov	r1, r9
20012598:	f001 ffb7 	bl	2001450a <__aeabi_ddiv>
2001259c:	ec53 2b19 	vmov	r2, r3, d9
200125a0:	f002 fb57 	bl	20014c52 <__aeabi_dsub>
200125a4:	4602      	mov	r2, r0
200125a6:	460b      	mov	r3, r1
200125a8:	ec51 0b18 	vmov	r0, r1, d8
200125ac:	f002 ff64 	bl	20015478 <__aeabi_dadd>
200125b0:	ed9f 0b43 	vldr	d0, [pc, #268]	; 200126c0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x390>
200125b4:	ec53 2b10 	vmov	r2, r3, d0
200125b8:	f002 ff5e 	bl	20015478 <__aeabi_dadd>
200125bc:	ec41 0b18 	vmov	d8, r0, r1
200125c0:	f1b8 0f00 	cmp.w	r8, #0
200125c4:	d06a      	beq.n	2001269c <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x36c>
200125c6:	f5b8 6f80 	cmp.w	r8, #1024	; 0x400
200125ca:	db1b      	blt.n	20012604 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x2d4>
200125cc:	ed9f 0b3a 	vldr	d0, [pc, #232]	; 200126b8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x388>
200125d0:	ec54 5b10 	vmov	r5, r4, d0
200125d4:	462a      	mov	r2, r5
200125d6:	4623      	mov	r3, r4
200125d8:	f002 fdbd 	bl	20015156 <__aeabi_dmul>
200125dc:	ec41 0b18 	vmov	d8, r0, r1
200125e0:	f240 72fe 	movw	r2, #2046	; 0x7fe
200125e4:	4590      	cmp	r8, r2
200125e6:	d949      	bls.n	2001267c <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x34c>
200125e8:	462a      	mov	r2, r5
200125ea:	4623      	mov	r3, r4
200125ec:	f002 fdb3 	bl	20015156 <__aeabi_dmul>
200125f0:	ec41 0b18 	vmov	d8, r0, r1
200125f4:	f640 30fd 	movw	r0, #3069	; 0xbfd
200125f8:	4580      	cmp	r8, r0
200125fa:	bf38      	it	cc
200125fc:	4640      	movcc	r0, r8
200125fe:	f2a0 78fe 	subw	r8, r0, #2046	; 0x7fe
20012602:	e041      	b.n	20012688 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x358>
20012604:	f64f 4202 	movw	r2, #64514	; 0xfc02
20012608:	f6cf 72ff 	movt	r2, #65535	; 0xffff
2001260c:	4590      	cmp	r8, r2
2001260e:	da3b      	bge.n	20012688 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x358>
20012610:	ed9f 0b4b 	vldr	d0, [pc, #300]	; 20012740 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x410>
20012614:	ec54 5b10 	vmov	r5, r4, d0
20012618:	462a      	mov	r2, r5
2001261a:	4623      	mov	r3, r4
2001261c:	f002 fd9b 	bl	20015156 <__aeabi_dmul>
20012620:	ec41 0b18 	vmov	d8, r0, r1
20012624:	f518 6ff9 	cmn.w	r8, #1992	; 0x7c8
20012628:	d82c      	bhi.n	20012684 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x354>
2001262a:	462a      	mov	r2, r5
2001262c:	4623      	mov	r3, r4
2001262e:	f002 fd92 	bl	20015156 <__aeabi_dmul>
20012632:	ec41 0b18 	vmov	d8, r0, r1
20012636:	f24f 4070 	movw	r0, #62576	; 0xf470
2001263a:	f6cf 70ff 	movt	r0, #65535	; 0xffff
2001263e:	f518 6f39 	cmn.w	r8, #2960	; 0xb90
20012642:	bf88      	it	hi
20012644:	4640      	movhi	r0, r8
20012646:	f200 7892 	addw	r8, r0, #1938	; 0x792
2001264a:	e01d      	b.n	20012688 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x358>
2001264c:	ed9f 0b1a 	vldr	d0, [pc, #104]	; 200126b8 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x388>
20012650:	4648      	mov	r0, r9
20012652:	ec53 2b10 	vmov	r2, r3, d0
20012656:	4629      	mov	r1, r5
20012658:	f002 ff0e 	bl	20015478 <__aeabi_dadd>
2001265c:	ec41 0b10 	vmov	d0, r0, r1
20012660:	4648      	mov	r0, r9
20012662:	ed8d 0b02 	vstr	d0, [sp, #8]
20012666:	ed9d 0b02 	vldr	d0, [sp, #8]
2001266a:	ed9f 0b15 	vldr	d0, [pc, #84]	; 200126c0 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x390>
2001266e:	4629      	mov	r1, r5
20012670:	ec53 2b10 	vmov	r2, r3, d0
20012674:	f002 ff00 	bl	20015478 <__aeabi_dadd>
20012678:	e00e      	b.n	20012698 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x368>
2001267a:	bf00      	nop
2001267c:	f2a8 38ff 	subw	r8, r8, #1023	; 0x3ff
20012680:	e002      	b.n	20012688 <_ZN4libm4math3exp3exp17hba7b8a63208fa88eE+0x358>
20012682:	bf00      	nop
20012684:	f208 38c9 	addw	r8, r8, #969	; 0x3c9
20012688:	f208 30ff 	addw	r0, r8, #1023	; 0x3ff
2001268c:	0503      	lsls	r3, r0, #20
2001268e:	ec51 0b18 	vmov	r0, r1, d8
20012692:	2200      	movs	r2, #0
20012694:	f002 fd5f 	bl	20015156 <__aeabi_dmul>
20012698:	ec41 0b18 	vmov	d8, r0, r1
2001269c:	eeb0 0a48 	vmov.f32	s0, s16
200126a0:	eef0 0a68 	vmov.f32	s1, s17
200126a4:	b004      	add	sp, #16
200126a6:	ecbd 8b04 	vpop	{d8-d9}
200126aa:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
200126ae:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...
200126bc:	7fe00000 	svcvc	0x00e00000
200126c0:	00000000 	andeq	r0, r0, r0
200126c4:	3ff00000 	svccc	0x00f00000	; IMB
200126c8:	fefa39ef 			; <UNDEFINED> instruction: 0xfefa39ef
200126cc:	40862e42 	addmi	r2, r6, r2, asr #28
200126d0:	dd7abcd2 	ldclle	12, cr11, [sl, #-840]!	; 0xfffffcb8
200126d4:	c086232b 	addgt	r2, r6, fp, lsr #6
200126d8:	00000000 	andeq	r0, r0, r0
200126dc:	b6a00000 	strtlt	r0, [r0], r0
200126e0:	d52d3051 	strle	r3, [sp, #-81]!	; 0xffffffaf
200126e4:	c0874910 	addgt	r4, r7, r0, lsl r9
200126e8:	652b82fe 	strvs	r8, [fp, #-766]!	; 0xfffffd02
200126ec:	3ff71547 	svccc	0x00f71547
200126f0:	00000000 	andeq	r0, r0, r0
200126f4:	c1e00000 	mvngt	r0, r0
200126f8:	ffc00000 			; <UNDEFINED> instruction: 0xffc00000
200126fc:	41dfffff 	ldrshmi	pc, [pc, #255]	; 20012803 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xbb>	; <UNPREDICTABLE>
20012700:	fee00000 	cdp2	0, 14, cr0, cr0, cr0, {0}
20012704:	bfe62e42 	svclt	0x00e62e42
20012708:	35793c76 	ldrbcc	r3, [r9, #-3190]!	; 0xfffff38a
2001270c:	3dea39ef 			; <UNDEFINED> instruction: 0x3dea39ef
20012710:	72bea4d0 	adcsvc	sl, lr, #208, 8	; 0xd0000000
20012714:	3e663769 	cdpcc	7, 6, cr3, cr6, cr9, {3}
20012718:	c5d26bf1 	ldrbgt	r6, [r2, #3057]	; 0xbf1
2001271c:	bebbbd41 	cdplt	13, 11, cr11, cr11, cr1, {2}
20012720:	af25de2c 	svcge	0x0025de2c
20012724:	3f11566a 	svccc	0x0011566a
20012728:	16bebd93 	ssatne	fp, #31, r3, lsl #27
2001272c:	bf66c16c 	svclt	0x0066c16c
20012730:	5555553e 	ldrbpl	r5, [r5, #-1342]	; 0xfffffac2
20012734:	3fc55555 	svccc	0x00c55555
20012738:	00000000 	andeq	r0, r0, r0
2001273c:	40000000 	andmi	r0, r0, r0
20012740:	00000000 	andeq	r0, r0, r0
20012744:	03600000 	cmneq	r0, #0

20012748 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE>:
20012748:	b5f0      	push	{r4, r5, r6, r7, lr}
2001274a:	af03      	add	r7, sp, #12
2001274c:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20012750:	b081      	sub	sp, #4
20012752:	ed2d 8b10 	vpush	{d8-d15}
20012756:	f5ad 7d2c 	sub.w	sp, sp, #688	; 0x2b0
2001275a:	ee10 4a10 	vmov	r4, s0
2001275e:	4620      	mov	r0, r4
20012760:	eeb0 8a40 	vmov.f32	s16, s0
20012764:	f002 fcae 	bl	200150c4 <__aeabi_f2d>
20012768:	4605      	mov	r5, r0
2001276a:	ec41 0b10 	vmov	d0, r0, r1
2001276e:	f640 70db 	movw	r0, #4059	; 0xfdb
20012772:	f024 4600 	bic.w	r6, r4, #2147483648	; 0x80000000
20012776:	f6c3 7049 	movt	r0, #16201	; 0x3f49
2001277a:	4286      	cmp	r6, r0
2001277c:	d21e      	bcs.n	200127bc <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x74>
2001277e:	f1b6 5f66 	cmp.w	r6, #964689920	; 0x39800000
20012782:	d22b      	bcs.n	200127dc <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x94>
20012784:	ed9f 0a37 	vldr	s0, [pc, #220]	; 20012864 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x11c>
20012788:	ed9f 1a37 	vldr	s2, [pc, #220]	; 20012868 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x120>
2001278c:	ee38 0a00 	vadd.f32	s0, s16, s0
20012790:	ee28 1a01 	vmul.f32	s2, s16, s2
20012794:	f5b6 0f00 	cmp.w	r6, #8388608	; 0x800000
20012798:	bf38      	it	cc
2001279a:	eeb0 0a41 	vmovcc.f32	s0, s2
2001279e:	ed8d 0a6e 	vstr	s0, [sp, #440]	; 0x1b8
200127a2:	ed9d 0a6e 	vldr	s0, [sp, #440]	; 0x1b8
200127a6:	eeb0 0a48 	vmov.f32	s0, s16
200127aa:	f50d 7d2c 	add.w	sp, sp, #688	; 0x2b0
200127ae:	ecbd 8b10 	vpop	{d8-d15}
200127b2:	b001      	add	sp, #4
200127b4:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200127b8:	bdf0      	pop	{r4, r5, r6, r7, pc}
200127ba:	bf00      	nop
200127bc:	f245 30d2 	movw	r0, #21458	; 0x53d2
200127c0:	f2c4 007b 	movt	r0, #16507	; 0x407b
200127c4:	468a      	mov	sl, r1
200127c6:	4286      	cmp	r6, r0
200127c8:	d20c      	bcs.n	200127e4 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9c>
200127ca:	f64c 30e4 	movw	r0, #52196	; 0xcbe4
200127ce:	f2c4 0016 	movt	r0, #16406	; 0x4016
200127d2:	4286      	cmp	r6, r0
200127d4:	d226      	bcs.n	20012824 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xdc>
200127d6:	f20f 70d0 	addw	r0, pc, #2000	; 0x7d0
200127da:	e011      	b.n	20012800 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xb8>
200127dc:	2000      	movs	r0, #0
200127de:	f001 b9af 	b.w	20013b40 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x13f8>
200127e2:	bf00      	nop
200127e4:	f243 10d6 	movw	r0, #12758	; 0x31d6
200127e8:	f2c4 00e2 	movt	r0, #16610	; 0x40e2
200127ec:	4286      	cmp	r6, r0
200127ee:	d21d      	bcs.n	2001282c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xe4>
200127f0:	f64e 50e0 	movw	r0, #60896	; 0xede0
200127f4:	f2c4 00af 	movt	r0, #16559	; 0x40af
200127f8:	4286      	cmp	r6, r0
200127fa:	d21f      	bcs.n	2001283c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xf4>
200127fc:	f20f 70b8 	addw	r0, pc, #1976	; 0x7b8
20012800:	f1b4 3fff 	cmp.w	r4, #4294967295	; 0xffffffff
20012804:	bfc8      	it	gt
20012806:	3008      	addgt	r0, #8
20012808:	ed90 0b00 	vldr	d0, [r0]
2001280c:	462a      	mov	r2, r5
2001280e:	ec51 0b10 	vmov	r0, r1, d0
20012812:	4653      	mov	r3, sl
20012814:	f002 fe30 	bl	20015478 <__aeabi_dadd>
20012818:	ec41 0b10 	vmov	d0, r0, r1
2001281c:	2001      	movs	r0, #1
2001281e:	f001 b98f 	b.w	20013b40 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x13f8>
20012822:	bf00      	nop
20012824:	f20f 70a0 	addw	r0, pc, #1952	; 0x7a0
20012828:	e00a      	b.n	20012840 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xf8>
2001282a:	bf00      	nop
2001282c:	ea4f 5bd6 	mov.w	fp, r6, lsr #23
20012830:	f1bb 0ffe 	cmp.w	fp, #254	; 0xfe
20012834:	d958      	bls.n	200128e8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1a0>
20012836:	ee38 8a48 	vsub.f32	s16, s16, s16
2001283a:	e7b4      	b.n	200127a6 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x5e>
2001283c:	f20f 7098 	addw	r0, pc, #1944	; 0x798
20012840:	f1b4 3fff 	cmp.w	r4, #4294967295	; 0xffffffff
20012844:	bfc8      	it	gt
20012846:	3008      	addgt	r0, #8
20012848:	ed90 0b00 	vldr	d0, [r0]
2001284c:	462a      	mov	r2, r5
2001284e:	ec51 0b10 	vmov	r0, r1, d0
20012852:	4653      	mov	r3, sl
20012854:	f002 fe10 	bl	20015478 <__aeabi_dadd>
20012858:	ec41 0b10 	vmov	d0, r0, r1
2001285c:	2000      	movs	r0, #0
2001285e:	f001 b96f 	b.w	20013b40 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x13f8>
20012862:	bf00      	nop
20012864:	7b800000 	blvc	1e01286c <_fasteheap+0xe00686c>
20012868:	03800000 	orreq	r0, r0, #0
2001286c:	bf00bf00 	svclt	0x0000bf00
20012870:	6dc9c883 	stclvs	8, cr12, [r9, #524]	; 0x20c
20012874:	3fe45f30 	svccc	0x00e45f30
20012878:	00000000 	andeq	r0, r0, r0
2001287c:	43380000 	teqmi	r8, #0
20012880:	00000000 	andeq	r0, r0, r0
20012884:	c3380000 	teqgt	r8, #0
20012888:	00000000 	andeq	r0, r0, r0
2001288c:	c1e00000 	mvngt	r0, r0
20012890:	ffc00000 			; <UNDEFINED> instruction: 0xffc00000
20012894:	41dfffff 	ldrshmi	pc, [pc, #255]	; 2001299b <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x253>	; <UNPREDICTABLE>
20012898:	50000000 	andpl	r0, r0, r0
2001289c:	bff921fb 	svclt	0x00f921fb
200128a0:	611a6263 	tstvs	sl, r3, ror #4
200128a4:	be5110b4 	mrclt	0, 2, r1, cr1, cr4, {5}
	...
200128b4:	3fc00000 	svccc	0x00c00000
200128b8:	00000000 	andeq	r0, r0, r0
200128bc:	c0200000 	eorgt	r0, r0, r0
200128c0:	00000000 	andeq	r0, r0, r0
200128c4:	3ff00000 	svccc	0x00f00000	; IMB
200128c8:	00000000 	andeq	r0, r0, r0
200128cc:	3e700000 	cdpcc	0, 7, cr0, cr0, cr0, {0}
200128d0:	00000000 	andeq	r0, r0, r0
200128d4:	c1700000 	cmngt	r0, r0
200128d8:	00000000 	andeq	r0, r0, r0
200128dc:	43300000 	teqmi	r0, #0
200128e0:	00000000 	andeq	r0, r0, r0
200128e4:	c3300000 	teqgt	r0, #0
200128e8:	f640 70da 	movw	r0, #4058	; 0xfda
200128ec:	f6c4 50c9 	movt	r0, #19913	; 0x4dc9
200128f0:	4286      	cmp	r6, r0
200128f2:	d85f      	bhi.n	200129b4 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x26c>
200128f4:	ed1f 0b22 	vldr	d0, [pc, #-136]	; 20012870 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x128>
200128f8:	4628      	mov	r0, r5
200128fa:	ec53 2b10 	vmov	r2, r3, d0
200128fe:	4651      	mov	r1, sl
20012900:	f002 fc29 	bl	20015156 <__aeabi_dmul>
20012904:	ed1f 0b24 	vldr	d0, [pc, #-144]	; 20012878 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x130>
20012908:	ec53 2b10 	vmov	r2, r3, d0
2001290c:	f002 fdb4 	bl	20015478 <__aeabi_dadd>
20012910:	ed1f 0b25 	vldr	d0, [pc, #-148]	; 20012880 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x138>
20012914:	ec53 2b10 	vmov	r2, r3, d0
20012918:	f002 fdae 	bl	20015478 <__aeabi_dadd>
2001291c:	ed1f 0b26 	vldr	d0, [pc, #-152]	; 20012888 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x140>
20012920:	4606      	mov	r6, r0
20012922:	ec53 2b10 	vmov	r2, r3, d0
20012926:	4688      	mov	r8, r1
20012928:	f002 fda8 	bl	2001547c <__aeabi_dcmpge>
2001292c:	4681      	mov	r9, r0
2001292e:	4630      	mov	r0, r6
20012930:	4641      	mov	r1, r8
20012932:	f001 fd19 	bl	20014368 <__aeabi_d2iz>
20012936:	ed1f 0b2a 	vldr	d0, [pc, #-168]	; 20012890 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x148>
2001293a:	f1b9 0f00 	cmp.w	r9, #0
2001293e:	4681      	mov	r9, r0
20012940:	ec53 2b10 	vmov	r2, r3, d0
20012944:	4630      	mov	r0, r6
20012946:	4641      	mov	r1, r8
20012948:	bf08      	it	eq
2001294a:	f04f 4900 	moveq.w	r9, #2147483648	; 0x80000000
2001294e:	f002 fdcf 	bl	200154f0 <__aeabi_dcmpgt>
20012952:	2800      	cmp	r0, #0
20012954:	4630      	mov	r0, r6
20012956:	4641      	mov	r1, r8
20012958:	4632      	mov	r2, r6
2001295a:	4643      	mov	r3, r8
2001295c:	bf18      	it	ne
2001295e:	f06f 4900 	mvnne.w	r9, #2147483648	; 0x80000000
20012962:	f002 fdfb 	bl	2001555c <__aeabi_dcmpun>
20012966:	ed1f 0b34 	vldr	d0, [pc, #-208]	; 20012898 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x150>
2001296a:	2800      	cmp	r0, #0
2001296c:	ec53 2b10 	vmov	r2, r3, d0
20012970:	4630      	mov	r0, r6
20012972:	4641      	mov	r1, r8
20012974:	bf18      	it	ne
20012976:	f04f 0900 	movne.w	r9, #0
2001297a:	f002 fbec 	bl	20015156 <__aeabi_dmul>
2001297e:	4602      	mov	r2, r0
20012980:	460b      	mov	r3, r1
20012982:	4628      	mov	r0, r5
20012984:	4651      	mov	r1, sl
20012986:	f002 fd77 	bl	20015478 <__aeabi_dadd>
2001298a:	ed1f 0b3b 	vldr	d0, [pc, #-236]	; 200128a0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x158>
2001298e:	4604      	mov	r4, r0
20012990:	460d      	mov	r5, r1
20012992:	ec53 2b10 	vmov	r2, r3, d0
20012996:	4630      	mov	r0, r6
20012998:	4641      	mov	r1, r8
2001299a:	f002 fbdc 	bl	20015156 <__aeabi_dmul>
2001299e:	4602      	mov	r2, r0
200129a0:	460b      	mov	r3, r1
200129a2:	4620      	mov	r0, r4
200129a4:	4629      	mov	r1, r5
200129a6:	f002 fd67 	bl	20015478 <__aeabi_dadd>
200129aa:	ec41 0b10 	vmov	d0, r0, r1
200129ae:	f001 b8c5 	b.w	20013b3c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x13f4>
200129b2:	bf00      	nop
200129b4:	f06f 0095 	mvn.w	r0, #149	; 0x95
200129b8:	eb00 50d6 	add.w	r0, r0, r6, lsr #23
200129bc:	9403      	str	r4, [sp, #12]
200129be:	9002      	str	r0, [sp, #8]
200129c0:	eba6 5ac0 	sub.w	sl, r6, r0, lsl #23
200129c4:	a81e      	add	r0, sp, #120	; 0x78
200129c6:	21a0      	movs	r1, #160	; 0xa0
200129c8:	f002 fe04 	bl	200155d4 <__aeabi_memclr8>
200129cc:	a846      	add	r0, sp, #280	; 0x118
200129ce:	21a0      	movs	r1, #160	; 0xa0
200129d0:	f002 fe00 	bl	200155d4 <__aeabi_memclr8>
200129d4:	a86e      	add	r0, sp, #440	; 0x1b8
200129d6:	21a0      	movs	r1, #160	; 0xa0
200129d8:	f002 fdfc 	bl	200155d4 <__aeabi_memclr8>
200129dc:	a896      	add	r0, sp, #600	; 0x258
200129de:	2150      	movs	r1, #80	; 0x50
200129e0:	f002 fb1e 	bl	20015020 <__aeabi_memclr4>
200129e4:	f06f 0098 	mvn.w	r0, #152	; 0x98
200129e8:	f64a 21ab 	movw	r1, #43691	; 0xaaab
200129ec:	eb00 50d6 	add.w	r0, r0, r6, lsr #23
200129f0:	f6ca 21aa 	movt	r1, #43690	; 0xaaaa
200129f4:	fba0 0101 	umull	r0, r1, r0, r1
200129f8:	090e      	lsrs	r6, r1, #4
200129fa:	f645 41b0 	movw	r1, #23728	; 0x5cb0
200129fe:	f2c2 0101 	movt	r1, #8193	; 0x2001
20012a02:	f851 0026 	ldr.w	r0, [r1, r6, lsl #2]
20012a06:	eb01 0486 	add.w	r4, r1, r6, lsl #2
20012a0a:	f001 ff79 	bl	20014900 <__aeabi_i2d>
20012a0e:	4681      	mov	r9, r0
20012a10:	ec41 0b10 	vmov	d0, r0, r1
20012a14:	e9d4 0501 	ldrd	r0, r5, [r4, #4]
20012a18:	68e4      	ldr	r4, [r4, #12]
20012a1a:	4688      	mov	r8, r1
20012a1c:	ed8d 0b1e 	vstr	d0, [sp, #120]	; 0x78
20012a20:	f001 ff6e 	bl	20014900 <__aeabi_i2d>
20012a24:	ec41 0b10 	vmov	d0, r0, r1
20012a28:	e9cd 0113 	strd	r0, r1, [sp, #76]	; 0x4c
20012a2c:	4628      	mov	r0, r5
20012a2e:	ed8d 0b20 	vstr	d0, [sp, #128]	; 0x80
20012a32:	f001 ff65 	bl	20014900 <__aeabi_i2d>
20012a36:	ec41 0b10 	vmov	d0, r0, r1
20012a3a:	e9cd 0115 	strd	r0, r1, [sp, #84]	; 0x54
20012a3e:	4620      	mov	r0, r4
20012a40:	ed8d 0b22 	vstr	d0, [sp, #136]	; 0x88
20012a44:	f001 ff5c 	bl	20014900 <__aeabi_i2d>
20012a48:	ec41 0b10 	vmov	d0, r0, r1
20012a4c:	e9cd 0117 	strd	r0, r1, [sp, #92]	; 0x5c
20012a50:	4650      	mov	r0, sl
20012a52:	ed8d 0b24 	vstr	d0, [sp, #144]	; 0x90
20012a56:	f002 fb35 	bl	200150c4 <__aeabi_f2d>
20012a5a:	4605      	mov	r5, r0
20012a5c:	468a      	mov	sl, r1
20012a5e:	eba6 0086 	sub.w	r0, r6, r6, lsl #2
20012a62:	9606      	str	r6, [sp, #24]
20012a64:	9019      	str	r0, [sp, #100]	; 0x64
20012a66:	eb0b 0bc0 	add.w	fp, fp, r0, lsl #3
20012a6a:	4648      	mov	r0, r9
20012a6c:	4641      	mov	r1, r8
20012a6e:	462a      	mov	r2, r5
20012a70:	4653      	mov	r3, sl
20012a72:	f50d 79dc 	add.w	r9, sp, #440	; 0x1b8
20012a76:	f002 fb6e 	bl	20015156 <__aeabi_dmul>
20012a7a:	ed1f 0b75 	vldr	d0, [pc, #-468]	; 200128a8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x160>
20012a7e:	ec54 6b10 	vmov	r6, r4, d0
20012a82:	4632      	mov	r2, r6
20012a84:	4623      	mov	r3, r4
20012a86:	f002 fcf7 	bl	20015478 <__aeabi_dadd>
20012a8a:	ec41 0b10 	vmov	d0, r0, r1
20012a8e:	e9dd 0113 	ldrd	r0, r1, [sp, #76]	; 0x4c
20012a92:	462a      	mov	r2, r5
20012a94:	4653      	mov	r3, sl
20012a96:	ed8d 0b6e 	vstr	d0, [sp, #440]	; 0x1b8
20012a9a:	f002 fb5c 	bl	20015156 <__aeabi_dmul>
20012a9e:	4632      	mov	r2, r6
20012aa0:	4623      	mov	r3, r4
20012aa2:	f002 fce9 	bl	20015478 <__aeabi_dadd>
20012aa6:	ec41 0b10 	vmov	d0, r0, r1
20012aaa:	e9dd 0115 	ldrd	r0, r1, [sp, #84]	; 0x54
20012aae:	462a      	mov	r2, r5
20012ab0:	4653      	mov	r3, sl
20012ab2:	ed8d 0b70 	vstr	d0, [sp, #448]	; 0x1c0
20012ab6:	f002 fb4e 	bl	20015156 <__aeabi_dmul>
20012aba:	4632      	mov	r2, r6
20012abc:	4623      	mov	r3, r4
20012abe:	f002 fcdb 	bl	20015478 <__aeabi_dadd>
20012ac2:	ec41 0b10 	vmov	d0, r0, r1
20012ac6:	e9dd 0117 	ldrd	r0, r1, [sp, #92]	; 0x5c
20012aca:	462a      	mov	r2, r5
20012acc:	4653      	mov	r3, sl
20012ace:	ed8d 0b72 	vstr	d0, [sp, #456]	; 0x1c8
20012ad2:	950f      	str	r5, [sp, #60]	; 0x3c
20012ad4:	f8cd a038 	str.w	sl, [sp, #56]	; 0x38
20012ad8:	f002 fb3d 	bl	20015156 <__aeabi_dmul>
20012adc:	4632      	mov	r2, r6
20012ade:	4623      	mov	r3, r4
20012ae0:	9611      	str	r6, [sp, #68]	; 0x44
20012ae2:	9410      	str	r4, [sp, #64]	; 0x40
20012ae4:	f002 fcc8 	bl	20015478 <__aeabi_dadd>
20012ae8:	ec41 0b10 	vmov	d0, r0, r1
20012aec:	9819      	ldr	r0, [sp, #100]	; 0x64
20012aee:	aa96      	add	r2, sp, #600	; 0x258
20012af0:	00c0      	lsls	r0, r0, #3
20012af2:	9001      	str	r0, [sp, #4]
20012af4:	f1ab 00ae 	sub.w	r0, fp, #174	; 0xae
20012af8:	900b      	str	r0, [sp, #44]	; 0x2c
20012afa:	f1a9 0008 	sub.w	r0, r9, #8
20012afe:	9012      	str	r0, [sp, #72]	; 0x48
20012b00:	1f10      	subs	r0, r2, #4
20012b02:	900c      	str	r0, [sp, #48]	; 0x30
20012b04:	f1cb 00c6 	rsb	r0, fp, #198	; 0xc6
20012b08:	f000 001f 	and.w	r0, r0, #31
20012b0c:	9008      	str	r0, [sp, #32]
20012b0e:	f1cb 00c5 	rsb	r0, fp, #197	; 0xc5
20012b12:	f000 001f 	and.w	r0, r0, #31
20012b16:	9007      	str	r0, [sp, #28]
20012b18:	f20b 3051 	addw	r0, fp, #849	; 0x351
20012b1c:	0500      	lsls	r0, r0, #20
20012b1e:	900a      	str	r0, [sp, #40]	; 0x28
20012b20:	1d10      	adds	r0, r2, #4
20012b22:	ed1f cb9d 	vldr	d12, [pc, #-628]	; 200128b0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x168>
20012b26:	ed1f db9c 	vldr	d13, [pc, #-624]	; 200128b8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x170>
20012b2a:	ed1f eba9 	vldr	d14, [pc, #-676]	; 20012888 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x140>
20012b2e:	ed1f fba8 	vldr	d15, [pc, #-672]	; 20012890 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x148>
20012b32:	ed1f 9b9d 	vldr	d9, [pc, #-628]	; 200128c0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x178>
20012b36:	ed1f 8b9c 	vldr	d8, [pc, #-624]	; 200128c8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x180>
20012b3a:	ed1f bb9b 	vldr	d11, [pc, #-620]	; 200128d0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x188>
20012b3e:	9009      	str	r0, [sp, #36]	; 0x24
20012b40:	f102 0008 	add.w	r0, r2, #8
20012b44:	2403      	movs	r4, #3
20012b46:	ed8d 0b74 	vstr	d0, [sp, #464]	; 0x1d0
20012b4a:	9004      	str	r0, [sp, #16]
20012b4c:	eb09 00c4 	add.w	r0, r9, r4, lsl #3
20012b50:	ed90 0b00 	vldr	d0, [r0]
20012b54:	2c00      	cmp	r4, #0
20012b56:	940d      	str	r4, [sp, #52]	; 0x34
20012b58:	f000 8084 	beq.w	20012c64 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x51c>
20012b5c:	9d0c      	ldr	r5, [sp, #48]	; 0x30
20012b5e:	46a2      	mov	sl, r4
20012b60:	ec51 9b10 	vmov	r9, r1, d0
20012b64:	f1aa 0801 	sub.w	r8, sl, #1
20012b68:	ec53 2b18 	vmov	r2, r3, d8
20012b6c:	4648      	mov	r0, r9
20012b6e:	9519      	str	r5, [sp, #100]	; 0x64
20012b70:	f1ba 0f02 	cmp.w	sl, #2
20012b74:	bf38      	it	cc
20012b76:	f04f 0801 	movcc.w	r8, #1
20012b7a:	9118      	str	r1, [sp, #96]	; 0x60
20012b7c:	f002 faeb 	bl	20015156 <__aeabi_dmul>
20012b80:	ec53 2b1e 	vmov	r2, r3, d14
20012b84:	4604      	mov	r4, r0
20012b86:	468b      	mov	fp, r1
20012b88:	e9cd 2316 	strd	r2, r3, [sp, #88]	; 0x58
20012b8c:	f002 fc76 	bl	2001547c <__aeabi_dcmpge>
20012b90:	4605      	mov	r5, r0
20012b92:	4620      	mov	r0, r4
20012b94:	4659      	mov	r1, fp
20012b96:	f001 fbe7 	bl	20014368 <__aeabi_d2iz>
20012b9a:	4606      	mov	r6, r0
20012b9c:	ec53 2b1f 	vmov	r2, r3, d15
20012ba0:	4620      	mov	r0, r4
20012ba2:	4659      	mov	r1, fp
20012ba4:	2d00      	cmp	r5, #0
20012ba6:	bf08      	it	eq
20012ba8:	f04f 4600 	moveq.w	r6, #2147483648	; 0x80000000
20012bac:	e9cd 2314 	strd	r2, r3, [sp, #80]	; 0x50
20012bb0:	f002 fc9e 	bl	200154f0 <__aeabi_dcmpgt>
20012bb4:	2800      	cmp	r0, #0
20012bb6:	4620      	mov	r0, r4
20012bb8:	4659      	mov	r1, fp
20012bba:	4622      	mov	r2, r4
20012bbc:	465b      	mov	r3, fp
20012bbe:	bf18      	it	ne
20012bc0:	f06f 4600 	mvnne.w	r6, #2147483648	; 0x80000000
20012bc4:	f002 fcca 	bl	2001555c <__aeabi_dcmpun>
20012bc8:	2800      	cmp	r0, #0
20012bca:	bf18      	it	ne
20012bcc:	2600      	movne	r6, #0
20012bce:	4630      	mov	r0, r6
20012bd0:	f001 fe96 	bl	20014900 <__aeabi_i2d>
20012bd4:	ec53 2b1b 	vmov	r2, r3, d11
20012bd8:	9013      	str	r0, [sp, #76]	; 0x4c
20012bda:	468b      	mov	fp, r1
20012bdc:	f002 fabb 	bl	20015156 <__aeabi_dmul>
20012be0:	460b      	mov	r3, r1
20012be2:	9918      	ldr	r1, [sp, #96]	; 0x60
20012be4:	4602      	mov	r2, r0
20012be6:	4648      	mov	r0, r9
20012be8:	f002 fc46 	bl	20015478 <__aeabi_dadd>
20012bec:	e9dd 2316 	ldrd	r2, r3, [sp, #88]	; 0x58
20012bf0:	4604      	mov	r4, r0
20012bf2:	460d      	mov	r5, r1
20012bf4:	f002 fc42 	bl	2001547c <__aeabi_dcmpge>
20012bf8:	4681      	mov	r9, r0
20012bfa:	4620      	mov	r0, r4
20012bfc:	4629      	mov	r1, r5
20012bfe:	f001 fbb3 	bl	20014368 <__aeabi_d2iz>
20012c02:	4606      	mov	r6, r0
20012c04:	f1b9 0f00 	cmp.w	r9, #0
20012c08:	bf08      	it	eq
20012c0a:	f04f 4600 	moveq.w	r6, #2147483648	; 0x80000000
20012c0e:	e9dd 2314 	ldrd	r2, r3, [sp, #80]	; 0x50
20012c12:	4620      	mov	r0, r4
20012c14:	4629      	mov	r1, r5
20012c16:	f002 fc6b 	bl	200154f0 <__aeabi_dcmpgt>
20012c1a:	2800      	cmp	r0, #0
20012c1c:	bf18      	it	ne
20012c1e:	f06f 4600 	mvnne.w	r6, #2147483648	; 0x80000000
20012c22:	4620      	mov	r0, r4
20012c24:	4629      	mov	r1, r5
20012c26:	4622      	mov	r2, r4
20012c28:	462b      	mov	r3, r5
20012c2a:	9d19      	ldr	r5, [sp, #100]	; 0x64
20012c2c:	f002 fc96 	bl	2001555c <__aeabi_dcmpun>
20012c30:	2800      	cmp	r0, #0
20012c32:	bf18      	it	ne
20012c34:	2600      	movne	r6, #0
20012c36:	9812      	ldr	r0, [sp, #72]	; 0x48
20012c38:	9a13      	ldr	r2, [sp, #76]	; 0x4c
20012c3a:	eb00 00ca 	add.w	r0, r0, sl, lsl #3
20012c3e:	ed90 0b00 	vldr	d0, [r0]
20012c42:	465b      	mov	r3, fp
20012c44:	ec51 0b10 	vmov	r0, r1, d0
20012c48:	f845 6f04 	str.w	r6, [r5, #4]!
20012c4c:	f002 fc14 	bl	20015478 <__aeabi_dadd>
20012c50:	ec41 0b10 	vmov	d0, r0, r1
20012c54:	f1ba 0f02 	cmp.w	sl, #2
20012c58:	d304      	bcc.n	20012c64 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x51c>
20012c5a:	f1b8 0f00 	cmp.w	r8, #0
20012c5e:	46c2      	mov	sl, r8
20012c60:	f47f af7e 	bne.w	20012b60 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x418>
20012c64:	9b0a      	ldr	r3, [sp, #40]	; 0x28
20012c66:	ec51 0b10 	vmov	r0, r1, d0
20012c6a:	2200      	movs	r2, #0
20012c6c:	f002 fa73 	bl	20015156 <__aeabi_dmul>
20012c70:	ec53 2b1c 	vmov	r2, r3, d12
20012c74:	4605      	mov	r5, r0
20012c76:	468a      	mov	sl, r1
20012c78:	f002 fa6d 	bl	20015156 <__aeabi_dmul>
20012c7c:	e9dd 3210 	ldrd	r3, r2, [sp, #64]	; 0x40
20012c80:	4683      	mov	fp, r0
20012c82:	4688      	mov	r8, r1
20012c84:	ec41 0b1a 	vmov	d10, r0, r1
20012c88:	f001 fef2 	bl	20014a70 <__aeabi_dcmpeq>
20012c8c:	2800      	cmp	r0, #0
20012c8e:	d167      	bne.n	20012d60 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x618>
20012c90:	f3c8 540a 	ubfx	r4, r8, #20, #11
20012c94:	f240 4032 	movw	r0, #1074	; 0x432
20012c98:	4284      	cmp	r4, r0
20012c9a:	d861      	bhi.n	20012d60 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x618>
20012c9c:	f1b8 0f00 	cmp.w	r8, #0
20012ca0:	d41e      	bmi.n	20012ce0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x598>
20012ca2:	ed1f 0bf3 	vldr	d0, [pc, #-972]	; 200128d8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x190>
20012ca6:	4658      	mov	r0, fp
20012ca8:	ec53 2b10 	vmov	r2, r3, d0
20012cac:	4641      	mov	r1, r8
20012cae:	f002 fbe3 	bl	20015478 <__aeabi_dadd>
20012cb2:	ed1f 0bf5 	vldr	d0, [pc, #-980]	; 200128e0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x198>
20012cb6:	ec53 2b10 	vmov	r2, r3, d0
20012cba:	f002 fbdd 	bl	20015478 <__aeabi_dadd>
20012cbe:	465a      	mov	r2, fp
20012cc0:	4643      	mov	r3, r8
20012cc2:	f001 ffc6 	bl	20014c52 <__aeabi_dsub>
20012cc6:	ec41 0b10 	vmov	d0, r0, r1
20012cca:	f240 30ff 	movw	r0, #1023	; 0x3ff
20012cce:	4284      	cmp	r4, r0
20012cd0:	ed8d 0baa 	vstr	d0, [sp, #680]	; 0x2a8
20012cd4:	d224      	bcs.n	20012d20 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x5d8>
20012cd6:	ed9d 0baa 	vldr	d0, [sp, #680]	; 0x2a8
20012cda:	ed9f aba7 	vldr	d10, [pc, #668]	; 20012f78 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x830>
20012cde:	e03f      	b.n	20012d60 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x618>
20012ce0:	ed9f 0ba7 	vldr	d0, [pc, #668]	; 20012f80 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x838>
20012ce4:	4658      	mov	r0, fp
20012ce6:	ec53 2b10 	vmov	r2, r3, d0
20012cea:	4641      	mov	r1, r8
20012cec:	f002 fbc4 	bl	20015478 <__aeabi_dadd>
20012cf0:	ed9f 0ba5 	vldr	d0, [pc, #660]	; 20012f88 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x840>
20012cf4:	ec53 2b10 	vmov	r2, r3, d0
20012cf8:	f002 fbbe 	bl	20015478 <__aeabi_dadd>
20012cfc:	465a      	mov	r2, fp
20012cfe:	4643      	mov	r3, r8
20012d00:	f001 ffa7 	bl	20014c52 <__aeabi_dsub>
20012d04:	ec41 0b10 	vmov	d0, r0, r1
20012d08:	f240 30ff 	movw	r0, #1023	; 0x3ff
20012d0c:	4284      	cmp	r4, r0
20012d0e:	ed8d 0baa 	vstr	d0, [sp, #680]	; 0x2a8
20012d12:	d205      	bcs.n	20012d20 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x5d8>
20012d14:	ed9f ab9e 	vldr	d10, [pc, #632]	; 20012f90 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x848>
20012d18:	ed9d 0baa 	vldr	d0, [sp, #680]	; 0x2a8
20012d1c:	e020      	b.n	20012d60 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x618>
20012d1e:	bf00      	nop
20012d20:	9519      	str	r5, [sp, #100]	; 0x64
20012d22:	ec56 5b10 	vmov	r5, r6, d0
20012d26:	4628      	mov	r0, r5
20012d28:	4631      	mov	r1, r6
20012d2a:	465a      	mov	r2, fp
20012d2c:	4643      	mov	r3, r8
20012d2e:	f002 fba3 	bl	20015478 <__aeabi_dadd>
20012d32:	ed9f 0b97 	vldr	d0, [pc, #604]	; 20012f90 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x848>
20012d36:	4680      	mov	r8, r0
20012d38:	ec53 2b10 	vmov	r2, r3, d0
20012d3c:	468b      	mov	fp, r1
20012d3e:	f002 fb9b 	bl	20015478 <__aeabi_dadd>
20012d42:	e9dd 3210 	ldrd	r3, r2, [sp, #64]	; 0x40
20012d46:	4604      	mov	r4, r0
20012d48:	4689      	mov	r9, r1
20012d4a:	4628      	mov	r0, r5
20012d4c:	9d19      	ldr	r5, [sp, #100]	; 0x64
20012d4e:	4631      	mov	r1, r6
20012d50:	f002 fbce 	bl	200154f0 <__aeabi_dcmpgt>
20012d54:	2800      	cmp	r0, #0
20012d56:	bf04      	itt	eq
20012d58:	46d9      	moveq	r9, fp
20012d5a:	4644      	moveq	r4, r8
20012d5c:	ec49 4b1a 	vmov	d10, r4, r9
20012d60:	ec51 0b1a 	vmov	r0, r1, d10
20012d64:	ec53 2b1d 	vmov	r2, r3, d13
20012d68:	f002 f9f5 	bl	20015156 <__aeabi_dmul>
20012d6c:	4602      	mov	r2, r0
20012d6e:	460b      	mov	r3, r1
20012d70:	4628      	mov	r0, r5
20012d72:	4651      	mov	r1, sl
20012d74:	f002 fb80 	bl	20015478 <__aeabi_dadd>
20012d78:	ec53 2b1e 	vmov	r2, r3, d14
20012d7c:	4604      	mov	r4, r0
20012d7e:	460d      	mov	r5, r1
20012d80:	e9cd 2318 	strd	r2, r3, [sp, #96]	; 0x60
20012d84:	f002 fb7a 	bl	2001547c <__aeabi_dcmpge>
20012d88:	4606      	mov	r6, r0
20012d8a:	4620      	mov	r0, r4
20012d8c:	4629      	mov	r1, r5
20012d8e:	f001 faeb 	bl	20014368 <__aeabi_d2iz>
20012d92:	2e00      	cmp	r6, #0
20012d94:	ec53 6b1f 	vmov	r6, r3, d15
20012d98:	4681      	mov	r9, r0
20012d9a:	4620      	mov	r0, r4
20012d9c:	4629      	mov	r1, r5
20012d9e:	4632      	mov	r2, r6
20012da0:	bf08      	it	eq
20012da2:	f04f 4900 	moveq.w	r9, #2147483648	; 0x80000000
20012da6:	9317      	str	r3, [sp, #92]	; 0x5c
20012da8:	f002 fba2 	bl	200154f0 <__aeabi_dcmpgt>
20012dac:	2800      	cmp	r0, #0
20012dae:	4620      	mov	r0, r4
20012db0:	4629      	mov	r1, r5
20012db2:	4622      	mov	r2, r4
20012db4:	462b      	mov	r3, r5
20012db6:	bf18      	it	ne
20012db8:	f06f 4900 	mvnne.w	r9, #2147483648	; 0x80000000
20012dbc:	f002 fbce 	bl	2001555c <__aeabi_dcmpun>
20012dc0:	2800      	cmp	r0, #0
20012dc2:	bf18      	it	ne
20012dc4:	f04f 0900 	movne.w	r9, #0
20012dc8:	4648      	mov	r0, r9
20012dca:	f001 fd99 	bl	20014900 <__aeabi_i2d>
20012dce:	4602      	mov	r2, r0
20012dd0:	460b      	mov	r3, r1
20012dd2:	4620      	mov	r0, r4
20012dd4:	4629      	mov	r1, r5
20012dd6:	f001 ff3c 	bl	20014c52 <__aeabi_dsub>
20012dda:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
20012ddc:	ec41 0b1a 	vmov	d10, r0, r1
20012de0:	4680      	mov	r8, r0
20012de2:	468a      	mov	sl, r1
20012de4:	2a00      	cmp	r2, #0
20012de6:	9616      	str	r6, [sp, #88]	; 0x58
20012de8:	dd24      	ble.n	20012e34 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x6ec>
20012dea:	e9dd 3b0c 	ldrd	r3, fp, [sp, #48]	; 0x30
20012dee:	9e08      	ldr	r6, [sp, #32]
20012df0:	f853 002b 	ldr.w	r0, [r3, fp, lsl #2]
20012df4:	fa40 f106 	asr.w	r1, r0, r6
20012df8:	4489      	add	r9, r1
20012dfa:	40b1      	lsls	r1, r6
20012dfc:	1a40      	subs	r0, r0, r1
20012dfe:	9907      	ldr	r1, [sp, #28]
20012e00:	f843 002b 	str.w	r0, [r3, fp, lsl #2]
20012e04:	fa40 fe01 	asr.w	lr, r0, r1
20012e08:	9e19      	ldr	r6, [sp, #100]	; 0x64
20012e0a:	f1be 0f01 	cmp.w	lr, #1
20012e0e:	ad96      	add	r5, sp, #600	; 0x258
20012e10:	f2c0 80f5 	blt.w	20012ffe <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8b6>
20012e14:	f1bb 0f00 	cmp.w	fp, #0
20012e18:	f000 80fc 	beq.w	20013014 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8cc>
20012e1c:	f1bb 0f04 	cmp.w	fp, #4
20012e20:	f00b 0c03 	and.w	ip, fp, #3
20012e24:	d21a      	bcs.n	20012e5c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x714>
20012e26:	f1bc 0f00 	cmp.w	ip, #0
20012e2a:	f000 809f 	beq.w	20012f6c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x824>
20012e2e:	9a96      	ldr	r2, [sp, #600]	; 0x258
20012e30:	2100      	movs	r1, #0
20012e32:	e079      	b.n	20012f28 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x7e0>
20012e34:	f8dd b034 	ldr.w	fp, [sp, #52]	; 0x34
20012e38:	f000 80d6 	beq.w	20012fe8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8a0>
20012e3c:	ed9f 0b56 	vldr	d0, [pc, #344]	; 20012f98 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x850>
20012e40:	4640      	mov	r0, r8
20012e42:	ec53 2b10 	vmov	r2, r3, d0
20012e46:	4651      	mov	r1, sl
20012e48:	f002 fb18 	bl	2001547c <__aeabi_dcmpge>
20012e4c:	9e19      	ldr	r6, [sp, #100]	; 0x64
20012e4e:	2800      	cmp	r0, #0
20012e50:	f040 80d8 	bne.w	20013004 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8bc>
20012e54:	f04f 0800 	mov.w	r8, #0
20012e58:	e109      	b.n	2001306e <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x926>
20012e5a:	bf00      	nop
20012e5c:	f00b 021c 	and.w	r2, fp, #28
20012e60:	2100      	movs	r1, #0
20012e62:	2600      	movs	r6, #0
20012e64:	f855 0021 	ldr.w	r0, [r5, r1, lsl #2]
20012e68:	2e00      	cmp	r6, #0
20012e6a:	f041 0601 	orr.w	r6, r1, #1
20012e6e:	d003      	beq.n	20012e78 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x730>
20012e70:	f06f 437f 	mvn.w	r3, #4278190080	; 0xff000000
20012e74:	e003      	b.n	20012e7e <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x736>
20012e76:	bf00      	nop
20012e78:	b330      	cbz	r0, 20012ec8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x780>
20012e7a:	f04f 7380 	mov.w	r3, #16777216	; 0x1000000
20012e7e:	1a18      	subs	r0, r3, r0
20012e80:	f845 0021 	str.w	r0, [r5, r1, lsl #2]
20012e84:	f855 0026 	ldr.w	r0, [r5, r6, lsl #2]
20012e88:	f041 0302 	orr.w	r3, r1, #2
20012e8c:	eb05 0486 	add.w	r4, r5, r6, lsl #2
20012e90:	f06f 467f 	mvn.w	r6, #4278190080	; 0xff000000
20012e94:	1a30      	subs	r0, r6, r0
20012e96:	6020      	str	r0, [r4, #0]
20012e98:	f855 0023 	ldr.w	r0, [r5, r3, lsl #2]
20012e9c:	f041 0603 	orr.w	r6, r1, #3
20012ea0:	eb05 0483 	add.w	r4, r5, r3, lsl #2
20012ea4:	f06f 437f 	mvn.w	r3, #4278190080	; 0xff000000
20012ea8:	1a18      	subs	r0, r3, r0
20012eaa:	6020      	str	r0, [r4, #0]
20012eac:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
20012eb0:	3104      	adds	r1, #4
20012eb2:	eb05 0086 	add.w	r0, r5, r6, lsl #2
20012eb6:	f06f 467f 	mvn.w	r6, #4278190080	; 0xff000000
20012eba:	1af3      	subs	r3, r6, r3
20012ebc:	2601      	movs	r6, #1
20012ebe:	6003      	str	r3, [r0, #0]
20012ec0:	3a04      	subs	r2, #4
20012ec2:	d1cf      	bne.n	20012e64 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x71c>
20012ec4:	e021      	b.n	20012f0a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x7c2>
20012ec6:	bf00      	nop
20012ec8:	f855 0026 	ldr.w	r0, [r5, r6, lsl #2]
20012ecc:	f041 0302 	orr.w	r3, r1, #2
20012ed0:	b120      	cbz	r0, 20012edc <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x794>
20012ed2:	eb05 0486 	add.w	r4, r5, r6, lsl #2
20012ed6:	f04f 7680 	mov.w	r6, #16777216	; 0x1000000
20012eda:	e7db      	b.n	20012e94 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x74c>
20012edc:	f855 0023 	ldr.w	r0, [r5, r3, lsl #2]
20012ee0:	f041 0603 	orr.w	r6, r1, #3
20012ee4:	b120      	cbz	r0, 20012ef0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x7a8>
20012ee6:	eb05 0483 	add.w	r4, r5, r3, lsl #2
20012eea:	f04f 7380 	mov.w	r3, #16777216	; 0x1000000
20012eee:	e7db      	b.n	20012ea8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x760>
20012ef0:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
20012ef4:	3104      	adds	r1, #4
20012ef6:	b12b      	cbz	r3, 20012f04 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x7bc>
20012ef8:	eb05 0086 	add.w	r0, r5, r6, lsl #2
20012efc:	f04f 7680 	mov.w	r6, #16777216	; 0x1000000
20012f00:	e7db      	b.n	20012eba <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x772>
20012f02:	bf00      	nop
20012f04:	2600      	movs	r6, #0
20012f06:	3a04      	subs	r2, #4
20012f08:	d1ac      	bne.n	20012e64 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x71c>
20012f0a:	f1bc 0f00 	cmp.w	ip, #0
20012f0e:	d02c      	beq.n	20012f6a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x822>
20012f10:	f855 2021 	ldr.w	r2, [r5, r1, lsl #2]
20012f14:	b146      	cbz	r6, 20012f28 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x7e0>
20012f16:	f06f 407f 	mvn.w	r0, #4278190080	; 0xff000000
20012f1a:	1a80      	subs	r0, r0, r2
20012f1c:	f1bc 0f01 	cmp.w	ip, #1
20012f20:	f845 0021 	str.w	r0, [r5, r1, lsl #2]
20012f24:	d020      	beq.n	20012f68 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x820>
20012f26:	e00a      	b.n	20012f3e <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x7f6>
20012f28:	2a00      	cmp	r2, #0
20012f2a:	f000 813b 	beq.w	200131a4 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa5c>
20012f2e:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
20012f32:	1a80      	subs	r0, r0, r2
20012f34:	f1bc 0f01 	cmp.w	ip, #1
20012f38:	f845 0021 	str.w	r0, [r5, r1, lsl #2]
20012f3c:	d014      	beq.n	20012f68 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x820>
20012f3e:	9809      	ldr	r0, [sp, #36]	; 0x24
20012f40:	f850 3021 	ldr.w	r3, [r0, r1, lsl #2]
20012f44:	eb00 0281 	add.w	r2, r0, r1, lsl #2
20012f48:	f06f 407f 	mvn.w	r0, #4278190080	; 0xff000000
20012f4c:	1ac0      	subs	r0, r0, r3
20012f4e:	f1bc 0f02 	cmp.w	ip, #2
20012f52:	6010      	str	r0, [r2, #0]
20012f54:	d008      	beq.n	20012f68 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x820>
20012f56:	9804      	ldr	r0, [sp, #16]
20012f58:	eb00 0281 	add.w	r2, r0, r1, lsl #2
20012f5c:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
20012f60:	f06f 417f 	mvn.w	r1, #4278190080	; 0xff000000
20012f64:	1a08      	subs	r0, r1, r0
20012f66:	6010      	str	r0, [r2, #0]
20012f68:	2601      	movs	r6, #1
20012f6a:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
20012f6c:	2a00      	cmp	r2, #0
20012f6e:	dc54      	bgt.n	2001301a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8d2>
20012f70:	e063      	b.n	2001303a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8f2>
20012f72:	bf00      	nop
20012f74:	bf00      	nop
20012f76:	bf00      	nop
	...
20012f84:	c3300000 	teqgt	r0, #0
20012f88:	00000000 	andeq	r0, r0, r0
20012f8c:	43300000 	teqmi	r0, #0
20012f90:	00000000 	andeq	r0, r0, r0
20012f94:	bff00000 	svclt	0x00f00000	; IMB
20012f98:	00000000 	andeq	r0, r0, r0
20012f9c:	3fe00000 	svccc	0x00e00000
20012fa0:	00000000 	andeq	r0, r0, r0
20012fa4:	41700000 	cmnmi	r0, r0
20012fa8:	54442d18 	strbpl	r2, [r4], #-3352	; 0xfffff2e8
20012fac:	3ff921fb 	svccc	0x00f921fb
20012fb0:	54442d18 	strbpl	r2, [r4], #-3352	; 0xfffff2e8
20012fb4:	bff921fb 	svclt	0x00f921fb
20012fb8:	7f3321d2 	svcvc	0x003321d2
20012fbc:	4012d97c 	andsmi	sp, r2, ip, ror r9
20012fc0:	7f3321d2 	svcvc	0x003321d2
20012fc4:	c012d97c 	andsgt	sp, r2, ip, ror r9
20012fc8:	54442d18 	strbpl	r2, [r4], #-3352	; 0xfffff2e8
20012fcc:	400921fb 	strdmi	r2, [r9], -fp
20012fd0:	54442d18 	strbpl	r2, [r4], #-3352	; 0xfffff2e8
20012fd4:	c00921fb 	strdgt	r2, [r9], -fp
20012fd8:	54442d18 	strbpl	r2, [r4], #-3352	; 0xfffff2e8
20012fdc:	401921fb 			; <UNDEFINED> instruction: 0x401921fb
20012fe0:	54442d18 	strbpl	r2, [r4], #-3352	; 0xfffff2e8
20012fe4:	c01921fb 			; <UNDEFINED> instruction: 0xc01921fb
20012fe8:	980c      	ldr	r0, [sp, #48]	; 0x30
20012fea:	f850 002b 	ldr.w	r0, [r0, fp, lsl #2]
20012fee:	ea4f 5ee0 	mov.w	lr, r0, asr #23
20012ff2:	9e19      	ldr	r6, [sp, #100]	; 0x64
20012ff4:	f1be 0f01 	cmp.w	lr, #1
20012ff8:	ad96      	add	r5, sp, #600	; 0x258
20012ffa:	f6bf af0b 	bge.w	20012e14 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x6cc>
20012ffe:	46f0      	mov	r8, lr
20013000:	e035      	b.n	2001306e <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x926>
20013002:	bf00      	nop
20013004:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
20013006:	f04f 0e02 	mov.w	lr, #2
2001300a:	ad96      	add	r5, sp, #600	; 0x258
2001300c:	f1bb 0f00 	cmp.w	fp, #0
20013010:	f47f af04 	bne.w	20012e1c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x6d4>
20013014:	2600      	movs	r6, #0
20013016:	2a00      	cmp	r2, #0
20013018:	dd0f      	ble.n	2001303a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8f2>
2001301a:	f64f 70ff 	movw	r0, #65535	; 0xffff
2001301e:	2a02      	cmp	r2, #2
20013020:	f2c0 003f 	movt	r0, #63	; 0x3f
20013024:	d003      	beq.n	2001302e <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8e6>
20013026:	2a01      	cmp	r2, #1
20013028:	d107      	bne.n	2001303a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x8f2>
2001302a:	f500 0080 	add.w	r0, r0, #4194304	; 0x400000
2001302e:	9a0c      	ldr	r2, [sp, #48]	; 0x30
20013030:	f852 102b 	ldr.w	r1, [r2, fp, lsl #2]
20013034:	4008      	ands	r0, r1
20013036:	f842 002b 	str.w	r0, [r2, fp, lsl #2]
2001303a:	f1be 0f02 	cmp.w	lr, #2
2001303e:	f109 0901 	add.w	r9, r9, #1
20013042:	d111      	bne.n	20013068 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x920>
20013044:	ec51 0b19 	vmov	r0, r1, d9
20013048:	4642      	mov	r2, r8
2001304a:	4653      	mov	r3, sl
2001304c:	f001 fe01 	bl	20014c52 <__aeabi_dsub>
20013050:	9b0a      	ldr	r3, [sp, #40]	; 0x28
20013052:	2200      	movs	r2, #0
20013054:	4604      	mov	r4, r0
20013056:	460d      	mov	r5, r1
20013058:	f001 fdfb 	bl	20014c52 <__aeabi_dsub>
2001305c:	2e00      	cmp	r6, #0
2001305e:	bf04      	itt	eq
20013060:	4629      	moveq	r1, r5
20013062:	4620      	moveq	r0, r4
20013064:	ec41 0b1a 	vmov	d10, r0, r1
20013068:	9e19      	ldr	r6, [sp, #100]	; 0x64
2001306a:	f04f 0802 	mov.w	r8, #2
2001306e:	ec54 5b1a 	vmov	r5, r4, d10
20013072:	e9dd 3210 	ldrd	r3, r2, [sp, #64]	; 0x40
20013076:	4628      	mov	r0, r5
20013078:	4621      	mov	r1, r4
2001307a:	f001 fcf9 	bl	20014a70 <__aeabi_dcmpeq>
2001307e:	2800      	cmp	r0, #0
20013080:	f000 80b4 	beq.w	200131ec <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xaa4>
20013084:	f1ab 0101 	sub.w	r1, fp, #1
20013088:	2903      	cmp	r1, #3
2001308a:	ae96      	add	r6, sp, #600	; 0x258
2001308c:	d331      	bcc.n	200130f2 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9aa>
2001308e:	2000      	movs	r0, #0
20013090:	460a      	mov	r2, r1
20013092:	2903      	cmp	r1, #3
20013094:	bf88      	it	hi
20013096:	3a01      	subhi	r2, #1
20013098:	f856 3021 	ldr.w	r3, [r6, r1, lsl #2]
2001309c:	2904      	cmp	r1, #4
2001309e:	ea40 0003 	orr.w	r0, r0, r3
200130a2:	bf28      	it	cs
200130a4:	2a03      	cmpcs	r2, #3
200130a6:	d321      	bcc.n	200130ec <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9a4>
200130a8:	4611      	mov	r1, r2
200130aa:	bf88      	it	hi
200130ac:	3901      	subhi	r1, #1
200130ae:	f856 3022 	ldr.w	r3, [r6, r2, lsl #2]
200130b2:	2a04      	cmp	r2, #4
200130b4:	ea40 0003 	orr.w	r0, r0, r3
200130b8:	bf28      	it	cs
200130ba:	2903      	cmpcs	r1, #3
200130bc:	d316      	bcc.n	200130ec <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9a4>
200130be:	460a      	mov	r2, r1
200130c0:	bf88      	it	hi
200130c2:	3a01      	subhi	r2, #1
200130c4:	f856 3021 	ldr.w	r3, [r6, r1, lsl #2]
200130c8:	2904      	cmp	r1, #4
200130ca:	ea40 0003 	orr.w	r0, r0, r3
200130ce:	bf28      	it	cs
200130d0:	2a03      	cmpcs	r2, #3
200130d2:	d30b      	bcc.n	200130ec <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9a4>
200130d4:	4611      	mov	r1, r2
200130d6:	bf88      	it	hi
200130d8:	3901      	subhi	r1, #1
200130da:	f856 3022 	ldr.w	r3, [r6, r2, lsl #2]
200130de:	2a04      	cmp	r2, #4
200130e0:	ea40 0003 	orr.w	r0, r0, r3
200130e4:	bf28      	it	cs
200130e6:	2902      	cmpcs	r1, #2
200130e8:	d8d2      	bhi.n	20013090 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x948>
200130ea:	bf00      	nop
200130ec:	2800      	cmp	r0, #0
200130ee:	f040 8161 	bne.w	200133b4 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc6c>
200130f2:	9909      	ldr	r1, [sp, #36]	; 0x24
200130f4:	2201      	movs	r2, #1
200130f6:	f50d 79dc 	add.w	r9, sp, #440	; 0x1b8
200130fa:	bf00      	nop
200130fc:	6848      	ldr	r0, [r1, #4]
200130fe:	2800      	cmp	r0, #0
20013100:	4610      	mov	r0, r2
20013102:	d114      	bne.n	2001312e <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9e6>
20013104:	680a      	ldr	r2, [r1, #0]
20013106:	b98a      	cbnz	r2, 2001312c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9e4>
20013108:	f851 2c04 	ldr.w	r2, [r1, #-4]
2001310c:	2a00      	cmp	r2, #0
2001310e:	d141      	bne.n	20013194 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa4c>
20013110:	f851 3c08 	ldr.w	r3, [r1, #-8]
20013114:	1d02      	adds	r2, r0, #4
20013116:	2b00      	cmp	r3, #0
20013118:	f1a1 0110 	sub.w	r1, r1, #16
2001311c:	d0ee      	beq.n	200130fc <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9b4>
2001311e:	3003      	adds	r0, #3
20013120:	eb00 040b 	add.w	r4, r0, fp
20013124:	45a3      	cmp	fp, r4
20013126:	f4bf ad11 	bcs.w	20012b4c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x404>
2001312a:	e005      	b.n	20013138 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9f0>
2001312c:	3001      	adds	r0, #1
2001312e:	eb00 040b 	add.w	r4, r0, fp
20013132:	45a3      	cmp	fp, r4
20013134:	f4bf ad0a 	bcs.w	20012b4c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x404>
20013138:	f10b 0501 	add.w	r5, fp, #1
2001313c:	f8dd a018 	ldr.w	sl, [sp, #24]
20013140:	f645 4bb0 	movw	fp, #23728	; 0x5cb0
20013144:	f10d 0878 	add.w	r8, sp, #120	; 0x78
20013148:	f2c2 0b01 	movt	fp, #8193	; 0x2001
2001314c:	eb05 000a 	add.w	r0, r5, sl
20013150:	f85b 0020 	ldr.w	r0, [fp, r0, lsl #2]
20013154:	eb08 06c5 	add.w	r6, r8, r5, lsl #3
20013158:	f001 fbd2 	bl	20014900 <__aeabi_i2d>
2001315c:	4602      	mov	r2, r0
2001315e:	460b      	mov	r3, r1
20013160:	ec41 0b10 	vmov	d0, r0, r1
20013164:	e9dd 100e 	ldrd	r1, r0, [sp, #56]	; 0x38
20013168:	ed86 0b00 	vstr	d0, [r6]
2001316c:	f001 fff3 	bl	20015156 <__aeabi_dmul>
20013170:	e9dd 3210 	ldrd	r3, r2, [sp, #64]	; 0x40
20013174:	f002 f980 	bl	20015478 <__aeabi_dadd>
20013178:	ec41 0b10 	vmov	d0, r0, r1
2001317c:	42a5      	cmp	r5, r4
2001317e:	eb09 00c5 	add.w	r0, r9, r5, lsl #3
20013182:	bf38      	it	cc
20013184:	3501      	addcc	r5, #1
20013186:	ed80 0b00 	vstr	d0, [r0]
2001318a:	f4bf acdf 	bcs.w	20012b4c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x404>
2001318e:	42a5      	cmp	r5, r4
20013190:	d9dc      	bls.n	2001314c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa04>
20013192:	e4db      	b.n	20012b4c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x404>
20013194:	3002      	adds	r0, #2
20013196:	eb00 040b 	add.w	r4, r0, fp
2001319a:	45a3      	cmp	fp, r4
2001319c:	f4bf acd6 	bcs.w	20012b4c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x404>
200131a0:	e7ca      	b.n	20013138 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x9f0>
200131a2:	bf00      	nop
200131a4:	f1bc 0f01 	cmp.w	ip, #1
200131a8:	d102      	bne.n	200131b0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa68>
200131aa:	2600      	movs	r6, #0
200131ac:	e6dd      	b.n	20012f6a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x822>
200131ae:	bf00      	nop
200131b0:	9809      	ldr	r0, [sp, #36]	; 0x24
200131b2:	f850 3021 	ldr.w	r3, [r0, r1, lsl #2]
200131b6:	b15b      	cbz	r3, 200131d0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa88>
200131b8:	eb00 0281 	add.w	r2, r0, r1, lsl #2
200131bc:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
200131c0:	1ac0      	subs	r0, r0, r3
200131c2:	f1bc 0f02 	cmp.w	ip, #2
200131c6:	6010      	str	r0, [r2, #0]
200131c8:	f47f aec5 	bne.w	20012f56 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x80e>
200131cc:	e6cc      	b.n	20012f68 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x820>
200131ce:	bf00      	nop
200131d0:	f1bc 0f02 	cmp.w	ip, #2
200131d4:	d0e9      	beq.n	200131aa <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa62>
200131d6:	9a04      	ldr	r2, [sp, #16]
200131d8:	f852 0021 	ldr.w	r0, [r2, r1, lsl #2]
200131dc:	2800      	cmp	r0, #0
200131de:	d0e4      	beq.n	200131aa <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xa62>
200131e0:	eb02 0281 	add.w	r2, r2, r1, lsl #2
200131e4:	f04f 7180 	mov.w	r1, #16777216	; 0x1000000
200131e8:	e6bc      	b.n	20012f64 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x81c>
200131ea:	bf00      	nop
200131ec:	f8cd 9014 	str.w	r9, [sp, #20]
200131f0:	990b      	ldr	r1, [sp, #44]	; 0x2c
200131f2:	f240 30ff 	movw	r0, #1023	; 0x3ff
200131f6:	1a40      	subs	r0, r0, r1
200131f8:	0503      	lsls	r3, r0, #20
200131fa:	4628      	mov	r0, r5
200131fc:	4621      	mov	r1, r4
200131fe:	2200      	movs	r2, #0
20013200:	f001 ffa9 	bl	20015156 <__aeabi_dmul>
20013204:	ed1f 0b9a 	vldr	d0, [pc, #-616]	; 20012fa0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x858>
20013208:	4682      	mov	sl, r0
2001320a:	ec53 2b10 	vmov	r2, r3, d0
2001320e:	4689      	mov	r9, r1
20013210:	ec41 0b1a 	vmov	d10, r0, r1
20013214:	f002 f932 	bl	2001547c <__aeabi_dcmpge>
20013218:	b910      	cbnz	r0, 20013220 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xad8>
2001321a:	e9dd 2916 	ldrd	r2, r9, [sp, #88]	; 0x58
2001321e:	e070      	b.n	20013302 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xbba>
20013220:	ec53 2b18 	vmov	r2, r3, d8
20013224:	4650      	mov	r0, sl
20013226:	4649      	mov	r1, r9
20013228:	f001 ff95 	bl	20015156 <__aeabi_dmul>
2001322c:	9a18      	ldr	r2, [sp, #96]	; 0x60
2001322e:	4633      	mov	r3, r6
20013230:	4604      	mov	r4, r0
20013232:	460d      	mov	r5, r1
20013234:	f002 f922 	bl	2001547c <__aeabi_dcmpge>
20013238:	f8cd 8030 	str.w	r8, [sp, #48]	; 0x30
2001323c:	4680      	mov	r8, r0
2001323e:	4620      	mov	r0, r4
20013240:	4629      	mov	r1, r5
20013242:	f001 f891 	bl	20014368 <__aeabi_d2iz>
20013246:	4606      	mov	r6, r0
20013248:	f1b8 0f00 	cmp.w	r8, #0
2001324c:	f8dd 8030 	ldr.w	r8, [sp, #48]	; 0x30
20013250:	bf08      	it	eq
20013252:	f04f 4600 	moveq.w	r6, #2147483648	; 0x80000000
20013256:	e9dd 2316 	ldrd	r2, r3, [sp, #88]	; 0x58
2001325a:	4620      	mov	r0, r4
2001325c:	4629      	mov	r1, r5
2001325e:	f002 f947 	bl	200154f0 <__aeabi_dcmpgt>
20013262:	2800      	cmp	r0, #0
20013264:	4620      	mov	r0, r4
20013266:	4629      	mov	r1, r5
20013268:	4622      	mov	r2, r4
2001326a:	462b      	mov	r3, r5
2001326c:	bf18      	it	ne
2001326e:	f06f 4600 	mvnne.w	r6, #2147483648	; 0x80000000
20013272:	f002 f973 	bl	2001555c <__aeabi_dcmpun>
20013276:	2800      	cmp	r0, #0
20013278:	bf18      	it	ne
2001327a:	2600      	movne	r6, #0
2001327c:	4630      	mov	r0, r6
2001327e:	f001 fb3f 	bl	20014900 <__aeabi_i2d>
20013282:	ec53 2b1b 	vmov	r2, r3, d11
20013286:	ec41 0b1a 	vmov	d10, r0, r1
2001328a:	f001 ff64 	bl	20015156 <__aeabi_dmul>
2001328e:	4602      	mov	r2, r0
20013290:	460b      	mov	r3, r1
20013292:	4650      	mov	r0, sl
20013294:	4649      	mov	r1, r9
20013296:	f002 f8ef 	bl	20015478 <__aeabi_dadd>
2001329a:	e9dd 2318 	ldrd	r2, r3, [sp, #96]	; 0x60
2001329e:	4604      	mov	r4, r0
200132a0:	460d      	mov	r5, r1
200132a2:	f002 f8eb 	bl	2001547c <__aeabi_dcmpge>
200132a6:	4681      	mov	r9, r0
200132a8:	4620      	mov	r0, r4
200132aa:	4629      	mov	r1, r5
200132ac:	f001 f85c 	bl	20014368 <__aeabi_d2iz>
200132b0:	4606      	mov	r6, r0
200132b2:	f1b9 0f00 	cmp.w	r9, #0
200132b6:	f8dd 905c 	ldr.w	r9, [sp, #92]	; 0x5c
200132ba:	bf08      	it	eq
200132bc:	f04f 4600 	moveq.w	r6, #2147483648	; 0x80000000
200132c0:	f8dd a058 	ldr.w	sl, [sp, #88]	; 0x58
200132c4:	4620      	mov	r0, r4
200132c6:	4629      	mov	r1, r5
200132c8:	4652      	mov	r2, sl
200132ca:	464b      	mov	r3, r9
200132cc:	f002 f910 	bl	200154f0 <__aeabi_dcmpgt>
200132d0:	2800      	cmp	r0, #0
200132d2:	4620      	mov	r0, r4
200132d4:	4629      	mov	r1, r5
200132d6:	4622      	mov	r2, r4
200132d8:	462b      	mov	r3, r5
200132da:	bf18      	it	ne
200132dc:	f06f 4600 	mvnne.w	r6, #2147483648	; 0x80000000
200132e0:	f002 f93c 	bl	2001555c <__aeabi_dcmpun>
200132e4:	4652      	mov	r2, sl
200132e6:	2800      	cmp	r0, #0
200132e8:	bf18      	it	ne
200132ea:	2600      	movne	r6, #0
200132ec:	f50d 7a16 	add.w	sl, sp, #600	; 0x258
200132f0:	e9dd 1001 	ldrd	r1, r0, [sp, #4]
200132f4:	f84a 602b 	str.w	r6, [sl, fp, lsl #2]
200132f8:	9e19      	ldr	r6, [sp, #100]	; 0x64
200132fa:	f10b 0b01 	add.w	fp, fp, #1
200132fe:	4408      	add	r0, r1
20013300:	900b      	str	r0, [sp, #44]	; 0x2c
20013302:	ec54 5b1a 	vmov	r5, r4, d10
20013306:	4628      	mov	r0, r5
20013308:	4621      	mov	r1, r4
2001330a:	464b      	mov	r3, r9
2001330c:	f002 f8f0 	bl	200154f0 <__aeabi_dcmpgt>
20013310:	9a18      	ldr	r2, [sp, #96]	; 0x60
20013312:	4682      	mov	sl, r0
20013314:	4628      	mov	r0, r5
20013316:	4621      	mov	r1, r4
20013318:	4633      	mov	r3, r6
2001331a:	f002 f8af 	bl	2001547c <__aeabi_dcmpge>
2001331e:	4681      	mov	r9, r0
20013320:	4628      	mov	r0, r5
20013322:	4621      	mov	r1, r4
20013324:	f001 f820 	bl	20014368 <__aeabi_d2iz>
20013328:	4606      	mov	r6, r0
2001332a:	f1b9 0f00 	cmp.w	r9, #0
2001332e:	bf08      	it	eq
20013330:	f04f 4600 	moveq.w	r6, #2147483648	; 0x80000000
20013334:	4628      	mov	r0, r5
20013336:	4621      	mov	r1, r4
20013338:	462a      	mov	r2, r5
2001333a:	4623      	mov	r3, r4
2001333c:	f1ba 0f00 	cmp.w	sl, #0
20013340:	bf18      	it	ne
20013342:	f06f 4600 	mvnne.w	r6, #2147483648	; 0x80000000
20013346:	f002 f909 	bl	2001555c <__aeabi_dcmpun>
2001334a:	2800      	cmp	r0, #0
2001334c:	bf18      	it	ne
2001334e:	2600      	movne	r6, #0
20013350:	a896      	add	r0, sp, #600	; 0x258
20013352:	f8dd 9014 	ldr.w	r9, [sp, #20]
20013356:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
20013358:	f840 602b 	str.w	r6, [r0, fp, lsl #2]
2001335c:	f5b2 6f80 	cmp.w	r2, #1024	; 0x400
20013360:	db12      	blt.n	20013388 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc40>
20013362:	f240 70fe 	movw	r0, #2046	; 0x7fe
20013366:	4282      	cmp	r2, r0
20013368:	d940      	bls.n	200133ec <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xca4>
2001336a:	f640 30fd 	movw	r0, #3069	; 0xbfd
2001336e:	ed9f 9b04 	vldr	d9, [pc, #16]	; 20013380 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc38>
20013372:	4282      	cmp	r2, r0
20013374:	bf38      	it	cc
20013376:	4610      	movcc	r0, r2
20013378:	f2a0 72fe 	subw	r2, r0, #2046	; 0x7fe
2001337c:	e040      	b.n	20013400 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xcb8>
2001337e:	bf00      	nop
20013380:	00000000 	andeq	r0, r0, r0
20013384:	7ff00000 	svcvc	0x00f00000	; IMB
20013388:	f64f 4002 	movw	r0, #64514	; 0xfc02
2001338c:	f6cf 70ff 	movt	r0, #65535	; 0xffff
20013390:	4282      	cmp	r2, r0
20013392:	da35      	bge.n	20013400 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xcb8>
20013394:	f512 6ff9 	cmn.w	r2, #1992	; 0x7c8
20013398:	d82e      	bhi.n	200133f8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xcb0>
2001339a:	f24f 4070 	movw	r0, #62576	; 0xf470
2001339e:	f6cf 70ff 	movt	r0, #65535	; 0xffff
200133a2:	ed9f 9bf5 	vldr	d9, [pc, #980]	; 20013778 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1030>
200133a6:	f512 6f39 	cmn.w	r2, #2960	; 0xb90
200133aa:	bf88      	it	hi
200133ac:	4610      	movhi	r0, r2
200133ae:	f200 7292 	addw	r2, r0, #1938	; 0x792
200133b2:	e025      	b.n	20013400 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xcb8>
200133b4:	eb06 008b 	add.w	r0, r6, fp, lsl #2
200133b8:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
200133ba:	3808      	subs	r0, #8
200133bc:	6841      	ldr	r1, [r0, #4]
200133be:	2900      	cmp	r1, #0
200133c0:	f040 83ca 	bne.w	20013b58 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1410>
200133c4:	6801      	ldr	r1, [r0, #0]
200133c6:	2900      	cmp	r1, #0
200133c8:	f040 83cc 	bne.w	20013b64 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x141c>
200133cc:	f850 1c04 	ldr.w	r1, [r0, #-4]
200133d0:	2900      	cmp	r1, #0
200133d2:	f040 83cd 	bne.w	20013b70 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1428>
200133d6:	f850 1c08 	ldr.w	r1, [r0, #-8]
200133da:	3a60      	subs	r2, #96	; 0x60
200133dc:	f1ab 0b04 	sub.w	fp, fp, #4
200133e0:	2900      	cmp	r1, #0
200133e2:	f1a0 0010 	sub.w	r0, r0, #16
200133e6:	d0e9      	beq.n	200133bc <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc74>
200133e8:	e7b8      	b.n	2001335c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc14>
200133ea:	bf00      	nop
200133ec:	ed9f 9be4 	vldr	d9, [pc, #912]	; 20013780 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1038>
200133f0:	f2a2 32ff 	subw	r2, r2, #1023	; 0x3ff
200133f4:	e004      	b.n	20013400 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xcb8>
200133f6:	bf00      	nop
200133f8:	ed9f 9be3 	vldr	d9, [pc, #908]	; 20013788 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1040>
200133fc:	f202 32c9 	addw	r2, r2, #969	; 0x3c9
20013400:	f202 30ff 	addw	r0, r2, #1023	; 0x3ff
20013404:	0503      	lsls	r3, r0, #20
20013406:	ec51 0b19 	vmov	r0, r1, d9
2001340a:	2200      	movs	r2, #0
2001340c:	f8cd 8030 	str.w	r8, [sp, #48]	; 0x30
20013410:	f001 fea1 	bl	20015156 <__aeabi_dmul>
20013414:	4604      	mov	r4, r0
20013416:	ec41 0b19 	vmov	d9, r0, r1
2001341a:	f10b 0001 	add.w	r0, fp, #1
2001341e:	f010 0003 	ands.w	r0, r0, #3
20013422:	900e      	str	r0, [sp, #56]	; 0x38
20013424:	465e      	mov	r6, fp
20013426:	a896      	add	r0, sp, #600	; 0x258
20013428:	f8cd 9014 	str.w	r9, [sp, #20]
2001342c:	d06d      	beq.n	2001350a <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xdc2>
2001342e:	f850 002b 	ldr.w	r0, [r0, fp, lsl #2]
20013432:	460d      	mov	r5, r1
20013434:	f1ab 0101 	sub.w	r1, fp, #1
20013438:	9119      	str	r1, [sp, #100]	; 0x64
2001343a:	f001 fa61 	bl	20014900 <__aeabi_i2d>
2001343e:	4602      	mov	r2, r0
20013440:	460b      	mov	r3, r1
20013442:	f50d 7adc 	add.w	sl, sp, #440	; 0x1b8
20013446:	4620      	mov	r0, r4
20013448:	4629      	mov	r1, r5
2001344a:	eb0a 06cb 	add.w	r6, sl, fp, lsl #3
2001344e:	f001 fe82 	bl	20015156 <__aeabi_dmul>
20013452:	ec41 0b10 	vmov	d0, r0, r1
20013456:	4620      	mov	r0, r4
20013458:	ed86 0b00 	vstr	d0, [r6]
2001345c:	ec53 6b18 	vmov	r6, r3, d8
20013460:	4629      	mov	r1, r5
20013462:	4632      	mov	r2, r6
20013464:	9318      	str	r3, [sp, #96]	; 0x60
20013466:	f001 fe76 	bl	20015156 <__aeabi_dmul>
2001346a:	f8dd 8038 	ldr.w	r8, [sp, #56]	; 0x38
2001346e:	ec41 0b19 	vmov	d9, r0, r1
20013472:	f1b8 0f01 	cmp.w	r8, #1
20013476:	d101      	bne.n	2001347c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xd34>
20013478:	9e19      	ldr	r6, [sp, #100]	; 0x64
2001347a:	e045      	b.n	20013508 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xdc0>
2001347c:	46b1      	mov	r9, r6
2001347e:	9e19      	ldr	r6, [sp, #100]	; 0x64
20013480:	aa96      	add	r2, sp, #600	; 0x258
20013482:	f852 2026 	ldr.w	r2, [r2, r6, lsl #2]
20013486:	f1ab 0302 	sub.w	r3, fp, #2
2001348a:	4604      	mov	r4, r0
2001348c:	4610      	mov	r0, r2
2001348e:	9317      	str	r3, [sp, #92]	; 0x5c
20013490:	460d      	mov	r5, r1
20013492:	f001 fa35 	bl	20014900 <__aeabi_i2d>
20013496:	4602      	mov	r2, r0
20013498:	460b      	mov	r3, r1
2001349a:	4620      	mov	r0, r4
2001349c:	4629      	mov	r1, r5
2001349e:	eb0a 06c6 	add.w	r6, sl, r6, lsl #3
200134a2:	f001 fe58 	bl	20015156 <__aeabi_dmul>
200134a6:	ec41 0b10 	vmov	d0, r0, r1
200134aa:	9b18      	ldr	r3, [sp, #96]	; 0x60
200134ac:	4620      	mov	r0, r4
200134ae:	4629      	mov	r1, r5
200134b0:	464a      	mov	r2, r9
200134b2:	ed86 0b00 	vstr	d0, [r6]
200134b6:	f001 fe4e 	bl	20015156 <__aeabi_dmul>
200134ba:	ec41 0b19 	vmov	d9, r0, r1
200134be:	f1b8 0f02 	cmp.w	r8, #2
200134c2:	d101      	bne.n	200134c8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xd80>
200134c4:	9e17      	ldr	r6, [sp, #92]	; 0x5c
200134c6:	e01f      	b.n	20013508 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xdc0>
200134c8:	9e17      	ldr	r6, [sp, #92]	; 0x5c
200134ca:	aa96      	add	r2, sp, #600	; 0x258
200134cc:	f852 2026 	ldr.w	r2, [r2, r6, lsl #2]
200134d0:	4604      	mov	r4, r0
200134d2:	4610      	mov	r0, r2
200134d4:	f1ab 0803 	sub.w	r8, fp, #3
200134d8:	460d      	mov	r5, r1
200134da:	f001 fa11 	bl	20014900 <__aeabi_i2d>
200134de:	4602      	mov	r2, r0
200134e0:	460b      	mov	r3, r1
200134e2:	4620      	mov	r0, r4
200134e4:	4629      	mov	r1, r5
200134e6:	eb0a 06c6 	add.w	r6, sl, r6, lsl #3
200134ea:	f001 fe34 	bl	20015156 <__aeabi_dmul>
200134ee:	ec41 0b10 	vmov	d0, r0, r1
200134f2:	9b18      	ldr	r3, [sp, #96]	; 0x60
200134f4:	4620      	mov	r0, r4
200134f6:	4629      	mov	r1, r5
200134f8:	464a      	mov	r2, r9
200134fa:	ed86 0b00 	vstr	d0, [r6]
200134fe:	4646      	mov	r6, r8
20013500:	f001 fe29 	bl	20015156 <__aeabi_dmul>
20013504:	ec41 0b19 	vmov	d9, r0, r1
20013508:	a896      	add	r0, sp, #600	; 0x258
2001350a:	f1bb 0f03 	cmp.w	fp, #3
2001350e:	f8cd b034 	str.w	fp, [sp, #52]	; 0x34
20013512:	d36c      	bcc.n	200135ee <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xea6>
20013514:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
20013518:	a86e      	add	r0, sp, #440	; 0x1b8
2001351a:	eb00 08c6 	add.w	r8, r0, r6, lsl #3
2001351e:	ec5a 9b18 	vmov	r9, sl, d8
20013522:	bf00      	nop
20013524:	f8db 0000 	ldr.w	r0, [fp]
20013528:	9619      	str	r6, [sp, #100]	; 0x64
2001352a:	f001 f9e9 	bl	20014900 <__aeabi_i2d>
2001352e:	ec56 4b19 	vmov	r4, r6, d9
20013532:	4602      	mov	r2, r0
20013534:	460b      	mov	r3, r1
20013536:	4620      	mov	r0, r4
20013538:	4631      	mov	r1, r6
2001353a:	f001 fe0c 	bl	20015156 <__aeabi_dmul>
2001353e:	ec41 0b10 	vmov	d0, r0, r1
20013542:	4620      	mov	r0, r4
20013544:	4631      	mov	r1, r6
20013546:	464a      	mov	r2, r9
20013548:	4653      	mov	r3, sl
2001354a:	ed88 0b00 	vstr	d0, [r8]
2001354e:	f001 fe02 	bl	20015156 <__aeabi_dmul>
20013552:	4604      	mov	r4, r0
20013554:	f85b 0c0c 	ldr.w	r0, [fp, #-12]
20013558:	460d      	mov	r5, r1
2001355a:	9018      	str	r0, [sp, #96]	; 0x60
2001355c:	e95b 6002 	ldrd	r6, r0, [fp, #-8]
20013560:	f001 f9ce 	bl	20014900 <__aeabi_i2d>
20013564:	4602      	mov	r2, r0
20013566:	460b      	mov	r3, r1
20013568:	4620      	mov	r0, r4
2001356a:	4629      	mov	r1, r5
2001356c:	f001 fdf3 	bl	20015156 <__aeabi_dmul>
20013570:	ec41 0b10 	vmov	d0, r0, r1
20013574:	4620      	mov	r0, r4
20013576:	4629      	mov	r1, r5
20013578:	464a      	mov	r2, r9
2001357a:	4653      	mov	r3, sl
2001357c:	ed08 0b02 	vstr	d0, [r8, #-8]
20013580:	f001 fde9 	bl	20015156 <__aeabi_dmul>
20013584:	4604      	mov	r4, r0
20013586:	4630      	mov	r0, r6
20013588:	460d      	mov	r5, r1
2001358a:	f001 f9b9 	bl	20014900 <__aeabi_i2d>
2001358e:	4602      	mov	r2, r0
20013590:	460b      	mov	r3, r1
20013592:	4620      	mov	r0, r4
20013594:	4629      	mov	r1, r5
20013596:	f001 fdde 	bl	20015156 <__aeabi_dmul>
2001359a:	ec41 0b10 	vmov	d0, r0, r1
2001359e:	4620      	mov	r0, r4
200135a0:	4629      	mov	r1, r5
200135a2:	464a      	mov	r2, r9
200135a4:	4653      	mov	r3, sl
200135a6:	ed08 0b04 	vstr	d0, [r8, #-16]
200135aa:	f001 fdd4 	bl	20015156 <__aeabi_dmul>
200135ae:	4604      	mov	r4, r0
200135b0:	9818      	ldr	r0, [sp, #96]	; 0x60
200135b2:	460d      	mov	r5, r1
200135b4:	f001 f9a4 	bl	20014900 <__aeabi_i2d>
200135b8:	4602      	mov	r2, r0
200135ba:	460b      	mov	r3, r1
200135bc:	4620      	mov	r0, r4
200135be:	4629      	mov	r1, r5
200135c0:	f001 fdc9 	bl	20015156 <__aeabi_dmul>
200135c4:	ec41 0b10 	vmov	d0, r0, r1
200135c8:	4620      	mov	r0, r4
200135ca:	4629      	mov	r1, r5
200135cc:	464a      	mov	r2, r9
200135ce:	4653      	mov	r3, sl
200135d0:	ed08 0b06 	vstr	d0, [r8, #-24]	; 0xffffffe8
200135d4:	f001 fdbf 	bl	20015156 <__aeabi_dmul>
200135d8:	ec41 0b19 	vmov	d9, r0, r1
200135dc:	9819      	ldr	r0, [sp, #100]	; 0x64
200135de:	f1ab 0b10 	sub.w	fp, fp, #16
200135e2:	f1a8 0820 	sub.w	r8, r8, #32
200135e6:	2803      	cmp	r0, #3
200135e8:	f1a0 0604 	sub.w	r6, r0, #4
200135ec:	d19a      	bne.n	20013524 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xddc>
200135ee:	9c0e      	ldr	r4, [sp, #56]	; 0x38
200135f0:	9d0d      	ldr	r5, [sp, #52]	; 0x34
200135f2:	2c00      	cmp	r4, #0
200135f4:	4629      	mov	r1, r5
200135f6:	f50d 79dc 	add.w	r9, sp, #440	; 0x1b8
200135fa:	f000 8080 	beq.w	200136fe <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xfb6>
200135fe:	eb09 06c5 	add.w	r6, r9, r5, lsl #3
20013602:	ed96 0b00 	vldr	d0, [r6]
20013606:	ec51 0b10 	vmov	r0, r1, d0
2001360a:	ed9f 0b6d 	vldr	d0, [pc, #436]	; 200137c0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1078>
2001360e:	ec53 ab10 	vmov	sl, r3, d0
20013612:	4652      	mov	r2, sl
20013614:	9319      	str	r3, [sp, #100]	; 0x64
20013616:	f001 fd9e 	bl	20015156 <__aeabi_dmul>
2001361a:	ed9f 0b57 	vldr	d0, [pc, #348]	; 20013778 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1030>
2001361e:	ec5b 8b10 	vmov	r8, fp, d0
20013622:	4642      	mov	r2, r8
20013624:	465b      	mov	r3, fp
20013626:	f001 ff27 	bl	20015478 <__aeabi_dadd>
2001362a:	ec41 0b10 	vmov	d0, r0, r1
2001362e:	1e69      	subs	r1, r5, #1
20013630:	2c01      	cmp	r4, #1
20013632:	ed8d 0b46 	vstr	d0, [sp, #280]	; 0x118
20013636:	d062      	beq.n	200136fe <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xfb6>
20013638:	eb09 00c1 	add.w	r0, r9, r1, lsl #3
2001363c:	ed90 0b00 	vldr	d0, [r0]
20013640:	9b19      	ldr	r3, [sp, #100]	; 0x64
20013642:	ec51 0b10 	vmov	r0, r1, d0
20013646:	4652      	mov	r2, sl
20013648:	f001 fd85 	bl	20015156 <__aeabi_dmul>
2001364c:	4642      	mov	r2, r8
2001364e:	465b      	mov	r3, fp
20013650:	f001 ff12 	bl	20015478 <__aeabi_dadd>
20013654:	ed96 0b00 	vldr	d0, [r6]
20013658:	4605      	mov	r5, r0
2001365a:	4689      	mov	r9, r1
2001365c:	ec51 0b10 	vmov	r0, r1, d0
20013660:	ed9f 0b59 	vldr	d0, [pc, #356]	; 200137c8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1080>
20013664:	4634      	mov	r4, r6
20013666:	ec53 2b10 	vmov	r2, r3, d0
2001366a:	e9cd 2317 	strd	r2, r3, [sp, #92]	; 0x5c
2001366e:	f001 fd72 	bl	20015156 <__aeabi_dmul>
20013672:	4602      	mov	r2, r0
20013674:	460b      	mov	r3, r1
20013676:	4628      	mov	r0, r5
20013678:	9d0d      	ldr	r5, [sp, #52]	; 0x34
2001367a:	4649      	mov	r1, r9
2001367c:	f50d 79dc 	add.w	r9, sp, #440	; 0x1b8
20013680:	f001 fefa 	bl	20015478 <__aeabi_dadd>
20013684:	ec41 0b10 	vmov	d0, r0, r1
20013688:	980e      	ldr	r0, [sp, #56]	; 0x38
2001368a:	1ea9      	subs	r1, r5, #2
2001368c:	2802      	cmp	r0, #2
2001368e:	ed8d 0b48 	vstr	d0, [sp, #288]	; 0x120
20013692:	d034      	beq.n	200136fe <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xfb6>
20013694:	eb09 00c1 	add.w	r0, r9, r1, lsl #3
20013698:	ed90 0b00 	vldr	d0, [r0]
2001369c:	9b19      	ldr	r3, [sp, #100]	; 0x64
2001369e:	ec51 0b10 	vmov	r0, r1, d0
200136a2:	4652      	mov	r2, sl
200136a4:	f001 fd57 	bl	20015156 <__aeabi_dmul>
200136a8:	4642      	mov	r2, r8
200136aa:	465b      	mov	r3, fp
200136ac:	f001 fee4 	bl	20015478 <__aeabi_dadd>
200136b0:	ed14 0b02 	vldr	d0, [r4, #-8]
200136b4:	e9dd 2317 	ldrd	r2, r3, [sp, #92]	; 0x5c
200136b8:	4606      	mov	r6, r0
200136ba:	4688      	mov	r8, r1
200136bc:	ed94 8b00 	vldr	d8, [r4]
200136c0:	ec51 0b10 	vmov	r0, r1, d0
200136c4:	f001 fd47 	bl	20015156 <__aeabi_dmul>
200136c8:	4602      	mov	r2, r0
200136ca:	460b      	mov	r3, r1
200136cc:	4630      	mov	r0, r6
200136ce:	4641      	mov	r1, r8
200136d0:	f001 fed2 	bl	20015478 <__aeabi_dadd>
200136d4:	ed9f 0b3e 	vldr	d0, [pc, #248]	; 200137d0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1088>
200136d8:	4604      	mov	r4, r0
200136da:	4688      	mov	r8, r1
200136dc:	ec51 0b18 	vmov	r0, r1, d8
200136e0:	ec53 2b10 	vmov	r2, r3, d0
200136e4:	f001 fd37 	bl	20015156 <__aeabi_dmul>
200136e8:	4602      	mov	r2, r0
200136ea:	460b      	mov	r3, r1
200136ec:	4620      	mov	r0, r4
200136ee:	4641      	mov	r1, r8
200136f0:	f001 fec2 	bl	20015478 <__aeabi_dadd>
200136f4:	ec41 0b10 	vmov	d0, r0, r1
200136f8:	1ee9      	subs	r1, r5, #3
200136fa:	ed8d 0b4a 	vstr	d0, [sp, #296]	; 0x128
200136fe:	2d03      	cmp	r5, #3
20013700:	f50d 7b8c 	add.w	fp, sp, #280	; 0x118
20013704:	d244      	bcs.n	20013790 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1048>
20013706:	9d0e      	ldr	r5, [sp, #56]	; 0x38
20013708:	f8dd a030 	ldr.w	sl, [sp, #48]	; 0x30
2001370c:	2d00      	cmp	r5, #0
2001370e:	f000 81c9 	beq.w	20013aa4 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x135c>
20013712:	9e0d      	ldr	r6, [sp, #52]	; 0x34
20013714:	eb0b 00c6 	add.w	r0, fp, r6, lsl #3
20013718:	ed90 0b00 	vldr	d0, [r0]
2001371c:	1e74      	subs	r4, r6, #1
2001371e:	ec51 0b10 	vmov	r0, r1, d0
20013722:	ed9f 0b15 	vldr	d0, [pc, #84]	; 20013778 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1030>
20013726:	ec53 2b10 	vmov	r2, r3, d0
2001372a:	f001 fea5 	bl	20015478 <__aeabi_dadd>
2001372e:	ec41 0b10 	vmov	d0, r0, r1
20013732:	f8dd 9014 	ldr.w	r9, [sp, #20]
20013736:	2d01      	cmp	r5, #1
20013738:	f000 81ba 	beq.w	20013ab0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1368>
2001373c:	eb0b 02c4 	add.w	r2, fp, r4, lsl #3
20013740:	ed92 0b00 	vldr	d0, [r2]
20013744:	f1a6 0802 	sub.w	r8, r6, #2
20013748:	ec53 2b10 	vmov	r2, r3, d0
2001374c:	f001 fe94 	bl	20015478 <__aeabi_dadd>
20013750:	ec41 0b10 	vmov	d0, r0, r1
20013754:	2d02      	cmp	r5, #2
20013756:	4644      	mov	r4, r8
20013758:	f000 81aa 	beq.w	20013ab0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1368>
2001375c:	eb0b 02c8 	add.w	r2, fp, r8, lsl #3
20013760:	ed92 0b00 	vldr	d0, [r2]
20013764:	1ef4      	subs	r4, r6, #3
20013766:	ec53 2b10 	vmov	r2, r3, d0
2001376a:	f001 fe85 	bl	20015478 <__aeabi_dadd>
2001376e:	ec41 0b10 	vmov	d0, r0, r1
20013772:	e19d      	b.n	20013ab0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1368>
20013774:	bf00      	nop
20013776:	bf00      	nop
	...
20013784:	7fe00000 	svcvc	0x00e00000
20013788:	00000000 	andeq	r0, r0, r0
2001378c:	03600000 	cmneq	r0, #0
20013790:	ed9f 0b0b 	vldr	d0, [pc, #44]	; 200137c0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1078>
20013794:	eb09 00c1 	add.w	r0, r9, r1, lsl #3
20013798:	ed1f 1b09 	vldr	d1, [pc, #-36]	; 20013778 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1030>
2001379c:	f100 0918 	add.w	r9, r0, #24
200137a0:	ec52 0b10 	vmov	r0, r2, d0
200137a4:	e9cd 2018 	strd	r2, r0, [sp, #96]	; 0x60
200137a8:	ec52 0b11 	vmov	r0, r2, d1
200137ac:	ed9f 8b06 	vldr	d8, [pc, #24]	; 200137c8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1080>
200137b0:	ed9f 9b07 	vldr	d9, [pc, #28]	; 200137d0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1088>
200137b4:	ed9f ab08 	vldr	d10, [pc, #32]	; 200137d8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1090>
200137b8:	e9cd 2016 	strd	r2, r0, [sp, #88]	; 0x58
200137bc:	43ca      	mvns	r2, r1
200137be:	e01d      	b.n	200137fc <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x10b4>
200137c0:	40000000 	andmi	r0, r0, r0
200137c4:	3ff921fb 	svccc	0x00f921fb
200137c8:	00000000 	andeq	r0, r0, r0
200137cc:	3e74442d 	cdpcc	4, 7, cr4, cr4, cr13, {1}
200137d0:	80000000 	andhi	r0, r0, r0
200137d4:	3cf84698 	ldclcc	6, cr4, [r8], #608	; 0x260
200137d8:	60000000 	andvs	r0, r0, r0
200137dc:	3b78cc51 	blcc	21e46928 <_eram+0x1e26928>
200137e0:	9913      	ldr	r1, [sp, #76]	; 0x4c
200137e2:	9a12      	ldr	r2, [sp, #72]	; 0x48
200137e4:	3904      	subs	r1, #4
200137e6:	eb0b 00c5 	add.w	r0, fp, r5, lsl #3
200137ea:	ed80 0b00 	vstr	d0, [r0]
200137ee:	f1a9 0920 	sub.w	r9, r9, #32
200137f2:	1c48      	adds	r0, r1, #1
200137f4:	f102 0204 	add.w	r2, r2, #4
200137f8:	f43f af85 	beq.w	20013706 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xfbe>
200137fc:	9113      	str	r1, [sp, #76]	; 0x4c
200137fe:	980d      	ldr	r0, [sp, #52]	; 0x34
20013800:	ed19 0b06 	vldr	d0, [r9, #-24]	; 0xffffffe8
20013804:	4410      	add	r0, r2
20013806:	9212      	str	r2, [sp, #72]	; 0x48
20013808:	9015      	str	r0, [sp, #84]	; 0x54
2001380a:	f100 0801 	add.w	r8, r0, #1
2001380e:	ec5a 0b10 	vmov	r0, sl, d0
20013812:	9014      	str	r0, [sp, #80]	; 0x50
20013814:	e9dd 3218 	ldrd	r3, r2, [sp, #96]	; 0x60
20013818:	4651      	mov	r1, sl
2001381a:	f001 fc9c 	bl	20015156 <__aeabi_dmul>
2001381e:	e9dd 3216 	ldrd	r3, r2, [sp, #88]	; 0x58
20013822:	f001 fe29 	bl	20015478 <__aeabi_dadd>
20013826:	ec41 0b10 	vmov	d0, r0, r1
2001382a:	f1b8 0f00 	cmp.w	r8, #0
2001382e:	d03f      	beq.n	200138b0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1168>
20013830:	ed19 0b04 	vldr	d0, [r9, #-16]
20013834:	4605      	mov	r5, r0
20013836:	460c      	mov	r4, r1
20013838:	ec53 2b18 	vmov	r2, r3, d8
2001383c:	ec51 0b10 	vmov	r0, r1, d0
20013840:	f001 fc89 	bl	20015156 <__aeabi_dmul>
20013844:	4602      	mov	r2, r0
20013846:	460b      	mov	r3, r1
20013848:	4628      	mov	r0, r5
2001384a:	4621      	mov	r1, r4
2001384c:	f001 fe14 	bl	20015478 <__aeabi_dadd>
20013850:	ec41 0b10 	vmov	d0, r0, r1
20013854:	f1b8 0f01 	cmp.w	r8, #1
20013858:	d02a      	beq.n	200138b0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1168>
2001385a:	ed19 0b02 	vldr	d0, [r9, #-8]
2001385e:	ec53 2b19 	vmov	r2, r3, d9
20013862:	ec55 6b10 	vmov	r6, r5, d0
20013866:	4604      	mov	r4, r0
20013868:	4630      	mov	r0, r6
2001386a:	460e      	mov	r6, r1
2001386c:	4629      	mov	r1, r5
2001386e:	f001 fc72 	bl	20015156 <__aeabi_dmul>
20013872:	4602      	mov	r2, r0
20013874:	460b      	mov	r3, r1
20013876:	4620      	mov	r0, r4
20013878:	4631      	mov	r1, r6
2001387a:	f001 fdfd 	bl	20015478 <__aeabi_dadd>
2001387e:	ec41 0b10 	vmov	d0, r0, r1
20013882:	f1b8 0f02 	cmp.w	r8, #2
20013886:	d013      	beq.n	200138b0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1168>
20013888:	ed99 0b00 	vldr	d0, [r9]
2001388c:	ec53 2b1a 	vmov	r2, r3, d10
20013890:	ec55 6b10 	vmov	r6, r5, d0
20013894:	4604      	mov	r4, r0
20013896:	4630      	mov	r0, r6
20013898:	460e      	mov	r6, r1
2001389a:	4629      	mov	r1, r5
2001389c:	f001 fc5b 	bl	20015156 <__aeabi_dmul>
200138a0:	4602      	mov	r2, r0
200138a2:	460b      	mov	r3, r1
200138a4:	4620      	mov	r0, r4
200138a6:	4631      	mov	r1, r6
200138a8:	f001 fde6 	bl	20015478 <__aeabi_dadd>
200138ac:	ec41 0b10 	vmov	d0, r0, r1
200138b0:	eb0b 00c8 	add.w	r0, fp, r8, lsl #3
200138b4:	ed80 0b00 	vstr	d0, [r0]
200138b8:	ed19 0b08 	vldr	d0, [r9, #-32]	; 0xffffffe0
200138bc:	9815      	ldr	r0, [sp, #84]	; 0x54
200138be:	1c85      	adds	r5, r0, #2
200138c0:	ec51 0b10 	vmov	r0, r1, d0
200138c4:	e9cd 0110 	strd	r0, r1, [sp, #64]	; 0x40
200138c8:	e9dd 3218 	ldrd	r3, r2, [sp, #96]	; 0x60
200138cc:	f001 fc43 	bl	20015156 <__aeabi_dmul>
200138d0:	e9dd 3216 	ldrd	r3, r2, [sp, #88]	; 0x58
200138d4:	f001 fdd0 	bl	20015478 <__aeabi_dadd>
200138d8:	ec41 0b10 	vmov	d0, r0, r1
200138dc:	b3e5      	cbz	r5, 20013958 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1210>
200138de:	4604      	mov	r4, r0
200138e0:	9814      	ldr	r0, [sp, #80]	; 0x50
200138e2:	460e      	mov	r6, r1
200138e4:	ec53 2b18 	vmov	r2, r3, d8
200138e8:	4651      	mov	r1, sl
200138ea:	f001 fc34 	bl	20015156 <__aeabi_dmul>
200138ee:	4602      	mov	r2, r0
200138f0:	460b      	mov	r3, r1
200138f2:	4620      	mov	r0, r4
200138f4:	4631      	mov	r1, r6
200138f6:	f001 fdbf 	bl	20015478 <__aeabi_dadd>
200138fa:	ec41 0b10 	vmov	d0, r0, r1
200138fe:	2d01      	cmp	r5, #1
20013900:	d02a      	beq.n	20013958 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1210>
20013902:	ed19 0b04 	vldr	d0, [r9, #-16]
20013906:	ec53 2b19 	vmov	r2, r3, d9
2001390a:	ec54 6b10 	vmov	r6, r4, d0
2001390e:	4680      	mov	r8, r0
20013910:	4630      	mov	r0, r6
20013912:	460e      	mov	r6, r1
20013914:	4621      	mov	r1, r4
20013916:	f001 fc1e 	bl	20015156 <__aeabi_dmul>
2001391a:	4602      	mov	r2, r0
2001391c:	460b      	mov	r3, r1
2001391e:	4640      	mov	r0, r8
20013920:	4631      	mov	r1, r6
20013922:	f001 fda9 	bl	20015478 <__aeabi_dadd>
20013926:	ec41 0b10 	vmov	d0, r0, r1
2001392a:	2d02      	cmp	r5, #2
2001392c:	d014      	beq.n	20013958 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1210>
2001392e:	ed19 0b02 	vldr	d0, [r9, #-8]
20013932:	ec53 2b1a 	vmov	r2, r3, d10
20013936:	ec54 6b10 	vmov	r6, r4, d0
2001393a:	4680      	mov	r8, r0
2001393c:	4630      	mov	r0, r6
2001393e:	460e      	mov	r6, r1
20013940:	4621      	mov	r1, r4
20013942:	f001 fc08 	bl	20015156 <__aeabi_dmul>
20013946:	4602      	mov	r2, r0
20013948:	460b      	mov	r3, r1
2001394a:	4640      	mov	r0, r8
2001394c:	4631      	mov	r1, r6
2001394e:	f001 fd93 	bl	20015478 <__aeabi_dadd>
20013952:	ec41 0b10 	vmov	d0, r0, r1
20013956:	bf00      	nop
20013958:	eb0b 00c5 	add.w	r0, fp, r5, lsl #3
2001395c:	f8cd a03c 	str.w	sl, [sp, #60]	; 0x3c
20013960:	ed80 0b00 	vstr	d0, [r0]
20013964:	ed19 0b0a 	vldr	d0, [r9, #-40]	; 0xffffffd8
20013968:	9815      	ldr	r0, [sp, #84]	; 0x54
2001396a:	ec5a 8b10 	vmov	r8, sl, d0
2001396e:	e9dd 3218 	ldrd	r3, r2, [sp, #96]	; 0x60
20013972:	f100 0b03 	add.w	fp, r0, #3
20013976:	4640      	mov	r0, r8
20013978:	4651      	mov	r1, sl
2001397a:	f001 fbec 	bl	20015156 <__aeabi_dmul>
2001397e:	e9dd 3216 	ldrd	r3, r2, [sp, #88]	; 0x58
20013982:	f001 fd79 	bl	20015478 <__aeabi_dadd>
20013986:	ec41 0b10 	vmov	d0, r0, r1
2001398a:	f1bb 0f00 	cmp.w	fp, #0
2001398e:	d039      	beq.n	20013a04 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x12bc>
20013990:	4604      	mov	r4, r0
20013992:	460e      	mov	r6, r1
20013994:	e9dd 0110 	ldrd	r0, r1, [sp, #64]	; 0x40
20013998:	ec53 2b18 	vmov	r2, r3, d8
2001399c:	f001 fbdb 	bl	20015156 <__aeabi_dmul>
200139a0:	4602      	mov	r2, r0
200139a2:	460b      	mov	r3, r1
200139a4:	4620      	mov	r0, r4
200139a6:	4631      	mov	r1, r6
200139a8:	f001 fd66 	bl	20015478 <__aeabi_dadd>
200139ac:	ec41 0b10 	vmov	d0, r0, r1
200139b0:	f1bb 0f01 	cmp.w	fp, #1
200139b4:	d026      	beq.n	20013a04 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x12bc>
200139b6:	4604      	mov	r4, r0
200139b8:	9814      	ldr	r0, [sp, #80]	; 0x50
200139ba:	460d      	mov	r5, r1
200139bc:	990f      	ldr	r1, [sp, #60]	; 0x3c
200139be:	ec53 2b19 	vmov	r2, r3, d9
200139c2:	f001 fbc8 	bl	20015156 <__aeabi_dmul>
200139c6:	4602      	mov	r2, r0
200139c8:	460b      	mov	r3, r1
200139ca:	4620      	mov	r0, r4
200139cc:	4629      	mov	r1, r5
200139ce:	f001 fd53 	bl	20015478 <__aeabi_dadd>
200139d2:	ec41 0b10 	vmov	d0, r0, r1
200139d6:	f1bb 0f02 	cmp.w	fp, #2
200139da:	d013      	beq.n	20013a04 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x12bc>
200139dc:	ed19 0b04 	vldr	d0, [r9, #-16]
200139e0:	ec53 2b1a 	vmov	r2, r3, d10
200139e4:	ec55 6b10 	vmov	r6, r5, d0
200139e8:	4604      	mov	r4, r0
200139ea:	4630      	mov	r0, r6
200139ec:	460e      	mov	r6, r1
200139ee:	4629      	mov	r1, r5
200139f0:	f001 fbb1 	bl	20015156 <__aeabi_dmul>
200139f4:	4602      	mov	r2, r0
200139f6:	460b      	mov	r3, r1
200139f8:	4620      	mov	r0, r4
200139fa:	4631      	mov	r1, r6
200139fc:	f001 fd3c 	bl	20015478 <__aeabi_dadd>
20013a00:	ec41 0b10 	vmov	d0, r0, r1
20013a04:	a946      	add	r1, sp, #280	; 0x118
20013a06:	eb01 00cb 	add.w	r0, r1, fp, lsl #3
20013a0a:	ed80 0b00 	vstr	d0, [r0]
20013a0e:	ed19 0b0c 	vldr	d0, [r9, #-48]	; 0xffffffd0
20013a12:	9815      	ldr	r0, [sp, #84]	; 0x54
20013a14:	e9dd 3218 	ldrd	r3, r2, [sp, #96]	; 0x60
20013a18:	468b      	mov	fp, r1
20013a1a:	1d05      	adds	r5, r0, #4
20013a1c:	ec51 0b10 	vmov	r0, r1, d0
20013a20:	f001 fb99 	bl	20015156 <__aeabi_dmul>
20013a24:	e9dd 3216 	ldrd	r3, r2, [sp, #88]	; 0x58
20013a28:	f001 fd26 	bl	20015478 <__aeabi_dadd>
20013a2c:	ec41 0b10 	vmov	d0, r0, r1
20013a30:	2d00      	cmp	r5, #0
20013a32:	f43f aed5 	beq.w	200137e0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1098>
20013a36:	4604      	mov	r4, r0
20013a38:	460e      	mov	r6, r1
20013a3a:	ec53 2b18 	vmov	r2, r3, d8
20013a3e:	4640      	mov	r0, r8
20013a40:	4651      	mov	r1, sl
20013a42:	f001 fb88 	bl	20015156 <__aeabi_dmul>
20013a46:	4602      	mov	r2, r0
20013a48:	460b      	mov	r3, r1
20013a4a:	4620      	mov	r0, r4
20013a4c:	4631      	mov	r1, r6
20013a4e:	f001 fd13 	bl	20015478 <__aeabi_dadd>
20013a52:	ec41 0b10 	vmov	d0, r0, r1
20013a56:	2d01      	cmp	r5, #1
20013a58:	f43f aec2 	beq.w	200137e0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1098>
20013a5c:	4604      	mov	r4, r0
20013a5e:	9810      	ldr	r0, [sp, #64]	; 0x40
20013a60:	460e      	mov	r6, r1
20013a62:	9911      	ldr	r1, [sp, #68]	; 0x44
20013a64:	ec53 2b19 	vmov	r2, r3, d9
20013a68:	f001 fb75 	bl	20015156 <__aeabi_dmul>
20013a6c:	4602      	mov	r2, r0
20013a6e:	460b      	mov	r3, r1
20013a70:	4620      	mov	r0, r4
20013a72:	4631      	mov	r1, r6
20013a74:	f001 fd00 	bl	20015478 <__aeabi_dadd>
20013a78:	ec41 0b10 	vmov	d0, r0, r1
20013a7c:	2d02      	cmp	r5, #2
20013a7e:	f43f aeaf 	beq.w	200137e0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1098>
20013a82:	4604      	mov	r4, r0
20013a84:	9814      	ldr	r0, [sp, #80]	; 0x50
20013a86:	460e      	mov	r6, r1
20013a88:	990f      	ldr	r1, [sp, #60]	; 0x3c
20013a8a:	ec53 2b1a 	vmov	r2, r3, d10
20013a8e:	f001 fb62 	bl	20015156 <__aeabi_dmul>
20013a92:	4602      	mov	r2, r0
20013a94:	460b      	mov	r3, r1
20013a96:	4620      	mov	r0, r4
20013a98:	4631      	mov	r1, r6
20013a9a:	f001 fced 	bl	20015478 <__aeabi_dadd>
20013a9e:	ec41 0b10 	vmov	d0, r0, r1
20013aa2:	e69d      	b.n	200137e0 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1098>
20013aa4:	9e0d      	ldr	r6, [sp, #52]	; 0x34
20013aa6:	ed9f 0b36 	vldr	d0, [pc, #216]	; 20013b80 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1438>
20013aaa:	f8dd 9014 	ldr.w	r9, [sp, #20]
20013aae:	4634      	mov	r4, r6
20013ab0:	2e03      	cmp	r6, #3
20013ab2:	d320      	bcc.n	20013af6 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x13ae>
20013ab4:	eb0b 05c4 	add.w	r5, fp, r4, lsl #3
20013ab8:	ec51 0b10 	vmov	r0, r1, d0
20013abc:	ed95 0b00 	vldr	d0, [r5]
20013ac0:	f1a5 0218 	sub.w	r2, r5, #24
20013ac4:	ec92 8b06 	vldmia	r2, {d8-d10}
20013ac8:	ec53 2b10 	vmov	r2, r3, d0
20013acc:	f001 fcd4 	bl	20015478 <__aeabi_dadd>
20013ad0:	ec53 2b1a 	vmov	r2, r3, d10
20013ad4:	f001 fcd0 	bl	20015478 <__aeabi_dadd>
20013ad8:	ec53 2b19 	vmov	r2, r3, d9
20013adc:	f001 fccc 	bl	20015478 <__aeabi_dadd>
20013ae0:	ec53 2b18 	vmov	r2, r3, d8
20013ae4:	f001 fcc8 	bl	20015478 <__aeabi_dadd>
20013ae8:	ec41 0b10 	vmov	d0, r0, r1
20013aec:	3d20      	subs	r5, #32
20013aee:	2c03      	cmp	r4, #3
20013af0:	f1a4 0404 	sub.w	r4, r4, #4
20013af4:	d1e0      	bne.n	20013ab8 <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x1370>
20013af6:	ed8d 0b1c 	vstr	d0, [sp, #112]	; 0x70
20013afa:	f89d 0077 	ldrb.w	r0, [sp, #119]	; 0x77
20013afe:	ec53 2b10 	vmov	r2, r3, d0
20013b02:	f080 0080 	eor.w	r0, r0, #128	; 0x80
20013b06:	f88d 0077 	strb.w	r0, [sp, #119]	; 0x77
20013b0a:	e9dd 101c 	ldrd	r1, r0, [sp, #112]	; 0x70
20013b0e:	f1ba 0f00 	cmp.w	sl, #0
20013b12:	bf1c      	itt	ne
20013b14:	460a      	movne	r2, r1
20013b16:	4603      	movne	r3, r0
20013b18:	9803      	ldr	r0, [sp, #12]
20013b1a:	ec43 2b10 	vmov	d0, r2, r3
20013b1e:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
20013b22:	dc0b      	bgt.n	20013b3c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0x13f4>
20013b24:	ed8d 0b1a 	vstr	d0, [sp, #104]	; 0x68
20013b28:	f89d 006f 	ldrb.w	r0, [sp, #111]	; 0x6f
20013b2c:	f1c9 0900 	rsb	r9, r9, #0
20013b30:	f080 0080 	eor.w	r0, r0, #128	; 0x80
20013b34:	f88d 006f 	strb.w	r0, [sp, #111]	; 0x6f
20013b38:	ed9d 0b1a 	vldr	d0, [sp, #104]	; 0x68
20013b3c:	f009 0001 	and.w	r0, r9, #1
20013b40:	f50d 7d2c 	add.w	sp, sp, #688	; 0x2b0
20013b44:	ecbd 8b10 	vpop	{d8-d15}
20013b48:	b001      	add	sp, #4
20013b4a:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20013b4e:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
20013b52:	f000 b819 	b.w	20013b88 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE>
20013b56:	bf00      	nop
20013b58:	f1ab 0b01 	sub.w	fp, fp, #1
20013b5c:	3a18      	subs	r2, #24
20013b5e:	f7ff bbfd 	b.w	2001335c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc14>
20013b62:	bf00      	nop
20013b64:	f1ab 0b02 	sub.w	fp, fp, #2
20013b68:	3a30      	subs	r2, #48	; 0x30
20013b6a:	f7ff bbf7 	b.w	2001335c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc14>
20013b6e:	bf00      	nop
20013b70:	f1ab 0b03 	sub.w	fp, fp, #3
20013b74:	3a48      	subs	r2, #72	; 0x48
20013b76:	f7ff bbf1 	b.w	2001335c <_ZN4libm4math4tanf4tanf17he5559165cecd99dfE+0xc14>
20013b7a:	bf00      	nop
20013b7c:	bf00      	nop
20013b7e:	bf00      	nop
	...

20013b88 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE>:
20013b88:	b5f0      	push	{r4, r5, r6, r7, lr}
20013b8a:	af03      	add	r7, sp, #12
20013b8c:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20013b90:	b087      	sub	sp, #28
20013b92:	ec55 6b10 	vmov	r6, r5, d0
20013b96:	9006      	str	r0, [sp, #24]
20013b98:	4630      	mov	r0, r6
20013b9a:	4629      	mov	r1, r5
20013b9c:	4632      	mov	r2, r6
20013b9e:	462b      	mov	r3, r5
20013ba0:	f001 fad9 	bl	20015156 <__aeabi_dmul>
20013ba4:	ed9f 0b40 	vldr	d0, [pc, #256]	; 20013ca8 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x120>
20013ba8:	4680      	mov	r8, r0
20013baa:	ec53 2b10 	vmov	r2, r3, d0
20013bae:	4689      	mov	r9, r1
20013bb0:	f001 fad1 	bl	20015156 <__aeabi_dmul>
20013bb4:	ed9f 0b3e 	vldr	d0, [pc, #248]	; 20013cb0 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x128>
20013bb8:	ec53 2b10 	vmov	r2, r3, d0
20013bbc:	f001 fc5c 	bl	20015478 <__aeabi_dadd>
20013bc0:	ed9f 0b3d 	vldr	d0, [pc, #244]	; 20013cb8 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x130>
20013bc4:	e9cd 1004 	strd	r1, r0, [sp, #16]
20013bc8:	ec53 2b10 	vmov	r2, r3, d0
20013bcc:	4640      	mov	r0, r8
20013bce:	4649      	mov	r1, r9
20013bd0:	f001 fac1 	bl	20015156 <__aeabi_dmul>
20013bd4:	ed9f 0b3a 	vldr	d0, [pc, #232]	; 20013cc0 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x138>
20013bd8:	ec53 2b10 	vmov	r2, r3, d0
20013bdc:	f001 fc4c 	bl	20015478 <__aeabi_dadd>
20013be0:	e9cd 1002 	strd	r1, r0, [sp, #8]
20013be4:	4640      	mov	r0, r8
20013be6:	4649      	mov	r1, r9
20013be8:	4642      	mov	r2, r8
20013bea:	464b      	mov	r3, r9
20013bec:	f001 fab3 	bl	20015156 <__aeabi_dmul>
20013bf0:	4682      	mov	sl, r0
20013bf2:	9101      	str	r1, [sp, #4]
20013bf4:	4640      	mov	r0, r8
20013bf6:	4649      	mov	r1, r9
20013bf8:	4632      	mov	r2, r6
20013bfa:	462b      	mov	r3, r5
20013bfc:	f001 faab 	bl	20015156 <__aeabi_dmul>
20013c00:	ed9f 0b31 	vldr	d0, [pc, #196]	; 20013cc8 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x140>
20013c04:	4683      	mov	fp, r0
20013c06:	460c      	mov	r4, r1
20013c08:	ec53 2b10 	vmov	r2, r3, d0
20013c0c:	4640      	mov	r0, r8
20013c0e:	4649      	mov	r1, r9
20013c10:	f001 faa1 	bl	20015156 <__aeabi_dmul>
20013c14:	ed9f 0b2e 	vldr	d0, [pc, #184]	; 20013cd0 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x148>
20013c18:	ec53 2b10 	vmov	r2, r3, d0
20013c1c:	f001 fc2c 	bl	20015478 <__aeabi_dadd>
20013c20:	4602      	mov	r2, r0
20013c22:	460b      	mov	r3, r1
20013c24:	4658      	mov	r0, fp
20013c26:	4621      	mov	r1, r4
20013c28:	f001 fa95 	bl	20015156 <__aeabi_dmul>
20013c2c:	4632      	mov	r2, r6
20013c2e:	462b      	mov	r3, r5
20013c30:	f001 fc22 	bl	20015478 <__aeabi_dadd>
20013c34:	9e01      	ldr	r6, [sp, #4]
20013c36:	4680      	mov	r8, r0
20013c38:	4689      	mov	r9, r1
20013c3a:	4658      	mov	r0, fp
20013c3c:	4621      	mov	r1, r4
20013c3e:	4652      	mov	r2, sl
20013c40:	4633      	mov	r3, r6
20013c42:	f001 fa88 	bl	20015156 <__aeabi_dmul>
20013c46:	e9dd 3204 	ldrd	r3, r2, [sp, #16]
20013c4a:	4604      	mov	r4, r0
20013c4c:	460d      	mov	r5, r1
20013c4e:	4650      	mov	r0, sl
20013c50:	4631      	mov	r1, r6
20013c52:	f001 fa80 	bl	20015156 <__aeabi_dmul>
20013c56:	4602      	mov	r2, r0
20013c58:	460b      	mov	r3, r1
20013c5a:	e9dd 1002 	ldrd	r1, r0, [sp, #8]
20013c5e:	f001 fc0b 	bl	20015478 <__aeabi_dadd>
20013c62:	4602      	mov	r2, r0
20013c64:	460b      	mov	r3, r1
20013c66:	4620      	mov	r0, r4
20013c68:	4629      	mov	r1, r5
20013c6a:	f001 fa74 	bl	20015156 <__aeabi_dmul>
20013c6e:	4602      	mov	r2, r0
20013c70:	460b      	mov	r3, r1
20013c72:	4640      	mov	r0, r8
20013c74:	4649      	mov	r1, r9
20013c76:	f001 fbff 	bl	20015478 <__aeabi_dadd>
20013c7a:	ed9f 0b17 	vldr	d0, [pc, #92]	; 20013cd8 <_ZN4libm4math6k_tanf6k_tanf17h6ca8f166b807184eE+0x150>
20013c7e:	4604      	mov	r4, r0
20013c80:	460d      	mov	r5, r1
20013c82:	ec51 0b10 	vmov	r0, r1, d0
20013c86:	4622      	mov	r2, r4
20013c88:	462b      	mov	r3, r5
20013c8a:	f000 fc3e 	bl	2001450a <__aeabi_ddiv>
20013c8e:	9a06      	ldr	r2, [sp, #24]
20013c90:	2a00      	cmp	r2, #0
20013c92:	bf04      	itt	eq
20013c94:	4629      	moveq	r1, r5
20013c96:	4620      	moveq	r0, r4
20013c98:	f000 ff3a 	bl	20014b10 <__aeabi_d2f>
20013c9c:	ee00 0a10 	vmov	s0, r0
20013ca0:	b007      	add	sp, #28
20013ca2:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20013ca6:	bdf0      	pop	{r4, r5, r6, r7, pc}
20013ca8:	bf971bcd 	svclt	0x00971bcd
20013cac:	3f8362b9 	svccc	0x008362b9
20013cb0:	fcecf44e 	stc2l	4, cr15, [ip], #312	; 0x138
20013cb4:	3f685dad 	svccc	0x00685dad
20013cb8:	908c33ce 	addls	r3, ip, lr, asr #7
20013cbc:	3f991df3 	svccc	0x00991df3
20013cc0:	1d865afe 	vstrne	s10, [r6, #1016]	; 0x3f8
20013cc4:	3fab54c9 	svccc	0x00ab54c9
20013cc8:	38999f72 	ldmcc	r9, {r1, r4, r5, r6, r8, r9, sl, fp, ip, pc}
20013ccc:	3fc112fd 	svccc	0x00c112fd
20013cd0:	3418c99f 	ldrcc	ip, [r8], #-2463	; 0xfffff661
20013cd4:	3fd5554d 	svccc	0x00d5554d
20013cd8:	00000000 	andeq	r0, r0, r0
20013cdc:	bff00000 	svclt	0x00f00000	; IMB

20013ce0 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E>:
20013ce0:	b5f0      	push	{r4, r5, r6, r7, lr}
20013ce2:	af03      	add	r7, sp, #12
20013ce4:	f84d 8d04 	str.w	r8, [sp, #-4]!
20013ce8:	b088      	sub	sp, #32
20013cea:	2800      	cmp	r0, #0
20013cec:	d042      	beq.n	20013d74 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x94>
20013cee:	4606      	mov	r6, r0
20013cf0:	460d      	mov	r5, r1
20013cf2:	4668      	mov	r0, sp
20013cf4:	4611      	mov	r1, r2
20013cf6:	461a      	mov	r2, r3
20013cf8:	f7fc fb83 	bl	20010402 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E>
20013cfc:	9800      	ldr	r0, [sp, #0]
20013cfe:	f1b0 4f00 	cmp.w	r0, #2147483648	; 0x80000000
20013d02:	d13b      	bne.n	20013d7c <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x9c>
20013d04:	e9dd 4801 	ldrd	r4, r8, [sp, #4]
20013d08:	b2e8      	uxtb	r0, r5
20013d0a:	4621      	mov	r1, r4
20013d0c:	47b0      	blx	r6
20013d0e:	2000      	movs	r0, #0
20013d10:	f1b8 0f00 	cmp.w	r8, #0
20013d14:	7020      	strb	r0, [r4, #0]
20013d16:	d02d      	beq.n	20013d74 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x94>
20013d18:	f246 0590 	movw	r5, #24720	; 0x6090
20013d1c:	f2c2 0501 	movt	r5, #8193	; 0x2001
20013d20:	e8d5 0f4f 	ldrexb	r0, [r5]
20013d24:	b120      	cbz	r0, 20013d30 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x50>
20013d26:	f3bf 8f2f 	clrex
20013d2a:	7828      	ldrb	r0, [r5, #0]
20013d2c:	b938      	cbnz	r0, 20013d3e <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x5e>
20013d2e:	e7f7      	b.n	20013d20 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x40>
20013d30:	2001      	movs	r0, #1
20013d32:	e8c5 0f41 	strexb	r1, r0, [r5]
20013d36:	b199      	cbz	r1, 20013d60 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x80>
20013d38:	7828      	ldrb	r0, [r5, #0]
20013d3a:	2800      	cmp	r0, #0
20013d3c:	d0f0      	beq.n	20013d20 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x40>
20013d3e:	bf10      	yield
20013d40:	7828      	ldrb	r0, [r5, #0]
20013d42:	2800      	cmp	r0, #0
20013d44:	d0ec      	beq.n	20013d20 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x40>
20013d46:	bf10      	yield
20013d48:	7828      	ldrb	r0, [r5, #0]
20013d4a:	2800      	cmp	r0, #0
20013d4c:	d0e8      	beq.n	20013d20 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x40>
20013d4e:	bf10      	yield
20013d50:	7828      	ldrb	r0, [r5, #0]
20013d52:	2800      	cmp	r0, #0
20013d54:	d0e4      	beq.n	20013d20 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x40>
20013d56:	bf10      	yield
20013d58:	7828      	ldrb	r0, [r5, #0]
20013d5a:	2800      	cmp	r0, #0
20013d5c:	d1ef      	bne.n	20013d3e <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x5e>
20013d5e:	e7df      	b.n	20013d20 <_ZN9owl_patch14program_vector10parameters10Parameters8register17h1ccefafb8090f4c0E+0x40>
20013d60:	4620      	mov	r0, r4
20013d62:	4641      	mov	r1, r8
20013d64:	f3bf 8f5f 	dmb	sy
20013d68:	f7f8 f99a 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
20013d6c:	2000      	movs	r0, #0
20013d6e:	f3bf 8f5f 	dmb	sy
20013d72:	7028      	strb	r0, [r5, #0]
20013d74:	b008      	add	sp, #32
20013d76:	f85d 8b04 	ldr.w	r8, [sp], #4
20013d7a:	bdf0      	pop	{r4, r5, r6, r7, pc}
20013d7c:	9a03      	ldr	r2, [sp, #12]
20013d7e:	e89d 000b 	ldmia.w	sp, {r0, r1, r3}
20013d82:	9207      	str	r2, [sp, #28]
20013d84:	aa04      	add	r2, sp, #16
20013d86:	c20b      	stmia	r2!, {r0, r1, r3}
20013d88:	f645 6014 	movw	r0, #24084	; 0x5e14
20013d8c:	f645 633c 	movw	r3, #24124	; 0x5e3c
20013d90:	f2c2 0001 	movt	r0, #8193	; 0x2001
20013d94:	f2c2 0301 	movt	r3, #8193	; 0x2001
20013d98:	aa04      	add	r2, sp, #16
20013d9a:	2126      	movs	r1, #38	; 0x26
20013d9c:	f7fd fc53 	bl	20011646 <_ZN4core6result13unwrap_failed17h727c9a6b0cd4ec86E>

20013da0 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E>:
20013da0:	6801      	ldr	r1, [r0, #0]
20013da2:	2900      	cmp	r1, #0
20013da4:	bf08      	it	eq
20013da6:	4770      	bxeq	lr
20013da8:	b5d0      	push	{r4, r6, r7, lr}
20013daa:	af02      	add	r7, sp, #8
20013dac:	6840      	ldr	r0, [r0, #4]
20013dae:	f246 0490 	movw	r4, #24720	; 0x6090
20013db2:	f2c2 0401 	movt	r4, #8193	; 0x2001
20013db6:	bf00      	nop
20013db8:	e8d4 2f4f 	ldrexb	r2, [r4]
20013dbc:	b122      	cbz	r2, 20013dc8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x28>
20013dbe:	f3bf 8f2f 	clrex
20013dc2:	7822      	ldrb	r2, [r4, #0]
20013dc4:	b93a      	cbnz	r2, 20013dd6 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x36>
20013dc6:	e7f7      	b.n	20013db8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x18>
20013dc8:	2201      	movs	r2, #1
20013dca:	e8c4 2f43 	strexb	r3, r2, [r4]
20013dce:	b19b      	cbz	r3, 20013df8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x58>
20013dd0:	7822      	ldrb	r2, [r4, #0]
20013dd2:	2a00      	cmp	r2, #0
20013dd4:	d0f0      	beq.n	20013db8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x18>
20013dd6:	bf10      	yield
20013dd8:	7822      	ldrb	r2, [r4, #0]
20013dda:	2a00      	cmp	r2, #0
20013ddc:	d0ec      	beq.n	20013db8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x18>
20013dde:	bf10      	yield
20013de0:	7822      	ldrb	r2, [r4, #0]
20013de2:	2a00      	cmp	r2, #0
20013de4:	d0e8      	beq.n	20013db8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x18>
20013de6:	bf10      	yield
20013de8:	7822      	ldrb	r2, [r4, #0]
20013dea:	2a00      	cmp	r2, #0
20013dec:	d0e4      	beq.n	20013db8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x18>
20013dee:	bf10      	yield
20013df0:	7822      	ldrb	r2, [r4, #0]
20013df2:	2a00      	cmp	r2, #0
20013df4:	d1ef      	bne.n	20013dd6 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x36>
20013df6:	e7df      	b.n	20013db8 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x18>
20013df8:	f3bf 8f5f 	dmb	sy
20013dfc:	f7f8 f950 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
20013e00:	2000      	movs	r0, #0
20013e02:	f3bf 8f5f 	dmb	sy
20013e06:	7020      	strb	r0, [r4, #0]
20013e08:	e8bd 40d0 	ldmia.w	sp!, {r4, r6, r7, lr}
20013e0c:	4770      	bx	lr
20013e0e:	d4d4      	bmi.n	20013dba <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x1a>

20013e10 <_ZN64_$LT$alloc..ffi..c_str..NulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h137f1502150ecab6E>:
20013e10:	b580      	push	{r7, lr}
20013e12:	466f      	mov	r7, sp
20013e14:	b082      	sub	sp, #8
20013e16:	460b      	mov	r3, r1
20013e18:	f100 010c 	add.w	r1, r0, #12
20013e1c:	9001      	str	r0, [sp, #4]
20013e1e:	aa01      	add	r2, sp, #4
20013e20:	4618      	mov	r0, r3
20013e22:	f7fd fdf9 	bl	20011a18 <_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h7483d6422e3806e3E>
20013e26:	b002      	add	sp, #8
20013e28:	bd80      	pop	{r7, pc}
20013e2a:	d4d4      	bmi.n	20013dd6 <_ZN4core3ptr48drop_in_place$LT$alloc..ffi..c_str..NulError$GT$17had7c924c71625f61E+0x36>

20013e2c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha86ce08c2faf7301E>:
20013e2c:	b5f0      	push	{r4, r5, r6, r7, lr}
20013e2e:	af03      	add	r7, sp, #12
20013e30:	e92d 0b00 	stmdb	sp!, {r8, r9, fp}
20013e34:	b084      	sub	sp, #16
20013e36:	6800      	ldr	r0, [r0, #0]
20013e38:	e9d0 4601 	ldrd	r4, r6, [r0, #4]
20013e3c:	a801      	add	r0, sp, #4
20013e3e:	f7fd fe49 	bl	20011ad4 <_ZN4core3fmt9Formatter10debug_list17h4286591438d2a557E>
20013e42:	b186      	cbz	r6, 20013e66 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha86ce08c2faf7301E+0x3a>
20013e44:	f645 58b8 	movw	r8, #23992	; 0x5db8
20013e48:	f2c2 0801 	movt	r8, #8193	; 0x2001
20013e4c:	a801      	add	r0, sp, #4
20013e4e:	f10d 090c 	add.w	r9, sp, #12
20013e52:	bf00      	nop
20013e54:	4649      	mov	r1, r9
20013e56:	4642      	mov	r2, r8
20013e58:	1c65      	adds	r5, r4, #1
20013e5a:	9403      	str	r4, [sp, #12]
20013e5c:	f7fd fd51 	bl	20011902 <_ZN4core3fmt8builders8DebugSet5entry17h6046271a2bed5129E>
20013e60:	3e01      	subs	r6, #1
20013e62:	462c      	mov	r4, r5
20013e64:	d1f6      	bne.n	20013e54 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha86ce08c2faf7301E+0x28>
20013e66:	a801      	add	r0, sp, #4
20013e68:	f7fd fdc2 	bl	200119f0 <_ZN4core3fmt8builders9DebugList6finish17h1edfe174d0080066E>
20013e6c:	b004      	add	sp, #16
20013e6e:	e8bd 0b00 	ldmia.w	sp!, {r8, r9, fp}
20013e72:	bdf0      	pop	{r4, r5, r6, r7, pc}

20013e74 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hf056e20f00d7fdf7E>:
20013e74:	69ca      	ldr	r2, [r1, #28]
20013e76:	6800      	ldr	r0, [r0, #0]
20013e78:	06d3      	lsls	r3, r2, #27
20013e7a:	bf48      	it	mi
20013e7c:	f7fd be91 	bmi.w	20011ba2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17h7a52f995f2c3d7aeE>
20013e80:	0692      	lsls	r2, r2, #26
20013e82:	bf58      	it	pl
20013e84:	f7fd bc07 	bpl.w	20011696 <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd9f7ba0cdf2d97b1E>
20013e88:	f7fd be59 	b.w	20011b3e <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17hcc6b0f23d2c937d6E>

20013e8c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h099e181731f08684E.356>:
20013e8c:	69ca      	ldr	r2, [r1, #28]
20013e8e:	06d3      	lsls	r3, r2, #27
20013e90:	bf48      	it	mi
20013e92:	f7fd bc59 	bmi.w	20011748 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h6e898189a2098a71E>
20013e96:	0692      	lsls	r2, r2, #26
20013e98:	bf58      	it	pl
20013e9a:	f7fc bc0e 	bpl.w	200106ba <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h45b149ccfd8c365cE>
20013e9e:	f7fd beb2 	b.w	20011c06 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h03a1f063ef546797E>
20013ea2:	d4d4      	bmi.n	20013e4e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha86ce08c2faf7301E+0x22>

20013ea4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE>:
20013ea4:	b5f0      	push	{r4, r5, r6, r7, lr}
20013ea6:	af03      	add	r7, sp, #12
20013ea8:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
20013eac:	f246 06e0 	movw	r6, #24800	; 0x60e0
20013eb0:	f2c2 0601 	movt	r6, #8193	; 0x2001
20013eb4:	1d35      	adds	r5, r6, #4
20013eb6:	e8d5 4f4f 	ldrexb	r4, [r5]
20013eba:	4613      	mov	r3, r2
20013ebc:	460a      	mov	r2, r1
20013ebe:	2c00      	cmp	r4, #0
20013ec0:	4601      	mov	r1, r0
20013ec2:	f040 8094 	bne.w	20013fee <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x14a>
20013ec6:	2001      	movs	r0, #1
20013ec8:	e8c5 0f44 	strexb	r4, r0, [r5]
20013ecc:	2c00      	cmp	r4, #0
20013ece:	f040 8091 	bne.w	20013ff4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x150>
20013ed2:	f3bf 8f5f 	dmb	sy
20013ed6:	68b0      	ldr	r0, [r6, #8]
20013ed8:	2800      	cmp	r0, #0
20013eda:	d175      	bne.n	20013fc8 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x124>
20013edc:	e9d6 a803 	ldrd	sl, r8, [r6, #12]
20013ee0:	2000      	movs	r0, #0
20013ee2:	60f0      	str	r0, [r6, #12]
20013ee4:	f1ba 0f00 	cmp.w	sl, #0
20013ee8:	f3bf 8f5f 	dmb	sy
20013eec:	7130      	strb	r0, [r6, #4]
20013eee:	d016      	beq.n	20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013ef0:	1e48      	subs	r0, r1, #1
20013ef2:	280b      	cmp	r0, #11
20013ef4:	d274      	bcs.n	20013fe0 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x13c>
20013ef6:	f8d8 4010 	ldr.w	r4, [r8, #16]
20013efa:	4650      	mov	r0, sl
20013efc:	47a0      	blx	r4
20013efe:	e00e      	b.n	20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013f00:	7930      	ldrb	r0, [r6, #4]
20013f02:	b160      	cbz	r0, 20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013f04:	bf10      	yield
20013f06:	7930      	ldrb	r0, [r6, #4]
20013f08:	b148      	cbz	r0, 20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013f0a:	bf10      	yield
20013f0c:	7930      	ldrb	r0, [r6, #4]
20013f0e:	b130      	cbz	r0, 20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013f10:	bf10      	yield
20013f12:	7930      	ldrb	r0, [r6, #4]
20013f14:	b118      	cbz	r0, 20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013f16:	bf10      	yield
20013f18:	7930      	ldrb	r0, [r6, #4]
20013f1a:	2800      	cmp	r0, #0
20013f1c:	d1f2      	bne.n	20013f04 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x60>
20013f1e:	e8d5 0f4f 	ldrexb	r0, [r5]
20013f22:	b128      	cbz	r0, 20013f30 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x8c>
20013f24:	f3bf 8f2f 	clrex
20013f28:	7930      	ldrb	r0, [r6, #4]
20013f2a:	2800      	cmp	r0, #0
20013f2c:	d1ea      	bne.n	20013f04 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x60>
20013f2e:	e7f6      	b.n	20013f1e <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x7a>
20013f30:	2001      	movs	r0, #1
20013f32:	e8c5 0f41 	strexb	r1, r0, [r5]
20013f36:	2900      	cmp	r1, #0
20013f38:	d1e2      	bne.n	20013f00 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x5c>
20013f3a:	f3bf 8f5f 	dmb	sy
20013f3e:	68b0      	ldr	r0, [r6, #8]
20013f40:	2800      	cmp	r0, #0
20013f42:	d147      	bne.n	20013fd4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x130>
20013f44:	e9d6 9503 	ldrd	r9, r5, [r6, #12]
20013f48:	e9c6 a803 	strd	sl, r8, [r6, #12]
20013f4c:	f1b9 0f00 	cmp.w	r9, #0
20013f50:	d033      	beq.n	20013fba <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x116>
20013f52:	6829      	ldr	r1, [r5, #0]
20013f54:	b109      	cbz	r1, 20013f5a <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xb6>
20013f56:	4648      	mov	r0, r9
20013f58:	4788      	blx	r1
20013f5a:	6869      	ldr	r1, [r5, #4]
20013f5c:	b369      	cbz	r1, 20013fba <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x116>
20013f5e:	f246 0490 	movw	r4, #24720	; 0x6090
20013f62:	f2c2 0401 	movt	r4, #8193	; 0x2001
20013f66:	bf00      	nop
20013f68:	e8d4 0f4f 	ldrexb	r0, [r4]
20013f6c:	b120      	cbz	r0, 20013f78 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xd4>
20013f6e:	f3bf 8f2f 	clrex
20013f72:	7820      	ldrb	r0, [r4, #0]
20013f74:	b938      	cbnz	r0, 20013f86 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xe2>
20013f76:	e7f7      	b.n	20013f68 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xc4>
20013f78:	2001      	movs	r0, #1
20013f7a:	e8c4 0f42 	strexb	r2, r0, [r4]
20013f7e:	b19a      	cbz	r2, 20013fa8 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x104>
20013f80:	7820      	ldrb	r0, [r4, #0]
20013f82:	2800      	cmp	r0, #0
20013f84:	d0f0      	beq.n	20013f68 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xc4>
20013f86:	bf10      	yield
20013f88:	7820      	ldrb	r0, [r4, #0]
20013f8a:	2800      	cmp	r0, #0
20013f8c:	d0ec      	beq.n	20013f68 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xc4>
20013f8e:	bf10      	yield
20013f90:	7820      	ldrb	r0, [r4, #0]
20013f92:	2800      	cmp	r0, #0
20013f94:	d0e8      	beq.n	20013f68 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xc4>
20013f96:	bf10      	yield
20013f98:	7820      	ldrb	r0, [r4, #0]
20013f9a:	2800      	cmp	r0, #0
20013f9c:	d0e4      	beq.n	20013f68 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xc4>
20013f9e:	bf10      	yield
20013fa0:	7820      	ldrb	r0, [r4, #0]
20013fa2:	2800      	cmp	r0, #0
20013fa4:	d1ef      	bne.n	20013f86 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xe2>
20013fa6:	e7df      	b.n	20013f68 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0xc4>
20013fa8:	4648      	mov	r0, r9
20013faa:	f3bf 8f5f 	dmb	sy
20013fae:	f7f8 f877 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
20013fb2:	2000      	movs	r0, #0
20013fb4:	f3bf 8f5f 	dmb	sy
20013fb8:	7020      	strb	r0, [r4, #0]
20013fba:	2000      	movs	r0, #0
20013fbc:	f3bf 8f5f 	dmb	sy
20013fc0:	7130      	strb	r0, [r6, #4]
20013fc2:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20013fc6:	bdf0      	pop	{r4, r5, r6, r7, pc}
20013fc8:	f645 60a4 	movw	r0, #24228	; 0x5ea4
20013fcc:	f2c2 0001 	movt	r0, #8193	; 0x2001
20013fd0:	f7fd f9cd 	bl	2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>
20013fd4:	f645 60c4 	movw	r0, #24260	; 0x5ec4
20013fd8:	f2c2 0001 	movt	r0, #8193	; 0x2001
20013fdc:	f7fd f9c7 	bl	2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>
20013fe0:	f7fd fb91 	bl	20011706 <_ZN4core6option13unwrap_failed17hb3ca06b9e4ca82c8E>
20013fe4:	e8d5 0f4f 	ldrexb	r0, [r5]
20013fe8:	2800      	cmp	r0, #0
20013fea:	f43f af6c 	beq.w	20013ec6 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x22>
20013fee:	f3bf 8f2f 	clrex
20013ff2:	bf00      	nop
20013ff4:	7930      	ldrb	r0, [r6, #4]
20013ff6:	2800      	cmp	r0, #0
20013ff8:	d0f4      	beq.n	20013fe4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x140>
20013ffa:	bf10      	yield
20013ffc:	7930      	ldrb	r0, [r6, #4]
20013ffe:	2800      	cmp	r0, #0
20014000:	d0f0      	beq.n	20013fe4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x140>
20014002:	bf10      	yield
20014004:	7930      	ldrb	r0, [r6, #4]
20014006:	2800      	cmp	r0, #0
20014008:	d0ec      	beq.n	20013fe4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x140>
2001400a:	bf10      	yield
2001400c:	7930      	ldrb	r0, [r6, #4]
2001400e:	2800      	cmp	r0, #0
20014010:	d0e8      	beq.n	20013fe4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x140>
20014012:	bf10      	yield
20014014:	7930      	ldrb	r0, [r6, #4]
20014016:	2800      	cmp	r0, #0
20014018:	d1ef      	bne.n	20013ffa <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x156>
2001401a:	e7e3      	b.n	20013fe4 <_ZN9owl_patch14program_vector10parameters23button_changed_callback17ha461f0de0d0a93baE+0x140>

2001401c <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE>:
2001401c:	b5f0      	push	{r4, r5, r6, r7, lr}
2001401e:	af03      	add	r7, sp, #12
20014020:	e92d 0b00 	stmdb	sp!, {r8, r9, fp}
20014024:	f246 06e0 	movw	r6, #24800	; 0x60e0
20014028:	f2c2 0601 	movt	r6, #8193	; 0x2001
2001402c:	f106 0914 	add.w	r9, r6, #20
20014030:	e8d9 4f4f 	ldrexb	r4, [r9]
20014034:	2c00      	cmp	r4, #0
20014036:	f000 8097 	beq.w	20014168 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x14c>
2001403a:	f3bf 8f2f 	clrex
2001403e:	bf00      	nop
20014040:	7d35      	ldrb	r5, [r6, #20]
20014042:	b15d      	cbz	r5, 2001405c <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x40>
20014044:	bf10      	yield
20014046:	7d35      	ldrb	r5, [r6, #20]
20014048:	b145      	cbz	r5, 2001405c <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x40>
2001404a:	bf10      	yield
2001404c:	7d35      	ldrb	r5, [r6, #20]
2001404e:	b12d      	cbz	r5, 2001405c <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x40>
20014050:	bf10      	yield
20014052:	7d35      	ldrb	r5, [r6, #20]
20014054:	b115      	cbz	r5, 2001405c <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x40>
20014056:	bf10      	yield
20014058:	e7f2      	b.n	20014040 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x24>
2001405a:	bf00      	nop
2001405c:	e8d9 5f4f 	ldrexb	r5, [r9]
20014060:	2d00      	cmp	r5, #0
20014062:	d1ea      	bne.n	2001403a <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x1e>
20014064:	2501      	movs	r5, #1
20014066:	e8c9 5f44 	strexb	r4, r5, [r9]
2001406a:	2c00      	cmp	r4, #0
2001406c:	d1e8      	bne.n	20014040 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x24>
2001406e:	f3bf 8f5f 	dmb	sy
20014072:	69b5      	ldr	r5, [r6, #24]
20014074:	2d00      	cmp	r5, #0
20014076:	f040 807f 	bne.w	20014178 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x15c>
2001407a:	e9d6 4807 	ldrd	r4, r8, [r6, #28]
2001407e:	2500      	movs	r5, #0
20014080:	61f5      	str	r5, [r6, #28]
20014082:	f3bf 8f5f 	dmb	sy
20014086:	7535      	strb	r5, [r6, #20]
20014088:	b1cc      	cbz	r4, 200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
2001408a:	061b      	lsls	r3, r3, #24
2001408c:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
20014090:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
20014094:	f8d8 2010 	ldr.w	r2, [r8, #16]
20014098:	4401      	add	r1, r0
2001409a:	4620      	mov	r0, r4
2001409c:	4790      	blx	r2
2001409e:	e00e      	b.n	200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
200140a0:	7d30      	ldrb	r0, [r6, #20]
200140a2:	b160      	cbz	r0, 200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
200140a4:	bf10      	yield
200140a6:	7d30      	ldrb	r0, [r6, #20]
200140a8:	b148      	cbz	r0, 200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
200140aa:	bf10      	yield
200140ac:	7d30      	ldrb	r0, [r6, #20]
200140ae:	b130      	cbz	r0, 200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
200140b0:	bf10      	yield
200140b2:	7d30      	ldrb	r0, [r6, #20]
200140b4:	b118      	cbz	r0, 200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
200140b6:	bf10      	yield
200140b8:	7d30      	ldrb	r0, [r6, #20]
200140ba:	2800      	cmp	r0, #0
200140bc:	d1f2      	bne.n	200140a4 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x88>
200140be:	e8d9 0f4f 	ldrexb	r0, [r9]
200140c2:	b128      	cbz	r0, 200140d0 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xb4>
200140c4:	f3bf 8f2f 	clrex
200140c8:	7d30      	ldrb	r0, [r6, #20]
200140ca:	2800      	cmp	r0, #0
200140cc:	d1ea      	bne.n	200140a4 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x88>
200140ce:	e7f6      	b.n	200140be <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xa2>
200140d0:	2001      	movs	r0, #1
200140d2:	e8c9 0f41 	strexb	r1, r0, [r9]
200140d6:	2900      	cmp	r1, #0
200140d8:	d1e2      	bne.n	200140a0 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x84>
200140da:	f3bf 8f5f 	dmb	sy
200140de:	69b0      	ldr	r0, [r6, #24]
200140e0:	2800      	cmp	r0, #0
200140e2:	d14f      	bne.n	20014184 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x168>
200140e4:	e9d6 9507 	ldrd	r9, r5, [r6, #28]
200140e8:	e9c6 4807 	strd	r4, r8, [r6, #28]
200140ec:	f1b9 0f00 	cmp.w	r9, #0
200140f0:	d033      	beq.n	2001415a <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x13e>
200140f2:	6829      	ldr	r1, [r5, #0]
200140f4:	b109      	cbz	r1, 200140fa <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xde>
200140f6:	4648      	mov	r0, r9
200140f8:	4788      	blx	r1
200140fa:	6869      	ldr	r1, [r5, #4]
200140fc:	b369      	cbz	r1, 2001415a <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x13e>
200140fe:	f246 0490 	movw	r4, #24720	; 0x6090
20014102:	f2c2 0401 	movt	r4, #8193	; 0x2001
20014106:	bf00      	nop
20014108:	e8d4 0f4f 	ldrexb	r0, [r4]
2001410c:	b120      	cbz	r0, 20014118 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xfc>
2001410e:	f3bf 8f2f 	clrex
20014112:	7820      	ldrb	r0, [r4, #0]
20014114:	b938      	cbnz	r0, 20014126 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x10a>
20014116:	e7f7      	b.n	20014108 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xec>
20014118:	2001      	movs	r0, #1
2001411a:	e8c4 0f42 	strexb	r2, r0, [r4]
2001411e:	b19a      	cbz	r2, 20014148 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x12c>
20014120:	7820      	ldrb	r0, [r4, #0]
20014122:	2800      	cmp	r0, #0
20014124:	d0f0      	beq.n	20014108 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xec>
20014126:	bf10      	yield
20014128:	7820      	ldrb	r0, [r4, #0]
2001412a:	2800      	cmp	r0, #0
2001412c:	d0ec      	beq.n	20014108 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xec>
2001412e:	bf10      	yield
20014130:	7820      	ldrb	r0, [r4, #0]
20014132:	2800      	cmp	r0, #0
20014134:	d0e8      	beq.n	20014108 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xec>
20014136:	bf10      	yield
20014138:	7820      	ldrb	r0, [r4, #0]
2001413a:	2800      	cmp	r0, #0
2001413c:	d0e4      	beq.n	20014108 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xec>
2001413e:	bf10      	yield
20014140:	7820      	ldrb	r0, [r4, #0]
20014142:	2800      	cmp	r0, #0
20014144:	d1ef      	bne.n	20014126 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x10a>
20014146:	e7df      	b.n	20014108 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0xec>
20014148:	4648      	mov	r0, r9
2001414a:	f3bf 8f5f 	dmb	sy
2001414e:	f7f7 ffa7 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
20014152:	2000      	movs	r0, #0
20014154:	f3bf 8f5f 	dmb	sy
20014158:	7020      	strb	r0, [r4, #0]
2001415a:	2000      	movs	r0, #0
2001415c:	f3bf 8f5f 	dmb	sy
20014160:	7530      	strb	r0, [r6, #20]
20014162:	e8bd 0b00 	ldmia.w	sp!, {r8, r9, fp}
20014166:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014168:	2401      	movs	r4, #1
2001416a:	e8c9 4f45 	strexb	r5, r4, [r9]
2001416e:	2d00      	cmp	r5, #0
20014170:	f47f af66 	bne.w	20014040 <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x24>
20014174:	e77b      	b.n	2001406e <_ZN9owl_patch14program_vector4midi13midi_callback17h3390a615e633372aE+0x52>
20014176:	bf00      	nop
20014178:	f645 60a4 	movw	r0, #24228	; 0x5ea4
2001417c:	f2c2 0001 	movt	r0, #8193	; 0x2001
20014180:	f7fd f8f5 	bl	2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>
20014184:	f645 7020 	movw	r0, #24352	; 0x5f20
20014188:	f2c2 0001 	movt	r0, #8193	; 0x2001
2001418c:	f7fd f8ef 	bl	2001136e <_ZN4core4cell22panic_already_borrowed17h09284e2e052cd51cE>

20014190 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E>:
20014190:	b5f0      	push	{r4, r5, r6, r7, lr}
20014192:	af03      	add	r7, sp, #12
20014194:	f84d bd04 	str.w	fp, [sp, #-4]!
20014198:	b088      	sub	sp, #32
2001419a:	6a06      	ldr	r6, [r0, #32]
2001419c:	2e00      	cmp	r6, #0
2001419e:	d043      	beq.n	20014228 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x98>
200141a0:	f645 0178 	movw	r1, #22648	; 0x5878
200141a4:	f2c2 0101 	movt	r1, #8193	; 0x2001
200141a8:	4668      	mov	r0, sp
200141aa:	220e      	movs	r2, #14
200141ac:	f7fc f929 	bl	20010402 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h36f40b4fb1a08c80E>
200141b0:	9800      	ldr	r0, [sp, #0]
200141b2:	f1b0 4f00 	cmp.w	r0, #2147483648	; 0x80000000
200141b6:	d13b      	bne.n	20014230 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0xa0>
200141b8:	e9dd 4501 	ldrd	r4, r5, [sp, #4]
200141bc:	2102      	movs	r1, #2
200141be:	4620      	mov	r0, r4
200141c0:	2202      	movs	r2, #2
200141c2:	47b0      	blx	r6
200141c4:	2000      	movs	r0, #0
200141c6:	7020      	strb	r0, [r4, #0]
200141c8:	b375      	cbz	r5, 20014228 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x98>
200141ca:	f246 0690 	movw	r6, #24720	; 0x6090
200141ce:	f2c2 0601 	movt	r6, #8193	; 0x2001
200141d2:	bf00      	nop
200141d4:	e8d6 0f4f 	ldrexb	r0, [r6]
200141d8:	b120      	cbz	r0, 200141e4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x54>
200141da:	f3bf 8f2f 	clrex
200141de:	7830      	ldrb	r0, [r6, #0]
200141e0:	b938      	cbnz	r0, 200141f2 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x62>
200141e2:	e7f7      	b.n	200141d4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x44>
200141e4:	2001      	movs	r0, #1
200141e6:	e8c6 0f41 	strexb	r1, r0, [r6]
200141ea:	b199      	cbz	r1, 20014214 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x84>
200141ec:	7830      	ldrb	r0, [r6, #0]
200141ee:	2800      	cmp	r0, #0
200141f0:	d0f0      	beq.n	200141d4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x44>
200141f2:	bf10      	yield
200141f4:	7830      	ldrb	r0, [r6, #0]
200141f6:	2800      	cmp	r0, #0
200141f8:	d0ec      	beq.n	200141d4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x44>
200141fa:	bf10      	yield
200141fc:	7830      	ldrb	r0, [r6, #0]
200141fe:	2800      	cmp	r0, #0
20014200:	d0e8      	beq.n	200141d4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x44>
20014202:	bf10      	yield
20014204:	7830      	ldrb	r0, [r6, #0]
20014206:	2800      	cmp	r0, #0
20014208:	d0e4      	beq.n	200141d4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x44>
2001420a:	bf10      	yield
2001420c:	7830      	ldrb	r0, [r6, #0]
2001420e:	2800      	cmp	r0, #0
20014210:	d1ef      	bne.n	200141f2 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x62>
20014212:	e7df      	b.n	200141d4 <_ZN9owl_patch14program_vector13ProgramVector14register_patch17h24b3de3a5bd8b3e5E+0x44>
20014214:	4620      	mov	r0, r4
20014216:	4629      	mov	r1, r5
20014218:	f3bf 8f5f 	dmb	sy
2001421c:	f7f7 ff40 	bl	2000c0a0 <_ZN4talc4talc13Talc$LT$O$GT$4free17h88879ea6d510468cE>
20014220:	2000      	movs	r0, #0
20014222:	f3bf 8f5f 	dmb	sy
20014226:	7030      	strb	r0, [r6, #0]
20014228:	b008      	add	sp, #32
2001422a:	f85d bb04 	ldr.w	fp, [sp], #4
2001422e:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014230:	9a03      	ldr	r2, [sp, #12]
20014232:	e89d 000b 	ldmia.w	sp, {r0, r1, r3}
20014236:	9207      	str	r2, [sp, #28]
20014238:	aa04      	add	r2, sp, #16
2001423a:	c20b      	stmia	r2!, {r0, r1, r3}
2001423c:	f246 000c 	movw	r0, #24588	; 0x600c
20014240:	f246 0328 	movw	r3, #24616	; 0x6028
20014244:	f2c2 0001 	movt	r0, #8193	; 0x2001
20014248:	f2c2 0301 	movt	r3, #8193	; 0x2001
2001424c:	aa04      	add	r2, sp, #16
2001424e:	211c      	movs	r1, #28
20014250:	f7fd f9f9 	bl	20011646 <_ZN4core6result13unwrap_failed17h727c9a6b0cd4ec86E>

20014254 <rust_begin_unwind>:
20014254:	b580      	push	{r7, lr}
20014256:	466f      	mov	r7, sp
20014258:	b090      	sub	sp, #64	; 0x40
2001425a:	6841      	ldr	r1, [r0, #4]
2001425c:	b161      	cbz	r1, 20014278 <rust_begin_unwind+0x24>
2001425e:	6800      	ldr	r0, [r0, #0]
20014260:	2140      	movs	r1, #64	; 0x40
20014262:	e9d0 4500 	ldrd	r4, r5, [r0]
20014266:	4668      	mov	r0, sp
20014268:	f000 feda 	bl	20015020 <__aeabi_memclr4>
2001426c:	462a      	mov	r2, r5
2001426e:	2d3f      	cmp	r5, #63	; 0x3f
20014270:	bf28      	it	cs
20014272:	223f      	movcs	r2, #63	; 0x3f
20014274:	e006      	b.n	20014284 <rust_begin_unwind+0x30>
20014276:	bf00      	nop
20014278:	4668      	mov	r0, sp
2001427a:	2140      	movs	r1, #64	; 0x40
2001427c:	f000 fed0 	bl	20015020 <__aeabi_memclr4>
20014280:	2200      	movs	r2, #0
20014282:	2401      	movs	r4, #1
20014284:	466d      	mov	r5, sp
20014286:	4628      	mov	r0, r5
20014288:	4621      	mov	r1, r4
2001428a:	f000 f898 	bl	200143be <__aeabi_memcpy>
2001428e:	f246 1050 	movw	r0, #24912	; 0x6150
20014292:	f2c2 0001 	movt	r0, #8193	; 0x2001
20014296:	6ac1      	ldr	r1, [r0, #44]	; 0x2c
20014298:	22e2      	movs	r2, #226	; 0xe2
2001429a:	7702      	strb	r2, [r0, #28]
2001429c:	63c5      	str	r5, [r0, #60]	; 0x3c
2001429e:	b909      	cbnz	r1, 200142a4 <rust_begin_unwind+0x50>
200142a0:	e7fe      	b.n	200142a0 <rust_begin_unwind+0x4c>
200142a2:	bf00      	nop
200142a4:	2004      	movs	r0, #4
200142a6:	4788      	blx	r1
200142a8:	f246 0042 	movw	r0, #24642	; 0x6042
200142ac:	f246 026c 	movw	r2, #24684	; 0x606c
200142b0:	f2c2 0001 	movt	r0, #8193	; 0x2001
200142b4:	f2c2 0201 	movt	r2, #8193	; 0x2001
200142b8:	2128      	movs	r1, #40	; 0x28
200142ba:	f7fc fb9b 	bl	200109f4 <_ZN4core9panicking5panic17hecf8dc16aef0cc30E>

200142be <fmin>:
200142be:	b5f0      	push	{r4, r5, r6, r7, lr}
200142c0:	af03      	add	r7, sp, #12
200142c2:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
200142c6:	ec5a 4b11 	vmov	r4, sl, d1
200142ca:	ec59 8b10 	vmov	r8, r9, d0
200142ce:	4622      	mov	r2, r4
200142d0:	4653      	mov	r3, sl
200142d2:	4640      	mov	r0, r8
200142d4:	4649      	mov	r1, r9
200142d6:	f000 fb95 	bl	20014a04 <__aeabi_dcmplt>
200142da:	2800      	cmp	r0, #0
200142dc:	4656      	mov	r6, sl
200142de:	4625      	mov	r5, r4
200142e0:	4620      	mov	r0, r4
200142e2:	4651      	mov	r1, sl
200142e4:	4622      	mov	r2, r4
200142e6:	4653      	mov	r3, sl
200142e8:	bf1c      	itt	ne
200142ea:	464e      	movne	r6, r9
200142ec:	4645      	movne	r5, r8
200142ee:	f001 f935 	bl	2001555c <__aeabi_dcmpun>
200142f2:	2800      	cmp	r0, #0
200142f4:	bf1c      	itt	ne
200142f6:	464e      	movne	r6, r9
200142f8:	4645      	movne	r5, r8
200142fa:	ec46 5b10 	vmov	d0, r5, r6
200142fe:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20014302:	bdf0      	pop	{r4, r5, r6, r7, pc}

20014304 <fmax>:
20014304:	b5f0      	push	{r4, r5, r6, r7, lr}
20014306:	af03      	add	r7, sp, #12
20014308:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
2001430c:	ec5a 4b10 	vmov	r4, sl, d0
20014310:	ec59 8b11 	vmov	r8, r9, d1
20014314:	4620      	mov	r0, r4
20014316:	4651      	mov	r1, sl
20014318:	4642      	mov	r2, r8
2001431a:	464b      	mov	r3, r9
2001431c:	f000 fb72 	bl	20014a04 <__aeabi_dcmplt>
20014320:	2800      	cmp	r0, #0
20014322:	4656      	mov	r6, sl
20014324:	4625      	mov	r5, r4
20014326:	4620      	mov	r0, r4
20014328:	4651      	mov	r1, sl
2001432a:	4622      	mov	r2, r4
2001432c:	4653      	mov	r3, sl
2001432e:	bf1c      	itt	ne
20014330:	464e      	movne	r6, r9
20014332:	4645      	movne	r5, r8
20014334:	f001 f912 	bl	2001555c <__aeabi_dcmpun>
20014338:	2800      	cmp	r0, #0
2001433a:	bf1c      	itt	ne
2001433c:	464e      	movne	r6, r9
2001433e:	4645      	movne	r5, r8
20014340:	ec46 5b10 	vmov	d0, r5, r6
20014344:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20014348:	bdf0      	pop	{r4, r5, r6, r7, pc}

2001434a <fmaxf>:
2001434a:	eeb4 0a60 	vcmp.f32	s0, s1
2001434e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
20014352:	eeb4 0a40 	vcmp.f32	s0, s0
20014356:	bf48      	it	mi
20014358:	eeb0 0a60 	vmovmi.f32	s0, s1
2001435c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
20014360:	bf68      	it	vs
20014362:	eeb0 0a60 	vmovvs.f32	s0, s1
20014366:	4770      	bx	lr

20014368 <__aeabi_d2iz>:
20014368:	2300      	movs	r3, #0
2001436a:	f021 4200 	bic.w	r2, r1, #2147483648	; 0x80000000
2001436e:	f6c3 73f0 	movt	r3, #16368	; 0x3ff0
20014372:	429a      	cmp	r2, r3
20014374:	bf3c      	itt	cc
20014376:	2000      	movcc	r0, #0
20014378:	4770      	bxcc	lr
2001437a:	2300      	movs	r3, #0
2001437c:	f2c4 13e0 	movt	r3, #16864	; 0x41e0
20014380:	429a      	cmp	r2, r3
20014382:	d20f      	bcs.n	200143a4 <__aeabi_d2iz+0x3c>
20014384:	231e      	movs	r3, #30
20014386:	0d40      	lsrs	r0, r0, #21
20014388:	eba3 5312 	sub.w	r3, r3, r2, lsr #20
2001438c:	ea40 20c2 	orr.w	r0, r0, r2, lsl #11
20014390:	f003 031f 	and.w	r3, r3, #31
20014394:	f040 4000 	orr.w	r0, r0, #2147483648	; 0x80000000
20014398:	2900      	cmp	r1, #0
2001439a:	fa20 f003 	lsr.w	r0, r0, r3
2001439e:	bf48      	it	mi
200143a0:	4240      	negmi	r0, r0
200143a2:	4770      	bx	lr
200143a4:	2300      	movs	r3, #0
200143a6:	3801      	subs	r0, #1
200143a8:	f6c7 73f0 	movt	r3, #32752	; 0x7ff0
200143ac:	eb72 0003 	sbcs.w	r0, r2, r3
200143b0:	bf2e      	itee	cs
200143b2:	2000      	movcs	r0, #0
200143b4:	f06f 4000 	mvncc.w	r0, #2147483648	; 0x80000000
200143b8:	ea80 70e1 	eorcc.w	r0, r0, r1, asr #31
200143bc:	4770      	bx	lr

200143be <__aeabi_memcpy>:
200143be:	f000 b800 	b.w	200143c2 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E>

200143c2 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E>:
200143c2:	b5f0      	push	{r4, r5, r6, r7, lr}
200143c4:	af03      	add	r7, sp, #12
200143c6:	e92d 0700 	stmdb	sp!, {r8, r9, sl}
200143ca:	2a10      	cmp	r2, #16
200143cc:	d363      	bcc.n	20014496 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0xd4>
200143ce:	4243      	negs	r3, r0
200143d0:	f013 0403 	ands.w	r4, r3, #3
200143d4:	eb00 0c04 	add.w	ip, r0, r4
200143d8:	d016      	beq.n	20014408 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x46>
200143da:	4603      	mov	r3, r0
200143dc:	460e      	mov	r6, r1
200143de:	7835      	ldrb	r5, [r6, #0]
200143e0:	f803 5b01 	strb.w	r5, [r3], #1
200143e4:	4563      	cmp	r3, ip
200143e6:	d20f      	bcs.n	20014408 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x46>
200143e8:	7875      	ldrb	r5, [r6, #1]
200143ea:	f803 5b01 	strb.w	r5, [r3], #1
200143ee:	4563      	cmp	r3, ip
200143f0:	bf3e      	ittt	cc
200143f2:	78b5      	ldrbcc	r5, [r6, #2]
200143f4:	f803 5b01 	strbcc.w	r5, [r3], #1
200143f8:	4563      	cmpcc	r3, ip
200143fa:	d205      	bcs.n	20014408 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x46>
200143fc:	78f5      	ldrb	r5, [r6, #3]
200143fe:	3604      	adds	r6, #4
20014400:	f803 5b01 	strb.w	r5, [r3], #1
20014404:	4563      	cmp	r3, ip
20014406:	d3ea      	bcc.n	200143de <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x1c>
20014408:	eba2 0e04 	sub.w	lr, r2, r4
2001440c:	eb01 0904 	add.w	r9, r1, r4
20014410:	f02e 0803 	bic.w	r8, lr, #3
20014414:	eb0c 0308 	add.w	r3, ip, r8
20014418:	ea5f 7189 	movs.w	r1, r9, lsl #30
2001441c:	d03e      	beq.n	2001449c <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0xda>
2001441e:	f1b8 0f01 	cmp.w	r8, #1
20014422:	db54      	blt.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
20014424:	2118      	movs	r1, #24
20014426:	f029 0203 	bic.w	r2, r9, #3
2001442a:	ea01 0ac9 	and.w	sl, r1, r9, lsl #3
2001442e:	ea4f 01c9 	mov.w	r1, r9, lsl #3
20014432:	f102 0508 	add.w	r5, r2, #8
20014436:	4249      	negs	r1, r1
20014438:	6812      	ldr	r2, [r2, #0]
2001443a:	f001 0618 	and.w	r6, r1, #24
2001443e:	f855 1c04 	ldr.w	r1, [r5, #-4]
20014442:	fa22 f20a 	lsr.w	r2, r2, sl
20014446:	fa01 f406 	lsl.w	r4, r1, r6
2001444a:	4322      	orrs	r2, r4
2001444c:	f84c 2b04 	str.w	r2, [ip], #4
20014450:	459c      	cmp	ip, r3
20014452:	d23c      	bcs.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
20014454:	682a      	ldr	r2, [r5, #0]
20014456:	fa21 f10a 	lsr.w	r1, r1, sl
2001445a:	fa02 f406 	lsl.w	r4, r2, r6
2001445e:	4321      	orrs	r1, r4
20014460:	f84c 1b04 	str.w	r1, [ip], #4
20014464:	459c      	cmp	ip, r3
20014466:	bf3f      	itttt	cc
20014468:	6869      	ldrcc	r1, [r5, #4]
2001446a:	fa22 f20a 	lsrcc.w	r2, r2, sl
2001446e:	fa01 f406 	lslcc.w	r4, r1, r6
20014472:	4322      	orrcc	r2, r4
20014474:	bf3c      	itt	cc
20014476:	f84c 2b04 	strcc.w	r2, [ip], #4
2001447a:	459c      	cmpcc	ip, r3
2001447c:	d227      	bcs.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
2001447e:	68aa      	ldr	r2, [r5, #8]
20014480:	fa21 f10a 	lsr.w	r1, r1, sl
20014484:	3510      	adds	r5, #16
20014486:	fa02 f406 	lsl.w	r4, r2, r6
2001448a:	4321      	orrs	r1, r4
2001448c:	f84c 1b04 	str.w	r1, [ip], #4
20014490:	459c      	cmp	ip, r3
20014492:	d3d4      	bcc.n	2001443e <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x7c>
20014494:	e01b      	b.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
20014496:	4603      	mov	r3, r0
20014498:	b9f2      	cbnz	r2, 200144d8 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x116>
2001449a:	e033      	b.n	20014504 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x142>
2001449c:	f1b8 0f01 	cmp.w	r8, #1
200144a0:	db15      	blt.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
200144a2:	464c      	mov	r4, r9
200144a4:	6821      	ldr	r1, [r4, #0]
200144a6:	f84c 1b04 	str.w	r1, [ip], #4
200144aa:	459c      	cmp	ip, r3
200144ac:	d20f      	bcs.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
200144ae:	6861      	ldr	r1, [r4, #4]
200144b0:	f84c 1b04 	str.w	r1, [ip], #4
200144b4:	459c      	cmp	ip, r3
200144b6:	bf3e      	ittt	cc
200144b8:	68a1      	ldrcc	r1, [r4, #8]
200144ba:	f84c 1b04 	strcc.w	r1, [ip], #4
200144be:	459c      	cmpcc	ip, r3
200144c0:	d205      	bcs.n	200144ce <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x10c>
200144c2:	68e1      	ldr	r1, [r4, #12]
200144c4:	3410      	adds	r4, #16
200144c6:	f84c 1b04 	str.w	r1, [ip], #4
200144ca:	459c      	cmp	ip, r3
200144cc:	d3ea      	bcc.n	200144a4 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0xe2>
200144ce:	eb09 0108 	add.w	r1, r9, r8
200144d2:	f00e 0203 	and.w	r2, lr, #3
200144d6:	b1aa      	cbz	r2, 20014504 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x142>
200144d8:	441a      	add	r2, r3
200144da:	780e      	ldrb	r6, [r1, #0]
200144dc:	f803 6b01 	strb.w	r6, [r3], #1
200144e0:	4293      	cmp	r3, r2
200144e2:	d20f      	bcs.n	20014504 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x142>
200144e4:	784e      	ldrb	r6, [r1, #1]
200144e6:	f803 6b01 	strb.w	r6, [r3], #1
200144ea:	4293      	cmp	r3, r2
200144ec:	bf3e      	ittt	cc
200144ee:	788e      	ldrbcc	r6, [r1, #2]
200144f0:	f803 6b01 	strbcc.w	r6, [r3], #1
200144f4:	4293      	cmpcc	r3, r2
200144f6:	d205      	bcs.n	20014504 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x142>
200144f8:	78ce      	ldrb	r6, [r1, #3]
200144fa:	3104      	adds	r1, #4
200144fc:	f803 6b01 	strb.w	r6, [r3], #1
20014500:	4293      	cmp	r3, r2
20014502:	d3ea      	bcc.n	200144da <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E+0x118>
20014504:	e8bd 0700 	ldmia.w	sp!, {r8, r9, sl}
20014508:	bdf0      	pop	{r4, r5, r6, r7, pc}

2001450a <__aeabi_ddiv>:
2001450a:	b580      	push	{r7, lr}
2001450c:	466f      	mov	r7, sp
2001450e:	ec41 0b10 	vmov	d0, r0, r1
20014512:	ec43 2b11 	vmov	d1, r2, r3
20014516:	f000 f803 	bl	20014520 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE>
2001451a:	ec51 0b10 	vmov	r0, r1, d0
2001451e:	bd80      	pop	{r7, pc}

20014520 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE>:
20014520:	b5f0      	push	{r4, r5, r6, r7, lr}
20014522:	af03      	add	r7, sp, #12
20014524:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20014528:	b086      	sub	sp, #24
2001452a:	ec52 cb10 	vmov	ip, r2, d0
2001452e:	f240 76ff 	movw	r6, #2047	; 0x7ff
20014532:	ec51 5b11 	vmov	r5, r1, d1
20014536:	f04f 0a00 	mov.w	sl, #0
2001453a:	ea81 0002 	eor.w	r0, r1, r2
2001453e:	f3c2 540a 	ubfx	r4, r2, #20, #11
20014542:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
20014546:	f3c1 590a 	ubfx	r9, r1, #20, #11
2001454a:	9005      	str	r0, [sp, #20]
2001454c:	ebb9 0006 	subs.w	r0, r9, r6
20014550:	468e      	mov	lr, r1
20014552:	4693      	mov	fp, r2
20014554:	f16a 0300 	sbc.w	r3, sl, #0
20014558:	1ba6      	subs	r6, r4, r6
2001455a:	9404      	str	r4, [sp, #16]
2001455c:	f64f 0402 	movw	r4, #63490	; 0xf802
20014560:	f16a 0800 	sbc.w	r8, sl, #0
20014564:	f6cf 74ff 	movt	r4, #65535	; 0xffff
20014568:	1b36      	subs	r6, r6, r4
2001456a:	f36f 5e1f 	bfc	lr, #20, #12
2001456e:	f36f 5b1f 	bfc	fp, #20, #12
20014572:	f178 36ff 	sbcs.w	r6, r8, #4294967295	; 0xffffffff
20014576:	f0c0 8084 	bcc.w	20014682 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x162>
2001457a:	1b00      	subs	r0, r0, r4
2001457c:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
20014580:	eb73 0006 	sbcs.w	r0, r3, r6
20014584:	d37d      	bcc.n	20014682 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x162>
20014586:	462e      	mov	r6, r5
20014588:	e9cd 9c02 	strd	r9, ip, [sp, #8]
2001458c:	f44e 1980 	orr.w	r9, lr, #1048576	; 0x100000
20014590:	0d70      	lsrs	r0, r6, #21
20014592:	2400      	movs	r4, #0
20014594:	f04f 0800 	mov.w	r8, #0
20014598:	ea40 21c9 	orr.w	r1, r0, r9, lsl #11
2001459c:	f24f 3033 	movw	r0, #62259	; 0xf333
200145a0:	f2c7 5004 	movt	r0, #29956	; 0x7504
200145a4:	f8dd c00c 	ldr.w	ip, [sp, #12]
200145a8:	1a40      	subs	r0, r0, r1
200145aa:	f44b 1b80 	orr.w	fp, fp, #1048576	; 0x100000
200145ae:	9601      	str	r6, [sp, #4]
200145b0:	fba1 2300 	umull	r2, r3, r1, r0
200145b4:	f8cd 9000 	str.w	r9, [sp]
200145b8:	425a      	negs	r2, r3
200145ba:	fba2 0200 	umull	r0, r2, r2, r0
200145be:	0fc0      	lsrs	r0, r0, #31
200145c0:	ea40 0042 	orr.w	r0, r0, r2, lsl #1
200145c4:	fba0 2301 	umull	r2, r3, r0, r1
200145c8:	425a      	negs	r2, r3
200145ca:	fba0 0202 	umull	r0, r2, r0, r2
200145ce:	0fc0      	lsrs	r0, r0, #31
200145d0:	ea40 0042 	orr.w	r0, r0, r2, lsl #1
200145d4:	fba0 2301 	umull	r2, r3, r0, r1
200145d8:	425a      	negs	r2, r3
200145da:	fba0 0202 	umull	r0, r2, r0, r2
200145de:	0fc0      	lsrs	r0, r0, #31
200145e0:	ea40 0042 	orr.w	r0, r0, r2, lsl #1
200145e4:	1e42      	subs	r2, r0, #1
200145e6:	02f0      	lsls	r0, r6, #11
200145e8:	ea4f 064b 	mov.w	r6, fp, lsl #1
200145ec:	fba0 0302 	umull	r0, r3, r0, r2
200145f0:	ea46 76dc 	orr.w	r6, r6, ip, lsr #31
200145f4:	fbe1 3402 	umlal	r3, r4, r1, r2
200145f8:	f1d3 0101 	rsbs	r1, r3, #1
200145fc:	eb68 0304 	sbc.w	r3, r8, r4
20014600:	fba2 3403 	umull	r3, r4, r2, r3
20014604:	fba1 1202 	umull	r1, r2, r1, r2
20014608:	0064      	lsls	r4, r4, #1
2001460a:	ea44 74d3 	orr.w	r4, r4, r3, lsr #31
2001460e:	0fc9      	lsrs	r1, r1, #31
20014610:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
20014614:	eb11 0143 	adds.w	r1, r1, r3, lsl #1
20014618:	eb44 72d2 	adc.w	r2, r4, r2, lsr #31
2001461c:	39e1      	subs	r1, #225	; 0xe1
2001461e:	f162 0300 	sbc.w	r3, r2, #0
20014622:	ea4f 024c 	mov.w	r2, ip, lsl #1
20014626:	fba1 4002 	umull	r4, r0, r1, r2
2001462a:	2400      	movs	r4, #0
2001462c:	fbe3 0402 	umlal	r0, r4, r3, r2
20014630:	fba1 1e06 	umull	r1, lr, r1, r6
20014634:	1840      	adds	r0, r0, r1
20014636:	eb54 040e 	adcs.w	r4, r4, lr
2001463a:	9802      	ldr	r0, [sp, #8]
2001463c:	f148 0100 	adc.w	r1, r8, #0
20014640:	fbe3 4106 	umlal	r4, r1, r3, r6
20014644:	9b04      	ldr	r3, [sp, #16]
20014646:	1a18      	subs	r0, r3, r0
20014648:	f168 0300 	sbc.w	r3, r8, #0
2001464c:	eb10 000a 	adds.w	r0, r0, sl
20014650:	eb43 75ea 	adc.w	r5, r3, sl, asr #31
20014654:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
20014658:	d225      	bcs.n	200146a6 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x186>
2001465a:	f8dd 8004 	ldr.w	r8, [sp, #4]
2001465e:	46b3      	mov	fp, r6
20014660:	fba8 e304 	umull	lr, r3, r8, r4
20014664:	fb08 3301 	mla	r3, r8, r1, r3
20014668:	f1de 0a00 	rsbs	sl, lr, #0
2001466c:	fb09 3904 	mla	r9, r9, r4, r3
20014670:	ea4f 534c 	mov.w	r3, ip, lsl #21
20014674:	4694      	mov	ip, r2
20014676:	eb63 0e09 	sbc.w	lr, r3, r9
2001467a:	f240 33fe 	movw	r3, #1022	; 0x3fe
2001467e:	18c0      	adds	r0, r0, r3
20014680:	e026      	b.n	200146d0 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x1b0>
20014682:	2400      	movs	r4, #0
20014684:	f022 4000 	bic.w	r0, r2, #2147483648	; 0x80000000
20014688:	f1dc 0300 	rsbs	r3, ip, #0
2001468c:	f6c7 74f0 	movt	r4, #32752	; 0x7ff0
20014690:	eb74 0300 	sbcs.w	r3, r4, r0
20014694:	d23f      	bcs.n	20014716 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x1f6>
20014696:	f442 2000 	orr.w	r0, r2, #524288	; 0x80000
2001469a:	ec40 cb10 	vmov	d0, ip, r0
2001469e:	b006      	add	sp, #24
200146a0:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200146a4:	bdf0      	pop	{r4, r5, r6, r7, pc}
200146a6:	f8dd 8004 	ldr.w	r8, [sp, #4]
200146aa:	ea5f 0151 	movs.w	r1, r1, lsr #1
200146ae:	ea4f 0434 	mov.w	r4, r4, rrx
200146b2:	ea4f 560c 	mov.w	r6, ip, lsl #20
200146b6:	fba4 2308 	umull	r2, r3, r4, r8
200146ba:	fb04 3309 	mla	r3, r4, r9, r3
200146be:	f1d2 0a00 	rsbs	sl, r2, #0
200146c2:	f240 32ff 	movw	r2, #1023	; 0x3ff
200146c6:	fb01 3308 	mla	r3, r1, r8, r3
200146ca:	eb66 0e03 	sbc.w	lr, r6, r3
200146ce:	1880      	adds	r0, r0, r2
200146d0:	f145 0500 	adc.w	r5, r5, #0
200146d4:	f240 73fe 	movw	r3, #2046	; 0x7fe
200146d8:	2200      	movs	r2, #0
200146da:	1a1b      	subs	r3, r3, r0
200146dc:	eb72 0305 	sbcs.w	r3, r2, r5
200146e0:	da0a      	bge.n	200146f8 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x1d8>
200146e2:	9805      	ldr	r0, [sp, #20]
200146e4:	f040 40e0 	orr.w	r0, r0, #1879048192	; 0x70000000
200146e8:	f040 607f 	orr.w	r0, r0, #267386880	; 0xff00000
200146ec:	ec40 2b10 	vmov	d0, r2, r0
200146f0:	b006      	add	sp, #24
200146f2:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200146f6:	bdf0      	pop	{r4, r5, r6, r7, pc}
200146f8:	4243      	negs	r3, r0
200146fa:	41aa      	sbcs	r2, r5
200146fc:	da2a      	bge.n	20014754 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x234>
200146fe:	ea4f 024e 	mov.w	r2, lr, lsl #1
20014702:	f36f 511f 	bfc	r1, #20, #12
20014706:	9d00      	ldr	r5, [sp, #0]
20014708:	ea41 5100 	orr.w	r1, r1, r0, lsl #20
2001470c:	ea42 72da 	orr.w	r2, r2, sl, lsr #31
20014710:	ea4f 004a 	mov.w	r0, sl, lsl #1
20014714:	e05a      	b.n	200147cc <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x2ac>
20014716:	f021 4200 	bic.w	r2, r1, #2147483648	; 0x80000000
2001471a:	426b      	negs	r3, r5
2001471c:	462e      	mov	r6, r5
2001471e:	eb74 0302 	sbcs.w	r3, r4, r2
20014722:	d207      	bcs.n	20014734 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x214>
20014724:	f441 2000 	orr.w	r0, r1, #524288	; 0x80000
20014728:	ec40 6b10 	vmov	d0, r6, r0
2001472c:	b006      	add	sp, #24
2001472e:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014732:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014734:	ea80 0104 	eor.w	r1, r0, r4
20014738:	ea51 010c 	orrs.w	r1, r1, ip
2001473c:	d162      	bne.n	20014804 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x2e4>
2001473e:	ea82 0004 	eor.w	r0, r2, r4
20014742:	4330      	orrs	r0, r6
20014744:	f040 80bd 	bne.w	200148c2 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x3a2>
20014748:	ed9f 0b6b 	vldr	d0, [pc, #428]	; 200148f8 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x3d8>
2001474c:	b006      	add	sp, #24
2001474e:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014752:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014754:	f06f 0233 	mvn.w	r2, #51	; 0x33
20014758:	1a82      	subs	r2, r0, r2
2001475a:	f175 32ff 	sbcs.w	r2, r5, #4294967295	; 0xffffffff
2001475e:	db55      	blt.n	2001480c <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x2ec>
20014760:	f1c0 0201 	rsb	r2, r0, #1
20014764:	f1c2 0620 	rsb	r6, r2, #32
20014768:	fa24 f302 	lsr.w	r3, r4, r2
2001476c:	fa01 f606 	lsl.w	r6, r1, r6
20014770:	ea43 0406 	orr.w	r4, r3, r6
20014774:	f06f 031e 	mvn.w	r3, #30
20014778:	1a1b      	subs	r3, r3, r0
2001477a:	bf58      	it	pl
2001477c:	fa21 f403 	lsrpl.w	r4, r1, r3
20014780:	4663      	mov	r3, ip
20014782:	fba8 c604 	umull	ip, r6, r8, r4
20014786:	fa21 f102 	lsr.w	r1, r1, r2
2001478a:	bf58      	it	pl
2001478c:	2100      	movpl	r1, #0
2001478e:	9d00      	ldr	r5, [sp, #0]
20014790:	fb08 6201 	mla	r2, r8, r1, r6
20014794:	f100 0634 	add.w	r6, r0, #52	; 0x34
20014798:	fa0b f906 	lsl.w	r9, fp, r6
2001479c:	fb05 2204 	mla	r2, r5, r4, r2
200147a0:	0052      	lsls	r2, r2, #1
200147a2:	ea42 7edc 	orr.w	lr, r2, ip, lsr #31
200147a6:	f06f 0213 	mvn.w	r2, #19
200147aa:	1a12      	subs	r2, r2, r0
200147ac:	3014      	adds	r0, #20
200147ae:	fa23 f202 	lsr.w	r2, r3, r2
200147b2:	ea42 0209 	orr.w	r2, r2, r9
200147b6:	bf58      	it	pl
200147b8:	fa03 f200 	lslpl.w	r2, r3, r0
200147bc:	fa03 f006 	lsl.w	r0, r3, r6
200147c0:	bf58      	it	pl
200147c2:	2000      	movpl	r0, #0
200147c4:	ebb0 004c 	subs.w	r0, r0, ip, lsl #1
200147c8:	eb62 020e 	sbc.w	r2, r2, lr
200147cc:	f004 0301 	and.w	r3, r4, #1
200147d0:	18c0      	adds	r0, r0, r3
200147d2:	f04f 0300 	mov.w	r3, #0
200147d6:	f142 0200 	adc.w	r2, r2, #0
200147da:	ebb8 0000 	subs.w	r0, r8, r0
200147de:	eb75 0002 	sbcs.w	r0, r5, r2
200147e2:	bf38      	it	cc
200147e4:	2301      	movcc	r3, #1
200147e6:	1c60      	adds	r0, r4, #1
200147e8:	f141 0200 	adc.w	r2, r1, #0
200147ec:	2b00      	cmp	r3, #0
200147ee:	bf04      	itt	eq
200147f0:	4620      	moveq	r0, r4
200147f2:	460a      	moveq	r2, r1
200147f4:	9905      	ldr	r1, [sp, #20]
200147f6:	4311      	orrs	r1, r2
200147f8:	ec41 0b10 	vmov	d0, r0, r1
200147fc:	b006      	add	sp, #24
200147fe:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014802:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014804:	ea82 0104 	eor.w	r1, r2, r4
20014808:	4331      	orrs	r1, r6
2001480a:	d107      	bne.n	2001481c <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x2fc>
2001480c:	9905      	ldr	r1, [sp, #20]
2001480e:	2000      	movs	r0, #0
20014810:	ec41 0b10 	vmov	d0, r0, r1
20014814:	b006      	add	sp, #24
20014816:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
2001481a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2001481c:	ea5c 0100 	orrs.w	r1, ip, r0
20014820:	d058      	beq.n	200148d4 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x3b4>
20014822:	ea56 0102 	orrs.w	r1, r6, r2
20014826:	d04c      	beq.n	200148c2 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x3a2>
20014828:	2100      	movs	r1, #0
2001482a:	f5b0 1f80 	cmp.w	r0, #1048576	; 0x100000
2001482e:	d220      	bcs.n	20014872 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x352>
20014830:	fabc f08c 	clz	r0, ip
20014834:	f1bb 0f00 	cmp.w	fp, #0
20014838:	f100 0020 	add.w	r0, r0, #32
2001483c:	bf18      	it	ne
2001483e:	fabb f08b 	clzne	r0, fp
20014842:	f100 0335 	add.w	r3, r0, #53	; 0x35
20014846:	f003 033f 	and.w	r3, r3, #63	; 0x3f
2001484a:	f1c0 0a0c 	rsb	sl, r0, #12
2001484e:	f1c3 0520 	rsb	r5, r3, #32
20014852:	fa0b f403 	lsl.w	r4, fp, r3
20014856:	fa2c f505 	lsr.w	r5, ip, r5
2001485a:	ea45 0b04 	orr.w	fp, r5, r4
2001485e:	f1b3 0420 	subs.w	r4, r3, #32
20014862:	bf58      	it	pl
20014864:	fa0c fb04 	lslpl.w	fp, ip, r4
20014868:	fa0c fc03 	lsl.w	ip, ip, r3
2001486c:	bf58      	it	pl
2001486e:	f04f 0c00 	movpl.w	ip, #0
20014872:	ebb1 5f12 	cmp.w	r1, r2, lsr #20
20014876:	e9cd 9c02 	strd	r9, ip, [sp, #8]
2001487a:	f47f ae87 	bne.w	2001458c <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x6c>
2001487e:	fab6 f086 	clz	r0, r6
20014882:	f1be 0f00 	cmp.w	lr, #0
20014886:	f100 0020 	add.w	r0, r0, #32
2001488a:	bf18      	it	ne
2001488c:	fabe f08e 	clzne	r0, lr
20014890:	f100 0135 	add.w	r1, r0, #53	; 0x35
20014894:	f001 013f 	and.w	r1, r1, #63	; 0x3f
20014898:	4450      	add	r0, sl
2001489a:	f1c1 0320 	rsb	r3, r1, #32
2001489e:	f1a0 0a0c 	sub.w	sl, r0, #12
200148a2:	fa0e f201 	lsl.w	r2, lr, r1
200148a6:	fa26 f303 	lsr.w	r3, r6, r3
200148aa:	ea43 0e02 	orr.w	lr, r3, r2
200148ae:	f1b1 0220 	subs.w	r2, r1, #32
200148b2:	bf58      	it	pl
200148b4:	fa06 fe02 	lslpl.w	lr, r6, r2
200148b8:	fa06 f601 	lsl.w	r6, r6, r1
200148bc:	bf58      	it	pl
200148be:	2600      	movpl	r6, #0
200148c0:	e664      	b.n	2001458c <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x6c>
200148c2:	9805      	ldr	r0, [sp, #20]
200148c4:	2100      	movs	r1, #0
200148c6:	4320      	orrs	r0, r4
200148c8:	ec40 1b10 	vmov	d0, r1, r0
200148cc:	b006      	add	sp, #24
200148ce:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200148d2:	bdf0      	pop	{r4, r5, r6, r7, pc}
200148d4:	ed9f 0b08 	vldr	d0, [pc, #32]	; 200148f8 <_ZN17compiler_builtins5float3div8__divdf317h5c7182983dd371afE+0x3d8>
200148d8:	ea56 0102 	orrs.w	r1, r6, r2
200148dc:	f04f 0000 	mov.w	r0, #0
200148e0:	9b05      	ldr	r3, [sp, #20]
200148e2:	ec51 2b10 	vmov	r2, r1, d0
200148e6:	bf1c      	itt	ne
200148e8:	4619      	movne	r1, r3
200148ea:	4602      	movne	r2, r0
200148ec:	ec41 2b10 	vmov	d0, r2, r1
200148f0:	b006      	add	sp, #24
200148f2:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200148f6:	bdf0      	pop	{r4, r5, r6, r7, pc}
200148f8:	00000000 	andeq	r0, r0, r0
200148fc:	7ff80000 	svcvc	0x00f80000

20014900 <__aeabi_i2d>:
20014900:	2800      	cmp	r0, #0
20014902:	d024      	beq.n	2001494e <__aeabi_i2d+0x4e>
20014904:	4601      	mov	r1, r0
20014906:	bf48      	it	mi
20014908:	4241      	negmi	r1, r0
2001490a:	b580      	push	{r7, lr}
2001490c:	466f      	mov	r7, sp
2001490e:	fab1 f281 	clz	r2, r1
20014912:	f1c2 030b 	rsb	r3, r2, #11
20014916:	f1b2 0e0b 	subs.w	lr, r2, #11
2001491a:	fa21 fc03 	lsr.w	ip, r1, r3
2001491e:	f240 431d 	movw	r3, #1053	; 0x41d
20014922:	eba3 0302 	sub.w	r3, r3, r2
20014926:	bf58      	it	pl
20014928:	fa01 fc0e 	lslpl.w	ip, r1, lr
2001492c:	3215      	adds	r2, #21
2001492e:	f1be 0f00 	cmp.w	lr, #0
20014932:	eb0c 5c03 	add.w	ip, ip, r3, lsl #20
20014936:	fa01 f202 	lsl.w	r2, r1, r2
2001493a:	bf58      	it	pl
2001493c:	2200      	movpl	r2, #0
2001493e:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
20014942:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
20014946:	ea4c 0100 	orr.w	r1, ip, r0
2001494a:	4610      	mov	r0, r2
2001494c:	4770      	bx	lr
2001494e:	2200      	movs	r2, #0
20014950:	f04f 0c00 	mov.w	ip, #0
20014954:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
20014958:	ea4c 0100 	orr.w	r1, ip, r0
2001495c:	4610      	mov	r0, r2
2001495e:	4770      	bx	lr

20014960 <__aeabi_memcpy8>:
20014960:	2a04      	cmp	r2, #4
20014962:	d318      	bcc.n	20014996 <__aeabi_memcpy8+0x36>
20014964:	b5b0      	push	{r4, r5, r7, lr}
20014966:	af02      	add	r7, sp, #8
20014968:	f1a2 0e04 	sub.w	lr, r2, #4
2001496c:	2301      	movs	r3, #1
2001496e:	eb03 039e 	add.w	r3, r3, lr, lsr #2
20014972:	f013 0403 	ands.w	r4, r3, #3
20014976:	d014      	beq.n	200149a2 <__aeabi_memcpy8+0x42>
20014978:	460b      	mov	r3, r1
2001497a:	4684      	mov	ip, r0
2001497c:	f853 5b04 	ldr.w	r5, [r3], #4
20014980:	2c01      	cmp	r4, #1
20014982:	f84c 5b04 	str.w	r5, [ip], #4
20014986:	d110      	bne.n	200149aa <__aeabi_memcpy8+0x4a>
20014988:	4660      	mov	r0, ip
2001498a:	4619      	mov	r1, r3
2001498c:	4672      	mov	r2, lr
2001498e:	f1be 0f0c 	cmp.w	lr, #12
20014992:	d21c      	bcs.n	200149ce <__aeabi_memcpy8+0x6e>
20014994:	e030      	b.n	200149f8 <__aeabi_memcpy8+0x98>
20014996:	460b      	mov	r3, r1
20014998:	4684      	mov	ip, r0
2001499a:	4660      	mov	r0, ip
2001499c:	4619      	mov	r1, r3
2001499e:	f7ff bd10 	b.w	200143c2 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E>
200149a2:	f1be 0f0c 	cmp.w	lr, #12
200149a6:	d212      	bcs.n	200149ce <__aeabi_memcpy8+0x6e>
200149a8:	e026      	b.n	200149f8 <__aeabi_memcpy8+0x98>
200149aa:	684b      	ldr	r3, [r1, #4]
200149ac:	2c02      	cmp	r4, #2
200149ae:	6043      	str	r3, [r0, #4]
200149b0:	d103      	bne.n	200149ba <__aeabi_memcpy8+0x5a>
200149b2:	3a08      	subs	r2, #8
200149b4:	3108      	adds	r1, #8
200149b6:	3008      	adds	r0, #8
200149b8:	e004      	b.n	200149c4 <__aeabi_memcpy8+0x64>
200149ba:	688b      	ldr	r3, [r1, #8]
200149bc:	3a0c      	subs	r2, #12
200149be:	6083      	str	r3, [r0, #8]
200149c0:	310c      	adds	r1, #12
200149c2:	300c      	adds	r0, #12
200149c4:	4684      	mov	ip, r0
200149c6:	460b      	mov	r3, r1
200149c8:	f1be 0f0c 	cmp.w	lr, #12
200149cc:	d314      	bcc.n	200149f8 <__aeabi_memcpy8+0x98>
200149ce:	4684      	mov	ip, r0
200149d0:	460b      	mov	r3, r1
200149d2:	6818      	ldr	r0, [r3, #0]
200149d4:	3a10      	subs	r2, #16
200149d6:	f8cc 0000 	str.w	r0, [ip]
200149da:	2a03      	cmp	r2, #3
200149dc:	6858      	ldr	r0, [r3, #4]
200149de:	f8cc 0004 	str.w	r0, [ip, #4]
200149e2:	6898      	ldr	r0, [r3, #8]
200149e4:	f8cc 0008 	str.w	r0, [ip, #8]
200149e8:	68d8      	ldr	r0, [r3, #12]
200149ea:	f103 0310 	add.w	r3, r3, #16
200149ee:	f8cc 000c 	str.w	r0, [ip, #12]
200149f2:	f10c 0c10 	add.w	ip, ip, #16
200149f6:	d8ec      	bhi.n	200149d2 <__aeabi_memcpy8+0x72>
200149f8:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
200149fc:	4660      	mov	r0, ip
200149fe:	4619      	mov	r1, r3
20014a00:	f7ff bcdf 	b.w	200143c2 <_ZN17compiler_builtins3mem6memcpy17hffbb2ceee3afb0e6E>

20014a04 <__aeabi_dcmplt>:
20014a04:	b5f0      	push	{r4, r5, r6, r7, lr}
20014a06:	af03      	add	r7, sp, #12
20014a08:	f84d bd04 	str.w	fp, [sp, #-4]!
20014a0c:	4684      	mov	ip, r0
20014a0e:	2400      	movs	r4, #0
20014a10:	f021 4e00 	bic.w	lr, r1, #2147483648	; 0x80000000
20014a14:	f1dc 0500 	rsbs	r5, ip, #0
20014a18:	f6c7 74f0 	movt	r4, #32752	; 0x7ff0
20014a1c:	f04f 0000 	mov.w	r0, #0
20014a20:	eb74 050e 	sbcs.w	r5, r4, lr
20014a24:	d316      	bcc.n	20014a54 <__aeabi_dcmplt+0x50>
20014a26:	f023 4500 	bic.w	r5, r3, #2147483648	; 0x80000000
20014a2a:	4256      	negs	r6, r2
20014a2c:	41ac      	sbcs	r4, r5
20014a2e:	d311      	bcc.n	20014a54 <__aeabi_dcmplt+0x50>
20014a30:	ea42 040c 	orr.w	r4, r2, ip
20014a34:	ea45 060e 	orr.w	r6, r5, lr
20014a38:	4326      	orrs	r6, r4
20014a3a:	d00b      	beq.n	20014a54 <__aeabi_dcmplt+0x50>
20014a3c:	ea03 0001 	and.w	r0, r3, r1
20014a40:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
20014a44:	dd09      	ble.n	20014a5a <__aeabi_dcmplt+0x56>
20014a46:	ebbc 0202 	subs.w	r2, ip, r2
20014a4a:	f04f 0000 	mov.w	r0, #0
20014a4e:	4199      	sbcs	r1, r3
20014a50:	bfb8      	it	lt
20014a52:	2001      	movlt	r0, #1
20014a54:	f85d bb04 	ldr.w	fp, [sp], #4
20014a58:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014a5a:	ebb2 020c 	subs.w	r2, r2, ip
20014a5e:	f04f 0000 	mov.w	r0, #0
20014a62:	eb73 0101 	sbcs.w	r1, r3, r1
20014a66:	bfb8      	it	lt
20014a68:	2001      	movlt	r0, #1
20014a6a:	f85d bb04 	ldr.w	fp, [sp], #4
20014a6e:	bdf0      	pop	{r4, r5, r6, r7, pc}

20014a70 <__aeabi_dcmpeq>:
20014a70:	b5f0      	push	{r4, r5, r6, r7, lr}
20014a72:	af03      	add	r7, sp, #12
20014a74:	f84d bd04 	str.w	fp, [sp, #-4]!
20014a78:	2500      	movs	r5, #0
20014a7a:	f021 4e00 	bic.w	lr, r1, #2147483648	; 0x80000000
20014a7e:	4244      	negs	r4, r0
20014a80:	f6c7 75f0 	movt	r5, #32752	; 0x7ff0
20014a84:	f04f 0c00 	mov.w	ip, #0
20014a88:	eb75 040e 	sbcs.w	r4, r5, lr
20014a8c:	d314      	bcc.n	20014ab8 <__aeabi_dcmpeq+0x48>
20014a8e:	f023 4400 	bic.w	r4, r3, #2147483648	; 0x80000000
20014a92:	4256      	negs	r6, r2
20014a94:	41a5      	sbcs	r5, r4
20014a96:	d30f      	bcc.n	20014ab8 <__aeabi_dcmpeq+0x48>
20014a98:	4059      	eors	r1, r3
20014a9a:	ea80 0302 	eor.w	r3, r0, r2
20014a9e:	4310      	orrs	r0, r2
20014aa0:	ea44 020e 	orr.w	r2, r4, lr
20014aa4:	4319      	orrs	r1, r3
20014aa6:	4310      	orrs	r0, r2
20014aa8:	fab1 f181 	clz	r1, r1
20014aac:	fab0 f080 	clz	r0, r0
20014ab0:	0940      	lsrs	r0, r0, #5
20014ab2:	0949      	lsrs	r1, r1, #5
20014ab4:	ea41 0c00 	orr.w	ip, r1, r0
20014ab8:	4660      	mov	r0, ip
20014aba:	f85d bb04 	ldr.w	fp, [sp], #4
20014abe:	bdf0      	pop	{r4, r5, r6, r7, pc}

20014ac0 <__aeabi_ui2d>:
20014ac0:	2800      	cmp	r0, #0
20014ac2:	bf02      	ittt	eq
20014ac4:	ed9f 0b10 	vldreq	d0, [pc, #64]	; 20014b08 <__aeabi_ui2d+0x48>
20014ac8:	ec51 0b10 	vmoveq	r0, r1, d0
20014acc:	4770      	bxeq	lr
20014ace:	fab0 f180 	clz	r1, r0
20014ad2:	f240 421d 	movw	r2, #1053	; 0x41d
20014ad6:	f1c1 030b 	rsb	r3, r1, #11
20014ada:	1a52      	subs	r2, r2, r1
20014adc:	f1b1 0c0b 	subs.w	ip, r1, #11
20014ae0:	f101 0115 	add.w	r1, r1, #21
20014ae4:	fa20 f303 	lsr.w	r3, r0, r3
20014ae8:	bf58      	it	pl
20014aea:	fa00 f30c 	lslpl.w	r3, r0, ip
20014aee:	eb03 5202 	add.w	r2, r3, r2, lsl #20
20014af2:	4088      	lsls	r0, r1
20014af4:	f1bc 0f00 	cmp.w	ip, #0
20014af8:	bf58      	it	pl
20014afa:	2000      	movpl	r0, #0
20014afc:	ec42 0b10 	vmov	d0, r0, r2
20014b00:	ec51 0b10 	vmov	r0, r1, d0
20014b04:	4770      	bx	lr
20014b06:	bf00      	nop
	...

20014b10 <__aeabi_d2f>:
20014b10:	f021 4300 	bic.w	r3, r1, #2147483648	; 0x80000000
20014b14:	f103 4230 	add.w	r2, r3, #2952790016	; 0xb0000000
20014b18:	f102 6c01 	add.w	ip, r2, #135266304	; 0x8100000
20014b1c:	f103 4240 	add.w	r2, r3, #3221225472	; 0xc0000000
20014b20:	f102 62fe 	add.w	r2, r2, #133169152	; 0x7f00000
20014b24:	4562      	cmp	r2, ip
20014b26:	d20e      	bcs.n	20014b46 <__aeabi_d2f+0x36>
20014b28:	0f42      	lsrs	r2, r0, #29
20014b2a:	f020 4060 	bic.w	r0, r0, #3758096384	; 0xe0000000
20014b2e:	ea42 02c3 	orr.w	r2, r2, r3, lsl #3
20014b32:	f1b0 5f80 	cmp.w	r0, #268435456	; 0x10000000
20014b36:	d919      	bls.n	20014b6c <__aeabi_d2f+0x5c>
20014b38:	f102 4080 	add.w	r0, r2, #1073741824	; 0x40000000
20014b3c:	3001      	adds	r0, #1
20014b3e:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014b42:	4308      	orrs	r0, r1
20014b44:	4770      	bx	lr
20014b46:	f240 0c00 	movw	ip, #0
20014b4a:	4242      	negs	r2, r0
20014b4c:	f6c7 7cf0 	movt	ip, #32752	; 0x7ff0
20014b50:	eb7c 0203 	sbcs.w	r2, ip, r3
20014b54:	d214      	bcs.n	20014b80 <__aeabi_d2f+0x70>
20014b56:	0f40      	lsrs	r0, r0, #29
20014b58:	f240 12ff 	movw	r2, #511	; 0x1ff
20014b5c:	ea40 00c3 	orr.w	r0, r0, r3, lsl #3
20014b60:	f362 509f 	bfi	r0, r2, #22, #10
20014b64:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014b68:	4308      	orrs	r0, r1
20014b6a:	4770      	bx	lr
20014b6c:	f102 4080 	add.w	r0, r2, #1073741824	; 0x40000000
20014b70:	bf04      	itt	eq
20014b72:	f002 0201 	andeq.w	r2, r2, #1
20014b76:	4410      	addeq	r0, r2
20014b78:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014b7c:	4308      	orrs	r0, r1
20014b7e:	4770      	bx	lr
20014b80:	f64f 72ff 	movw	r2, #65535	; 0xffff
20014b84:	f2c4 72ef 	movt	r2, #18415	; 0x47ef
20014b88:	4293      	cmp	r3, r2
20014b8a:	d905      	bls.n	20014b98 <__aeabi_d2f+0x88>
20014b8c:	f04f 40ff 	mov.w	r0, #2139095040	; 0x7f800000
20014b90:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014b94:	4308      	orrs	r0, r1
20014b96:	4770      	bx	lr
20014b98:	f240 3281 	movw	r2, #897	; 0x381
20014b9c:	eba2 5213 	sub.w	r2, r2, r3, lsr #20
20014ba0:	2a34      	cmp	r2, #52	; 0x34
20014ba2:	d904      	bls.n	20014bae <__aeabi_d2f+0x9e>
20014ba4:	2000      	movs	r0, #0
20014ba6:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014baa:	4308      	orrs	r0, r1
20014bac:	4770      	bx	lr
20014bae:	b5f0      	push	{r4, r5, r6, r7, lr}
20014bb0:	af03      	add	r7, sp, #12
20014bb2:	f84d 8d04 	str.w	r8, [sp, #-4]!
20014bb6:	f04f 0e01 	mov.w	lr, #1
20014bba:	460c      	mov	r4, r1
20014bbc:	ea4f 5c13 	mov.w	ip, r3, lsr #20
20014bc0:	f36e 541f 	bfi	r4, lr, #20, #12
20014bc4:	f1c2 0320 	rsb	r3, r2, #32
20014bc8:	fa20 f502 	lsr.w	r5, r0, r2
20014bcc:	f1b2 0e20 	subs.w	lr, r2, #32
20014bd0:	fa24 f202 	lsr.w	r2, r4, r2
20014bd4:	fa04 f303 	lsl.w	r3, r4, r3
20014bd8:	ea45 0803 	orr.w	r8, r5, r3
20014bdc:	f1ac 0501 	sub.w	r5, ip, #1
20014be0:	bf58      	it	pl
20014be2:	fa24 f80e 	lsrpl.w	r8, r4, lr
20014be6:	f005 053f 	and.w	r5, r5, #63	; 0x3f
20014bea:	f1c5 0320 	rsb	r3, r5, #32
20014bee:	f1b5 0620 	subs.w	r6, r5, #32
20014bf2:	fa20 fc03 	lsr.w	ip, r0, r3
20014bf6:	fa04 f305 	lsl.w	r3, r4, r5
20014bfa:	ea43 030c 	orr.w	r3, r3, ip
20014bfe:	bf58      	it	pl
20014c00:	fa00 f306 	lslpl.w	r3, r0, r6
20014c04:	fa00 f005 	lsl.w	r0, r0, r5
20014c08:	bf58      	it	pl
20014c0a:	2000      	movpl	r0, #0
20014c0c:	4318      	orrs	r0, r3
20014c0e:	bf18      	it	ne
20014c10:	2001      	movne	r0, #1
20014c12:	f1be 0f00 	cmp.w	lr, #0
20014c16:	ea40 0008 	orr.w	r0, r0, r8
20014c1a:	bf58      	it	pl
20014c1c:	2200      	movpl	r2, #0
20014c1e:	f020 4360 	bic.w	r3, r0, #3758096384	; 0xe0000000
20014c22:	ea4f 7058 	mov.w	r0, r8, lsr #29
20014c26:	ea40 00c2 	orr.w	r0, r0, r2, lsl #3
20014c2a:	f1b3 5f80 	cmp.w	r3, #268435456	; 0x10000000
20014c2e:	f85d 8b04 	ldr.w	r8, [sp], #4
20014c32:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
20014c36:	d904      	bls.n	20014c42 <__aeabi_d2f+0x132>
20014c38:	3001      	adds	r0, #1
20014c3a:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014c3e:	4308      	orrs	r0, r1
20014c40:	4770      	bx	lr
20014c42:	bf04      	itt	eq
20014c44:	f000 0201 	andeq.w	r2, r0, #1
20014c48:	4410      	addeq	r0, r2
20014c4a:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
20014c4e:	4308      	orrs	r0, r1
20014c50:	4770      	bx	lr

20014c52 <__aeabi_dsub>:
20014c52:	b082      	sub	sp, #8
20014c54:	ec43 2b10 	vmov	d0, r2, r3
20014c58:	ed8d 0b00 	vstr	d0, [sp]
20014c5c:	f89d 3007 	ldrb.w	r3, [sp, #7]
20014c60:	9a00      	ldr	r2, [sp, #0]
20014c62:	f083 0380 	eor.w	r3, r3, #128	; 0x80
20014c66:	f88d 3007 	strb.w	r3, [sp, #7]
20014c6a:	9b01      	ldr	r3, [sp, #4]
20014c6c:	b002      	add	sp, #8
20014c6e:	f000 b803 	b.w	20014c78 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E>
20014c72:	d4d4      	bmi.n	20014c1e <__aeabi_d2f+0x10e>
20014c74:	d4d4      	bmi.n	20014c20 <__aeabi_d2f+0x110>
20014c76:	d4d4      	bmi.n	20014c22 <__aeabi_d2f+0x112>

20014c78 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E>:
20014c78:	b5f0      	push	{r4, r5, r6, r7, lr}
20014c7a:	af03      	add	r7, sp, #12
20014c7c:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20014c80:	f240 0900 	movw	r9, #0
20014c84:	f021 4500 	bic.w	r5, r1, #2147483648	; 0x80000000
20014c88:	f2c8 0910 	movt	r9, #32784	; 0x8010
20014c8c:	ec43 2b11 	vmov	d1, r2, r3
20014c90:	ec41 0b10 	vmov	d0, r0, r1
20014c94:	f023 4800 	bic.w	r8, r3, #2147483648	; 0x80000000
20014c98:	eb05 0609 	add.w	r6, r5, r9
20014c9c:	1e44      	subs	r4, r0, #1
20014c9e:	f04f 0c01 	mov.w	ip, #1
20014ca2:	eb76 0609 	sbcs.w	r6, r6, r9
20014ca6:	d366      	bcc.n	20014d76 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0xfe>
20014ca8:	eb08 0609 	add.w	r6, r8, r9
20014cac:	ebb2 040c 	subs.w	r4, r2, ip
20014cb0:	eb76 0609 	sbcs.w	r6, r6, r9
20014cb4:	d35f      	bcc.n	20014d76 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0xfe>
20014cb6:	1a84      	subs	r4, r0, r2
20014cb8:	f04f 0600 	mov.w	r6, #0
20014cbc:	eb75 0508 	sbcs.w	r5, r5, r8
20014cc0:	4696      	mov	lr, r2
20014cc2:	461c      	mov	r4, r3
20014cc4:	4688      	mov	r8, r1
20014cc6:	bf38      	it	cc
20014cc8:	2601      	movcc	r6, #1
20014cca:	2e00      	cmp	r6, #0
20014ccc:	bf1f      	itttt	ne
20014cce:	4686      	movne	lr, r0
20014cd0:	4610      	movne	r0, r2
20014cd2:	460c      	movne	r4, r1
20014cd4:	4698      	movne	r8, r3
20014cd6:	4645      	mov	r5, r8
20014cd8:	f3c8 5c0a 	ubfx	ip, r8, #20, #11
20014cdc:	f36f 551f 	bfc	r5, #20, #12
20014ce0:	f3c4 590a 	ubfx	r9, r4, #20, #11
20014ce4:	f1bc 0f00 	cmp.w	ip, #0
20014ce8:	d064      	beq.n	20014db4 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x13c>
20014cea:	f36f 541f 	bfc	r4, #20, #12
20014cee:	f1b9 0f00 	cmp.w	r9, #0
20014cf2:	f000 8084 	beq.w	20014dfe <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x186>
20014cf6:	00e2      	lsls	r2, r4, #3
20014cf8:	ea83 0a01 	eor.w	sl, r3, r1
20014cfc:	ea42 725e 	orr.w	r2, r2, lr, lsr #29
20014d00:	45cc      	cmp	ip, r9
20014d02:	f442 0300 	orr.w	r3, r2, #8388608	; 0x800000
20014d06:	ea4f 02c5 	mov.w	r2, r5, lsl #3
20014d0a:	ea42 7b50 	orr.w	fp, r2, r0, lsr #29
20014d0e:	ea4f 05ce 	mov.w	r5, lr, lsl #3
20014d12:	f000 8097 	beq.w	20014e44 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x1cc>
20014d16:	ebac 0609 	sub.w	r6, ip, r9
20014d1a:	2e40      	cmp	r6, #64	; 0x40
20014d1c:	f080 8090 	bcs.w	20014e40 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x1c8>
20014d20:	f1c6 0220 	rsb	r2, r6, #32
20014d24:	4271      	negs	r1, r6
20014d26:	f001 013f 	and.w	r1, r1, #63	; 0x3f
20014d2a:	fa25 fe06 	lsr.w	lr, r5, r6
20014d2e:	fa03 f202 	lsl.w	r2, r3, r2
20014d32:	ea4e 0902 	orr.w	r9, lr, r2
20014d36:	f1c1 0220 	rsb	r2, r1, #32
20014d3a:	f1b6 0e20 	subs.w	lr, r6, #32
20014d3e:	bf58      	it	pl
20014d40:	fa23 f90e 	lsrpl.w	r9, r3, lr
20014d44:	fa25 f402 	lsr.w	r4, r5, r2
20014d48:	fa03 f201 	lsl.w	r2, r3, r1
20014d4c:	4322      	orrs	r2, r4
20014d4e:	f1b1 0420 	subs.w	r4, r1, #32
20014d52:	fa05 f101 	lsl.w	r1, r5, r1
20014d56:	bf58      	it	pl
20014d58:	fa05 f204 	lslpl.w	r2, r5, r4
20014d5c:	bf58      	it	pl
20014d5e:	2100      	movpl	r1, #0
20014d60:	40f3      	lsrs	r3, r6
20014d62:	4311      	orrs	r1, r2
20014d64:	bf18      	it	ne
20014d66:	2101      	movne	r1, #1
20014d68:	ea49 0501 	orr.w	r5, r9, r1
20014d6c:	f1be 0f00 	cmp.w	lr, #0
20014d70:	bf58      	it	pl
20014d72:	2300      	movpl	r3, #0
20014d74:	e066      	b.n	20014e44 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x1cc>
20014d76:	f240 0e00 	movw	lr, #0
20014d7a:	4244      	negs	r4, r0
20014d7c:	f6c7 7ef0 	movt	lr, #32752	; 0x7ff0
20014d80:	eb7e 0405 	sbcs.w	r4, lr, r5
20014d84:	d208      	bcs.n	20014d98 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x120>
20014d86:	f445 2100 	orr.w	r1, r5, #524288	; 0x80000
20014d8a:	ec41 0b10 	vmov	d0, r0, r1
20014d8e:	ec51 0b10 	vmov	r0, r1, d0
20014d92:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014d96:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014d98:	4254      	negs	r4, r2
20014d9a:	eb7e 0408 	sbcs.w	r4, lr, r8
20014d9e:	f080 80f1 	bcs.w	20014f84 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x30c>
20014da2:	f448 2000 	orr.w	r0, r8, #524288	; 0x80000
20014da6:	ec40 2b10 	vmov	d0, r2, r0
20014daa:	ec51 0b10 	vmov	r0, r1, d0
20014dae:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014db2:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014db4:	fab0 f280 	clz	r2, r0
20014db8:	2d00      	cmp	r5, #0
20014dba:	f102 0a20 	add.w	sl, r2, #32
20014dbe:	bf18      	it	ne
20014dc0:	fab5 fa85 	clzne	sl, r5
20014dc4:	f10a 0635 	add.w	r6, sl, #53	; 0x35
20014dc8:	f006 063f 	and.w	r6, r6, #63	; 0x3f
20014dcc:	f1b6 0220 	subs.w	r2, r6, #32
20014dd0:	fa05 fc06 	lsl.w	ip, r5, r6
20014dd4:	f1c6 0520 	rsb	r5, r6, #32
20014dd8:	fa20 f505 	lsr.w	r5, r0, r5
20014ddc:	ea45 050c 	orr.w	r5, r5, ip
20014de0:	f1ca 0c0c 	rsb	ip, sl, #12
20014de4:	bf58      	it	pl
20014de6:	fa00 f502 	lslpl.w	r5, r0, r2
20014dea:	fa00 f006 	lsl.w	r0, r0, r6
20014dee:	bf58      	it	pl
20014df0:	2000      	movpl	r0, #0
20014df2:	f36f 541f 	bfc	r4, #20, #12
20014df6:	f1b9 0f00 	cmp.w	r9, #0
20014dfa:	f47f af7c 	bne.w	20014cf6 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x7e>
20014dfe:	fabe f28e 	clz	r2, lr
20014e02:	2c00      	cmp	r4, #0
20014e04:	f102 0a20 	add.w	sl, r2, #32
20014e08:	bf18      	it	ne
20014e0a:	fab4 fa84 	clzne	sl, r4
20014e0e:	f10a 0635 	add.w	r6, sl, #53	; 0x35
20014e12:	f006 063f 	and.w	r6, r6, #63	; 0x3f
20014e16:	f1b6 0220 	subs.w	r2, r6, #32
20014e1a:	fa04 f906 	lsl.w	r9, r4, r6
20014e1e:	f1c6 0420 	rsb	r4, r6, #32
20014e22:	fa2e f404 	lsr.w	r4, lr, r4
20014e26:	ea44 0409 	orr.w	r4, r4, r9
20014e2a:	f1ca 090c 	rsb	r9, sl, #12
20014e2e:	bf58      	it	pl
20014e30:	fa0e f402 	lslpl.w	r4, lr, r2
20014e34:	fa0e fe06 	lsl.w	lr, lr, r6
20014e38:	bf58      	it	pl
20014e3a:	f04f 0e00 	movpl.w	lr, #0
20014e3e:	e75a      	b.n	20014cf6 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x7e>
20014e40:	2300      	movs	r3, #0
20014e42:	2501      	movs	r5, #1
20014e44:	f44b 0600 	orr.w	r6, fp, #8388608	; 0x800000
20014e48:	f008 4e00 	and.w	lr, r8, #2147483648	; 0x80000000
20014e4c:	00c4      	lsls	r4, r0, #3
20014e4e:	f1ba 3fff 	cmp.w	sl, #4294967295	; 0xffffffff
20014e52:	dd0e      	ble.n	20014e72 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x1fa>
20014e54:	1929      	adds	r1, r5, r4
20014e56:	eb43 0206 	adc.w	r2, r3, r6
20014e5a:	01d3      	lsls	r3, r2, #7
20014e5c:	d530      	bpl.n	20014ec0 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x248>
20014e5e:	ea5f 0252 	movs.w	r2, r2, lsr #1
20014e62:	f005 0301 	and.w	r3, r5, #1
20014e66:	ea4f 0131 	mov.w	r1, r1, rrx
20014e6a:	f10c 0c01 	add.w	ip, ip, #1
20014e6e:	4319      	orrs	r1, r3
20014e70:	e026      	b.n	20014ec0 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x248>
20014e72:	1b61      	subs	r1, r4, r5
20014e74:	eb66 0203 	sbc.w	r2, r6, r3
20014e78:	ea51 0302 	orrs.w	r3, r1, r2
20014e7c:	f000 809f 	beq.w	20014fbe <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x346>
20014e80:	2300      	movs	r3, #0
20014e82:	ebb3 5fd2 	cmp.w	r3, r2, lsr #23
20014e86:	d11b      	bne.n	20014ec0 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x248>
20014e88:	fab1 f381 	clz	r3, r1
20014e8c:	2a00      	cmp	r2, #0
20014e8e:	f103 0320 	add.w	r3, r3, #32
20014e92:	bf18      	it	ne
20014e94:	fab2 f382 	clzne	r3, r2
20014e98:	f1a3 0608 	sub.w	r6, r3, #8
20014e9c:	f1c3 0528 	rsb	r5, r3, #40	; 0x28
20014ea0:	ebac 0c06 	sub.w	ip, ip, r6
20014ea4:	40b2      	lsls	r2, r6
20014ea6:	3b28      	subs	r3, #40	; 0x28
20014ea8:	fa21 f505 	lsr.w	r5, r1, r5
20014eac:	ea42 0205 	orr.w	r2, r2, r5
20014eb0:	bf58      	it	pl
20014eb2:	fa01 f203 	lslpl.w	r2, r1, r3
20014eb6:	fa01 f106 	lsl.w	r1, r1, r6
20014eba:	bf58      	it	pl
20014ebc:	2100      	movpl	r1, #0
20014ebe:	e00f      	b.n	20014ee0 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x268>
20014ec0:	f240 73fe 	movw	r3, #2046	; 0x7fe
20014ec4:	459c      	cmp	ip, r3
20014ec6:	dd0b      	ble.n	20014ee0 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x268>
20014ec8:	f04e 40e0 	orr.w	r0, lr, #1879048192	; 0x70000000
20014ecc:	2100      	movs	r1, #0
20014ece:	f040 607f 	orr.w	r0, r0, #267386880	; 0xff00000
20014ed2:	ec40 1b10 	vmov	d0, r1, r0
20014ed6:	ec51 0b10 	vmov	r0, r1, d0
20014eda:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014ede:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014ee0:	f1bc 0f01 	cmp.w	ip, #1
20014ee4:	da32      	bge.n	20014f4c <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x2d4>
20014ee6:	f1cc 0301 	rsb	r3, ip, #1
20014eea:	f1ac 0401 	sub.w	r4, ip, #1
20014eee:	f003 033f 	and.w	r3, r3, #63	; 0x3f
20014ef2:	f004 043f 	and.w	r4, r4, #63	; 0x3f
20014ef6:	f1c3 0520 	rsb	r5, r3, #32
20014efa:	f1c4 0020 	rsb	r0, r4, #32
20014efe:	fa21 f603 	lsr.w	r6, r1, r3
20014f02:	f1b3 0820 	subs.w	r8, r3, #32
20014f06:	fa02 f505 	lsl.w	r5, r2, r5
20014f0a:	fa21 f000 	lsr.w	r0, r1, r0
20014f0e:	ea46 0605 	orr.w	r6, r6, r5
20014f12:	fa02 f504 	lsl.w	r5, r2, r4
20014f16:	ea40 0005 	orr.w	r0, r0, r5
20014f1a:	bf58      	it	pl
20014f1c:	fa22 f608 	lsrpl.w	r6, r2, r8
20014f20:	f1b4 0520 	subs.w	r5, r4, #32
20014f24:	bf58      	it	pl
20014f26:	fa01 f005 	lslpl.w	r0, r1, r5
20014f2a:	fa01 f104 	lsl.w	r1, r1, r4
20014f2e:	fa22 f203 	lsr.w	r2, r2, r3
20014f32:	bf58      	it	pl
20014f34:	2100      	movpl	r1, #0
20014f36:	4308      	orrs	r0, r1
20014f38:	bf18      	it	ne
20014f3a:	2001      	movne	r0, #1
20014f3c:	ea46 0100 	orr.w	r1, r6, r0
20014f40:	f04f 0c00 	mov.w	ip, #0
20014f44:	f1b8 0f00 	cmp.w	r8, #0
20014f48:	bf58      	it	pl
20014f4a:	2200      	movpl	r2, #0
20014f4c:	08c8      	lsrs	r0, r1, #3
20014f4e:	ea40 7342 	orr.w	r3, r0, r2, lsl #29
20014f52:	f3c2 00d3 	ubfx	r0, r2, #3, #20
20014f56:	f001 0107 	and.w	r1, r1, #7
20014f5a:	ea40 500c 	orr.w	r0, r0, ip, lsl #20
20014f5e:	2904      	cmp	r1, #4
20014f60:	ea40 000e 	orr.w	r0, r0, lr
20014f64:	d901      	bls.n	20014f6a <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x2f2>
20014f66:	3301      	adds	r3, #1
20014f68:	e003      	b.n	20014f72 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x2fa>
20014f6a:	d104      	bne.n	20014f76 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x2fe>
20014f6c:	f003 0101 	and.w	r1, r3, #1
20014f70:	185b      	adds	r3, r3, r1
20014f72:	f140 0000 	adc.w	r0, r0, #0
20014f76:	ec40 3b10 	vmov	d0, r3, r0
20014f7a:	ec51 0b10 	vmov	r0, r1, d0
20014f7e:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014f82:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014f84:	ea85 040e 	eor.w	r4, r5, lr
20014f88:	4304      	orrs	r4, r0
20014f8a:	d11f      	bne.n	20014fcc <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x354>
20014f8c:	ed9f 0b22 	vldr	d0, [pc, #136]	; 20015018 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x3a0>
20014f90:	4042      	eors	r2, r0
20014f92:	f1bc 0601 	subs.w	r6, ip, #1
20014f96:	ea83 0301 	eor.w	r3, r3, r1
20014f9a:	ea82 0206 	eor.w	r2, r2, r6
20014f9e:	f569 1680 	sbc.w	r6, r9, #1048576	; 0x100000
20014fa2:	4073      	eors	r3, r6
20014fa4:	ec55 4b10 	vmov	r4, r5, d0
20014fa8:	431a      	orrs	r2, r3
20014faa:	bf1c      	itt	ne
20014fac:	460d      	movne	r5, r1
20014fae:	4604      	movne	r4, r0
20014fb0:	ec45 4b10 	vmov	d0, r4, r5
20014fb4:	ec51 0b10 	vmov	r0, r1, d0
20014fb8:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014fbc:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014fbe:	ed9f 0b14 	vldr	d0, [pc, #80]	; 20015010 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x398>
20014fc2:	ec51 0b10 	vmov	r0, r1, d0
20014fc6:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014fca:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014fcc:	ea88 060e 	eor.w	r6, r8, lr
20014fd0:	4316      	orrs	r6, r2
20014fd2:	d108      	bne.n	20014fe6 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x36e>
20014fd4:	eeb0 0a41 	vmov.f32	s0, s2
20014fd8:	eef0 0a61 	vmov.f32	s1, s3
20014fdc:	ec51 0b10 	vmov	r0, r1, d0
20014fe0:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20014fe4:	bdf0      	pop	{r4, r5, r6, r7, pc}
20014fe6:	ea50 0605 	orrs.w	r6, r0, r5
20014fea:	d004      	beq.n	20014ff6 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x37e>
20014fec:	ea52 0608 	orrs.w	r6, r2, r8
20014ff0:	f47f ae61 	bne.w	20014cb6 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x3e>
20014ff4:	e6cb      	b.n	20014d8e <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x116>
20014ff6:	eeb0 0a41 	vmov.f32	s0, s2
20014ffa:	ea52 0608 	orrs.w	r6, r2, r8
20014ffe:	eef0 0a61 	vmov.f32	s1, s3
20015002:	f47f aec4 	bne.w	20014d8e <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x116>
20015006:	4010      	ands	r0, r2
20015008:	4019      	ands	r1, r3
2001500a:	e6be      	b.n	20014d8a <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E+0x112>
2001500c:	bf00      	nop
2001500e:	bf00      	nop
	...
2001501c:	7ff80000 	svcvc	0x00f80000

20015020 <__aeabi_memclr4>:
20015020:	b580      	push	{r7, lr}
20015022:	466f      	mov	r7, sp
20015024:	2904      	cmp	r1, #4
20015026:	d314      	bcc.n	20015052 <__aeabi_memclr4+0x32>
20015028:	f1a1 0c04 	sub.w	ip, r1, #4
2001502c:	2201      	movs	r2, #1
2001502e:	eb02 029c 	add.w	r2, r2, ip, lsr #2
20015032:	f012 0303 	ands.w	r3, r2, #3
20015036:	d00e      	beq.n	20015056 <__aeabi_memclr4+0x36>
20015038:	f04f 0e00 	mov.w	lr, #0
2001503c:	4602      	mov	r2, r0
2001503e:	f842 eb04 	str.w	lr, [r2], #4
20015042:	2b01      	cmp	r3, #1
20015044:	d10b      	bne.n	2001505e <__aeabi_memclr4+0x3e>
20015046:	4610      	mov	r0, r2
20015048:	4661      	mov	r1, ip
2001504a:	f1bc 0f0c 	cmp.w	ip, #12
2001504e:	d219      	bcs.n	20015084 <__aeabi_memclr4+0x64>
20015050:	e022      	b.n	20015098 <__aeabi_memclr4+0x78>
20015052:	4602      	mov	r2, r0
20015054:	e020      	b.n	20015098 <__aeabi_memclr4+0x78>
20015056:	f1bc 0f0c 	cmp.w	ip, #12
2001505a:	d213      	bcs.n	20015084 <__aeabi_memclr4+0x64>
2001505c:	e01c      	b.n	20015098 <__aeabi_memclr4+0x78>
2001505e:	2b02      	cmp	r3, #2
20015060:	f8c0 e004 	str.w	lr, [r0, #4]
20015064:	d106      	bne.n	20015074 <__aeabi_memclr4+0x54>
20015066:	3908      	subs	r1, #8
20015068:	3008      	adds	r0, #8
2001506a:	4602      	mov	r2, r0
2001506c:	f1bc 0f0c 	cmp.w	ip, #12
20015070:	d208      	bcs.n	20015084 <__aeabi_memclr4+0x64>
20015072:	e011      	b.n	20015098 <__aeabi_memclr4+0x78>
20015074:	2200      	movs	r2, #0
20015076:	390c      	subs	r1, #12
20015078:	6082      	str	r2, [r0, #8]
2001507a:	300c      	adds	r0, #12
2001507c:	4602      	mov	r2, r0
2001507e:	f1bc 0f0c 	cmp.w	ip, #12
20015082:	d309      	bcc.n	20015098 <__aeabi_memclr4+0x78>
20015084:	2300      	movs	r3, #0
20015086:	4602      	mov	r2, r0
20015088:	3910      	subs	r1, #16
2001508a:	e9c2 3300 	strd	r3, r3, [r2]
2001508e:	e9c2 3302 	strd	r3, r3, [r2, #8]
20015092:	3210      	adds	r2, #16
20015094:	2903      	cmp	r1, #3
20015096:	d8f7      	bhi.n	20015088 <__aeabi_memclr4+0x68>
20015098:	2900      	cmp	r1, #0
2001509a:	bf08      	it	eq
2001509c:	bd80      	popeq	{r7, pc}
2001509e:	1850      	adds	r0, r2, r1
200150a0:	2100      	movs	r1, #0
200150a2:	f802 1b01 	strb.w	r1, [r2], #1
200150a6:	4282      	cmp	r2, r0
200150a8:	d20b      	bcs.n	200150c2 <__aeabi_memclr4+0xa2>
200150aa:	f802 1b01 	strb.w	r1, [r2], #1
200150ae:	4282      	cmp	r2, r0
200150b0:	bf3c      	itt	cc
200150b2:	f802 1b01 	strbcc.w	r1, [r2], #1
200150b6:	4282      	cmpcc	r2, r0
200150b8:	d203      	bcs.n	200150c2 <__aeabi_memclr4+0xa2>
200150ba:	f802 1b01 	strb.w	r1, [r2], #1
200150be:	4282      	cmp	r2, r0
200150c0:	d3ef      	bcc.n	200150a2 <__aeabi_memclr4+0x82>
200150c2:	bd80      	pop	{r7, pc}

200150c4 <__aeabi_f2d>:
200150c4:	f020 4100 	bic.w	r1, r0, #2147483648	; 0x80000000
200150c8:	f5a1 0200 	sub.w	r2, r1, #8388608	; 0x800000
200150cc:	f1b2 4ffe 	cmp.w	r2, #2130706432	; 0x7f000000
200150d0:	d204      	bcs.n	200150dc <__aeabi_f2d+0x18>
200150d2:	f04f 5260 	mov.w	r2, #939524096	; 0x38000000
200150d6:	eb02 03d1 	add.w	r3, r2, r1, lsr #3
200150da:	e007      	b.n	200150ec <__aeabi_f2d+0x28>
200150dc:	0dca      	lsrs	r2, r1, #23
200150de:	2afe      	cmp	r2, #254	; 0xfe
200150e0:	d90b      	bls.n	200150fa <__aeabi_f2d+0x36>
200150e2:	2200      	movs	r2, #0
200150e4:	f6c7 72f0 	movt	r2, #32752	; 0x7ff0
200150e8:	ea42 03d1 	orr.w	r3, r2, r1, lsr #3
200150ec:	074a      	lsls	r2, r1, #29
200150ee:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
200150f2:	ea43 0100 	orr.w	r1, r3, r0
200150f6:	4610      	mov	r0, r2
200150f8:	4770      	bx	lr
200150fa:	b321      	cbz	r1, 20015146 <__aeabi_f2d+0x82>
200150fc:	b580      	push	{r7, lr}
200150fe:	466f      	mov	r7, sp
20015100:	fab1 f281 	clz	r2, r1
20015104:	f1c2 030b 	rsb	r3, r2, #11
20015108:	f1b2 0c0b 	subs.w	ip, r2, #11
2001510c:	fa21 f303 	lsr.w	r3, r1, r3
20015110:	bf58      	it	pl
20015112:	fa01 f30c 	lslpl.w	r3, r1, ip
20015116:	f483 1e80 	eor.w	lr, r3, #1048576	; 0x100000
2001511a:	f240 3389 	movw	r3, #905	; 0x389
2001511e:	f1bc 0f00 	cmp.w	ip, #0
20015122:	eba3 0302 	sub.w	r3, r3, r2
20015126:	f102 0215 	add.w	r2, r2, #21
2001512a:	ea4e 5303 	orr.w	r3, lr, r3, lsl #20
2001512e:	fa01 f202 	lsl.w	r2, r1, r2
20015132:	bf58      	it	pl
20015134:	2200      	movpl	r2, #0
20015136:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
2001513a:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
2001513e:	ea43 0100 	orr.w	r1, r3, r0
20015142:	4610      	mov	r0, r2
20015144:	4770      	bx	lr
20015146:	2200      	movs	r2, #0
20015148:	2300      	movs	r3, #0
2001514a:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
2001514e:	ea43 0100 	orr.w	r1, r3, r0
20015152:	4610      	mov	r0, r2
20015154:	4770      	bx	lr

20015156 <__aeabi_dmul>:
20015156:	f000 b803 	b.w	20015160 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE>
2001515a:	d4d4      	bmi.n	20015106 <__aeabi_f2d+0x42>
2001515c:	d4d4      	bmi.n	20015108 <__aeabi_f2d+0x44>
2001515e:	d4d4      	bmi.n	2001510a <__aeabi_f2d+0x46>

20015160 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE>:
20015160:	b5f0      	push	{r4, r5, r6, r7, lr}
20015162:	af03      	add	r7, sp, #12
20015164:	e92d 0f00 	stmdb	sp!, {r8, r9, sl, fp}
20015168:	b083      	sub	sp, #12
2001516a:	ea83 0601 	eor.w	r6, r3, r1
2001516e:	f3c1 550a 	ubfx	r5, r1, #20, #11
20015172:	f006 4600 	and.w	r6, r6, #2147483648	; 0x80000000
20015176:	9602      	str	r6, [sp, #8]
20015178:	f3c3 560a 	ubfx	r6, r3, #20, #11
2001517c:	f240 74ff 	movw	r4, #2047	; 0x7ff
20015180:	ebb6 0804 	subs.w	r8, r6, r4
20015184:	469b      	mov	fp, r3
20015186:	468a      	mov	sl, r1
20015188:	f04f 0900 	mov.w	r9, #0
2001518c:	9601      	str	r6, [sp, #4]
2001518e:	f169 0600 	sbc.w	r6, r9, #0
20015192:	ebb5 0c04 	subs.w	ip, r5, r4
20015196:	f64f 0402 	movw	r4, #63490	; 0xf802
2001519a:	9500      	str	r5, [sp, #0]
2001519c:	f169 0e00 	sbc.w	lr, r9, #0
200151a0:	f6cf 74ff 	movt	r4, #65535	; 0xffff
200151a4:	ebbc 0504 	subs.w	r5, ip, r4
200151a8:	f36f 5b1f 	bfc	fp, #20, #12
200151ac:	f36f 5a1f 	bfc	sl, #20, #12
200151b0:	f17e 35ff 	sbcs.w	r5, lr, #4294967295	; 0xffffffff
200151b4:	d33d      	bcc.n	20015232 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0xd2>
200151b6:	ebb8 0404 	subs.w	r4, r8, r4
200151ba:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
200151be:	41ae      	sbcs	r6, r5
200151c0:	d337      	bcc.n	20015232 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0xd2>
200151c2:	02d3      	lsls	r3, r2, #11
200151c4:	ea4f 25cb 	mov.w	r5, fp, lsl #11
200151c8:	ea45 5252 	orr.w	r2, r5, r2, lsr #21
200151cc:	fba3 c600 	umull	ip, r6, r3, r0
200151d0:	f042 4200 	orr.w	r2, r2, #2147483648	; 0x80000000
200151d4:	f44a 1480 	orr.w	r4, sl, #1048576	; 0x100000
200151d8:	2100      	movs	r1, #0
200151da:	f04f 0e00 	mov.w	lr, #0
200151de:	fbe2 6100 	umlal	r6, r1, r2, r0
200151e2:	fba3 0304 	umull	r0, r3, r3, r4
200151e6:	1985      	adds	r5, r0, r6
200151e8:	eb51 0003 	adcs.w	r0, r1, r3
200151ec:	f14e 0300 	adc.w	r3, lr, #0
200151f0:	fbe2 0304 	umlal	r0, r3, r2, r4
200151f4:	02d9      	lsls	r1, r3, #11
200151f6:	e9dd 2100 	ldrd	r2, r1, [sp]
200151fa:	4411      	add	r1, r2
200151fc:	eb01 0609 	add.w	r6, r1, r9
20015200:	d424      	bmi.n	2001524c <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0xec>
20015202:	0069      	lsls	r1, r5, #1
20015204:	ea41 72dc 	orr.w	r2, r1, ip, lsr #31
20015208:	0059      	lsls	r1, r3, #1
2001520a:	ea41 73d0 	orr.w	r3, r1, r0, lsr #31
2001520e:	0040      	lsls	r0, r0, #1
20015210:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
20015214:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
20015218:	f2a6 36ff 	subw	r6, r6, #1023	; 0x3ff
2001521c:	f240 71fe 	movw	r1, #2046	; 0x7fe
20015220:	428e      	cmp	r6, r1
20015222:	dc1a      	bgt.n	2001525a <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0xfa>
20015224:	2e01      	cmp	r6, #1
20015226:	db41      	blt.n	200152ac <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x14c>
20015228:	f36f 531f 	bfc	r3, #20, #12
2001522c:	ea43 5306 	orr.w	r3, r3, r6, lsl #20
20015230:	e092      	b.n	20015358 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x1f8>
20015232:	f240 0900 	movw	r9, #0
20015236:	f021 4400 	bic.w	r4, r1, #2147483648	; 0x80000000
2001523a:	4246      	negs	r6, r0
2001523c:	f6c7 79f0 	movt	r9, #32752	; 0x7ff0
20015240:	eb79 0604 	sbcs.w	r6, r9, r4
20015244:	d217      	bcs.n	20015276 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x116>
20015246:	f441 2100 	orr.w	r1, r1, #524288	; 0x80000
2001524a:	e0b9      	b.n	200153c0 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x260>
2001524c:	f2a6 36fe 	subw	r6, r6, #1022	; 0x3fe
20015250:	462a      	mov	r2, r5
20015252:	f240 71fe 	movw	r1, #2046	; 0x7fe
20015256:	428e      	cmp	r6, r1
20015258:	dde4      	ble.n	20015224 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0xc4>
2001525a:	9802      	ldr	r0, [sp, #8]
2001525c:	f040 40e0 	orr.w	r0, r0, #1879048192	; 0x70000000
20015260:	f040 607f 	orr.w	r0, r0, #267386880	; 0xff00000
20015264:	2100      	movs	r1, #0
20015266:	ec40 1b10 	vmov	d0, r1, r0
2001526a:	ec51 0b10 	vmov	r0, r1, d0
2001526e:	b003      	add	sp, #12
20015270:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20015274:	bdf0      	pop	{r4, r5, r6, r7, pc}
20015276:	f023 4100 	bic.w	r1, r3, #2147483648	; 0x80000000
2001527a:	4256      	negs	r6, r2
2001527c:	eb79 0601 	sbcs.w	r6, r9, r1
20015280:	d209      	bcs.n	20015296 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x136>
20015282:	f443 2000 	orr.w	r0, r3, #524288	; 0x80000
20015286:	ec40 2b10 	vmov	d0, r2, r0
2001528a:	ec51 0b10 	vmov	r0, r1, d0
2001528e:	b003      	add	sp, #12
20015290:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20015294:	bdf0      	pop	{r4, r5, r6, r7, pc}
20015296:	ea84 0309 	eor.w	r3, r4, r9
2001529a:	4303      	orrs	r3, r0
2001529c:	d179      	bne.n	20015392 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x232>
2001529e:	ea52 0001 	orrs.w	r0, r2, r1
200152a2:	d07d      	beq.n	200153a0 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x240>
200152a4:	9802      	ldr	r0, [sp, #8]
200152a6:	ea40 0009 	orr.w	r0, r0, r9
200152aa:	e7db      	b.n	20015264 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x104>
200152ac:	f1c6 0501 	rsb	r5, r6, #1
200152b0:	2d3f      	cmp	r5, #63	; 0x3f
200152b2:	f200 8083 	bhi.w	200153bc <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x25c>
200152b6:	f1c5 0820 	rsb	r8, r5, #32
200152ba:	f106 0a3f 	add.w	sl, r6, #63	; 0x3f
200152be:	fa2c f105 	lsr.w	r1, ip, r5
200152c2:	f1b5 0e20 	subs.w	lr, r5, #32
200152c6:	fa02 f408 	lsl.w	r4, r2, r8
200152ca:	ea41 0104 	orr.w	r1, r1, r4
200152ce:	fa00 f40a 	lsl.w	r4, r0, sl
200152d2:	bf58      	it	pl
200152d4:	fa22 f10e 	lsrpl.w	r1, r2, lr
200152d8:	f116 091f 	adds.w	r9, r6, #31
200152dc:	bf58      	it	pl
200152de:	2400      	movpl	r4, #0
200152e0:	ea41 0b04 	orr.w	fp, r1, r4
200152e4:	f06f 041e 	mvn.w	r4, #30
200152e8:	1ba4      	subs	r4, r4, r6
200152ea:	fa02 f60a 	lsl.w	r6, r2, sl
200152ee:	f1b9 0f00 	cmp.w	r9, #0
200152f2:	fa2c f104 	lsr.w	r1, ip, r4
200152f6:	fa20 f404 	lsr.w	r4, r0, r4
200152fa:	ea41 0106 	orr.w	r1, r1, r6
200152fe:	fa0c f60a 	lsl.w	r6, ip, sl
20015302:	bf58      	it	pl
20015304:	fa0c f109 	lslpl.w	r1, ip, r9
20015308:	bf58      	it	pl
2001530a:	2600      	movpl	r6, #0
2001530c:	4331      	orrs	r1, r6
2001530e:	fa20 f605 	lsr.w	r6, r0, r5
20015312:	bf18      	it	ne
20015314:	2101      	movne	r1, #1
20015316:	ea4b 0c01 	orr.w	ip, fp, r1
2001531a:	fa03 f108 	lsl.w	r1, r3, r8
2001531e:	f1be 0f00 	cmp.w	lr, #0
20015322:	ea41 0106 	orr.w	r1, r1, r6
20015326:	fa03 f60a 	lsl.w	r6, r3, sl
2001532a:	ea44 0406 	orr.w	r4, r4, r6
2001532e:	bf58      	it	pl
20015330:	fa23 f10e 	lsrpl.w	r1, r3, lr
20015334:	f1b9 0f00 	cmp.w	r9, #0
20015338:	bf58      	it	pl
2001533a:	fa00 f409 	lslpl.w	r4, r0, r9
2001533e:	fa22 f005 	lsr.w	r0, r2, r5
20015342:	f1be 0f00 	cmp.w	lr, #0
20015346:	bf58      	it	pl
20015348:	2000      	movpl	r0, #0
2001534a:	fa23 f305 	lsr.w	r3, r3, r5
2001534e:	ea40 0204 	orr.w	r2, r0, r4
20015352:	bf58      	it	pl
20015354:	2300      	movpl	r3, #0
20015356:	4608      	mov	r0, r1
20015358:	9902      	ldr	r1, [sp, #8]
2001535a:	f04f 4600 	mov.w	r6, #2147483648	; 0x80000000
2001535e:	430b      	orrs	r3, r1
20015360:	f1dc 0100 	rsbs	r1, ip, #0
20015364:	eb76 0102 	sbcs.w	r1, r6, r2
20015368:	d201      	bcs.n	2001536e <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x20e>
2001536a:	3001      	adds	r0, #1
2001536c:	e007      	b.n	2001537e <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x21e>
2001536e:	ea82 0106 	eor.w	r1, r2, r6
20015372:	ea51 010c 	orrs.w	r1, r1, ip
20015376:	d104      	bne.n	20015382 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x222>
20015378:	f000 0101 	and.w	r1, r0, #1
2001537c:	1840      	adds	r0, r0, r1
2001537e:	f143 0300 	adc.w	r3, r3, #0
20015382:	ec43 0b10 	vmov	d0, r0, r3
20015386:	ec51 0b10 	vmov	r0, r1, d0
2001538a:	b003      	add	sp, #12
2001538c:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
20015390:	bdf0      	pop	{r4, r5, r6, r7, pc}
20015392:	ea81 0309 	eor.w	r3, r1, r9
20015396:	4313      	orrs	r3, r2
20015398:	d10a      	bne.n	200153b0 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x250>
2001539a:	4320      	orrs	r0, r4
2001539c:	f47f af82 	bne.w	200152a4 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x144>
200153a0:	ed9f 0b33 	vldr	d0, [pc, #204]	; 20015470 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x310>
200153a4:	ec51 0b10 	vmov	r0, r1, d0
200153a8:	b003      	add	sp, #12
200153aa:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200153ae:	bdf0      	pop	{r4, r5, r6, r7, pc}
200153b0:	ea50 0304 	orrs.w	r3, r0, r4
200153b4:	bf18      	it	ne
200153b6:	ea52 0301 	orrsne.w	r3, r2, r1
200153ba:	d109      	bne.n	200153d0 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x270>
200153bc:	9902      	ldr	r1, [sp, #8]
200153be:	2000      	movs	r0, #0
200153c0:	ec41 0b10 	vmov	d0, r0, r1
200153c4:	ec51 0b10 	vmov	r0, r1, d0
200153c8:	b003      	add	sp, #12
200153ca:	e8bd 0f00 	ldmia.w	sp!, {r8, r9, sl, fp}
200153ce:	bdf0      	pop	{r4, r5, r6, r7, pc}
200153d0:	f04f 0c00 	mov.w	ip, #0
200153d4:	f5b4 1f80 	cmp.w	r4, #1048576	; 0x100000
200153d8:	f04f 0900 	mov.w	r9, #0
200153dc:	d21f      	bcs.n	2001541e <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x2be>
200153de:	fab0 f680 	clz	r6, r0
200153e2:	f1ba 0f00 	cmp.w	sl, #0
200153e6:	f106 0620 	add.w	r6, r6, #32
200153ea:	bf18      	it	ne
200153ec:	faba f68a 	clzne	r6, sl
200153f0:	f106 0535 	add.w	r5, r6, #53	; 0x35
200153f4:	f005 053f 	and.w	r5, r5, #63	; 0x3f
200153f8:	f1c6 090c 	rsb	r9, r6, #12
200153fc:	f1c5 0320 	rsb	r3, r5, #32
20015400:	fa0a f405 	lsl.w	r4, sl, r5
20015404:	fa20 f303 	lsr.w	r3, r0, r3
20015408:	ea43 0a04 	orr.w	sl, r3, r4
2001540c:	f1b5 0320 	subs.w	r3, r5, #32
20015410:	bf58      	it	pl
20015412:	fa00 fa03 	lslpl.w	sl, r0, r3
20015416:	fa00 f005 	lsl.w	r0, r0, r5
2001541a:	bf58      	it	pl
2001541c:	2000      	movpl	r0, #0
2001541e:	ebbc 5f11 	cmp.w	ip, r1, lsr #20
20015422:	f47f aece 	bne.w	200151c2 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x62>
20015426:	fab2 f182 	clz	r1, r2
2001542a:	f1bb 0f00 	cmp.w	fp, #0
2001542e:	f101 0120 	add.w	r1, r1, #32
20015432:	bf18      	it	ne
20015434:	fabb f18b 	clzne	r1, fp
20015438:	f101 0335 	add.w	r3, r1, #53	; 0x35
2001543c:	f003 033f 	and.w	r3, r3, #63	; 0x3f
20015440:	eba9 0101 	sub.w	r1, r9, r1
20015444:	f1c3 0520 	rsb	r5, r3, #32
20015448:	f101 090c 	add.w	r9, r1, #12
2001544c:	fa0b f603 	lsl.w	r6, fp, r3
20015450:	fa22 f505 	lsr.w	r5, r2, r5
20015454:	ea45 0b06 	orr.w	fp, r5, r6
20015458:	f1b3 0620 	subs.w	r6, r3, #32
2001545c:	bf58      	it	pl
2001545e:	fa02 fb06 	lslpl.w	fp, r2, r6
20015462:	fa02 f203 	lsl.w	r2, r2, r3
20015466:	bf58      	it	pl
20015468:	2200      	movpl	r2, #0
2001546a:	e6aa      	b.n	200151c2 <_ZN17compiler_builtins5float3mul8__muldf317h2d73aaf14b265a0bE+0x62>
2001546c:	bf00      	nop
2001546e:	bf00      	nop
20015470:	00000000 	andeq	r0, r0, r0
20015474:	7ff80000 	svcvc	0x00f80000

20015478 <__aeabi_dadd>:
20015478:	f7ff bbfe 	b.w	20014c78 <_ZN17compiler_builtins5float3add8__adddf317h715bdee480e7e538E>

2001547c <__aeabi_dcmpge>:
2001547c:	b5f0      	push	{r4, r5, r6, r7, lr}
2001547e:	af03      	add	r7, sp, #12
20015480:	f84d bd04 	str.w	fp, [sp, #-4]!
20015484:	4684      	mov	ip, r0
20015486:	2400      	movs	r4, #0
20015488:	f021 4e00 	bic.w	lr, r1, #2147483648	; 0x80000000
2001548c:	f1dc 0500 	rsbs	r5, ip, #0
20015490:	f6c7 74f0 	movt	r4, #32752	; 0x7ff0
20015494:	f04f 0000 	mov.w	r0, #0
20015498:	eb74 050e 	sbcs.w	r5, r4, lr
2001549c:	d316      	bcc.n	200154cc <__aeabi_dcmpge+0x50>
2001549e:	f023 4500 	bic.w	r5, r3, #2147483648	; 0x80000000
200154a2:	4256      	negs	r6, r2
200154a4:	41ac      	sbcs	r4, r5
200154a6:	d311      	bcc.n	200154cc <__aeabi_dcmpge+0x50>
200154a8:	ea42 000c 	orr.w	r0, r2, ip
200154ac:	ea45 060e 	orr.w	r6, r5, lr
200154b0:	4330      	orrs	r0, r6
200154b2:	d00e      	beq.n	200154d2 <__aeabi_dcmpge+0x56>
200154b4:	ea03 0001 	and.w	r0, r3, r1
200154b8:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
200154bc:	dd0d      	ble.n	200154da <__aeabi_dcmpge+0x5e>
200154be:	ebbc 0202 	subs.w	r2, ip, r2
200154c2:	f04f 0000 	mov.w	r0, #0
200154c6:	4199      	sbcs	r1, r3
200154c8:	bfa8      	it	ge
200154ca:	2001      	movge	r0, #1
200154cc:	f85d bb04 	ldr.w	fp, [sp], #4
200154d0:	bdf0      	pop	{r4, r5, r6, r7, pc}
200154d2:	2001      	movs	r0, #1
200154d4:	f85d bb04 	ldr.w	fp, [sp], #4
200154d8:	bdf0      	pop	{r4, r5, r6, r7, pc}
200154da:	ebb2 020c 	subs.w	r2, r2, ip
200154de:	f04f 0000 	mov.w	r0, #0
200154e2:	eb73 0101 	sbcs.w	r1, r3, r1
200154e6:	bfa8      	it	ge
200154e8:	2001      	movge	r0, #1
200154ea:	f85d bb04 	ldr.w	fp, [sp], #4
200154ee:	bdf0      	pop	{r4, r5, r6, r7, pc}

200154f0 <__aeabi_dcmpgt>:
200154f0:	b5f0      	push	{r4, r5, r6, r7, lr}
200154f2:	af03      	add	r7, sp, #12
200154f4:	f84d bd04 	str.w	fp, [sp, #-4]!
200154f8:	4684      	mov	ip, r0
200154fa:	2400      	movs	r4, #0
200154fc:	f021 4e00 	bic.w	lr, r1, #2147483648	; 0x80000000
20015500:	f1dc 0500 	rsbs	r5, ip, #0
20015504:	f6c7 74f0 	movt	r4, #32752	; 0x7ff0
20015508:	f04f 0000 	mov.w	r0, #0
2001550c:	eb74 050e 	sbcs.w	r5, r4, lr
20015510:	d317      	bcc.n	20015542 <__aeabi_dcmpgt+0x52>
20015512:	f023 4500 	bic.w	r5, r3, #2147483648	; 0x80000000
20015516:	4256      	negs	r6, r2
20015518:	41ac      	sbcs	r4, r5
2001551a:	d312      	bcc.n	20015542 <__aeabi_dcmpgt+0x52>
2001551c:	ea42 040c 	orr.w	r4, r2, ip
20015520:	ea45 060e 	orr.w	r6, r5, lr
20015524:	4326      	orrs	r6, r4
20015526:	d00c      	beq.n	20015542 <__aeabi_dcmpgt+0x52>
20015528:	ea03 0001 	and.w	r0, r3, r1
2001552c:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
20015530:	dd0a      	ble.n	20015548 <__aeabi_dcmpgt+0x58>
20015532:	ebb2 020c 	subs.w	r2, r2, ip
20015536:	f04f 0000 	mov.w	r0, #0
2001553a:	eb73 0101 	sbcs.w	r1, r3, r1
2001553e:	bfb8      	it	lt
20015540:	2001      	movlt	r0, #1
20015542:	f85d bb04 	ldr.w	fp, [sp], #4
20015546:	bdf0      	pop	{r4, r5, r6, r7, pc}
20015548:	ebbc 0202 	subs.w	r2, ip, r2
2001554c:	f04f 0000 	mov.w	r0, #0
20015550:	4199      	sbcs	r1, r3
20015552:	bfb8      	it	lt
20015554:	2001      	movlt	r0, #1
20015556:	f85d bb04 	ldr.w	fp, [sp], #4
2001555a:	bdf0      	pop	{r4, r5, r6, r7, pc}

2001555c <__aeabi_dcmpun>:
2001555c:	f240 0c00 	movw	ip, #0
20015560:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
20015564:	4240      	negs	r0, r0
20015566:	f6c7 7cf0 	movt	ip, #32752	; 0x7ff0
2001556a:	eb7c 0001 	sbcs.w	r0, ip, r1
2001556e:	bf3c      	itt	cc
20015570:	2001      	movcc	r0, #1
20015572:	4770      	bxcc	lr
20015574:	f023 4100 	bic.w	r1, r3, #2147483648	; 0x80000000
20015578:	4252      	negs	r2, r2
2001557a:	f04f 0000 	mov.w	r0, #0
2001557e:	eb7c 0101 	sbcs.w	r1, ip, r1
20015582:	bf38      	it	cc
20015584:	2001      	movcc	r0, #1
20015586:	4770      	bx	lr

20015588 <__aeabi_d2uiz>:
20015588:	2200      	movs	r2, #0
2001558a:	f6c3 72f0 	movt	r2, #16368	; 0x3ff0
2001558e:	4291      	cmp	r1, r2
20015590:	bf3c      	itt	cc
20015592:	2000      	movcc	r0, #0
20015594:	4770      	bxcc	lr
20015596:	2200      	movs	r2, #0
20015598:	f2c4 12f0 	movt	r2, #16880	; 0x41f0
2001559c:	4291      	cmp	r1, r2
2001559e:	d20b      	bcs.n	200155b8 <__aeabi_d2uiz+0x30>
200155a0:	221e      	movs	r2, #30
200155a2:	0d40      	lsrs	r0, r0, #21
200155a4:	eba2 5211 	sub.w	r2, r2, r1, lsr #20
200155a8:	ea40 20c1 	orr.w	r0, r0, r1, lsl #11
200155ac:	f002 021f 	and.w	r2, r2, #31
200155b0:	f040 4000 	orr.w	r0, r0, #2147483648	; 0x80000000
200155b4:	40d0      	lsrs	r0, r2
200155b6:	4770      	bx	lr
200155b8:	4602      	mov	r2, r0
200155ba:	2300      	movs	r3, #0
200155bc:	2000      	movs	r0, #0
200155be:	3a01      	subs	r2, #1
200155c0:	f6c7 73f0 	movt	r3, #32752	; 0x7ff0
200155c4:	4199      	sbcs	r1, r3
200155c6:	bf38      	it	cc
200155c8:	2001      	movcc	r0, #1
200155ca:	2800      	cmp	r0, #0
200155cc:	bf18      	it	ne
200155ce:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
200155d2:	4770      	bx	lr

200155d4 <__aeabi_memclr8>:
200155d4:	b580      	push	{r7, lr}
200155d6:	466f      	mov	r7, sp
200155d8:	2904      	cmp	r1, #4
200155da:	d314      	bcc.n	20015606 <__aeabi_memclr8+0x32>
200155dc:	f1a1 0c04 	sub.w	ip, r1, #4
200155e0:	2201      	movs	r2, #1
200155e2:	eb02 029c 	add.w	r2, r2, ip, lsr #2
200155e6:	f012 0303 	ands.w	r3, r2, #3
200155ea:	d00e      	beq.n	2001560a <__aeabi_memclr8+0x36>
200155ec:	f04f 0e00 	mov.w	lr, #0
200155f0:	4602      	mov	r2, r0
200155f2:	f842 eb04 	str.w	lr, [r2], #4
200155f6:	2b01      	cmp	r3, #1
200155f8:	d10b      	bne.n	20015612 <__aeabi_memclr8+0x3e>
200155fa:	4610      	mov	r0, r2
200155fc:	4661      	mov	r1, ip
200155fe:	f1bc 0f0c 	cmp.w	ip, #12
20015602:	d219      	bcs.n	20015638 <__aeabi_memclr8+0x64>
20015604:	e022      	b.n	2001564c <__aeabi_memclr8+0x78>
20015606:	4602      	mov	r2, r0
20015608:	e020      	b.n	2001564c <__aeabi_memclr8+0x78>
2001560a:	f1bc 0f0c 	cmp.w	ip, #12
2001560e:	d213      	bcs.n	20015638 <__aeabi_memclr8+0x64>
20015610:	e01c      	b.n	2001564c <__aeabi_memclr8+0x78>
20015612:	2b02      	cmp	r3, #2
20015614:	f8c0 e004 	str.w	lr, [r0, #4]
20015618:	d106      	bne.n	20015628 <__aeabi_memclr8+0x54>
2001561a:	3908      	subs	r1, #8
2001561c:	3008      	adds	r0, #8
2001561e:	4602      	mov	r2, r0
20015620:	f1bc 0f0c 	cmp.w	ip, #12
20015624:	d208      	bcs.n	20015638 <__aeabi_memclr8+0x64>
20015626:	e011      	b.n	2001564c <__aeabi_memclr8+0x78>
20015628:	2200      	movs	r2, #0
2001562a:	390c      	subs	r1, #12
2001562c:	6082      	str	r2, [r0, #8]
2001562e:	300c      	adds	r0, #12
20015630:	4602      	mov	r2, r0
20015632:	f1bc 0f0c 	cmp.w	ip, #12
20015636:	d309      	bcc.n	2001564c <__aeabi_memclr8+0x78>
20015638:	2300      	movs	r3, #0
2001563a:	4602      	mov	r2, r0
2001563c:	3910      	subs	r1, #16
2001563e:	e9c2 3300 	strd	r3, r3, [r2]
20015642:	e9c2 3302 	strd	r3, r3, [r2, #8]
20015646:	3210      	adds	r2, #16
20015648:	2903      	cmp	r1, #3
2001564a:	d8f7      	bhi.n	2001563c <__aeabi_memclr8+0x68>
2001564c:	2900      	cmp	r1, #0
2001564e:	bf08      	it	eq
20015650:	bd80      	popeq	{r7, pc}
20015652:	1850      	adds	r0, r2, r1
20015654:	2100      	movs	r1, #0
20015656:	f802 1b01 	strb.w	r1, [r2], #1
2001565a:	4282      	cmp	r2, r0
2001565c:	d20b      	bcs.n	20015676 <__aeabi_memclr8+0xa2>
2001565e:	f802 1b01 	strb.w	r1, [r2], #1
20015662:	4282      	cmp	r2, r0
20015664:	bf3c      	itt	cc
20015666:	f802 1b01 	strbcc.w	r1, [r2], #1
2001566a:	4282      	cmpcc	r2, r0
2001566c:	d203      	bcs.n	20015676 <__aeabi_memclr8+0xa2>
2001566e:	f802 1b01 	strb.w	r1, [r2], #1
20015672:	4282      	cmp	r2, r0
20015674:	d3ef      	bcc.n	20015656 <__aeabi_memclr8+0x82>
20015676:	bd80      	pop	{r7, pc}
20015678:	552f      	strb	r7, [r5, r4]
2001567a:	6573      	str	r3, [r6, #84]	; 0x54
2001567c:	7372      	strb	r2, [r6, #13]
2001567e:	702f      	strb	r7, [r5, #0]
20015680:	6d73      	ldr	r3, [r6, #84]	; 0x54
20015682:	7469      	strb	r1, [r5, #17]
20015684:	2f68      	cmp	r7, #104	; 0x68
20015686:	7250      	strb	r0, [r2, #9]
20015688:	6a6f      	ldr	r7, [r5, #36]	; 0x24
2001568a:	6365      	str	r5, [r4, #52]	; 0x34
2001568c:	7374      	strb	r4, [r6, #13]
2001568e:	6f2f      	ldr	r7, [r5, #112]	; 0x70
20015690:	6c77      	ldr	r7, [r6, #68]	; 0x44
20015692:	705f      	strb	r7, [r3, #1]
20015694:	7461      	strb	r1, [r4, #17]
20015696:	6863      	ldr	r3, [r4, #4]
20015698:	732f      	strb	r7, [r5, #12]
2001569a:	6372      	str	r2, [r6, #52]	; 0x34
2001569c:	732f      	strb	r7, [r5, #12]
2001569e:	6d61      	ldr	r1, [r4, #84]	; 0x54
200156a0:	6c70      	ldr	r0, [r6, #68]	; 0x44
200156a2:	5f65      	ldrsh	r5, [r4, r5]
200156a4:	7562      	strb	r2, [r4, #21]
200156a6:	6666      	str	r6, [r4, #100]	; 0x64
200156a8:	7265      	strb	r5, [r4, #9]
200156aa:	722e      	strb	r6, [r5, #8]
200156ac:	d473      	bmi.n	20015796 <.Lanon.f5f270e712b74926b98f069c093e4b8d.6+0x46>
200156ae:	d4d4      	bmi.n	2001565a <__aeabi_memclr8+0x86>

200156b0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.1>:
200156b0:	5678      	ldrsb	r0, [r7, r1]
200156b2:	2001      	movs	r0, #1
200156b4:	0035      	movs	r5, r6
200156b6:	0000      	movs	r0, r0
200156b8:	011c      	lsls	r4, r3, #4
200156ba:	0000      	movs	r0, r0
200156bc:	0009      	movs	r1, r1
	...

200156c0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.2>:
200156c0:	0000      	movs	r0, r0
200156c2:	0000      	movs	r0, r0
200156c4:	0004      	movs	r4, r0
200156c6:	0000      	movs	r0, r0
200156c8:	0004      	movs	r4, r0
200156ca:	0000      	movs	r0, r0
200156cc:	c079      	stmia	r0!, {r0, r3, r4, r5, r6}
200156ce:	2000      	movs	r0, #0
200156d0:	552f      	strb	r7, [r5, r4]
200156d2:	6573      	str	r3, [r6, #84]	; 0x54
200156d4:	7372      	strb	r2, [r6, #13]
200156d6:	702f      	strb	r7, [r5, #0]
200156d8:	6d73      	ldr	r3, [r6, #84]	; 0x54
200156da:	7469      	strb	r1, [r5, #17]
200156dc:	2f68      	cmp	r7, #104	; 0x68
200156de:	632e      	str	r6, [r5, #48]	; 0x30
200156e0:	7261      	strb	r1, [r4, #9]
200156e2:	6f67      	ldr	r7, [r4, #116]	; 0x74
200156e4:	722f      	strb	r7, [r5, #8]
200156e6:	6765      	str	r5, [r4, #116]	; 0x74
200156e8:	7369      	strb	r1, [r5, #13]
200156ea:	7274      	strb	r4, [r6, #9]
200156ec:	2f79      	cmp	r7, #121	; 0x79
200156ee:	7273      	strb	r3, [r6, #9]
200156f0:	2f63      	cmp	r7, #99	; 0x63
200156f2:	6e69      	ldr	r1, [r5, #100]	; 0x64
200156f4:	6564      	str	r4, [r4, #84]	; 0x54
200156f6:	2e78      	cmp	r6, #120	; 0x78
200156f8:	7263      	strb	r3, [r4, #9]
200156fa:	7461      	strb	r1, [r4, #17]
200156fc:	7365      	strb	r5, [r4, #13]
200156fe:	692e      	ldr	r6, [r5, #16]
20015700:	2d6f      	cmp	r5, #111	; 0x6f
20015702:	6636      	str	r6, [r6, #96]	; 0x60
20015704:	3731      	adds	r7, #49	; 0x31
20015706:	3264      	adds	r2, #100	; 0x64
20015708:	6232      	str	r2, [r6, #32]
2001570a:	6162      	str	r2, [r4, #20]
2001570c:	3531      	adds	r5, #49	; 0x31
2001570e:	3030      	adds	r0, #48	; 0x30
20015710:	6631      	str	r1, [r6, #96]	; 0x60
20015712:	742f      	strb	r7, [r5, #16]
20015714:	6c61      	ldr	r1, [r4, #68]	; 0x44
20015716:	2d63      	cmp	r5, #99	; 0x63
20015718:	2e34      	cmp	r6, #52	; 0x34
2001571a:	2e34      	cmp	r6, #52	; 0x34
2001571c:	2f31      	cmp	r7, #49	; 0x31
2001571e:	7273      	strb	r3, [r6, #9]
20015720:	2f63      	cmp	r7, #99	; 0x63
20015722:	6174      	str	r4, [r6, #20]
20015724:	636c      	str	r4, [r5, #52]	; 0x34
20015726:	722e      	strb	r6, [r5, #8]
20015728:	6873      	ldr	r3, [r6, #4]
2001572a:	6165      	str	r5, [r4, #20]
2001572c:	2070      	movs	r0, #112	; 0x70
2001572e:	6f63      	ldr	r3, [r4, #116]	; 0x74
20015730:	6576      	str	r6, [r6, #84]	; 0x54
20015732:	7372      	strb	r2, [r6, #13]
20015734:	7420      	strb	r0, [r4, #16]
20015736:	6568      	str	r0, [r5, #84]	; 0x54
20015738:	6e20      	ldr	r0, [r4, #96]	; 0x60
2001573a:	6c75      	ldr	r5, [r6, #68]	; 0x44
2001573c:	206c      	movs	r0, #108	; 0x6c
2001573e:	6461      	str	r1, [r4, #68]	; 0x44
20015740:	7264      	strb	r4, [r4, #9]
20015742:	7365      	strb	r5, [r4, #13]
20015744:	2173      	movs	r1, #115	; 0x73
20015746:	d4d4      	bmi.n	200156f2 <.Lanon.f5f270e712b74926b98f069c093e4b8d.2+0x32>

20015748 <.Lanon.f5f270e712b74926b98f069c093e4b8d.5>:
20015748:	5729      	ldrsb	r1, [r5, r4]
2001574a:	2001      	movs	r0, #1
2001574c:	001d      	movs	r5, r3
	...

20015750 <.Lanon.f5f270e712b74926b98f069c093e4b8d.6>:
20015750:	56d0      	ldrsb	r0, [r2, r3]
20015752:	2001      	movs	r0, #1
20015754:	0059      	lsls	r1, r3, #1
20015756:	0000      	movs	r0, r0
20015758:	02dc      	lsls	r4, r3, #11
2001575a:	0000      	movs	r0, r0
2001575c:	0009      	movs	r1, r1
2001575e:	0000      	movs	r0, r0
20015760:	552f      	strb	r7, [r5, r4]
20015762:	6573      	str	r3, [r6, #84]	; 0x54
20015764:	7372      	strb	r2, [r6, #13]
20015766:	702f      	strb	r7, [r5, #0]
20015768:	6d73      	ldr	r3, [r6, #84]	; 0x54
2001576a:	7469      	strb	r1, [r5, #17]
2001576c:	2f68      	cmp	r7, #104	; 0x68
2001576e:	632e      	str	r6, [r5, #48]	; 0x30
20015770:	7261      	strb	r1, [r4, #9]
20015772:	6f67      	ldr	r7, [r4, #116]	; 0x74
20015774:	722f      	strb	r7, [r5, #8]
20015776:	6765      	str	r5, [r4, #116]	; 0x74
20015778:	7369      	strb	r1, [r5, #13]
2001577a:	7274      	strb	r4, [r6, #9]
2001577c:	2f79      	cmp	r7, #121	; 0x79
2001577e:	7273      	strb	r3, [r6, #9]
20015780:	2f63      	cmp	r7, #99	; 0x63
20015782:	6e69      	ldr	r1, [r5, #100]	; 0x64
20015784:	6564      	str	r4, [r4, #84]	; 0x54
20015786:	2e78      	cmp	r6, #120	; 0x78
20015788:	7263      	strb	r3, [r4, #9]
2001578a:	7461      	strb	r1, [r4, #17]
2001578c:	7365      	strb	r5, [r4, #13]
2001578e:	692e      	ldr	r6, [r5, #16]
20015790:	2d6f      	cmp	r5, #111	; 0x6f
20015792:	6636      	str	r6, [r6, #96]	; 0x60
20015794:	3731      	adds	r7, #49	; 0x31
20015796:	3264      	adds	r2, #100	; 0x64
20015798:	6232      	str	r2, [r6, #32]
2001579a:	6162      	str	r2, [r4, #20]
2001579c:	3531      	adds	r5, #49	; 0x31
2001579e:	3030      	adds	r0, #48	; 0x30
200157a0:	6631      	str	r1, [r6, #96]	; 0x60
200157a2:	662f      	str	r7, [r5, #96]	; 0x60
200157a4:	6e75      	ldr	r5, [r6, #100]	; 0x64
200157a6:	7364      	strb	r4, [r4, #13]
200157a8:	2d70      	cmp	r5, #112	; 0x70
200157aa:	2e30      	cmp	r6, #48	; 0x30
200157ac:	3831      	subs	r0, #49	; 0x31
200157ae:	322e      	adds	r2, #46	; 0x2e
200157b0:	732f      	strb	r7, [r5, #12]
200157b2:	6372      	str	r2, [r6, #52]	; 0x34
200157b4:	642f      	str	r7, [r5, #64]	; 0x40
200157b6:	6e79      	ldr	r1, [r7, #100]	; 0x64
200157b8:	6d61      	ldr	r1, [r4, #84]	; 0x54
200157ba:	6369      	str	r1, [r5, #52]	; 0x34
200157bc:	2e73      	cmp	r6, #115	; 0x73
200157be:	7372      	strb	r2, [r6, #13]

200157c0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.8>:
200157c0:	5760      	ldrsb	r0, [r4, r5]
200157c2:	2001      	movs	r0, #1
200157c4:	0060      	lsls	r0, r4, #1
200157c6:	0000      	movs	r0, r0
200157c8:	006c      	lsls	r4, r5, #1
200157ca:	0000      	movs	r0, r0
200157cc:	0014      	movs	r4, r2
	...

200157d0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.9>:
200157d0:	5760      	ldrsb	r0, [r4, r5]
200157d2:	2001      	movs	r0, #1
200157d4:	0060      	lsls	r0, r4, #1
200157d6:	0000      	movs	r0, r0
200157d8:	006e      	lsls	r6, r5, #1
200157da:	0000      	movs	r0, r0
200157dc:	0037      	movs	r7, r6
	...

200157e0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.10>:
200157e0:	5760      	ldrsb	r0, [r4, r5]
200157e2:	2001      	movs	r0, #1
200157e4:	0060      	lsls	r0, r4, #1
200157e6:	0000      	movs	r0, r0
200157e8:	006e      	lsls	r6, r5, #1
200157ea:	0000      	movs	r0, r0
200157ec:	0047      	lsls	r7, r0, #1
	...

200157f0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.11>:
200157f0:	5760      	ldrsb	r0, [r4, r5]
200157f2:	2001      	movs	r0, #1
200157f4:	0060      	lsls	r0, r4, #1
200157f6:	0000      	movs	r0, r0
200157f8:	00d4      	lsls	r4, r2, #3
200157fa:	0000      	movs	r0, r0
200157fc:	0025      	movs	r5, r4
	...

20015800 <.Lanon.f5f270e712b74926b98f069c093e4b8d.12>:
20015800:	5760      	ldrsb	r0, [r4, r5]
20015802:	2001      	movs	r0, #1
20015804:	0060      	lsls	r0, r4, #1
20015806:	0000      	movs	r0, r0
20015808:	0067      	lsls	r7, r4, #1
2001580a:	0000      	movs	r0, r0
2001580c:	0014      	movs	r4, r2
2001580e:	0000      	movs	r0, r0
20015810:	6f6e      	ldr	r6, [r5, #116]	; 0x74
20015812:	6120      	str	r0, [r4, #16]
20015814:	6475      	str	r5, [r6, #68]	; 0x44
20015816:	6f69      	ldr	r1, [r5, #116]	; 0x74
20015818:	6120      	str	r0, [r4, #16]
2001581a:	6176      	str	r6, [r6, #20]
2001581c:	6c69      	ldr	r1, [r5, #68]	; 0x44
2001581e:	6261      	str	r1, [r4, #36]	; 0x24
20015820:	656c      	str	r4, [r5, #84]	; 0x54
20015822:	d4d4      	bmi.n	200157ce <.Lanon.f5f270e712b74926b98f069c093e4b8d.8+0xe>

20015824 <.Lanon.f5f270e712b74926b98f069c093e4b8d.15>:
20015824:	5810      	ldr	r0, [r2, r0]
20015826:	2001      	movs	r0, #1
20015828:	0012      	movs	r2, r2
2001582a:	0000      	movs	r0, r0
2001582c:	552f      	strb	r7, [r5, r4]
2001582e:	6573      	str	r3, [r6, #84]	; 0x54
20015830:	7372      	strb	r2, [r6, #13]
20015832:	702f      	strb	r7, [r5, #0]
20015834:	6d73      	ldr	r3, [r6, #84]	; 0x54
20015836:	7469      	strb	r1, [r5, #17]
20015838:	2f68      	cmp	r7, #104	; 0x68
2001583a:	7250      	strb	r0, [r2, #9]
2001583c:	6a6f      	ldr	r7, [r5, #36]	; 0x24
2001583e:	6365      	str	r5, [r4, #52]	; 0x34
20015840:	7374      	strb	r4, [r6, #13]
20015842:	6f2f      	ldr	r7, [r5, #112]	; 0x70
20015844:	6c77      	ldr	r7, [r6, #68]	; 0x44
20015846:	705f      	strb	r7, [r3, #1]
20015848:	7461      	strb	r1, [r4, #17]
2001584a:	6863      	ldr	r3, [r4, #4]
2001584c:	732f      	strb	r7, [r5, #12]
2001584e:	6372      	str	r2, [r6, #52]	; 0x34
20015850:	702f      	strb	r7, [r5, #0]
20015852:	6f72      	ldr	r2, [r6, #116]	; 0x74
20015854:	7267      	strb	r7, [r4, #9]
20015856:	6d61      	ldr	r1, [r4, #84]	; 0x54
20015858:	765f      	strb	r7, [r3, #25]
2001585a:	6365      	str	r5, [r4, #52]	; 0x34
2001585c:	6f74      	ldr	r4, [r6, #116]	; 0x74
2001585e:	2f72      	cmp	r7, #114	; 0x72
20015860:	7561      	strb	r1, [r4, #21]
20015862:	6964      	ldr	r4, [r4, #20]
20015864:	2e6f      	cmp	r6, #111	; 0x6f
20015866:	7372      	strb	r2, [r6, #13]

20015868 <.Lanon.f5f270e712b74926b98f069c093e4b8d.17>:
20015868:	582c      	ldr	r4, [r5, r0]
2001586a:	2001      	movs	r0, #1
2001586c:	003c      	movs	r4, r7
2001586e:	0000      	movs	r0, r0
20015870:	0044      	lsls	r4, r0, #1
20015872:	0000      	movs	r0, r0
20015874:	000d      	movs	r5, r1
	...

20015878 <.Lanon.f5f270e712b74926b98f069c093e4b8d.18>:
20015878:	7546      	strb	r6, [r0, #21]
2001587a:	446e      	add	r6, sp
2001587c:	7073      	strb	r3, [r6, #1]
2001587e:	4520      	cmp	r0, r4
20015880:	6178      	str	r0, [r7, #20]
20015882:	706d      	strb	r5, [r5, #1]
20015884:	656c      	str	r4, [r5, #84]	; 0x54

20015886 <.Lanon.f5f270e712b74926b98f069c093e4b8d.19>:
20015886:	6543      	str	r3, [r0, #84]	; 0x54
20015888:	746e      	strb	r6, [r5, #17]
2001588a:	7265      	strb	r5, [r4, #9]

2001588c <.Lanon.f5f270e712b74926b98f069c093e4b8d.20>:
2001588c:	6552      	str	r2, [r2, #84]	; 0x54
2001588e:	      	strh	r3, [r6, r5]

2001588f <.Lanon.f5f270e712b74926b98f069c093e4b8d.21>:
2001588f:	7053      	strb	r3, [r2, #1]
20015891:	696c      	ldr	r4, [r5, #20]
20015893:	6374      	str	r4, [r6, #52]	; 0x34
20015895:	7568      	strb	r0, [r5, #21]
20015897:	6b6e      	ldr	r6, [r5, #52]	; 0x34
20015899:	7320      	strb	r0, [r4, #12]
2001589b:	7a69      	ldrb	r1, [r5, #9]
2001589d:	2065      	movs	r0, #101	; 0x65
2001589f:	756d      	strb	r5, [r5, #21]
200158a1:	7473      	strb	r3, [r6, #17]
200158a3:	6220      	str	r0, [r4, #32]
200158a5:	2065      	movs	r0, #101	; 0x65
200158a7:	6f6e      	ldr	r6, [r5, #116]	; 0x74
200158a9:	2d6e      	cmp	r5, #110	; 0x6e
200158ab:	657a      	str	r2, [r7, #84]	; 0x54
200158ad:	6f72      	ldr	r2, [r6, #116]	; 0x74
200158af:	      	str	r4, [sp, #848]	; 0x350

200158b0 <.Lanon.f5f270e712b74926b98f069c093e4b8d.23>:
200158b0:	5894      	ldr	r4, [r2, r2]
200158b2:	2001      	movs	r0, #1
200158b4:	001b      	movs	r3, r3
	...

200158b8 <.Lanon.f5f270e712b74926b98f069c093e4b8d.24>:
200158b8:	5678      	ldrsb	r0, [r7, r1]
200158ba:	2001      	movs	r0, #1
200158bc:	0035      	movs	r5, r6
200158be:	0000      	movs	r0, r0
200158c0:	00b7      	lsls	r7, r6, #2
200158c2:	0000      	movs	r0, r0
200158c4:	0016      	movs	r6, r2
200158c6:	0000      	movs	r0, r0
200158c8:	7865      	ldrb	r5, [r4, #1]
200158ca:	6d61      	ldr	r1, [r4, #84]	; 0x54
200158cc:	6c70      	ldr	r0, [r6, #68]	; 0x44
200158ce:	7365      	strb	r5, [r4, #13]
200158d0:	662f      	str	r7, [r5, #96]	; 0x60
200158d2:	6e75      	ldr	r5, [r6, #100]	; 0x64
200158d4:	7364      	strb	r4, [r4, #13]
200158d6:	2e70      	cmp	r6, #112	; 0x70
200158d8:	7372      	strb	r2, [r6, #13]
200158da:	d4d4      	bmi.n	20015886 <.Lanon.f5f270e712b74926b98f069c093e4b8d.19>

200158dc <.Lanon.f5f270e712b74926b98f069c093e4b8d.26>:
200158dc:	58c8      	ldr	r0, [r1, r3]
200158de:	2001      	movs	r0, #1
200158e0:	0012      	movs	r2, r2
200158e2:	0000      	movs	r0, r0
200158e4:	0050      	lsls	r0, r2, #1
200158e6:	0000      	movs	r0, r0
200158e8:	0015      	movs	r5, r2
200158ea:	0000      	movs	r0, r0
200158ec:	6163      	str	r3, [r4, #20]
200158ee:	6170      	str	r0, [r6, #20]
200158f0:	6963      	ldr	r3, [r4, #20]
200158f2:	7974      	ldrb	r4, [r6, #5]
200158f4:	6f20      	ldr	r0, [r4, #112]	; 0x70
200158f6:	6576      	str	r6, [r6, #84]	; 0x54
200158f8:	6672      	str	r2, [r6, #100]	; 0x64
200158fa:	6f6c      	ldr	r4, [r5, #116]	; 0x74
200158fc:	d477      	bmi.n	200159ee <.Lanon.fbd797e2716bf9ec2517646d08565479.252+0x41>
200158fe:	d4d4      	bmi.n	200158aa <.Lanon.f5f270e712b74926b98f069c093e4b8d.21+0x1b>

20015900 <.Lanon.52294dce11d05b9f4f5d7fd102af2374.4>:
20015900:	58ec      	ldr	r4, [r5, r3]
20015902:	2001      	movs	r0, #1
20015904:	0011      	movs	r1, r2
20015906:	0000      	movs	r0, r0
20015908:	6c61      	ldr	r1, [r4, #68]	; 0x44
2001590a:	6f6c      	ldr	r4, [r5, #116]	; 0x74
2001590c:	2f63      	cmp	r7, #99	; 0x63
2001590e:	7273      	strb	r3, [r6, #9]
20015910:	2f63      	cmp	r7, #99	; 0x63
20015912:	6172      	str	r2, [r6, #20]
20015914:	5f77      	ldrsh	r7, [r6, r5]
20015916:	6576      	str	r6, [r6, #84]	; 0x54
20015918:	2e63      	cmp	r6, #99	; 0x63
2001591a:	7372      	strb	r2, [r6, #13]

2001591c <.Lanon.52294dce11d05b9f4f5d7fd102af2374.6>:
2001591c:	5908      	ldr	r0, [r1, r4]
2001591e:	2001      	movs	r0, #1
20015920:	0014      	movs	r4, r2
20015922:	0000      	movs	r0, r0
20015924:	0018      	movs	r0, r3
20015926:	0000      	movs	r0, r0
20015928:	0005      	movs	r5, r0
2001592a:	0000      	movs	r0, r0
2001592c:	6c61      	ldr	r1, [r4, #68]	; 0x44
2001592e:	6f6c      	ldr	r4, [r5, #116]	; 0x74
20015930:	2f63      	cmp	r7, #99	; 0x63
20015932:	7273      	strb	r3, [r6, #9]
20015934:	2f63      	cmp	r7, #99	; 0x63
20015936:	6c61      	ldr	r1, [r4, #68]	; 0x44
20015938:	6f6c      	ldr	r4, [r5, #116]	; 0x74
2001593a:	2e63      	cmp	r6, #99	; 0x63
2001593c:	7372      	strb	r2, [r6, #13]
2001593e:	656d      	str	r5, [r5, #84]	; 0x54
20015940:	6f6d      	ldr	r5, [r5, #116]	; 0x74
20015942:	7972      	ldrb	r2, [r6, #5]
20015944:	6120      	str	r0, [r4, #16]
20015946:	6c6c      	ldr	r4, [r5, #68]	; 0x44
20015948:	636f      	str	r7, [r5, #52]	; 0x34
2001594a:	7461      	strb	r1, [r4, #17]
2001594c:	6f69      	ldr	r1, [r5, #116]	; 0x74
2001594e:	206e      	movs	r0, #110	; 0x6e
20015950:	666f      	str	r7, [r5, #100]	; 0x64
20015952:	2020      	movs	r0, #32
20015954:	7962      	ldrb	r2, [r4, #5]
20015956:	6574      	str	r4, [r6, #84]	; 0x54
20015958:	2073      	movs	r0, #115	; 0x73
2001595a:	6166      	str	r6, [r4, #20]
2001595c:	6c69      	ldr	r1, [r5, #68]	; 0x44
2001595e:	6465      	str	r5, [r4, #68]	; 0x44

20015960 <.Lanon.52294dce11d05b9f4f5d7fd102af2374.13>:
20015960:	593e      	ldr	r6, [r7, r4]
20015962:	2001      	movs	r0, #1
20015964:	0015      	movs	r5, r2
20015966:	0000      	movs	r0, r0
20015968:	5953      	ldr	r3, [r2, r5]
2001596a:	2001      	movs	r0, #1
2001596c:	000d      	movs	r5, r1
	...

20015970 <.Lanon.52294dce11d05b9f4f5d7fd102af2374.14>:
20015970:	592c      	ldr	r4, [r5, r4]
20015972:	2001      	movs	r0, #1
20015974:	0012      	movs	r2, r2
20015976:	0000      	movs	r0, r0
20015978:	01a2      	lsls	r2, r4, #6
2001597a:	0000      	movs	r0, r0
2001597c:	000d      	movs	r5, r1
	...

20015980 <.Lanon.fbd797e2716bf9ec2517646d08565479.167>:
20015980:	      	tst	r1, r5

20015981 <.Lanon.fbd797e2716bf9ec2517646d08565479.178>:
20015981:	6f42      	ldr	r2, [r0, #116]	; 0x74
20015983:	7272      	strb	r2, [r6, #9]
20015985:	776f      	strb	r7, [r5, #29]
20015987:	754d      	strb	r5, [r1, #21]
20015989:	4574      	cmp	r4, lr
2001598b:	7272      	strb	r2, [r6, #9]
2001598d:	726f      	strb	r7, [r5, #9]
2001598f:	6c61      	ldr	r1, [r4, #68]	; 0x44
20015991:	6572      	str	r2, [r6, #84]	; 0x54
20015993:	6461      	str	r1, [r4, #68]	; 0x44
20015995:	2079      	movs	r0, #121	; 0x79
20015997:	6f62      	ldr	r2, [r4, #116]	; 0x74
20015999:	7272      	strb	r2, [r6, #9]
2001599b:	776f      	strb	r7, [r5, #29]
2001599d:	6465      	str	r5, [r4, #68]	; 0x44
2001599f:	203a      	movs	r0, #58	; 0x3a
200159a1:	d4d4      	bmi.n	2001594d <.Lanon.52294dce11d05b9f4f5d7fd102af2374.6+0x31>
200159a3:	      	ldrh	r4, [r2, #62]	; 0x3e

200159a4 <.Lanon.fbd797e2716bf9ec2517646d08565479.181>:
200159a4:	598f      	ldr	r7, [r1, r6]
200159a6:	2001      	movs	r0, #1
200159a8:	0012      	movs	r2, r2
	...

200159ac <.Lanon.fbd797e2716bf9ec2517646d08565479.246>:
200159ac:	      	str	r3, [r3, #52]	; 0x34

200159ad <.Lanon.fbd797e2716bf9ec2517646d08565479.252>:
200159ad:	6163      	str	r3, [r4, #20]
200159af:	6c6c      	ldr	r4, [r5, #68]	; 0x44
200159b1:	6465      	str	r5, [r4, #68]	; 0x44
200159b3:	6020      	str	r0, [r4, #0]
200159b5:	704f      	strb	r7, [r1, #1]
200159b7:	6974      	ldr	r4, [r6, #20]
200159b9:	6e6f      	ldr	r7, [r5, #100]	; 0x64
200159bb:	3a3a      	subs	r2, #58	; 0x3a
200159bd:	6e75      	ldr	r5, [r6, #100]	; 0x64
200159bf:	7277      	strb	r7, [r6, #9]
200159c1:	7061      	strb	r1, [r4, #1]
200159c3:	2928      	cmp	r1, #40	; 0x28
200159c5:	2060      	movs	r0, #96	; 0x60
200159c7:	6e6f      	ldr	r7, [r5, #100]	; 0x64
200159c9:	6120      	str	r0, [r4, #16]
200159cb:	6020      	str	r0, [r4, #0]
200159cd:	6f4e      	ldr	r6, [r1, #116]	; 0x74
200159cf:	656e      	str	r6, [r5, #84]	; 0x54
200159d1:	2060      	movs	r0, #96	; 0x60
200159d3:	6176      	str	r6, [r6, #20]
200159d5:	756c      	strb	r4, [r5, #21]
200159d7:	6965      	ldr	r5, [r4, #20]
200159d9:	646e      	str	r6, [r5, #68]	; 0x44
200159db:	7865      	ldrb	r5, [r4, #1]
200159dd:	6f20      	ldr	r0, [r4, #112]	; 0x70
200159df:	7475      	strb	r5, [r6, #17]
200159e1:	6f20      	ldr	r0, [r4, #112]	; 0x70
200159e3:	2066      	movs	r0, #102	; 0x66
200159e5:	6f62      	ldr	r2, [r4, #116]	; 0x74
200159e7:	6e75      	ldr	r5, [r6, #100]	; 0x64
200159e9:	7364      	strb	r4, [r4, #13]
200159eb:	203a      	movs	r0, #58	; 0x3a
200159ed:	6874      	ldr	r4, [r6, #4]
200159ef:	2065      	movs	r0, #101	; 0x65
200159f1:	656c      	str	r4, [r5, #84]	; 0x54
200159f3:	206e      	movs	r0, #110	; 0x6e
200159f5:	7369      	strb	r1, [r5, #13]
200159f7:	7320      	strb	r0, [r4, #12]
200159f9:	6372      	str	r2, [r6, #52]	; 0x34
200159fb:	702f      	strb	r7, [r5, #0]
200159fd:	6f72      	ldr	r2, [r6, #116]	; 0x74
200159ff:	7267      	strb	r7, [r4, #9]
20015a01:	6d61      	ldr	r1, [r4, #84]	; 0x54
20015a03:	765f      	strb	r7, [r3, #25]
20015a05:	6365      	str	r5, [r4, #52]	; 0x34
20015a07:	6f74      	ldr	r4, [r6, #116]	; 0x74
20015a09:	2f72      	cmp	r7, #114	; 0x72
20015a0b:	6170      	str	r0, [r6, #20]
20015a0d:	6172      	str	r2, [r6, #20]
20015a0f:	656d      	str	r5, [r5, #84]	; 0x54
20015a11:	6574      	str	r4, [r6, #84]	; 0x54
20015a13:	7372      	strb	r2, [r6, #13]
20015a15:	722e      	strb	r6, [r5, #8]
20015a17:	2073      	movs	r0, #115	; 0x73
20015a19:	7562      	strb	r2, [r4, #21]
20015a1b:	2074      	movs	r0, #116	; 0x74
20015a1d:	6874      	ldr	r4, [r6, #4]
20015a1f:	2065      	movs	r0, #101	; 0x65
20015a21:	6e69      	ldr	r1, [r5, #100]	; 0x64
20015a23:	6564      	str	r4, [r4, #84]	; 0x54
20015a25:	2078      	movs	r0, #120	; 0x78
20015a27:	7369      	strb	r1, [r5, #13]
20015a29:	d420      	bmi.n	20015a6d <.Lanon.fbd797e2716bf9ec2517646d08565479.272+0x31>
20015a2b:	      	bhi.n	200159d7 <.Lanon.fbd797e2716bf9ec2517646d08565479.252+0x2a>

20015a2c <.Lanon.fbd797e2716bf9ec2517646d08565479.263>:
20015a2c:	59d8      	ldr	r0, [r3, r7]
20015a2e:	2001      	movs	r0, #1
20015a30:	0020      	movs	r0, r4
20015a32:	0000      	movs	r0, r0
20015a34:	5a18      	ldrh	r0, [r3, r0]
20015a36:	2001      	movs	r0, #1
20015a38:	0012      	movs	r2, r2
	...

20015a3c <.Lanon.fbd797e2716bf9ec2517646d08565479.272>:
20015a3c:	3d3d      	subs	r5, #61	; 0x3d
20015a3e:	d4d4      	bmi.n	200159ea <.Lanon.fbd797e2716bf9ec2517646d08565479.252+0x3d>
20015a40:	7361      	strb	r1, [r4, #13]
20015a42:	6573      	str	r3, [r6, #84]	; 0x54
20015a44:	7472      	strb	r2, [r6, #17]
20015a46:	6f69      	ldr	r1, [r5, #116]	; 0x74
20015a48:	206e      	movs	r0, #110	; 0x6e
20015a4a:	6c60      	ldr	r0, [r4, #68]	; 0x44
20015a4c:	6665      	str	r5, [r4, #100]	; 0x64
20015a4e:	2074      	movs	r0, #116	; 0x74
20015a50:	0000      	movs	r0, r0
20015a52:	0000      	movs	r0, r0
20015a54:	0000      	movs	r0, r0
20015a56:	3fe0      	subs	r7, #224	; 0xe0
20015a58:	0000      	movs	r0, r0
20015a5a:	0000      	movs	r0, r0
20015a5c:	0000      	movs	r0, r0
20015a5e:	bfe0      	nop	{14}
20015a60:	6162      	str	r2, [r4, #20]
20015a62:	2064      	movs	r0, #100	; 0x64
20015a64:	7561      	strb	r1, [r4, #21]
20015a66:	6964      	ldr	r4, [r4, #20]
20015a68:	206f      	movs	r0, #111	; 0x6f
20015a6a:	6f66      	ldr	r6, [r4, #116]	; 0x74
20015a6c:	6d72      	ldr	r2, [r6, #84]	; 0x54
20015a6e:	7461      	strb	r1, [r4, #17]
20015a70:	7220      	strb	r0, [r4, #8]
20015a72:	6769      	str	r1, [r5, #116]	; 0x74
20015a74:	7468      	strb	r0, [r5, #17]
20015a76:	2060      	movs	r0, #96	; 0x60
20015a78:	6166      	str	r6, [r4, #20]
20015a7a:	6c69      	ldr	r1, [r5, #68]	; 0x44
20015a7c:	6465      	str	r5, [r4, #68]	; 0x44
20015a7e:	203a      	movs	r0, #58	; 0x3a
20015a80:	7220      	strb	r0, [r4, #8]
20015a82:	6769      	str	r1, [r5, #116]	; 0x74
20015a84:	7468      	strb	r0, [r5, #17]
20015a86:	2060      	movs	r0, #96	; 0x60
20015a88:	6166      	str	r6, [r4, #20]
20015a8a:	6c69      	ldr	r1, [r5, #68]	; 0x44
20015a8c:	6465      	str	r5, [r4, #68]	; 0x44
20015a8e:	200a      	movs	r0, #10
20015a90:	6c20      	ldr	r0, [r4, #64]	; 0x40
20015a92:	6665      	str	r5, [r4, #100]	; 0x64
20015a94:	3a74      	subs	r2, #116	; 0x74
20015a96:	0a20      	lsrs	r0, r4, #8
20015a98:	7220      	strb	r0, [r4, #8]
20015a9a:	6769      	str	r1, [r5, #116]	; 0x74
20015a9c:	7468      	strb	r0, [r5, #17]
20015a9e:	203a      	movs	r0, #58	; 0x3a

20015aa0 <.Lanon.fbd797e2716bf9ec2517646d08565479.278>:
20015aa0:	5a40      	ldrh	r0, [r0, r1]
20015aa2:	2001      	movs	r0, #1
20015aa4:	0010      	movs	r0, r2
20015aa6:	0000      	movs	r0, r0
20015aa8:	5a80      	ldrh	r0, [r0, r2]
20015aaa:	2001      	movs	r0, #1
20015aac:	0017      	movs	r7, r2
20015aae:	0000      	movs	r0, r0
20015ab0:	5a97      	ldrh	r7, [r2, r2]
20015ab2:	2001      	movs	r0, #1
20015ab4:	0009      	movs	r1, r1
20015ab6:	0000      	movs	r0, r0
20015ab8:	200a      	movs	r0, #10
20015aba:	6c20      	ldr	r0, [r4, #64]	; 0x40
20015abc:	6665      	str	r5, [r4, #100]	; 0x64
20015abe:	3a74      	subs	r2, #116	; 0x74
20015ac0:	d420      	bmi.n	20015b04 <.Lanon.fbd797e2716bf9ec2517646d08565479.284+0xc>
20015ac2:	d4d4      	bmi.n	20015a6e <.Lanon.fbd797e2716bf9ec2517646d08565479.272+0x32>

20015ac4 <.Lanon.fbd797e2716bf9ec2517646d08565479.281>:
20015ac4:	5a40      	ldrh	r0, [r0, r1]
20015ac6:	2001      	movs	r0, #1
20015ac8:	0010      	movs	r0, r2
20015aca:	0000      	movs	r0, r0
20015acc:	5a70      	ldrh	r0, [r6, r1]
20015ace:	2001      	movs	r0, #1
20015ad0:	0010      	movs	r0, r2
20015ad2:	0000      	movs	r0, r0
20015ad4:	5ab8      	ldrh	r0, [r7, r2]
20015ad6:	2001      	movs	r0, #1
20015ad8:	0009      	movs	r1, r1
20015ada:	0000      	movs	r0, r0
20015adc:	5a97      	ldrh	r7, [r2, r2]
20015ade:	2001      	movs	r0, #1
20015ae0:	0009      	movs	r1, r1
20015ae2:	0000      	movs	r0, r0
20015ae4:	203a      	movs	r0, #58	; 0x3a
20015ae6:	d4d4      	bmi.n	20015a92 <.Lanon.fbd797e2716bf9ec2517646d08565479.272+0x56>

20015ae8 <.Lanon.fbd797e2716bf9ec2517646d08565479.283>:
20015ae8:	0001      	movs	r1, r0
20015aea:	0000      	movs	r0, r0
20015aec:	0000      	movs	r0, r0
20015aee:	0000      	movs	r0, r0
20015af0:	5ae4      	ldrh	r4, [r4, r3]
20015af2:	2001      	movs	r0, #1
20015af4:	0002      	movs	r2, r0
	...

20015af8 <.Lanon.fbd797e2716bf9ec2517646d08565479.284>:
20015af8:	0000      	movs	r0, r0
20015afa:	0000      	movs	r0, r0
20015afc:	000c      	movs	r4, r1
20015afe:	0000      	movs	r0, r0
20015b00:	0004      	movs	r4, r0
20015b02:	0000      	movs	r0, r0
20015b04:	13a3      	asrs	r3, r4, #14
20015b06:	2001      	movs	r0, #1
20015b08:	15ed      	asrs	r5, r5, #23
20015b0a:	2001      	movs	r0, #1
20015b0c:	1639      	asrs	r1, r7, #24
20015b0e:	2001      	movs	r0, #1
20015b10:	444d      	add	r5, r9
20015b12:	0049      	lsls	r1, r1, #1
20015b14:	2020      	movs	r0, #32
20015b16:	2020      	movs	r0, #32

20015b18 <.Lanon.fbd797e2716bf9ec2517646d08565479.287>:
20015b18:	202c      	movs	r0, #44	; 0x2c

20015b1a <.Lanon.fbd797e2716bf9ec2517646d08565479.289>:
20015b1a:	0a2c      	lsrs	r4, r5, #8

20015b1c <.Lanon.fbd797e2716bf9ec2517646d08565479.295>:
20015b1c:	      	cmp	r0, #40	; 0x28

20015b1d <.Lanon.fbd797e2716bf9ec2517646d08565479.296>:
20015b1d:	0a28      	lsrs	r0, r5, #8

20015b1f <.Lanon.fbd797e2716bf9ec2517646d08565479.297>:
20015b1f:	      	lsrs	r4, r5, #8

20015b20 <.Lanon.fbd797e2716bf9ec2517646d08565479.298>:
20015b20:	      	ldrb	r2, [r1, r4]

20015b21 <.Lanon.fbd797e2716bf9ec2517646d08565479.301>:
20015b21:	635d      	str	r5, [r3, #52]	; 0x34
20015b23:	726f      	strb	r7, [r5, #9]
20015b25:	2f65      	cmp	r7, #101	; 0x65
20015b27:	7273      	strb	r3, [r6, #9]
20015b29:	2f63      	cmp	r7, #99	; 0x63
20015b2b:	6d66      	ldr	r6, [r4, #84]	; 0x54
20015b2d:	2f74      	cmp	r7, #116	; 0x74
20015b2f:	756e      	strb	r6, [r5, #21]
20015b31:	2e6d      	cmp	r6, #109	; 0x6d
20015b33:	7372      	strb	r2, [r6, #13]
20015b35:	d4d4      	bmi.n	20015ae1 <.Lanon.fbd797e2716bf9ec2517646d08565479.281+0x1d>
20015b37:	      	movs	r2, #212	; 0xd4

20015b38 <.Lanon.fbd797e2716bf9ec2517646d08565479.313>:
20015b38:	5b22      	ldrh	r2, [r4, r4]
20015b3a:	2001      	movs	r0, #1
20015b3c:	0013      	movs	r3, r2
20015b3e:	0000      	movs	r0, r0
20015b40:	0066      	lsls	r6, r4, #1
20015b42:	0000      	movs	r0, r0
20015b44:	0017      	movs	r7, r2
	...

20015b48 <.Lanon.fbd797e2716bf9ec2517646d08565479.315>:
20015b48:	7830      	ldrb	r0, [r6, #0]

20015b4a <.Lanon.fbd797e2716bf9ec2517646d08565479.317>:
20015b4a:	3030      	adds	r0, #48	; 0x30
20015b4c:	3130      	adds	r1, #48	; 0x30
20015b4e:	3230      	adds	r2, #48	; 0x30
20015b50:	3330      	adds	r3, #48	; 0x30
20015b52:	3430      	adds	r4, #48	; 0x30
20015b54:	3530      	adds	r5, #48	; 0x30
20015b56:	3630      	adds	r6, #48	; 0x30
20015b58:	3730      	adds	r7, #48	; 0x30
20015b5a:	3830      	subs	r0, #48	; 0x30
20015b5c:	3930      	subs	r1, #48	; 0x30
20015b5e:	3031      	adds	r0, #49	; 0x31
20015b60:	3131      	adds	r1, #49	; 0x31
20015b62:	3231      	adds	r2, #49	; 0x31
20015b64:	3331      	adds	r3, #49	; 0x31
20015b66:	3431      	adds	r4, #49	; 0x31
20015b68:	3531      	adds	r5, #49	; 0x31
20015b6a:	3631      	adds	r6, #49	; 0x31
20015b6c:	3731      	adds	r7, #49	; 0x31
20015b6e:	3831      	subs	r0, #49	; 0x31
20015b70:	3931      	subs	r1, #49	; 0x31
20015b72:	3032      	adds	r0, #50	; 0x32
20015b74:	3132      	adds	r1, #50	; 0x32
20015b76:	3232      	adds	r2, #50	; 0x32
20015b78:	3332      	adds	r3, #50	; 0x32
20015b7a:	3432      	adds	r4, #50	; 0x32
20015b7c:	3532      	adds	r5, #50	; 0x32
20015b7e:	3632      	adds	r6, #50	; 0x32
20015b80:	3732      	adds	r7, #50	; 0x32
20015b82:	3832      	subs	r0, #50	; 0x32
20015b84:	3932      	subs	r1, #50	; 0x32
20015b86:	3033      	adds	r0, #51	; 0x33
20015b88:	3133      	adds	r1, #51	; 0x33
20015b8a:	3233      	adds	r2, #51	; 0x33
20015b8c:	3333      	adds	r3, #51	; 0x33
20015b8e:	3433      	adds	r4, #51	; 0x33
20015b90:	3533      	adds	r5, #51	; 0x33
20015b92:	3633      	adds	r6, #51	; 0x33
20015b94:	3733      	adds	r7, #51	; 0x33
20015b96:	3833      	subs	r0, #51	; 0x33
20015b98:	3933      	subs	r1, #51	; 0x33
20015b9a:	3034      	adds	r0, #52	; 0x34
20015b9c:	3134      	adds	r1, #52	; 0x34
20015b9e:	3234      	adds	r2, #52	; 0x34
20015ba0:	3334      	adds	r3, #52	; 0x34
20015ba2:	3434      	adds	r4, #52	; 0x34
20015ba4:	3534      	adds	r5, #52	; 0x34
20015ba6:	3634      	adds	r6, #52	; 0x34
20015ba8:	3734      	adds	r7, #52	; 0x34
20015baa:	3834      	subs	r0, #52	; 0x34
20015bac:	3934      	subs	r1, #52	; 0x34
20015bae:	3035      	adds	r0, #53	; 0x35
20015bb0:	3135      	adds	r1, #53	; 0x35
20015bb2:	3235      	adds	r2, #53	; 0x35
20015bb4:	3335      	adds	r3, #53	; 0x35
20015bb6:	3435      	adds	r4, #53	; 0x35
20015bb8:	3535      	adds	r5, #53	; 0x35
20015bba:	3635      	adds	r6, #53	; 0x35
20015bbc:	3735      	adds	r7, #53	; 0x35
20015bbe:	3835      	subs	r0, #53	; 0x35
20015bc0:	3935      	subs	r1, #53	; 0x35
20015bc2:	3036      	adds	r0, #54	; 0x36
20015bc4:	3136      	adds	r1, #54	; 0x36
20015bc6:	3236      	adds	r2, #54	; 0x36
20015bc8:	3336      	adds	r3, #54	; 0x36
20015bca:	3436      	adds	r4, #54	; 0x36
20015bcc:	3536      	adds	r5, #54	; 0x36
20015bce:	3636      	adds	r6, #54	; 0x36
20015bd0:	3736      	adds	r7, #54	; 0x36
20015bd2:	3836      	subs	r0, #54	; 0x36
20015bd4:	3936      	subs	r1, #54	; 0x36
20015bd6:	3037      	adds	r0, #55	; 0x37
20015bd8:	3137      	adds	r1, #55	; 0x37
20015bda:	3237      	adds	r2, #55	; 0x37
20015bdc:	3337      	adds	r3, #55	; 0x37
20015bde:	3437      	adds	r4, #55	; 0x37
20015be0:	3537      	adds	r5, #55	; 0x37
20015be2:	3637      	adds	r6, #55	; 0x37
20015be4:	3737      	adds	r7, #55	; 0x37
20015be6:	3837      	subs	r0, #55	; 0x37
20015be8:	3937      	subs	r1, #55	; 0x37
20015bea:	3038      	adds	r0, #56	; 0x38
20015bec:	3138      	adds	r1, #56	; 0x38
20015bee:	3238      	adds	r2, #56	; 0x38
20015bf0:	3338      	adds	r3, #56	; 0x38
20015bf2:	3438      	adds	r4, #56	; 0x38
20015bf4:	3538      	adds	r5, #56	; 0x38
20015bf6:	3638      	adds	r6, #56	; 0x38
20015bf8:	3738      	adds	r7, #56	; 0x38
20015bfa:	3838      	subs	r0, #56	; 0x38
20015bfc:	3938      	subs	r1, #56	; 0x38
20015bfe:	3039      	adds	r0, #57	; 0x39
20015c00:	3139      	adds	r1, #57	; 0x39
20015c02:	3239      	adds	r2, #57	; 0x39
20015c04:	3339      	adds	r3, #57	; 0x39
20015c06:	3439      	adds	r4, #57	; 0x39
20015c08:	3539      	adds	r5, #57	; 0x39
20015c0a:	3639      	adds	r6, #57	; 0x39
20015c0c:	3739      	adds	r7, #57	; 0x39
20015c0e:	3839      	subs	r0, #57	; 0x39
20015c10:	3939      	subs	r1, #57	; 0x39
20015c12:	6172      	str	r2, [r6, #20]
20015c14:	676e      	str	r6, [r5, #116]	; 0x74
20015c16:	2065      	movs	r0, #101	; 0x65
20015c18:	7473      	strb	r3, [r6, #17]
20015c1a:	7261      	strb	r1, [r4, #9]
20015c1c:	2074      	movs	r0, #116	; 0x74
20015c1e:	6e69      	ldr	r1, [r5, #100]	; 0x64
20015c20:	6564      	str	r4, [r4, #84]	; 0x54
20015c22:	2078      	movs	r0, #120	; 0x78
20015c24:	6f20      	ldr	r0, [r4, #112]	; 0x70
20015c26:	7475      	strb	r5, [r6, #17]
20015c28:	6f20      	ldr	r0, [r4, #112]	; 0x70
20015c2a:	2066      	movs	r0, #102	; 0x66
20015c2c:	6172      	str	r2, [r6, #20]
20015c2e:	676e      	str	r6, [r5, #116]	; 0x74
20015c30:	2065      	movs	r0, #101	; 0x65
20015c32:	6f66      	ldr	r6, [r4, #116]	; 0x74
20015c34:	2072      	movs	r0, #114	; 0x72
20015c36:	6c73      	ldr	r3, [r6, #68]	; 0x44
20015c38:	6369      	str	r1, [r5, #52]	; 0x34
20015c3a:	2065      	movs	r0, #101	; 0x65
20015c3c:	666f      	str	r7, [r5, #100]	; 0x64
20015c3e:	6c20      	ldr	r0, [r4, #64]	; 0x40
20015c40:	6e65      	ldr	r5, [r4, #100]	; 0x64
20015c42:	7467      	strb	r7, [r4, #17]
20015c44:	2068      	movs	r0, #104	; 0x68
20015c46:	d4d4      	bmi.n	20015bf2 <.Lanon.fbd797e2716bf9ec2517646d08565479.317+0xa8>

20015c48 <.Lanon.fbd797e2716bf9ec2517646d08565479.343>:
20015c48:	5c12      	ldrb	r2, [r2, r0]
20015c4a:	2001      	movs	r0, #1
20015c4c:	0012      	movs	r2, r2
20015c4e:	0000      	movs	r0, r0
20015c50:	5c24      	ldrb	r4, [r4, r0]
20015c52:	2001      	movs	r0, #1
20015c54:	0022      	movs	r2, r4
20015c56:	0000      	movs	r0, r0
20015c58:	6f73      	ldr	r3, [r6, #116]	; 0x74
20015c5a:	7275      	strb	r5, [r6, #9]
20015c5c:	6563      	str	r3, [r4, #84]	; 0x54
20015c5e:	7320      	strb	r0, [r4, #12]
20015c60:	696c      	ldr	r4, [r5, #20]
20015c62:	6563      	str	r3, [r4, #84]	; 0x54
20015c64:	6c20      	ldr	r0, [r4, #64]	; 0x40
20015c66:	6e65      	ldr	r5, [r4, #100]	; 0x64
20015c68:	7467      	strb	r7, [r4, #17]
20015c6a:	2068      	movs	r0, #104	; 0x68
20015c6c:	2928      	cmp	r1, #40	; 0x28
20015c6e:	6420      	str	r0, [r4, #64]	; 0x40
20015c70:	656f      	str	r7, [r5, #84]	; 0x54
20015c72:	2073      	movs	r0, #115	; 0x73
20015c74:	6f6e      	ldr	r6, [r5, #116]	; 0x74
20015c76:	2074      	movs	r0, #116	; 0x74
20015c78:	616d      	str	r5, [r5, #20]
20015c7a:	6374      	str	r4, [r6, #52]	; 0x34
20015c7c:	2068      	movs	r0, #104	; 0x68
20015c7e:	6564      	str	r4, [r4, #84]	; 0x54
20015c80:	7473      	strb	r3, [r6, #17]
20015c82:	6e69      	ldr	r1, [r5, #100]	; 0x64
20015c84:	7461      	strb	r1, [r4, #17]
20015c86:	6f69      	ldr	r1, [r5, #116]	; 0x74
20015c88:	206e      	movs	r0, #110	; 0x6e
20015c8a:	6c73      	ldr	r3, [r6, #68]	; 0x44
20015c8c:	6369      	str	r1, [r5, #52]	; 0x34
20015c8e:	2065      	movs	r0, #101	; 0x65
20015c90:	656c      	str	r4, [r5, #84]	; 0x54
20015c92:	676e      	str	r6, [r5, #116]	; 0x74
20015c94:	6874      	ldr	r4, [r6, #4]
20015c96:	2820      	cmp	r0, #32

20015c98 <.Lanon.fbd797e2716bf9ec2517646d08565479.358>:
20015c98:	5c58      	ldrb	r0, [r3, r1]
20015c9a:	2001      	movs	r0, #1
20015c9c:	0015      	movs	r5, r2
20015c9e:	0000      	movs	r0, r0
20015ca0:	5c6d      	ldrb	r5, [r5, r1]
20015ca2:	2001      	movs	r0, #1
20015ca4:	002b      	movs	r3, r5
20015ca6:	0000      	movs	r0, r0
20015ca8:	5980      	ldr	r0, [r0, r6]
20015caa:	2001      	movs	r0, #1
20015cac:	0001      	movs	r1, r0
	...

20015cb0 <.Lanon.70f237c424c422488728a9adbbfcd26f.81>:
20015cb0:	f983 00a2 	vst1.8	{d0[5]}, [r3], r2
20015cb4:	4e44      	ldr	r6, [pc, #272]	; (20015dc8 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.1+0x10>)
20015cb6:	006e      	lsls	r6, r5, #1
20015cb8:	29fc      	cmp	r1, #252	; 0xfc
20015cba:	0015      	movs	r5, r2
20015cbc:	57d1      	ldrsb	r1, [r2, r7]
20015cbe:	0027      	movs	r7, r4
20015cc0:	34dd      	adds	r4, #221	; 0xdd
20015cc2:	00f5      	lsls	r5, r6, #3
20015cc4:	db62      	blt.n	20015d8c <.Lanon.70f237c424c422488728a9adbbfcd26f.81+0xdc>
20015cc6:	00c0      	lsls	r0, r0, #3
20015cc8:	993c      	ldr	r1, [sp, #240]	; 0xf0
20015cca:	0095      	lsls	r5, r2, #2
20015ccc:	9041      	str	r0, [sp, #260]	; 0x104
20015cce:	0043      	lsls	r3, r0, #1
20015cd0:	5163      	str	r3, [r4, r5]
20015cd2:	00fe      	lsls	r6, r7, #3
20015cd4:	debb      	udf	#187	; 0xbb
20015cd6:	00ab      	lsls	r3, r5, #2
20015cd8:	61b7      	str	r7, [r6, #24]
20015cda:	00c5      	lsls	r5, r0, #3
20015cdc:	6e3a      	ldr	r2, [r7, #96]	; 0x60
20015cde:	0024      	movs	r4, r4
20015ce0:	4dd2      	ldr	r5, [pc, #840]	; (2001602c <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.41+0x4>)
20015ce2:	0042      	lsls	r2, r0, #1
20015ce4:	0649      	lsls	r1, r1, #25
20015ce6:	00e0      	lsls	r0, r4, #3
20015ce8:	ea09 002e 	and.w	r0, r9, lr, asr #32
20015cec:	921c      	str	r2, [sp, #112]	; 0x70
20015cee:	00d1      	lsls	r1, r2, #3
20015cf0:	1deb      	adds	r3, r5, #7
20015cf2:	00fe      	lsls	r6, r7, #3
20015cf4:	b129      	cbz	r1, 20015d02 <.Lanon.70f237c424c422488728a9adbbfcd26f.81+0x52>
20015cf6:	001c      	movs	r4, r3
20015cf8:	3ee8      	subs	r6, #232	; 0xe8
20015cfa:	00a7      	lsls	r7, r4, #2
20015cfc:	35f5      	adds	r5, #245	; 0xf5
20015cfe:	0082      	lsls	r2, r0, #2
20015d00:	bb44      	cbnz	r4, 20015d54 <.Lanon.70f237c424c422488728a9adbbfcd26f.81+0xa4>
20015d02:	002e      	movs	r6, r5
20015d04:	e99c 0084 			; <UNDEFINED> instruction: 0xe99c0084
20015d08:	26b4      	movs	r6, #180	; 0xb4
20015d0a:	0070      	lsls	r0, r6, #1
20015d0c:	7e41      	ldrb	r1, [r0, #25]
20015d0e:	005f      	lsls	r7, r3, #1
20015d10:	91d6      	str	r1, [sp, #856]	; 0x358
20015d12:	0039      	movs	r1, r7
20015d14:	8353      	strh	r3, [r2, #26]
20015d16:	0039      	movs	r1, r7
20015d18:	f49c 0039 	eors.w	r0, ip, #12124160	; 0xb90000
20015d1c:	5f8b      	ldrsh	r3, [r1, r6]
20015d1e:	0084      	lsls	r4, r0, #2
20015d20:	f928 00bd 	vld4.32	{d0-d3}, [r8 :256]!
20015d24:	1ff8      	subs	r0, r7, #7
20015d26:	003b      	movs	r3, r7
20015d28:	ffde 0097 	vshr.u64	d16, d7, #34
20015d2c:	980f      	ldr	r0, [sp, #60]	; 0x3c
20015d2e:	0005      	movs	r5, r0
20015d30:	2f11      	cmp	r7, #17
20015d32:	00ef      	lsls	r7, r5, #3
20015d34:	5a0a      	ldrh	r2, [r1, r0]
20015d36:	008b      	lsls	r3, r1, #2
20015d38:	1f6d      	subs	r5, r5, #5
20015d3a:	006d      	lsls	r5, r5, #1
20015d3c:	7ecf      	ldrb	r7, [r1, #27]
20015d3e:	0036      	movs	r6, r6
20015d40:	cb09      	ldmia	r3, {r0, r3}
20015d42:	0027      	movs	r7, r4
20015d44:	4f46      	ldr	r7, [pc, #280]	; (20015e60 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.15+0x14>)
20015d46:	00b7      	lsls	r7, r6, #2
20015d48:	669e      	str	r6, [r3, #104]	; 0x68
20015d4a:	003f      	movs	r7, r7
20015d4c:	ea2d 005f 	bic.w	r0, sp, pc, lsr #1
20015d50:	27ba      	movs	r7, #186	; 0xba
20015d52:	0075      	lsls	r5, r6, #1
20015d54:	ebe5 00c7 			; <UNDEFINED> instruction: 0xebe500c7
20015d58:	7b3d      	ldrb	r5, [r7, #12]
20015d5a:	00f1      	lsls	r1, r6, #3
20015d5c:	39f7      	subs	r1, #247	; 0xf7
20015d5e:	0007      	movs	r7, r0
20015d60:	5292      	strh	r2, [r2, r2]
20015d62:	008a      	lsls	r2, r1, #2
20015d64:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
20015d66:	00ea      	lsls	r2, r5, #3
20015d68:	b11f      	cbz	r7, 20015d72 <.Lanon.70f237c424c422488728a9adbbfcd26f.81+0xc2>
20015d6a:	005f      	lsls	r7, r3, #1
20015d6c:	5d08      	ldrb	r0, [r1, r4]
20015d6e:	008d      	lsls	r5, r1, #2
20015d70:	0330      	lsls	r0, r6, #12
20015d72:	0056      	lsls	r6, r2, #1
20015d74:	fc7b 0046 	ldc2l	0, cr0, [fp], #-280	; 0xfffffee8
20015d78:	abf0      	add	r3, sp, #960	; 0x3c0
20015d7a:	006b      	lsls	r3, r5, #1
20015d7c:	bc20      	pop	{r5}
20015d7e:	00cf      	lsls	r7, r1, #3
20015d80:	f436 009a 	bics.w	r0, r6, #5046272	; 0x4d0000
20015d84:	a9e3      	add	r1, sp, #908	; 0x38c
20015d86:	001d      	movs	r5, r3
20015d88:	615e      	str	r6, [r3, #20]
20015d8a:	0091      	lsls	r1, r2, #2
20015d8c:	1b08      	subs	r0, r1, r4
20015d8e:	00e6      	lsls	r6, r4, #3
20015d90:	9985      	ldr	r1, [sp, #532]	; 0x214
20015d92:	0065      	lsls	r5, r4, #1
20015d94:	14a0      	asrs	r0, r4, #18
20015d96:	005f      	lsls	r7, r3, #1
20015d98:	408d      	lsls	r5, r1
20015d9a:	0068      	lsls	r0, r5, #1
20015d9c:	d880      	bhi.n	20015ca0 <.Lanon.fbd797e2716bf9ec2517646d08565479.358+0x8>
20015d9e:	00ff      	lsls	r7, r7, #3
20015da0:	7327      	strb	r7, [r4, #12]
20015da2:	004d      	lsls	r5, r1, #1
20015da4:	0606      	lsls	r6, r0, #24
20015da6:	0031      	movs	r1, r6
20015da8:	56ca      	ldrsb	r2, [r1, r3]
20015daa:	0015      	movs	r5, r2
20015dac:	a8c9      	add	r0, sp, #804	; 0x324
20015dae:	0073      	lsls	r3, r6, #1
20015db0:	e27b      	b.n	200162aa <_stack+0x10a>
20015db2:	0060      	lsls	r0, r4, #1
20015db4:	8c6b      	ldrh	r3, [r5, #34]	; 0x22
20015db6:	00c0      	lsls	r0, r0, #3

20015db8 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.1>:
20015db8:	0000      	movs	r0, r0
20015dba:	0000      	movs	r0, r0
20015dbc:	0004      	movs	r4, r0
20015dbe:	0000      	movs	r0, r0
20015dc0:	0004      	movs	r4, r0
20015dc2:	0000      	movs	r0, r0
20015dc4:	3e75      	subs	r6, #117	; 0x75
20015dc6:	2001      	movs	r0, #1
20015dc8:	754e      	strb	r6, [r1, #21]
20015dca:	456c      	cmp	r4, sp
20015dcc:	7272      	strb	r2, [r6, #9]
20015dce:	726f      	strb	r7, [r5, #9]

20015dd0 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.8>:
20015dd0:	5a60      	ldrh	r0, [r4, r1]
20015dd2:	2001      	movs	r0, #1
20015dd4:	0010      	movs	r0, r2
20015dd6:	0000      	movs	r0, r0
20015dd8:	7273      	strb	r3, [r6, #9]
20015dda:	2f63      	cmp	r7, #99	; 0x63
20015ddc:	7270      	strb	r0, [r6, #9]
20015dde:	676f      	str	r7, [r5, #116]	; 0x74
20015de0:	6172      	str	r2, [r6, #20]
20015de2:	5f6d      	ldrsh	r5, [r5, r5]
20015de4:	6576      	str	r6, [r6, #84]	; 0x54
20015de6:	7463      	strb	r3, [r4, #17]
20015de8:	726f      	strb	r7, [r5, #9]
20015dea:	612f      	str	r7, [r5, #16]
20015dec:	6475      	str	r5, [r6, #68]	; 0x44
20015dee:	6f69      	ldr	r1, [r5, #116]	; 0x74
20015df0:	722e      	strb	r6, [r5, #8]
20015df2:	d473      	bmi.n	20015edc <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.19+0x18>

20015df4 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.10>:
20015df4:	5dd8      	ldrb	r0, [r3, r7]
20015df6:	2001      	movs	r0, #1
20015df8:	001b      	movs	r3, r3
20015dfa:	0000      	movs	r0, r0
20015dfc:	001f      	movs	r7, r3
20015dfe:	0000      	movs	r0, r0
20015e00:	0012      	movs	r2, r2
	...

20015e04 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.11>:
20015e04:	3da1      	subs	r5, #161	; 0xa1
20015e06:	2001      	movs	r0, #1
20015e08:	0010      	movs	r0, r2
20015e0a:	0000      	movs	r0, r0
20015e0c:	0004      	movs	r4, r0
20015e0e:	0000      	movs	r0, r0
20015e10:	3e11      	subs	r6, #17
20015e12:	2001      	movs	r0, #1

20015e14 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.12>:
20015e14:	6166      	str	r6, [r4, #20]
20015e16:	6c69      	ldr	r1, [r5, #68]	; 0x44
20015e18:	6465      	str	r5, [r4, #68]	; 0x44
20015e1a:	7420      	strb	r0, [r4, #16]
20015e1c:	206f      	movs	r0, #111	; 0x6f
20015e1e:	7263      	strb	r3, [r4, #9]
20015e20:	6165      	str	r5, [r4, #20]
20015e22:	6574      	str	r4, [r6, #84]	; 0x54
20015e24:	7020      	strb	r0, [r4, #0]
20015e26:	7261      	strb	r1, [r4, #9]
20015e28:	6d65      	ldr	r5, [r4, #84]	; 0x54
20015e2a:	7465      	strb	r5, [r4, #17]
20015e2c:	7265      	strb	r5, [r4, #9]
20015e2e:	6e20      	ldr	r0, [r4, #96]	; 0x60
20015e30:	6d61      	ldr	r1, [r4, #84]	; 0x54
20015e32:	2065      	movs	r0, #101	; 0x65
20015e34:	7473      	strb	r3, [r6, #17]
20015e36:	6972      	ldr	r2, [r6, #20]
20015e38:	676e      	str	r6, [r5, #116]	; 0x74
20015e3a:	d4d4      	bmi.n	20015de6 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.8+0x16>

20015e3c <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.14>:
20015e3c:	59f8      	ldr	r0, [r7, r7]
20015e3e:	2001      	movs	r0, #1
20015e40:	0020      	movs	r0, r4
20015e42:	0000      	movs	r0, r0
20015e44:	0028      	movs	r0, r5
20015e46:	0000      	movs	r0, r0
20015e48:	002d      	movs	r5, r5
	...

20015e4c <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.15>:
20015e4c:	59f8      	ldr	r0, [r7, r7]
20015e4e:	2001      	movs	r0, #1
20015e50:	0020      	movs	r0, r4
20015e52:	0000      	movs	r0, r0
20015e54:	0036      	movs	r6, r6
20015e56:	0000      	movs	r0, r0
20015e58:	0009      	movs	r1, r1
20015e5a:	0000      	movs	r0, r0
20015e5c:	722f      	strb	r7, [r5, #8]
20015e5e:	7375      	strb	r5, [r6, #13]
20015e60:	6374      	str	r4, [r6, #52]	; 0x34
20015e62:	652f      	str	r7, [r5, #80]	; 0x50
20015e64:	3735      	adds	r7, #53	; 0x35
20015e66:	3366      	adds	r3, #102	; 0x66
20015e68:	3930      	subs	r1, #48	; 0x30
20015e6a:	6130      	str	r0, [r6, #16]
20015e6c:	6365      	str	r5, [r4, #52]	; 0x34
20015e6e:	3333      	adds	r3, #51	; 0x33
20015e70:	6463      	str	r3, [r4, #68]	; 0x44
20015e72:	6662      	str	r2, [r4, #100]	; 0x64
20015e74:	3636      	adds	r6, #54	; 0x36
20015e76:	3630      	adds	r6, #48	; 0x30
20015e78:	6333      	str	r3, [r6, #48]	; 0x30
20015e7a:	3638      	adds	r6, #56	; 0x38
20015e7c:	6136      	str	r6, [r6, #16]
20015e7e:	6166      	str	r6, [r4, #20]
20015e80:	3561      	adds	r5, #97	; 0x61
20015e82:	3165      	adds	r1, #101	; 0x65
20015e84:	3765      	adds	r7, #101	; 0x65
20015e86:	6238      	str	r0, [r7, #32]
20015e88:	6239      	str	r1, [r7, #32]
20015e8a:	2f62      	cmp	r7, #98	; 0x62
20015e8c:	696c      	ldr	r4, [r5, #20]
20015e8e:	7262      	strb	r2, [r4, #9]
20015e90:	7261      	strb	r1, [r4, #9]
20015e92:	2f79      	cmp	r7, #121	; 0x79
20015e94:	6f63      	ldr	r3, [r4, #116]	; 0x74
20015e96:	6572      	str	r2, [r6, #84]	; 0x54
20015e98:	732f      	strb	r7, [r5, #12]
20015e9a:	6372      	str	r2, [r6, #52]	; 0x34
20015e9c:	632f      	str	r7, [r5, #48]	; 0x30
20015e9e:	6c65      	ldr	r5, [r4, #68]	; 0x44
20015ea0:	2e6c      	cmp	r6, #108	; 0x6c
20015ea2:	7372      	strb	r2, [r6, #13]

20015ea4 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.17>:
20015ea4:	5e5c      	ldrsh	r4, [r3, r1]
20015ea6:	2001      	movs	r0, #1
20015ea8:	0048      	lsls	r0, r1, #1
20015eaa:	0000      	movs	r0, r0
20015eac:	04fa      	lsls	r2, r7, #19
20015eae:	0000      	movs	r0, r0
20015eb0:	000e      	movs	r6, r1
	...

20015eb4 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.18>:
20015eb4:	59f8      	ldr	r0, [r7, r7]
20015eb6:	2001      	movs	r0, #1
20015eb8:	0020      	movs	r0, r4
20015eba:	0000      	movs	r0, r0
20015ebc:	0052      	lsls	r2, r2, #1
20015ebe:	0000      	movs	r0, r0
20015ec0:	002e      	movs	r6, r5
	...

20015ec4 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.19>:
20015ec4:	59f8      	ldr	r0, [r7, r7]
20015ec6:	2001      	movs	r0, #1
20015ec8:	0020      	movs	r0, r4
20015eca:	0000      	movs	r0, r0
20015ecc:	0054      	lsls	r4, r2, #1
20015ece:	0000      	movs	r0, r0
20015ed0:	001c      	movs	r4, r3
20015ed2:	0000      	movs	r0, r0
20015ed4:	7273      	strb	r3, [r6, #9]
20015ed6:	2f63      	cmp	r7, #99	; 0x63
20015ed8:	7270      	strb	r0, [r6, #9]
20015eda:	676f      	str	r7, [r5, #116]	; 0x74
20015edc:	6172      	str	r2, [r6, #20]
20015ede:	5f6d      	ldrsh	r5, [r5, r5]
20015ee0:	6576      	str	r6, [r6, #84]	; 0x54
20015ee2:	7463      	strb	r3, [r4, #17]
20015ee4:	726f      	strb	r7, [r5, #9]
20015ee6:	6d2f      	ldr	r7, [r5, #80]	; 0x50
20015ee8:	7365      	strb	r5, [r4, #13]
20015eea:	6173      	str	r3, [r6, #20]
20015eec:	6567      	str	r7, [r4, #84]	; 0x54
20015eee:	2e73      	cmp	r6, #115	; 0x73
20015ef0:	7372      	strb	r2, [r6, #13]
20015ef2:	d4d4      	bmi.n	20015e9e <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.15+0x52>

20015ef4 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.21>:
20015ef4:	5ed4      	ldrsh	r4, [r2, r3]
20015ef6:	2001      	movs	r0, #1
20015ef8:	001e      	movs	r6, r3
20015efa:	0000      	movs	r0, r0
20015efc:	0013      	movs	r3, r2
20015efe:	0000      	movs	r0, r0
20015f00:	0019      	movs	r1, r3
20015f02:	0000      	movs	r0, r0
20015f04:	7273      	strb	r3, [r6, #9]
20015f06:	2f63      	cmp	r7, #99	; 0x63
20015f08:	7270      	strb	r0, [r6, #9]
20015f0a:	676f      	str	r7, [r5, #116]	; 0x74
20015f0c:	6172      	str	r2, [r6, #20]
20015f0e:	5f6d      	ldrsh	r5, [r5, r5]
20015f10:	6576      	str	r6, [r6, #84]	; 0x54
20015f12:	7463      	strb	r3, [r4, #17]
20015f14:	726f      	strb	r7, [r5, #9]
20015f16:	6d2f      	ldr	r7, [r5, #80]	; 0x50
20015f18:	6469      	str	r1, [r5, #68]	; 0x44
20015f1a:	2e69      	cmp	r6, #105	; 0x69
20015f1c:	7372      	strb	r2, [r6, #13]
20015f1e:	d4d4      	bmi.n	20015eca <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.19+0x6>

20015f20 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.26>:
20015f20:	5f04      	ldrsh	r4, [r0, r4]
20015f22:	2001      	movs	r0, #1
20015f24:	001a      	movs	r2, r3
20015f26:	0000      	movs	r0, r0
20015f28:	002a      	movs	r2, r5
20015f2a:	0000      	movs	r0, r0
20015f2c:	001a      	movs	r2, r3
20015f2e:	0000      	movs	r0, r0
20015f30:	7270      	strb	r0, [r6, #9]
20015f32:	676f      	str	r7, [r5, #116]	; 0x74
20015f34:	6172      	str	r2, [r6, #20]
20015f36:	206d      	movs	r0, #109	; 0x6d
20015f38:	6576      	str	r6, [r6, #84]	; 0x54
20015f3a:	7463      	strb	r3, [r4, #17]
20015f3c:	726f      	strb	r7, [r5, #9]
20015f3e:	6320      	str	r0, [r4, #48]	; 0x30
20015f40:	6568      	str	r0, [r5, #84]	; 0x54
20015f42:	6b63      	ldr	r3, [r4, #52]	; 0x34
20015f44:	7573      	strb	r3, [r6, #21]
20015f46:	206d      	movs	r0, #109	; 0x6d
20015f48:	7265      	strb	r5, [r4, #9]
20015f4a:	6f72      	ldr	r2, [r6, #116]	; 0x74
20015f4c:	d472      	bmi.n	20016034 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.41+0xc>
20015f4e:	d4d4      	bmi.n	20015efa <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.21+0x6>

20015f50 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.28>:
20015f50:	5f30      	ldrsh	r0, [r6, r4]
20015f52:	2001      	movs	r0, #1
20015f54:	001d      	movs	r5, r3
20015f56:	0000      	movs	r0, r0
20015f58:	7273      	strb	r3, [r6, #9]
20015f5a:	2f63      	cmp	r7, #99	; 0x63
20015f5c:	7270      	strb	r0, [r6, #9]
20015f5e:	676f      	str	r7, [r5, #116]	; 0x74
20015f60:	6172      	str	r2, [r6, #20]
20015f62:	5f6d      	ldrsh	r5, [r5, r5]
20015f64:	6576      	str	r6, [r6, #84]	; 0x54
20015f66:	7463      	strb	r3, [r4, #17]
20015f68:	726f      	strb	r7, [r5, #9]
20015f6a:	6d2f      	ldr	r7, [r5, #80]	; 0x50
20015f6c:	646f      	str	r7, [r5, #68]	; 0x44
20015f6e:	722e      	strb	r6, [r5, #8]
20015f70:	d473      	bmi.n	2001605a <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.47+0x18>
20015f72:	d4d4      	bmi.n	20015f1e <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.21+0x2a>

20015f74 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.30>:
20015f74:	5f58      	ldrsh	r0, [r3, r5]
20015f76:	2001      	movs	r0, #1
20015f78:	0019      	movs	r1, r3
20015f7a:	0000      	movs	r0, r0
20015f7c:	0057      	lsls	r7, r2, #1
20015f7e:	0000      	movs	r0, r0
20015f80:	000d      	movs	r5, r1
20015f82:	0000      	movs	r0, r0
20015f84:	7270      	strb	r0, [r6, #9]
20015f86:	676f      	str	r7, [r5, #116]	; 0x74
20015f88:	6172      	str	r2, [r6, #20]
20015f8a:	206d      	movs	r0, #109	; 0x6d
20015f8c:	6576      	str	r6, [r6, #84]	; 0x54
20015f8e:	7463      	strb	r3, [r4, #17]
20015f90:	726f      	strb	r7, [r5, #9]
20015f92:	6120      	str	r0, [r4, #16]
20015f94:	726c      	strb	r4, [r5, #9]
20015f96:	6165      	str	r5, [r4, #20]
20015f98:	7964      	ldrb	r4, [r4, #5]
20015f9a:	7420      	strb	r0, [r4, #16]
20015f9c:	6b61      	ldr	r1, [r4, #52]	; 0x34
20015f9e:	6e65      	ldr	r5, [r4, #100]	; 0x64

20015fa0 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.32>:
20015fa0:	5f84      	ldrsh	r4, [r0, r6]
20015fa2:	2001      	movs	r0, #1
20015fa4:	001c      	movs	r4, r3
	...

20015fa8 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.33>:
20015fa8:	5f58      	ldrsh	r0, [r3, r5]
20015faa:	2001      	movs	r0, #1
20015fac:	0019      	movs	r1, r3
20015fae:	0000      	movs	r0, r0
20015fb0:	004e      	lsls	r6, r1, #1
20015fb2:	0000      	movs	r0, r0
20015fb4:	000d      	movs	r5, r1
20015fb6:	0000      	movs	r0, r0
20015fb8:	7670      	strb	r0, [r6, #25]
20015fba:	682e      	ldr	r6, [r5, #0]
20015fbc:	6165      	str	r5, [r4, #20]
20015fbe:	4c70      	ldr	r4, [pc, #448]	; (20016180 <_ZN9owl_patch14program_vector14PROGRAM_VECTOR17h196e69be75576409E+0x30>)
20015fc0:	636f      	str	r7, [r5, #52]	; 0x34
20015fc2:	7461      	strb	r1, [r4, #17]
20015fc4:	6f69      	ldr	r1, [r5, #116]	; 0x74
20015fc6:	736e      	strb	r6, [r5, #13]
20015fc8:	692e      	ldr	r6, [r5, #16]
20015fca:	5f73      	ldrsh	r3, [r6, r5]
20015fcc:	756e      	strb	r6, [r5, #21]
20015fce:	6c6c      	ldr	r4, [r5, #68]	; 0x44

20015fd0 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.35>:
20015fd0:	5fb8      	ldrsh	r0, [r7, r6]
20015fd2:	2001      	movs	r0, #1
20015fd4:	0018      	movs	r0, r3
	...

20015fd8 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.36>:
20015fd8:	5f58      	ldrsh	r0, [r3, r5]
20015fda:	2001      	movs	r0, #1
20015fdc:	0019      	movs	r1, r3
20015fde:	0000      	movs	r0, r0
20015fe0:	00a1      	lsls	r1, r4, #2
20015fe2:	0000      	movs	r0, r0
20015fe4:	0011      	movs	r1, r2
20015fe6:	0000      	movs	r0, r0
20015fe8:	6162      	str	r2, [r4, #20]
20015fea:	2064      	movs	r0, #100	; 0x64
20015fec:	6863      	ldr	r3, [r4, #4]
20015fee:	6365      	str	r5, [r4, #52]	; 0x34
20015ff0:	736b      	strb	r3, [r5, #13]
20015ff2:	6d75      	ldr	r5, [r6, #84]	; 0x54

20015ff4 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.38>:
20015ff4:	5fe8      	ldrsh	r0, [r5, r7]
20015ff6:	2001      	movs	r0, #1
20015ff8:	000c      	movs	r4, r1
	...

20015ffc <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.39>:
20015ffc:	5f58      	ldrsh	r0, [r3, r5]
20015ffe:	2001      	movs	r0, #1
20016000:	0019      	movs	r1, r3
20016002:	0000      	movs	r0, r0
20016004:	0092      	lsls	r2, r2, #2
20016006:	0000      	movs	r0, r0
20016008:	000d      	movs	r5, r1
	...

2001600c <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.40>:
2001600c:	6166      	str	r6, [r4, #20]
2001600e:	6c69      	ldr	r1, [r5, #68]	; 0x44
20016010:	6465      	str	r5, [r4, #68]	; 0x44
20016012:	7420      	strb	r0, [r4, #16]
20016014:	206f      	movs	r0, #111	; 0x6f
20016016:	7263      	strb	r3, [r4, #9]
20016018:	6165      	str	r5, [r4, #20]
2001601a:	6574      	str	r4, [r6, #84]	; 0x54
2001601c:	6e20      	ldr	r0, [r4, #96]	; 0x60
2001601e:	6d61      	ldr	r1, [r4, #84]	; 0x54
20016020:	2065      	movs	r0, #101	; 0x65
20016022:	7473      	strb	r3, [r6, #17]
20016024:	6972      	ldr	r2, [r6, #20]
20016026:	676e      	str	r6, [r5, #116]	; 0x74

20016028 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.41>:
20016028:	5f58      	ldrsh	r0, [r3, r5]
2001602a:	2001      	movs	r0, #1
2001602c:	0019      	movs	r1, r3
2001602e:	0000      	movs	r0, r0
20016030:	00af      	lsls	r7, r5, #2
20016032:	0000      	movs	r0, r0
20016034:	002d      	movs	r5, r5
20016036:	0000      	movs	r0, r0
20016038:	7273      	strb	r3, [r6, #9]
2001603a:	2f63      	cmp	r7, #99	; 0x63
2001603c:	696c      	ldr	r4, [r5, #20]
2001603e:	2e62      	cmp	r6, #98	; 0x62
20016040:	7372      	strb	r2, [r6, #13]

20016042 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.47>:
20016042:	6e69      	ldr	r1, [r5, #100]	; 0x64
20016044:	6574      	str	r4, [r6, #84]	; 0x54
20016046:	6e72      	ldr	r2, [r6, #100]	; 0x64
20016048:	6c61      	ldr	r1, [r4, #68]	; 0x44
2001604a:	6520      	str	r0, [r4, #80]	; 0x50
2001604c:	7272      	strb	r2, [r6, #9]
2001604e:	726f      	strb	r7, [r5, #9]
20016050:	203a      	movs	r0, #58	; 0x3a
20016052:	6e65      	ldr	r5, [r4, #100]	; 0x64
20016054:	6574      	str	r4, [r6, #84]	; 0x54
20016056:	6572      	str	r2, [r6, #84]	; 0x54
20016058:	2064      	movs	r0, #100	; 0x64
2001605a:	6e75      	ldr	r5, [r6, #100]	; 0x64
2001605c:	6572      	str	r2, [r6, #84]	; 0x54
2001605e:	6361      	str	r1, [r4, #52]	; 0x34
20016060:	6168      	str	r0, [r5, #20]
20016062:	6c62      	ldr	r2, [r4, #68]	; 0x44
20016064:	2065      	movs	r0, #101	; 0x65
20016066:	6f63      	ldr	r3, [r4, #116]	; 0x74
20016068:	6564      	str	r4, [r4, #84]	; 0x54
2001606a:	d4d4      	bmi.n	20016016 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.40+0xa>

2001606c <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.48>:
2001606c:	6038      	str	r0, [r7, #0]
2001606e:	2001      	movs	r0, #1
20016070:	000a      	movs	r2, r1
20016072:	0000      	movs	r0, r0
20016074:	0025      	movs	r5, r4
20016076:	0000      	movs	r0, r0
20016078:	0009      	movs	r1, r1
2001607a:	0000      	movs	r0, r0
2001607c:	d4d4      	bmi.n	20016028 <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.41>
2001607e:	d4d4      	bmi.n	2001602a <.Lanon.4814ed1e1f8347f5122566d24c84a4e0.41+0x2>

Disassembly of section .ARM:

20016080 <__exidx_start>:
20016080:	7fff5fb8 	svcvc	0x00ff5fb8
20016084:	00000001 	andeq	r0, r0, r1
20016088:	7ffff5f0 	svcvc	0x00fff5f0
2001608c:	00000001 	andeq	r0, r0, r1

Disassembly of section .bss:

20016090 <_ZN6fundsp9ALLOCATOR17h3cbd9bce8178267bE>:
	...

200160e0 <.L_MergedGlobals>:
	...

200160e1 <__rust_no_alloc_shim_is_unstable>:
200160e1:	 	andeq	r0, r0, r0

200160e4 <_ZN9owl_patch14program_vector10parameters15BUTTON_CALLBACK17h98c0e553ae7442ffE>:
	...

200160f4 <_ZN9owl_patch14program_vector4midi13MIDI_CALLBACK17ha54d37bec2f858cfE>:
	...

20016104 <_ZN9owl_patch14program_vector8messages8INSTANCE17h5e46ce659db029efE>:
	...

Disassembly of section .pv:

20016150 <_ZN9owl_patch14program_vector14PROGRAM_VECTOR17h196e69be75576409E>:
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00004441 	andeq	r4, r0, r1, asr #8
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000003a 	andeq	r0, r0, sl, lsr r0
  10:	302e3243 	eorcc	r3, lr, r3, asr #4
  14:	63050039 	movwvs	r0, #20537	; 0x5039
  18:	6574726f 	ldrbvs	r7, [r4, #-623]!	; 0xfffffd91
  1c:	346d2d78 	strbtcc	r2, [sp], #-3448	; 0xfffff288
  20:	070d0600 	streq	r0, [sp, -r0, lsl #12]
  24:	0900084d 	stmdbeq	r0, {r0, r2, r3, r6, fp}
  28:	0e060a02 	vmlaeq.f32	s0, s12, s4
  2c:	14011100 	strne	r1, [r1], #-256	; 0xffffff00
  30:	17011501 	strne	r1, [r1, -r1, lsl #10]
  34:	19011803 	stmdbne	r1, {r0, r1, fp, ip}
  38:	1c011b01 			; <UNDEFINED> instruction: 0x1c011b01
  3c:	22021e01 	andcs	r1, r2, #1, 28
  40:	26012401 	strcs	r2, [r1], -r1, lsl #8
  44:	Address 0x0000000000000044 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	6e694c00 	cdpvs	12, 6, cr4, cr9, cr0, {0}
   4:	3a72656b 	bcc	1c995b8 <_Min_Heap_Size+0x1c995b8>
   8:	444c4c20 	strbmi	r4, [ip], #-3104	; 0xfffff3e0
   c:	2e393120 	rsfcsep	f3, f1, f0
  10:	20302e31 	eorscs	r2, r0, r1, lsr lr
  14:	74746828 	ldrbtvc	r6, [r4], #-2088	; 0xfffff7d8
  18:	2f3a7370 	svccs	0x003a7370
  1c:	7469672f 	strbtvc	r6, [r9], #-1839	; 0xfffff8d1
  20:	2e627568 	cdpcs	5, 6, cr7, cr2, cr8, {3}
  24:	2f6d6f63 	svccs	0x006d6f63
  28:	74737572 	ldrbtvc	r7, [r3], #-1394	; 0xfffffa8e
  2c:	6e616c2d 	cdpvs	12, 6, cr6, cr1, cr13, {1}
  30:	6c6c2f67 	stclvs	15, cr2, [ip], #-412	; 0xfffffe64
  34:	702d6d76 	eorvc	r6, sp, r6, ror sp
  38:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xfffff08e
  3c:	672e7463 	strvs	r7, [lr, -r3, ror #8]!
  40:	35207469 	strcc	r7, [r0, #-1129]!	; 0xfffffb97
  44:	31656137 	cmncc	r5, r7, lsr r1
  48:	37343361 	ldrcc	r3, [r4, -r1, ror #6]!
  4c:	37353034 			; <UNDEFINED> instruction: 0x37353034
  50:	64616566 	strbtvs	r6, [r1], #-1382	; 0xfffffa9a
  54:	33346332 	teqcc	r4, #-939524096	; 0xc8000000
  58:	38323938 	ldmdacc	r2!, {r3, r4, r5, r8, fp, ip, sp}
  5c:	36336465 	ldrtcc	r6, [r3], -r5, ror #8
  60:	37336238 			; <UNDEFINED> instruction: 0x37336238
  64:	66623034 			; <UNDEFINED> instruction: 0x66623034
  68:	29636530 	stmdbcs	r3!, {r4, r5, r8, sl, sp, lr}^
  6c:	73757200 	cmnvc	r5, #0, 4
  70:	76206374 			; <UNDEFINED> instruction: 0x76206374
  74:	69737265 	ldmdbvs	r3!, {r0, r2, r5, r6, r9, ip, sp, lr}^
  78:	31206e6f 			; <UNDEFINED> instruction: 0x31206e6f
  7c:	2e32382e 	cdpcs	8, 3, cr3, cr2, cr14, {1}
  80:	696e2d30 	stmdbvs	lr!, {r4, r5, r8, sl, fp, sp}^
  84:	6c746867 	ldclvs	8, cr6, [r4], #-412	; 0xfffffe64
  88:	65282079 	strvs	r2, [r8, #-121]!	; 0xffffff87
  8c:	33663735 	cmncc	r6, #13893632	; 0xd40000
  90:	61303930 	teqvs	r0, r0, lsr r9
  94:	32303220 	eorscc	r3, r0, #32, 4
  98:	38302d34 	ldmdacc	r0!, {r2, r4, r5, r8, sl, fp, sp}
  9c:	2935302d 	ldmdbcs	r5!, {r0, r2, r3, r5, ip, sp}
	...

; ModuleID = '/home/harri001/Lab1_8bits/poly_proj/solution_poly/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [5 x i8] c"poly\00"      ; [#uses=1 type=[5 x i8]*]

; [#uses=0]
define void @poly(i8 signext %x, i8* %y) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %x) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %y) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @str) nounwind
  %x_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %x) nounwind ; [#uses=3 type=i8]
  call void @llvm.dbg.value(metadata !{i8 %x_read}, i64 0, metadata !12), !dbg !21 ; [debug line = 1:16] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i8 %x}, i64 0, metadata !12), !dbg !21 ; [debug line = 1:16] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i8* %y}, i64 0, metadata !22), !dbg !23 ; [debug line = 1:25] [debug variable = y]
  %tmp_3 = shl i8 %x_read, 2, !dbg !24            ; [#uses=1 type=i8] [debug line = 3:2]
  %tmp_1 = sub i8 %tmp_3, %x_read, !dbg !24       ; [#uses=1 type=i8] [debug line = 3:2]
  %tmp = add i8 %tmp_1, 2                         ; [#uses=1 type=i8]
  %tmp1 = mul i8 %tmp, %x_read                    ; [#uses=1 type=i8]
  %tmp_2 = add i8 %tmp1, 1, !dbg !24              ; [#uses=1 type=i8] [debug line = 3:2]
  call void @_ssdm_op_Write.ap_auto.i8P(i8* %y, i8 %tmp_2) nounwind, !dbg !24 ; [debug line = 3:2]
  ret void, !dbg !26                              ; [debug line = 4:1]
}

; [#uses=3]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=2]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i8 @_ssdm_op_Read.ap_auto.i8(i8) {
entry:
  ret i8 %0
}

; [#uses=1]
define weak void @_ssdm_op_Write.ap_auto.i8P(i8*, i8) {
entry:
  store i8 %1, i8* %0
  ret void
}

; [#uses=0]
declare i6 @_ssdm_op_PartSelect.i6.i8.i32.i32(i8, i32, i32) nounwind readnone

; [#uses=0]
declare i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6, i2) nounwind readnone

!llvm.map.gv = !{}

!0 = metadata !{metadata !1}
!1 = metadata !{i32 0, i32 7, metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{metadata !"x", metadata !4, metadata !"char"}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 0, i32 0, i32 0}
!6 = metadata !{metadata !7}
!7 = metadata !{i32 0, i32 7, metadata !8}
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !"y", metadata !10, metadata !"char"}
!10 = metadata !{metadata !11}
!11 = metadata !{i32 0, i32 0, i32 1}
!12 = metadata !{i32 786689, metadata !13, metadata !"x", metadata !14, i32 16777217, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"poly", metadata !"poly", metadata !"", metadata !14, i32 1, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8, i8*)* @poly, null, null, metadata !19, i32 1} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 786473, metadata !"lab1.c", metadata !"/home/harri001/Lab1_8bits", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!16 = metadata !{null, metadata !17, metadata !18}
!17 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!21 = metadata !{i32 1, i32 16, metadata !13, null}
!22 = metadata !{i32 786689, metadata !13, metadata !"y", metadata !14, i32 33554433, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!23 = metadata !{i32 1, i32 25, metadata !13, null}
!24 = metadata !{i32 3, i32 2, metadata !25, null}
!25 = metadata !{i32 786443, metadata !13, i32 1, i32 28, metadata !14, i32 0} ; [ DW_TAG_lexical_block ]
!26 = metadata !{i32 4, i32 1, metadata !25, null}

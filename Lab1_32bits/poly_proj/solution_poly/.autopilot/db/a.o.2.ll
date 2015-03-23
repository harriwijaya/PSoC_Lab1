; ModuleID = '/home/harri001/Lab1_32bits/poly_proj/solution_poly/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [5 x i8] c"poly\00"      ; [#uses=1 type=[5 x i8]*]

; [#uses=0]
define void @poly(i32 %x, i32* %y) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %y) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !25), !dbg !26 ; [debug line = 1:15] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32* %y}, i64 0, metadata !27), !dbg !28 ; [debug line = 1:24] [debug variable = y]
  %_shl = shl i32 %x, 2, !dbg !29                 ; [#uses=1 type=i32] [debug line = 3:2]
  %tmp.1 = sub i32 %_shl, %x, !dbg !29            ; [#uses=1 type=i32] [debug line = 3:2]
  %tmp = add i32 %tmp.1, 2                        ; [#uses=1 type=i32]
  %tmp1 = mul i32 %tmp, %x                        ; [#uses=1 type=i32]
  %tmp.2 = add nsw i32 %tmp1, 1, !dbg !29         ; [#uses=1 type=i32] [debug line = 3:2]
  store i32 %tmp.2, i32* %y, align 4, !dbg !29    ; [debug line = 3:2]
  ret void, !dbg !31                              ; [debug line = 4:1]
}

; [#uses=2]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=2]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/harri001/Lab1_32bits/poly_proj/solution_poly/.autopilot/db/lab1.pragma.2.c", metadata !"/home/harri001/Lab1_32bits", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"poly", metadata !"poly", metadata !"", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32*)* @poly, null, null, metadata !11, i32 1} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"lab1.c", metadata !"/home/harri001/Lab1_32bits", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"x", metadata !17, metadata !"int"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 0, i32 0}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"y", metadata !23, metadata !"int"}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 0, i32 1}
!25 = metadata !{i32 786689, metadata !5, metadata !"x", metadata !6, i32 16777217, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!26 = metadata !{i32 1, i32 15, metadata !5, null}
!27 = metadata !{i32 786689, metadata !5, metadata !"y", metadata !6, i32 33554433, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 1, i32 24, metadata !5, null}
!29 = metadata !{i32 3, i32 2, metadata !30, null}
!30 = metadata !{i32 786443, metadata !5, i32 1, i32 27, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!31 = metadata !{i32 4, i32 1, metadata !30, null}

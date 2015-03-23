; ModuleID = '/home/harri001/Lab1_32bits/poly_proj/solution_poly/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [5 x i8] c"poly\00"

define void @poly(i32 %x, i32* %y) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %y) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @str) nounwind
  %x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %x) nounwind
  %tmp_3 = shl i32 %x_read, 2
  %tmp_1 = sub i32 %tmp_3, %x_read
  %tmp = add i32 %tmp_1, 2
  %tmp1 = mul i32 %tmp, %x_read
  %tmp_2 = add nsw i32 %tmp1, 1
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %y, i32 %tmp_2) nounwind
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

declare i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i30.i2(i30, i2) nounwind readnone

!llvm.map.gv = !{}

!0 = metadata !{metadata !1}
!1 = metadata !{i32 0, i32 31, metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{metadata !"x", metadata !4, metadata !"int"}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 0, i32 0, i32 0}
!6 = metadata !{metadata !7}
!7 = metadata !{i32 0, i32 31, metadata !8}
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !"y", metadata !10, metadata !"int"}
!10 = metadata !{metadata !11}
!11 = metadata !{i32 0, i32 0, i32 1}

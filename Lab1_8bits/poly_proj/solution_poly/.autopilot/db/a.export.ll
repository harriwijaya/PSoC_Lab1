; ModuleID = '/home/harri001/Lab1_8bits/poly_proj/solution_poly/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [5 x i8] c"poly\00"

define void @poly(i8 signext %x, i8* %y) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %x) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %y) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @str) nounwind
  %x_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %x) nounwind
  %tmp_3 = shl i8 %x_read, 2
  %tmp_1 = sub i8 %tmp_3, %x_read
  %tmp = add i8 %tmp_1, 2
  %tmp1 = mul i8 %tmp, %x_read
  %tmp_2 = add i8 %tmp1, 1
  call void @_ssdm_op_Write.ap_auto.i8P(i8* %y, i8 %tmp_2) nounwind
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

define weak i8 @_ssdm_op_Read.ap_auto.i8(i8) {
entry:
  ret i8 %0
}

define weak void @_ssdm_op_Write.ap_auto.i8P(i8*, i8) {
entry:
  store i8 %1, i8* %0
  ret void
}

declare i6 @_ssdm_op_PartSelect.i6.i8.i32.i32(i8, i32, i32) nounwind readnone

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

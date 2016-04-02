; ModuleID = 'fib.0.rs'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin"

%str_slice = type { i8*, i64 }
%"2.core::fmt::Formatter" = type { i32, i32, i8, %"2.core::option::Option<usize>", %"2.core::option::Option<usize>", { i8*, void (i8*)** }, %"2.core::slice::Iter<core::fmt::ArgumentV1>", { %"2.core::fmt::ArgumentV1"*, i64 } }
%"2.core::option::Option<usize>" = type { i64, [0 x i64], [1 x i64] }
%"2.core::slice::Iter<core::fmt::ArgumentV1>" = type { %"2.core::fmt::ArgumentV1"*, %"2.core::fmt::ArgumentV1"*, %"2.core::marker::PhantomData<&'static core::fmt::ArgumentV1>" }
%"2.core::fmt::ArgumentV1" = type { %"2.core::fmt::Void"*, i8 (%"2.core::fmt::Void"*, %"2.core::fmt::Formatter"*)* }
%"2.core::fmt::Void" = type {}
%"2.core::marker::PhantomData<&'static core::fmt::ArgumentV1>" = type {}
%"2.core::ops::Range<u64>" = type { i64, i64 }
%"2.core::option::Option<u64>" = type { i64, [0 x i64], [1 x i64] }
%"2.core::fmt::Arguments" = type { { %str_slice*, i64 }, %"2.core::option::Option<&'static [core::fmt::rt::v1::Argument]>", { %"2.core::fmt::ArgumentV1"*, i64 } }
%"2.core::option::Option<&'static [core::fmt::rt::v1::Argument]>" = type { { %"2.core::fmt::rt::v1::Argument"*, i64 } }
%"2.core::fmt::rt::v1::Argument" = type { %"2.core::fmt::rt::v1::Position", %"2.core::fmt::rt::v1::FormatSpec" }
%"2.core::fmt::rt::v1::Position" = type { i64, [0 x i64], [1 x i64] }
%"2.core::fmt::rt::v1::FormatSpec" = type { i32, i8, i32, %"2.core::fmt::rt::v1::Count", %"2.core::fmt::rt::v1::Count" }
%"2.core::fmt::rt::v1::Count" = type { i64, [0 x i64], [1 x i64] }

@const3766 = internal unnamed_addr constant i64 0, align 8
@const3767 = internal unnamed_addr constant i64 1, align 8
@const3768 = internal unnamed_addr constant i64 3, align 8
@const3769 = internal unnamed_addr constant i64 1000000000, align 8
@str3825 = internal constant [31 x i8] c"arithmetic operation overflowed"
@str3827 = internal constant [21 x i8] c"../src/libcore/ops.rs"
@panic_loc3828 = internal unnamed_addr constant { %str_slice, %str_slice, i32 } { %str_slice { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str3825, i32 0, i32 0), i64 31 }, %str_slice { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str3827, i32 0, i32 0), i64 21 }, i32 208 }, align 8
@const3969 = internal unnamed_addr constant { i64, [8 x i8] } { i64 0, [8 x i8] undef }, align 8
@str3971 = internal constant [6 x i8] c"fib.rs"
@panic_loc3972 = internal unnamed_addr constant { %str_slice, %str_slice, i32 } { %str_slice { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str3825, i32 0, i32 0), i64 31 }, %str_slice { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str3971, i32 0, i32 0), i64 6 }, i32 13 }, align 8
@const3978 = internal unnamed_addr constant { { i8*, i8* } } zeroinitializer, align 8
@_ZN4main15__STATIC_FMTSTR20h148d1c036df6bba47aaE = internal constant { %str_slice*, i64 } { %str_slice* getelementptr inbounds ([3 x %str_slice], [3 x %str_slice]* @ref3991, i32 0, i32 0), i64 3 }, align 8
@const3987 = internal unnamed_addr constant i8 (i64*, %"2.core::fmt::Formatter"*)* @_ZN3fmt3num16u64.fmt..Display3fmt20h7d66a70f163a6dbbSTVE, align 8
@str3988 = internal constant [0 x i8] zeroinitializer
@str3989 = internal constant [1 x i8] c" "
@str3990 = internal constant [1 x i8] c"\0A"
@ref3991 = internal unnamed_addr constant [3 x %str_slice] [%str_slice { i8* getelementptr inbounds ([0 x i8], [0 x i8]* @str3988, i32 0, i32 0), i64 0 }, %str_slice { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @str3989, i32 0, i32 0), i64 1 }, %str_slice { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @str3990, i32 0, i32 0), i64 1 }], align 8

; Function Attrs: uwtable
define internal void @_ZN4main20hea55ce560f98b657eaaE() unnamed_addr #0 {
entry-block:
  %i = alloca i64
  %f1 = alloca i64
  %f2 = alloca i64
  %_result = alloca {}
  %0 = alloca %"2.core::ops::Range<u64>"
  %1 = alloca %"2.core::ops::Range<u64>"
  %iter = alloca %"2.core::ops::Range<u64>"*
  %2 = alloca %"2.core::option::Option<u64>"
  %__llmatch = alloca i64*
  %j = alloca i64
  %t = alloca i64
  %3 = alloca %"2.core::fmt::Arguments"
  %4 = alloca { %str_slice*, i64 }
  %5 = alloca [2 x %"2.core::fmt::ArgumentV1"]
  %6 = alloca { i64*, i64* }
  %__llmatch6 = alloca i64**
  %__arg0 = alloca i64*
  %__llmatch7 = alloca i64**
  %__arg1 = alloca i64*
  %__coerce_target = alloca { %"2.core::fmt::ArgumentV1"*, i64 }
  store i64 0, i64* %i, align 8
  store i64 1, i64* %f1, align 8
  store i64 1, i64* %f2, align 8
  %7 = getelementptr inbounds %"2.core::ops::Range<u64>", %"2.core::ops::Range<u64>"* %1, i32 0, i32 0
  store i64 3, i64* %7, align 8
  %8 = getelementptr inbounds %"2.core::ops::Range<u64>", %"2.core::ops::Range<u64>"* %1, i32 0, i32 1
  store i64 1000000000, i64* %8, align 8
  call void @_ZN4iter14I.IntoIterator9into_iter19h976532696457697613E(%"2.core::ops::Range<u64>"* noalias nocapture sret dereferenceable(16) %0, %"2.core::ops::Range<u64>"* noalias nocapture dereferenceable(16) %1)
  store %"2.core::ops::Range<u64>"* %0, %"2.core::ops::Range<u64>"** %iter
  br label %case_body

case_body:                                        ; preds = %entry-block
  %9 = load %"2.core::ops::Range<u64>"*, %"2.core::ops::Range<u64>"** %iter
  br label %loop_body

loop_exit:                                        ; preds = %clean_ast_100_
  br label %join4

loop_body:                                        ; preds = %join, %case_body
  call void @"_ZN4iter28ops..Range$LT$A$GT$.Iterator4next19h323731717494547294E"(%"2.core::option::Option<u64>"* noalias nocapture sret dereferenceable(16) %2, %"2.core::ops::Range<u64>"* noalias dereferenceable(16) %9)
  %10 = getelementptr inbounds %"2.core::option::Option<u64>", %"2.core::option::Option<u64>"* %2, i32 0, i32 0
  %11 = load i64, i64* %10, !range !0
  switch i64 %11, label %match_else [
    i64 1, label %match_case
    i64 0, label %match_case3
  ]

case_body1:                                       ; preds = %match_case
  %12 = load i64*, i64** %__llmatch
  %13 = load i64, i64* %12, align 8
  store i64 %13, i64* %j, align 8
  %14 = bitcast i64* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 29, i64 8, i32 8, i1 false)
  %15 = load i64, i64* %f1, align 8
  store i64 %15, i64* %t, align 8
  %16 = load i64, i64* %f2, align 8
  store i64 %16, i64* %f1, align 8
  %17 = load i64, i64* %t, align 8
  %18 = load i64, i64* %f2, align 8
  %19 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %17, i64 %18)
  %20 = extractvalue { i64, i1 } %19, 0
  %21 = extractvalue { i64, i1 } %19, 1
  %22 = icmp eq i1 %21, true
  %23 = call i1 @llvm.expect.i1(i1 %22, i1 false)
  br i1 %22, label %cond, label %next

case_body2:                                       ; preds = %match_case3
  br label %clean_ast_100_

match_else:                                       ; preds = %loop_body
  unreachable

match_case:                                       ; preds = %loop_body
  %24 = bitcast %"2.core::option::Option<u64>"* %2 to { i64, i64 }*
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 1
  store i64* %25, i64** %__llmatch
  br label %case_body1

match_case3:                                      ; preds = %loop_body
  br label %case_body2

next:                                             ; preds = %case_body1
  store i64 %20, i64* %f2, align 8
  %26 = load i64, i64* %j, align 8
  store i64 %26, i64* %i, align 8
  br label %join

cond:                                             ; preds = %case_body1
  call void @_ZN9panicking5panic20h94bef08fa1f352c06WLE({ %str_slice, %str_slice, i32 }* noalias readonly dereferenceable(40) @panic_loc3972)
  unreachable

clean_ast_100_:                                   ; preds = %case_body2
  br label %loop_exit

join:                                             ; preds = %next
  br label %loop_body

join4:                                            ; preds = %loop_exit
  %27 = bitcast { %str_slice*, i64 }* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* bitcast ({ %str_slice*, i64 }* @_ZN4main15__STATIC_FMTSTR20h148d1c036df6bba47aaE to i8*), i64 16, i32 8, i1 false)
  %28 = getelementptr inbounds { %str_slice*, i64 }, { %str_slice*, i64 }* %4, i32 0, i32 0
  %29 = load %str_slice*, %str_slice** %28
  %30 = getelementptr inbounds { %str_slice*, i64 }, { %str_slice*, i64 }* %4, i32 0, i32 1
  %31 = load i64, i64* %30
  %32 = getelementptr inbounds { i64*, i64* }, { i64*, i64* }* %6, i32 0, i32 0
  store i64* %i, i64** %32, align 8
  %33 = getelementptr inbounds { i64*, i64* }, { i64*, i64* }* %6, i32 0, i32 1
  store i64* %f2, i64** %33, align 8
  %34 = getelementptr inbounds { i64*, i64* }, { i64*, i64* }* %6, i32 0, i32 0
  %35 = getelementptr inbounds { i64*, i64* }, { i64*, i64* }* %6, i32 0, i32 1
  store i64** %35, i64*** %__llmatch7
  store i64** %34, i64*** %__llmatch6
  br label %case_body5

case_body5:                                       ; preds = %join4
  %36 = load i64**, i64*** %__llmatch7
  %37 = load i64*, i64** %36, align 8, !nonnull !1
  store i64* %37, i64** %__arg1, align 8
  %38 = load i64**, i64*** %__llmatch6
  %39 = load i64*, i64** %38, align 8, !nonnull !1
  store i64* %39, i64** %__arg0, align 8
  %40 = getelementptr inbounds [2 x %"2.core::fmt::ArgumentV1"], [2 x %"2.core::fmt::ArgumentV1"]* %5, i32 0, i32 0
  %41 = getelementptr inbounds %"2.core::fmt::ArgumentV1", %"2.core::fmt::ArgumentV1"* %40, i32 0
  %42 = load i64*, i64** %__arg0, align 8, !nonnull !1
  call void @"_ZN3fmt24ArgumentV1$LT$$u27$a$GT$3new20h2761029851994952955E"(%"2.core::fmt::ArgumentV1"* noalias nocapture sret dereferenceable(16) %41, i64* noalias readonly dereferenceable(8) %42, i8 (i64*, %"2.core::fmt::Formatter"*)* @_ZN3fmt3num16u64.fmt..Display3fmt20h7d66a70f163a6dbbSTVE)
  %43 = getelementptr inbounds %"2.core::fmt::ArgumentV1", %"2.core::fmt::ArgumentV1"* %40, i32 1
  %44 = load i64*, i64** %__arg1, align 8, !nonnull !1
  call void @"_ZN3fmt24ArgumentV1$LT$$u27$a$GT$3new20h2761029851994952955E"(%"2.core::fmt::ArgumentV1"* noalias nocapture sret dereferenceable(16) %43, i64* noalias readonly dereferenceable(8) %44, i8 (i64*, %"2.core::fmt::Formatter"*)* @_ZN3fmt3num16u64.fmt..Display3fmt20h7d66a70f163a6dbbSTVE)
  br label %join8

join8:                                            ; preds = %case_body5
  %45 = bitcast [2 x %"2.core::fmt::ArgumentV1"]* %5 to %"2.core::fmt::ArgumentV1"*
  %46 = getelementptr inbounds { %"2.core::fmt::ArgumentV1"*, i64 }, { %"2.core::fmt::ArgumentV1"*, i64 }* %__coerce_target, i32 0, i32 0
  store %"2.core::fmt::ArgumentV1"* %45, %"2.core::fmt::ArgumentV1"** %46
  %47 = getelementptr inbounds { %"2.core::fmt::ArgumentV1"*, i64 }, { %"2.core::fmt::ArgumentV1"*, i64 }* %__coerce_target, i32 0, i32 1
  store i64 2, i64* %47
  %48 = getelementptr inbounds { %"2.core::fmt::ArgumentV1"*, i64 }, { %"2.core::fmt::ArgumentV1"*, i64 }* %__coerce_target, i32 0, i32 0
  %49 = load %"2.core::fmt::ArgumentV1"*, %"2.core::fmt::ArgumentV1"** %48
  %50 = getelementptr inbounds { %"2.core::fmt::ArgumentV1"*, i64 }, { %"2.core::fmt::ArgumentV1"*, i64 }* %__coerce_target, i32 0, i32 1
  %51 = load i64, i64* %50
  call void @"_ZN3fmt23Arguments$LT$$u27$a$GT$6new_v120h7dbe6374a61899058KWE"(%"2.core::fmt::Arguments"* noalias nocapture sret dereferenceable(48) %3, %str_slice* noalias nonnull readonly %29, i64 %31, %"2.core::fmt::ArgumentV1"* noalias nonnull readonly %49, i64 %51)
  call void @_ZN2io5stdio6_print20ha0899236459da4b6KbhE(%"2.core::fmt::Arguments"* noalias nocapture dereferenceable(48) %3)
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN4iter14I.IntoIterator9into_iter19h976532696457697613E(%"2.core::ops::Range<u64>"* noalias nocapture sret dereferenceable(16), %"2.core::ops::Range<u64>"* noalias nocapture dereferenceable(16) %self) unnamed_addr #0 {
entry-block:
  %1 = bitcast %"2.core::ops::Range<u64>"* %self to i8*
  %2 = bitcast %"2.core::ops::Range<u64>"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 16, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: inlinehint uwtable
define internal void @"_ZN4iter28ops..Range$LT$A$GT$.Iterator4next19h323731717494547294E"(%"2.core::option::Option<u64>"* noalias nocapture sret dereferenceable(16), %"2.core::ops::Range<u64>"* noalias dereferenceable(16)) unnamed_addr #2 {
entry-block:
  %self = alloca %"2.core::ops::Range<u64>"*
  %2 = alloca i8
  %n = alloca i64
  %3 = alloca i64
  %addr_of = alloca i64
  %4 = bitcast i64* %addr_of to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 29, i64 8, i32 8, i1 false)
  store %"2.core::ops::Range<u64>"* %1, %"2.core::ops::Range<u64>"** %self, align 8
  %5 = load %"2.core::ops::Range<u64>"*, %"2.core::ops::Range<u64>"** %self, align 8, !nonnull !1
  %6 = getelementptr inbounds %"2.core::ops::Range<u64>", %"2.core::ops::Range<u64>"* %5, i32 0, i32 0
  %7 = load %"2.core::ops::Range<u64>"*, %"2.core::ops::Range<u64>"** %self, align 8, !nonnull !1
  %8 = getelementptr inbounds %"2.core::ops::Range<u64>", %"2.core::ops::Range<u64>"* %7, i32 0, i32 1
  %9 = call zeroext i1 @_ZN3cmp5impls14u64.PartialOrd2lt20h16f7fbb10edf41aac8BE(i64* noalias readonly dereferenceable(8) %6, i64* noalias readonly dereferenceable(8) %8)
  %10 = zext i1 %9 to i8
  store i8 %10, i8* %2, align 1
  %11 = load i8, i8* %2, align 1, !range !2
  %12 = trunc i8 %11 to i1
  br i1 %12, label %then-block-135-, label %else-block

then-block-135-:                                  ; preds = %entry-block
  %13 = load %"2.core::ops::Range<u64>"*, %"2.core::ops::Range<u64>"** %self, align 8, !nonnull !1
  %14 = getelementptr inbounds %"2.core::ops::Range<u64>", %"2.core::ops::Range<u64>"* %13, i32 0, i32 0
  %15 = call i64 @_ZN3num7u64.One3one20he6f0b7fb41e907c5lzhE()
  store i64 %15, i64* %3, align 8
  %16 = load i64, i64* %3, align 8
  store i64 %16, i64* %addr_of, align 8
  %17 = call i64 @"_ZN3ops49_$RF$$u27$b$u20$u64.Add$LT$$RF$$u27$a$u20$u64$GT$3add20h19897ead92a0dad8O2qE"(i64* noalias readonly dereferenceable(8) %14, i64* noalias readonly dereferenceable(8) %addr_of)
  store i64 %17, i64* %n, align 8
  %18 = load %"2.core::ops::Range<u64>"*, %"2.core::ops::Range<u64>"** %self, align 8, !nonnull !1
  %19 = getelementptr inbounds %"2.core::ops::Range<u64>", %"2.core::ops::Range<u64>"* %18, i32 0, i32 0
  call void @_ZN3mem4swap20h6133418381406252974E(i64* noalias dereferenceable(8) %n, i64* noalias dereferenceable(8) %19)
  %20 = bitcast %"2.core::option::Option<u64>"* %0 to { i64, i64 }*
  %21 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %20, i32 0, i32 1
  %22 = load i64, i64* %n, align 8
  store i64 %22, i64* %21, align 8
  %23 = getelementptr inbounds %"2.core::option::Option<u64>", %"2.core::option::Option<u64>"* %0, i32 0, i32 0
  store i64 1, i64* %23
  br label %join

else-block:                                       ; preds = %entry-block
  %24 = bitcast %"2.core::option::Option<u64>"* %0 to { i64, [8 x i8] }*
  %25 = bitcast { i64, [8 x i8] }* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* bitcast ({ i64, [8 x i8] }* @const3969 to i8*), i64 16, i32 8, i1 false)
  br label %join

join:                                             ; preds = %else-block, %then-block-135-
  ret void
}

; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN3cmp5impls14u64.PartialOrd2lt20h16f7fbb10edf41aac8BE(i64* noalias readonly dereferenceable(8), i64* noalias readonly dereferenceable(8)) unnamed_addr #2 {
entry-block:
  %self = alloca i64*
  %other = alloca i64*
  store i64* %0, i64** %self, align 8
  store i64* %1, i64** %other, align 8
  %2 = load i64*, i64** %self, align 8, !nonnull !1
  %3 = load i64, i64* %2, align 8
  %4 = load i64*, i64** %other, align 8, !nonnull !1
  %5 = load i64, i64* %4, align 8
  %6 = icmp ult i64 %3, %5
  %7 = zext i1 %6 to i8
  %8 = trunc i8 %7 to i1
  ret i1 %8
}

; Function Attrs: inlinehint uwtable
define internal i64 @_ZN3num7u64.One3one20he6f0b7fb41e907c5lzhE() unnamed_addr #2 {
entry-block:
  ret i64 1
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: inlinehint uwtable
define internal i64 @"_ZN3ops49_$RF$$u27$b$u20$u64.Add$LT$$RF$$u27$a$u20$u64$GT$3add20h19897ead92a0dad8O2qE"(i64* noalias readonly dereferenceable(8), i64* noalias readonly dereferenceable(8)) unnamed_addr #2 {
entry-block:
  %self = alloca i64*
  %other = alloca i64*
  store i64* %0, i64** %self, align 8
  store i64* %1, i64** %other, align 8
  %2 = load i64*, i64** %self, align 8, !nonnull !1
  %3 = load i64, i64* %2, align 8
  %4 = load i64*, i64** %other, align 8, !nonnull !1
  %5 = load i64, i64* %4, align 8
  %6 = call i64 @_ZN3ops7u64.Add3add20hc1138ec50654e03av1qE(i64 %3, i64 %5)
  ret i64 %6
}

; Function Attrs: inlinehint uwtable
define internal i64 @_ZN3ops7u64.Add3add20hc1138ec50654e03av1qE(i64, i64) unnamed_addr #2 {
entry-block:
  %self = alloca i64
  %other = alloca i64
  store i64 %0, i64* %self, align 8
  store i64 %1, i64* %other, align 8
  %2 = load i64, i64* %self, align 8
  %3 = load i64, i64* %other, align 8
  %4 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %2, i64 %3)
  %5 = extractvalue { i64, i1 } %4, 0
  %6 = extractvalue { i64, i1 } %4, 1
  %7 = icmp eq i1 %6, true
  %8 = call i1 @llvm.expect.i1(i1 %7, i1 false)
  br i1 %7, label %cond, label %next

next:                                             ; preds = %entry-block
  ret i64 %5

cond:                                             ; preds = %entry-block
  call void @_ZN9panicking5panic20h94bef08fa1f352c06WLE({ %str_slice, %str_slice, i32 }* noalias readonly dereferenceable(40) @panic_loc3828)
  unreachable
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #3

; Function Attrs: nounwind readnone
declare i1 @llvm.expect.i1(i1, i1) #3

; Function Attrs: cold noinline noreturn
declare void @_ZN9panicking5panic20h94bef08fa1f352c06WLE({ %str_slice, %str_slice, i32 }* noalias readonly dereferenceable(40)) unnamed_addr #4

; Function Attrs: inlinehint uwtable
define internal void @_ZN3mem4swap20h6133418381406252974E(i64* noalias dereferenceable(8), i64* noalias dereferenceable(8)) unnamed_addr #2 {
entry-block:
  %x = alloca i64*
  %y = alloca i64*
  %t = alloca i64
  store i64* %0, i64** %x, align 8
  store i64* %1, i64** %y, align 8
  %2 = call i64 @_ZN3mem13uninitialized21h13677963806447702328E()
  store i64 %2, i64* %t, align 8
  %3 = load i64*, i64** %x, align 8, !nonnull !1
  %4 = bitcast i64* %t to i8*
  %5 = bitcast i64* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 8, i1 false)
  %6 = load i64*, i64** %y, align 8, !nonnull !1
  %7 = load i64*, i64** %x, align 8, !nonnull !1
  %8 = bitcast i64* %7 to i8*
  %9 = bitcast i64* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 8, i1 false)
  %10 = load i64*, i64** %y, align 8, !nonnull !1
  %11 = bitcast i64* %10 to i8*
  %12 = bitcast i64* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 8, i1 false)
  %13 = load i64, i64* %t, align 8
  call void @_ZN3mem6forget20h5790662362522053783E(i64 %13)
  ret void
}

; Function Attrs: inlinehint uwtable
define internal i64 @_ZN3mem13uninitialized21h13677963806447702328E() unnamed_addr #2 {
entry-block:
  %sret_slot = alloca i64
  %0 = load i64, i64* %sret_slot, align 8
  ret i64 %0
}

; Function Attrs: uwtable
define internal void @_ZN3mem6forget20h5790662362522053783E(i64) unnamed_addr #0 {
entry-block:
  %t = alloca i64
  store i64 %0, i64* %t, align 8
  %1 = load i64, i64* %t, align 8
  ret void
}

declare void @_ZN2io5stdio6_print20ha0899236459da4b6KbhE(%"2.core::fmt::Arguments"* noalias nocapture dereferenceable(48)) unnamed_addr #5

; Function Attrs: inlinehint uwtable
define internal void @"_ZN3fmt23Arguments$LT$$u27$a$GT$6new_v120h7dbe6374a61899058KWE"(%"2.core::fmt::Arguments"* noalias nocapture sret dereferenceable(48), %str_slice* noalias nonnull readonly, i64, %"2.core::fmt::ArgumentV1"* noalias nonnull readonly, i64) unnamed_addr #2 {
entry-block:
  %pieces = alloca { %str_slice*, i64 }
  %args = alloca { %"2.core::fmt::ArgumentV1"*, i64 }
  %5 = getelementptr inbounds { %str_slice*, i64 }, { %str_slice*, i64 }* %pieces, i32 0, i32 0
  store %str_slice* %1, %str_slice** %5
  %6 = getelementptr inbounds { %str_slice*, i64 }, { %str_slice*, i64 }* %pieces, i32 0, i32 1
  store i64 %2, i64* %6
  %7 = getelementptr inbounds { %"2.core::fmt::ArgumentV1"*, i64 }, { %"2.core::fmt::ArgumentV1"*, i64 }* %args, i32 0, i32 0
  store %"2.core::fmt::ArgumentV1"* %3, %"2.core::fmt::ArgumentV1"** %7
  %8 = getelementptr inbounds { %"2.core::fmt::ArgumentV1"*, i64 }, { %"2.core::fmt::ArgumentV1"*, i64 }* %args, i32 0, i32 1
  store i64 %4, i64* %8
  %9 = getelementptr inbounds %"2.core::fmt::Arguments", %"2.core::fmt::Arguments"* %0, i32 0, i32 0
  %10 = bitcast { %str_slice*, i64 }* %pieces to i8*
  %11 = bitcast { %str_slice*, i64 }* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %10, i64 16, i32 8, i1 false)
  %12 = getelementptr inbounds %"2.core::fmt::Arguments", %"2.core::fmt::Arguments"* %0, i32 0, i32 1
  %13 = bitcast %"2.core::option::Option<&'static [core::fmt::rt::v1::Argument]>"* %12 to { { i8*, i8* } }*
  %14 = bitcast { { i8*, i8* } }* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* bitcast ({ { i8*, i8* } }* @const3978 to i8*), i64 16, i32 8, i1 false)
  %15 = getelementptr inbounds %"2.core::fmt::Arguments", %"2.core::fmt::Arguments"* %0, i32 0, i32 2
  %16 = bitcast { %"2.core::fmt::ArgumentV1"*, i64 }* %args to i8*
  %17 = bitcast { %"2.core::fmt::ArgumentV1"*, i64 }* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %16, i64 16, i32 8, i1 false)
  ret void
}

; Function Attrs: uwtable
define internal void @"_ZN3fmt24ArgumentV1$LT$$u27$a$GT$3new20h2761029851994952955E"(%"2.core::fmt::ArgumentV1"* noalias nocapture sret dereferenceable(16), i64* noalias readonly dereferenceable(8), i8 (i64*, %"2.core::fmt::Formatter"*)*) unnamed_addr #0 {
entry-block:
  %x = alloca i64*
  %f = alloca i8 (i64*, %"2.core::fmt::Formatter"*)*
  store i64* %1, i64** %x, align 8
  store i8 (i64*, %"2.core::fmt::Formatter"*)* %2, i8 (i64*, %"2.core::fmt::Formatter"*)** %f, align 8
  %3 = getelementptr inbounds %"2.core::fmt::ArgumentV1", %"2.core::fmt::ArgumentV1"* %0, i32 0, i32 1
  %4 = load i8 (i64*, %"2.core::fmt::Formatter"*)*, i8 (i64*, %"2.core::fmt::Formatter"*)** %f, align 8
  %5 = bitcast i8 (i64*, %"2.core::fmt::Formatter"*)* %4 to i8 (%"2.core::fmt::Void"*, %"2.core::fmt::Formatter"*)*
  store i8 (%"2.core::fmt::Void"*, %"2.core::fmt::Formatter"*)* %5, i8 (%"2.core::fmt::Void"*, %"2.core::fmt::Formatter"*)** %3
  %6 = getelementptr inbounds %"2.core::fmt::ArgumentV1", %"2.core::fmt::ArgumentV1"* %0, i32 0, i32 0
  %7 = load i64*, i64** %x, align 8, !nonnull !1
  %8 = bitcast i64* %7 to %"2.core::fmt::Void"*
  store %"2.core::fmt::Void"* %8, %"2.core::fmt::Void"** %6
  ret void
}

declare i8 @_ZN3fmt3num16u64.fmt..Display3fmt20h7d66a70f163a6dbbSTVE(i64* noalias readonly dereferenceable(8), %"2.core::fmt::Formatter"* noalias dereferenceable(96)) unnamed_addr #5

define i64 @main(i64, i8**) unnamed_addr {
top:
  %2 = call i64 @_ZN2rt10lang_start20hcf1bb0740bf735368VxE(i8* bitcast (void ()* @_ZN4main20hea55ce560f98b657eaaE to i8*), i64 %0, i8** %1)
  ret i64 %2
}

declare i64 @_ZN2rt10lang_start20hcf1bb0740bf735368VxE(i8*, i64, i8**) unnamed_addr #5

attributes #0 = { uwtable "no-frame-pointer-elim"="true" }
attributes #1 = { nounwind }
attributes #2 = { inlinehint uwtable "no-frame-pointer-elim"="true" }
attributes #3 = { nounwind readnone }
attributes #4 = { cold noinline noreturn "no-frame-pointer-elim"="true" }
attributes #5 = { "no-frame-pointer-elim"="true" }

!0 = !{i64 0, i64 2}
!1 = !{}
!2 = !{i8 0, i8 2}

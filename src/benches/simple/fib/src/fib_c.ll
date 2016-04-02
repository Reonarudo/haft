; ModuleID = 'fib.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

@.str = private unnamed_addr constant [9 x i8] c"%ld %ld\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %j = alloca i64, align 8
  %f1 = alloca i64, align 8
  %f2 = alloca i64, align 8
  %t = alloca i64, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i64 1, i64* %f1, align 8
  store i64 1, i64* %f2, align 8
  store i64 3, i64* %j, align 8
  br label %4

; <label>:4                                       ; preds = %13, %0
  %5 = load i64* %j, align 8
  %6 = icmp sle i64 %5, 1000000000
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %4
  %8 = load i64* %f1, align 8
  store i64 %8, i64* %t, align 8
  %9 = load i64* %f2, align 8
  store i64 %9, i64* %f1, align 8
  %10 = load i64* %t, align 8
  %11 = load i64* %f2, align 8
  %12 = add nsw i64 %10, %11
  store i64 %12, i64* %f2, align 8
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i64* %j, align 8
  %15 = add nsw i64 %14, 1
  store i64 %15, i64* %j, align 8
  br label %4

; <label>:16                                      ; preds = %4
  %17 = load i64* %j, align 8
  %18 = load i64* %f2, align 8
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i64 %17, i64 %18)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.0.2 (clang-700.1.81)"}

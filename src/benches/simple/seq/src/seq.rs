
fn foo(x:i32) -> i32{
  return x + 2;
}

fn bar(x:i32) -> i32{
  return foo(x) + 1;
}

fn main() {
  let mut r:i32 = 0;
  r += foo(r);
  r += 1;
  r += bar(r);
  r += 2;
  std::process::exit(r);
}

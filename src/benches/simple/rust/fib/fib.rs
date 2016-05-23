fn main() {

    let mut i:u64=0;
    let mut f1:u64=1;
    let mut f2:u64=1;
    

    for j in 3..1000000000 {
        let t:u64;
        
        t = f1;
        f1 = f2;
        f2 = t + f2;
        i=j;
    }

    println!("{} {}",
              i, f2);
}
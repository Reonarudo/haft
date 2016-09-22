fn main(){
	let mut i=0;
	loop{
		match i {
			100000000	=> 	break,
			_		=> 	if i % 3 == 0 && i % 5 == 0{
							println!("FizzBuzz");
						}else if i % 3 == 0{
							println!("Fizz");
						}else if i % 5 == 0{
							println!("Buzz");
						},
					}
		i=i+1;
	}
}

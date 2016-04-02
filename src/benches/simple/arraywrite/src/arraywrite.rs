use std::env;
use std::char;

const MAXSIZE:usize = 1000*1000;

static mut arr:[char;MAXSIZE]=[' ';MAXSIZE];

fn arraywrite(size:usize){
    for i in 0..size{
		unsafe{
		//char::from_digit best match with atoi
			arr[i]=char::from_digit(i as u32, 10).unwrap();
		}
	}

}

fn main() {
    let args: Vec<_> = env::args().collect();
    if args.len() != 2 {
        println!("usage: {} char_array_size\n", args[0]);
	}else{
		    let size:usize=args[1].parse::<usize>().unwrap();
    
		    arraywrite(size);
			unsafe{
				//TODO:Don't understand why print arr[0]
				println!("arr[0]:{} \n",arr[0]);
			}
	}
}

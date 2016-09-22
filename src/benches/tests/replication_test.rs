#[inline(never)]
fn add(x: i32, y:i32)-> i32{
	return x+y;
}


fn main(){
	let mut count=0;
	let mut r=-1;
	loop{
		r=add(count-1,count);
		if count == 2 {
			break;
		}
		count+=1;
	}
	std::process::exit(r);
}

fn will_Throw_An_Exception(argument:i32) -> i32{
    try!(argument);
    return 1;
}
fn runs_After_Exception_Is_Caught(argument:i32) -> i32{
return 2+argument;
}

int main(){
int result=0;
try {
result=will_Throw_An_Exception(result);
} catch (int exception_value) {
result=runs_After_Exception_Is_Caught(exception_value);
}

return result;
}
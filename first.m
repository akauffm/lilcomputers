#import <Foundation/Foundation.h>

@interface YourClass : NSObject

// I had to redefine the goodbye variable as a string because
// it wouldn't work as a void within NSLog as it was implemented
// in the example.

{
	NSString* byestring;
}
- (NSString*) goodbye;

@end



@interface MyClass : NSObject
{
	float myFloat;
	YourClass* friend;
}

- (void) hello;

@end



@implementation YourClass

- (id) init
{
	self = [super init];
	return self;
}

- (NSString*) goodbye
{
	byestring = @"Goodbye, nice seeing you!";
	return(byestring);
}

- (void) dealloc
{
	// release any retained objects here.
	[super dealloc];
}

@end

@implementation MyClass

- (id) init
{
	self = [super init];
	if(self != nil)
	{
		myFloat = 5.0;
	}
	return self;
}

- (void) hello
{
	NSLog(@"Hello, I'm your first Objective-C program!");
}

- (void) setMyFloat:(float)val
{
	myFloat = val;
}

- (float)myFloat
{
	return myFloat;
}

// setter method
- (void) setFriend:(YourClass*)buddy
{
	//I'm not sure whether this is necessary, given the
	//autorelease in main() but just in case... 
	
	[buddy retain];
	[friend release];
	friend = buddy;
}

// getter method
- (YourClass*)friend
{
	return friend;
}


- (void) dealloc
{
	// release any retained objects here.
	[super dealloc];
}

@end

int main(int argc, char**argv)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// allocate an instance
	MyClass *instance = [[MyClass alloc] init];
	[instance hello];
	
	YourClass *jeremy = [[YourClass alloc] init];
	
	[instance setFriend: jeremy];
	
	[instance setMyFloat: 10.0f];
	NSLog(@"new value is %f", [instance myFloat]);
	
	// The first %@ returns the class and a pointer to the instance.
	// To make it prettier, I guess you could define method that 
	// stores the friend object's name and returns it instead.
	
	NSLog(@"This is my friend %@ and he says '%@'", [instance friend], [[instance friend] goodbye]);
	
	[pool release];
	
	return 0;
}
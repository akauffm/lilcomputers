#import <Foundation/Foundation.h>

@interface YourClass : NSObject

- (void) goodbye;

@end

@interface MyClass : NSObject
{
	float myFloat;
}

- (void) hello;

@end

@implementation YourClass

- (id) init
{
	self = [super init];
	return self;
}

- (void) goodbye
{
	NSLog(@"Goodbye, nice seeing you!");
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
	
	YourClass *myinstance = [[YourClass alloc] init];
	[myinstance goodbye];
	
	[instance setMyFloat: 10.0f];
	NSLog(@"new value is %f", [instance myFloat]);
	
	[pool release];
	
	return 0;
}
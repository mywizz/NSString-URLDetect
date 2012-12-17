// NSString+URLDetect.m
//
// Copyright (c) 2012 Yunseok Kim (http://mywizz.me/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSString+URLDetect.h"

@implementation NSString (URLDetect)

// ---------------------------------------------------------------------
#pragma mark -

- (BOOL)containsURL
{
	NSError *error;
	NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
	
	if (error != nil)
	{
		return NO;
	}
	
	NSArray *matches = [detector matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];

	for (NSTextCheckingResult *match in matches)
	{
		NSRange range = [self rangeOfString:match.URL.absoluteString];
		if ((range.location != NSNotFound) && ([match.URL.scheme isEqualToString:@"http"] || [match.URL.scheme isEqualToString:@"https"]))
		{
			return YES;
		}
	}
	return NO;
}

// ---------------------------------------------------------------------
#pragma mark -

- (NSArray *)componentsByDetectedURLs
{
	NSError *error;
	NSMutableArray *urls = [[NSMutableArray alloc] init];
	NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];

	if (error != nil)
	{
		return urls;
	}
	
	NSArray *matches = [detector matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];

	for (NSTextCheckingResult *match in matches) 
	{
		NSRange range = [self rangeOfString:match.URL.absoluteString];
		if ((range.location != NSNotFound) && ([match.URL.scheme isEqualToString:@"http"] || [match.URL.scheme isEqualToString:@"https"]))
		{
			[urls addObject:match.URL];
		}
	}
	
	return urls;
}
		{
			[urls addObject:url];
		}
	}
	
	return urls;
}

@end
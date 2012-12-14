# NSString+URLDetect

NSString Category for detect URL (which starts with `http://` or `https://`).

## Usage

	NSString *text = @"Visit http://github.com and www.facebook.com";

	BOOL hasURL = [text containsURL]; // YES
	
	NSArray *urls = [text componentsByDetectedURLs]; // returns ("http://github.com")
	

## License

Available under the MIT license.
	
	
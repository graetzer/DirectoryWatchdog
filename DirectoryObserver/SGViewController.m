//
//  SGViewController.m
//  DirectoryObserver
//
//  Copyright (c) 2011 Simon Grätzer.
//

#import "SGViewController.h"
#import "SGDirWatchdog.h"

@implementation SGViewController

@synthesize files;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [observer release];
}

+ (NSString *)documentsPath
{
#ifdef DEBUG
	NSLog(@"%s", __FUNCTION__);
#endif
    
	NSArray *documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [documentsPaths objectAtIndex:0]; // Path to the application's "Documents" directory
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.files = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:[SGViewController documentsPath] error:NULL];
    
    observer = [[SGDirWatchdog alloc]initWithPath:[SGViewController documentsPath]  update:^{
        self.files = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:[SGViewController documentsPath] error:NULL];
        [self.tableView reloadData];
    }];
    
    [observer start];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [observer stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.files.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [self.files objectAtIndex:indexPath.row];
    
    return cell;
};

@end

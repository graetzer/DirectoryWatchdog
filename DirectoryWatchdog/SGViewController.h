//
//  SGViewController.h
//  DirectoryObserver
//
//  Copyright (c) 2011 Simon Grätzer.
//

#import <UIKit/UIKit.h>

@class SGDirWatchdog;
@interface SGViewController : UITableViewController {
    SGDirWatchdog *observer;
}


@property (strong, nonatomic) NSArray *files;

@end

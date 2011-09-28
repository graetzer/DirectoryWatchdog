//
//  SGDirObserver.h
//  DirectoryObserver
//
//  Copyright (c) 2011 Simon Grätzer.
//

#import <Foundation/Foundation.h>

@interface SGDirWatchdog : NSObject {
    NSString *_path;
    void (^_update)(void);
    int					_dirFD;
	CFFileDescriptorRef	_kqRef;
}

@property (nonatomic, readonly) NSString *path;

- (id)initWithPath:(NSString *)path update:(void (^)(void))update;

- (void)start;

- (void)stop;

@end

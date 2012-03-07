# Description #
DirectoryWatchdog is a simple utility tool to mointor changes in local folders. Most common use is the monitoring of an applications documents direcory in combination with iTunes file sharing support. This code uses the BSD kqueue API and should work on OSX as well as iOS.

In the code I use blocks for the callback, so it requires iOS 4 or higher (or OSX 10.6 or newer). You should be able to rewrite it to a delegate pattern, if you want to target older versions

# How to use in your own project #
Just copy the SGDirWatchdog.h and SGDirWatchdog.m files into your project folder and add them to the XCode project.
Then use the class as I do in SGViewController.m

# Example for those who do not have time to look at SGViewController.m #
<pre>
#import "SGDirWatchdog.h"
// TableviewController code ...
- (void)viewDidLoad
{
    [super viewDidLoad];
    observer = [[SGDirWatchdog alloc]initWithPath:[SGViewController documentsPath]  update:^{
        self.files = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:documentsPath error:NULL];
        [self.tableView reloadData];
    }];
    
    [observer start];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [observer stop];
}
// ...
</pre>

# Credits #
Code is based on Michael Heyeck's blogpost: http://www.mlsite.net/blog/?p=2312

# Licence #
Copyright (c) 2011 Simon Grätzer

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
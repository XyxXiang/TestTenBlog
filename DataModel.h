//
//  DataModel.h
//  TestTenBlog
//
//  Created by L'x on 14-10-20.
//  Copyright (c) 2014年 LittleX. All rights reserved.
//

#import <Foundation/Foundation.h>

#define __string(__k__) @property (nonatomic, copy) NSString * __k__

@interface DataModel : NSObject

__string(from);
__string(fromurl);
__string(https_head);
__string(image);
__string(name);
__string(nick);
__string(origtext);
__string(readcount);
__string(text);



@end

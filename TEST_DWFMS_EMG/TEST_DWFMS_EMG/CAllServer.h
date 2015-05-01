//
//  CAllServer.h
//  TEST_DWFMS_EMG
//
//  Created by 김향기 on 2015. 4. 26..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAllServer : NSObject

- (void) test:(NSString*)url  ;
- (NSString *)stringWithUrl:(NSString *)url VAL:(NSMutableDictionary*)value;
@end

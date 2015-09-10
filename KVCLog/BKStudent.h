//
//  BKStudent.h
//  KVCLog
//
//  Created by Konstantyn Bykhkalo on 21.01.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSDate* dateOfBirth;
@property (assign, nonatomic) NSInteger mark;
@property (weak, nonatomic) BKStudent* friend;

+(BKStudent*) randomStudent;

@end

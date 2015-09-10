//
//  BKStudent.m
//  KVCLog
//
//  Created by Konstantyn Bykhkalo on 21.01.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "BKStudent.h"

@interface BKStudent ()

@property (strong, nonatomic) NSString* dateByString;

@end


@implementation BKStudent


static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};
static int namesCount = 50;


+(BKStudent*) randomStudent{
    
    BKStudent* student = [[BKStudent alloc]init];
    
    student.firstName = firstNames[arc4random()%namesCount] ;
    student.lastName = lastNames[arc4random()%namesCount] ;
    
    student.mark = ((arc4random()%5)+1);
    
    NSDate* date = [NSDate date];
    double randomSec = ((arc4random()%350360000)+3000000);
    randomSec = randomSec * (-1);
    date = [date dateByAddingTimeInterval:randomSec];
    
    student.dateOfBirth = date;
    
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd MMMM yyyy"];
    student.dateByString = [NSString stringWithFormat:@"%@",[dateFormater stringFromDate:student.dateOfBirth]];
    
    return student;
}

-(NSString*)description {
    
    return [NSString stringWithFormat:@"student %@ %@ born in %@. MARK = %d. He/She has a friend - %@ ", self.firstName, self.lastName, self.dateByString, self.mark, self.friend.firstName];
    
}

@end

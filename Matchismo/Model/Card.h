//
//  Card.h
//  Matchismo
//
//  Created by Maximino Salazar-Lechuga on 06/02/13.
//  Copyright (c) 2013 Evomatik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;

@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end

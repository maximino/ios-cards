//
//  PlayingCard.h
//  Matchismo
//
//  Created by Maximino Salazar-Lechuga on 06/02/13.
//  Copyright (c) 2013 Evomatik. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Maximino Salazar-Lechuga on 07/02/13.
//  Copyright (c) 2013 Evomatik. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) NSString *info;
@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end


@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    self.info = @"";
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        self.info = self.score > 4 ? [NSString stringWithFormat:@"Bonus! 16"] : [NSString stringWithFormat:@"Nice! add 4"];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.info = [NSString stringWithFormat:@"penalty! - 2"];
                    }
                    break;
                }
            }
            self.score -=FLIP_COST;
            self.info = [NSString stringWithFormat:@"%@ - 1 due flipped up.", self.info];
        }
        card.faceUp = !card.isFaceUp;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = deck.drawRandomCard;
            if (card) {
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

@end

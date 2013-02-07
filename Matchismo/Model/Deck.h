//
//  Deck.h
//  Matchismo
//
//  Created by Maximino Salazar-Lechuga on 06/02/13.
//  Copyright (c) 2013 Evomatik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end

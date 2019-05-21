//
//  TRAPokemonController.h
//  Pokedex26ObjC
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRAPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRAPokemonController : NSObject

-(void) fetchPokemonWithName: (NSString *)name completion: (void (^) (TRAPokemon * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END

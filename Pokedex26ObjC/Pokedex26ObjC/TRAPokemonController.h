//
//  TRAPokemonController.h
//  Pokedex26ObjC
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRAPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRAPokemonController : NSObject

+(void) fetchPokemonWithName: (NSString *)name completion: (void (^) (TRAPokemon * _Nullable))completion;

+(void) fetchImageWithUrlString: (NSString *)urlString completion: (void (^) (UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END

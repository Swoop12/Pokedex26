//
//  TRAPokemon.h
//  Pokedex26ObjC
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRAPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly) NSInteger weight;
@property (nonatomic, copy, readonly) NSString *imageUrl;

-(instancetype)initWithName: (NSString *)name identifier: (NSInteger)identifier weight: (NSInteger)weight imageUrl: (NSString *)imageUrl;

-(instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END

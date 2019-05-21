//
//  TRAPokemon.m
//  Pokedex26ObjC
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

#import "TRAPokemon.h"

@implementation TRAPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier weight:(NSInteger)weight imageUrl:(NSString *)imageUrl
{
    self = [super init];
    if (self) {
        _name = name;
        _identifier = identifier;
        _weight = weight;
        _imageUrl = imageUrl;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    //1) Pull the necessary values out of the dictionary (json)
    NSString *nameFromJson = dictionary[@"name"];
    NSInteger idFromJson = [dictionary[@"id"] integerValue];
    NSInteger weightFromJson = [dictionary[@"weight"] integerValue];
    NSDictionary<NSString *, NSString *> *spritesDictionary = dictionary[@"sprites"];
    NSString *imageUrl = spritesDictionary[@"front_default"];
    
    if(![nameFromJson isKindOfClass:[NSString class]] ||
       ![imageUrl isKindOfClass:[NSString class]]){
        return nil;
    }
    //2) Call the memberwise init with those values
    return [self initWithName:nameFromJson identifier:idFromJson weight:weightFromJson imageUrl:imageUrl];
}
@end

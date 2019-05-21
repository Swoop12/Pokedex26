//
//  TRAPokemonController.m
//  Pokedex26ObjC
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

#import "TRAPokemonController.h"

@implementation TRAPokemonController

+ (void)fetchPokemonWithName:(NSString *)name completion:(void (^)(TRAPokemon * _Nullable))completion
{
    //1) Construct the Url
    NSURL *baseUrl = [NSURL URLWithString:@"https://pokeapi.co/api/v2"];
    NSURL *fullUrl = [[baseUrl URLByAppendingPathComponent:@"pokemon"] URLByAppendingPathComponent:name];
    
    NSLog(@"%@", [fullUrl absoluteString]);
    
    //2) Datatask Completion
    [[[NSURLSession sharedSession] dataTaskWithURL:fullUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data){
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            TRAPokemon *pokemon = [[TRAPokemon alloc] initWithDictionary:jsonDictionary];
            completion(pokemon);
            return;
        }
        completion(nil);
    }] resume];
}

+ (void)fetchImageWithUrlString:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion
{
    //1) Construct the Url
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@", [url absoluteString]);
    
    //2) Datatask & Completion
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        if(data){
            UIImage *pokeImage = [UIImage imageWithData:data];
            completion(pokeImage);
            return;
        }
        completion(nil);
    }] resume];
}

@end

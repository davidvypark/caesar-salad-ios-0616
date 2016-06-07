//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here

-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {
    
    NSMutableString *encodedString = [NSMutableString stringWithString:@""];
    
    for (NSUInteger i = 0; i < message.length; i++) {
        NSString *letterToCode = [message substringWithRange:NSMakeRange(i,1)];
        
        if ([letterToCode isEqualToString:@" "]) {
            
            //if the character is a space
            //keep it a space
            
            [encodedString appendString:@" "];
        } else {
            
            //first translate the letter into an ASCII integer
            unichar asciiCode = [letterToCode characterAtIndex:0];
            

            if(asciiCode < 91 && asciiCode > 64){
                
                //if capital letter
                
                NSInteger shift = ((asciiCode - 64 + key) % 26) + 64;
                
                [encodedString appendString:[NSString stringWithFormat:@"%C",(unichar)shift]];
                
                
                
            } else if (asciiCode < 123 && asciiCode > 96) {
                //if lowercaseleter
                
                NSInteger shift = ((asciiCode - 96 + key) % 26) + 96;
                
                [encodedString appendString:[NSString stringWithFormat:@"%C",(unichar)shift]];
                
                
            } else {
                
                //if not a lowercase or uppercase letter in the alphabet
                //keep it the same
                [encodedString appendString:[NSString stringWithFormat:@"%C",asciiCode]];
            
            }
            
        }
    
    
    }
    
    
    
    return encodedString;
}

-(NSString *)decodeMessage:(NSString *)encodedMessge withOffset:(NSInteger)key {
    
    NSMutableString *decodedString = [NSMutableString stringWithString:@""];
    
    for (NSUInteger i = 0; i < encodedMessge.length; i++) {
        NSString *letterToCode = [encodedMessge substringWithRange:NSMakeRange(i,1)];
        
        if ([letterToCode isEqualToString:@" "]) {
            
            //if the character is a space
            //keep it a space
            
            [decodedString appendString:@" "];
        } else {
            
            //first translate the letter into an ASCII integer
            unichar asciiCode = [letterToCode characterAtIndex:0];
            
            
            if((asciiCode < 91 ) && (asciiCode > 64 )){
                
                //if capital letter
                NSInteger newKey = key % 26;
                NSInteger shift = ((asciiCode - 65 +26 - newKey) % 26) + 65;
                
                [decodedString appendString:[NSString stringWithFormat:@"%C",(unichar)shift]];
                NSLog(@"\n\n\n\n ENCODED: %@ KEY: %li SHIFT: %li \n\n\n\n",encodedMessge, key, shift);
                
                
                
            } else if ((asciiCode < 123) && (asciiCode > 96)) {
                
                //if lowercaseleter
                NSInteger newKey = key % 26;
                NSInteger shift = ((asciiCode - 97 + 26 - newKey) % 26) + 97;
                
                [decodedString appendString:[NSString stringWithFormat:@"%C",(unichar)shift]];
                NSLog(@"\n\n\n\n ENCODED: %@ KEY: %li SHIFT: %li \n\n\n\n",encodedMessge, key, shift);
                
                
            } else {
                
                //if not a lowercase or uppercase letter in the alphabet
                //keep it the same
                [decodedString appendString:[NSString stringWithFormat:@"%C",asciiCode]];
                
            }
            
        }
      //oh dddaaaaaaaang for the decode the letter have to be reduced to 0-25 not 1-26 or else 26 representing z % 26 gives 0 which does not represent a letter. "z" should be represented by 25 and "a" by 0.
        
    }
    
    
    
    return decodedString;
    
}


@end

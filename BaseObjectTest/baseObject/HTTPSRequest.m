//
//  HTTPSRequest.m
//  BaseObjectTest
//
//  Created by dcj on 15/9/2.
//  Copyright (c) 2015年 dcj. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "HTTPSRequest.h"

@interface HTTPSRequest ()<NSURLConnectionDelegate>


@end

@implementation HTTPSRequest

-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{


}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

}
- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection{
    return YES;
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace NS_DEPRECATED(10_6, 10_10, 3_0, 8_0, "Use -connection:willSendRequestForAuthenticationChallenge: instead."){
    return YES;

}
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge NS_DEPRECATED(10_2, 10_10, 2_0, 8_0, "Use -connection:willSendRequestForAuthenticationChallenge: instead."){

}
- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge NS_DEPRECATED(10_2, 10_10, 2_0, 8_0, "Use -connection:willSendRequestForAuthenticationChallenge: instead."){

}


@end

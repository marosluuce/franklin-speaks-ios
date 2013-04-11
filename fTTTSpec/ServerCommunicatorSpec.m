#import <OCDSpec2/OCDSpec2.h>

#import "ServerCommunicator.h"

OCDSpec2Context(ServerCommunicatorSpec) {
  
  Describe(@"+dictionaryToQueryString", ^{
    
    It(@"is stuff=junk for {stuff: junk}", ^{
      NSDictionary *dict = @{@"stuff": @"junk"};
      NSString *query = [ServerCommunicator dictionaryToQueryString:dict];
      
      [ExpectObj(query) toBeEqualTo:@"stuff=junk"];
    });
    
    It(@"is stuff=junk&moar=alsojunk for {stuff: junk, moar: alsojunk}", ^{
      NSDictionary *dict = @{@"stuff": @"junk", @"moar": @"alsojunk"};
      NSString *query = [ServerCommunicator dictionaryToQueryString:dict];
      
      [ExpectObj(query) toBeEqualTo:@"stuff=junk&moar=alsojunk"];
    });
    
  });
  
  Describe(@"-buildRequest", ^{
    
    __block NSURL *url;
    __block ServerCommunicator *communicator;
    __block NSDictionary *dataToSend;
    __block NSURLRequest *request;
    
    BeforeEach(^{
      url = [NSURL URLWithString:@"http://localhost:5000/"];
      communicator = [[ServerCommunicator alloc] initWithUrl:url];
      dataToSend = @{@"square": @"1"};
      request = [communicator createRequest:dataToSend];
    });
    
    It(@"is a post request", ^{      
      [ExpectObj(request.HTTPMethod) toBeEqualTo:@"POST"];
    });
    
    It(@"contains the data to post", ^{
      NSData *expectedData = [[ServerCommunicator dictionaryToQueryString:dataToSend] dataUsingEncoding:NSUTF8StringEncoding];
      
      [ExpectObj(request.HTTPBody) toBeEqualTo:expectedData];
    });
    
    It(@"contains the server url", ^{      
      [ExpectObj(request.URL) toBeEqualTo:url];
    });
    
  });
  
}

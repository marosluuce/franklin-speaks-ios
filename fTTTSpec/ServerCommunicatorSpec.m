#import <OCDSpec2/OCDSpec2.h>

#import "Connector.h"
#import "MockHttpConnector.h"
#import "ServerCommunicator.h"

OCDSpec2Context(ServerCommunicatorSpec) {
  
  __block NSURL *url;
  __block id <Connector> connector;
  __block ServerCommunicator *communicator;
  __block NSDictionary *dataToSend;
  __block NSURLRequest *request;

  BeforeEach(^{
    url = [NSURL URLWithString:@"http://localhost:5000/"];
    connector = [[MockHttpConnector alloc] init];
    communicator = [[ServerCommunicator alloc] initWithUrl:url andWithConnector:connector];
    dataToSend = @{@"square": @"1"};
    request = [communicator createRequest:dataToSend];
  });
  
  Describe(@"-dictionaryToQueryString", ^{
    
    It(@"is stuff=junk for {stuff: junk}", ^{
      NSDictionary *dict = @{@"stuff": @"junk"};
      NSString *query = [communicator dictionaryToQueryString:dict];
      
      [ExpectObj(query) toBeEqualTo:@"stuff=junk"];
    });
    
    It(@"is stuff=junk&moar=alsojunk for {stuff: junk, moar: alsojunk}", ^{
      NSDictionary *dict = @{@"stuff": @"junk", @"moar": @"alsojunk"};
      NSString *query = [communicator dictionaryToQueryString:dict];
      
      [ExpectObj(query) toBeEqualTo:@"stuff=junk&moar=alsojunk"];
    });
    
    It(@"is an empty string for an empty dictionary", ^{
      NSString *query = [communicator dictionaryToQueryString:@{}];
      
      [ExpectObj(query) toBeEqualTo:@""];
    });
    
  });
  
  Describe(@"-buildRequest", ^{
    
    It(@"is a post request", ^{      
      [ExpectObj(request.HTTPMethod) toBeEqualTo:@"POST"];
    });
    
    It(@"contains the data to post", ^{
      NSData *expectedData = [[communicator dictionaryToQueryString:dataToSend] dataUsingEncoding:NSUTF8StringEncoding];
      
      [ExpectObj(request.HTTPBody) toBeEqualTo:expectedData];
    });
    
    It(@"contains the server url", ^{      
      [ExpectObj(request.URL) toBeEqualTo:url];
    });
    
  });
  
  Describe(@"-sendRequest", ^{
    
    It(@"gets back a data object", ^{
      NSData *data = [communicator sendRequest:request withConnector:connector];
      
      [ExpectObj(data) toExist];
    });
    
  });
  
  Describe(@"-parseDataToJson", ^{
    
    It(@"is json", ^{
      NSString *string = @"{\"stuff\": \"junk\", \"moar\": \"moarjunk\"}";
      NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
      NSDictionary *parsedData = [communicator parseDataToJson:(NSData *)data];
            
      [ExpectObj([parsedData objectForKey:@"stuff"]) toBeEqualTo:@"junk"];
      [ExpectObj([parsedData objectForKey:@"moar"]) toBeEqualTo:@"moarjunk"];
    });
    
  });
  
  Describe(@"-communicate", ^{
    
    It(@"takes a data to send, sends it, and returns json response", ^{
      NSDictionary *received = [communicator communicate:@{@"Baltar": @"Gaius"}];
      
      [ExpectObj([received objectForKey:@"Quote"]) toBeEqualTo:@"No more Mr. Nice Gaius!"];
    });
    
  });
  
}

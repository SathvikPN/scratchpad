Client side:
- defining service
- specify methods (remotely callable) : params, return-types
- has a stub provides same methods as server

Server side:
- implements interface
- runs server to handle client calls

gRPC uses Protocol Buffers:
- define structure for data we wish to serialise in [.proto] file
- Protocol buffer data is strucutured as "messaages"

message Person {
  string name = 1;
  int32 id = 2;
  bool is_valid = 3;
}

Generate Code Stubs in preferred language
- after defining datastructures, use protocol-buffer-compiler [protoc] to generate data access classes from proto-definitions
- generated classes has
    accessors,
    methods to serialise/parse whole structure from/to raw bytes
    
Use this generated pb-files in our application to populate, serialise and retrieve.


define gRPC services in a proto-file ------------------------------------------------------------------------------------------
service Greeter {
  rpc SayHello (HelloRequest) returns (HelloReply) {}
}

message HelloRequest {
  string name = 1;
  int32 id = 2;
}

message HelloReply {
  string reply_param = 1;
}


[Concepts] --------------------------------------------------------------------------------------------------------------------

define service:
    specifies methods that can be called remotely (defined params, return types)

gRPC uses Protocol Buffers as Interface Definition Language
    - service interface
    - structure of payload messages
    
4 kinds of service methods
- unary RPC
- server streaming RPC
- client streaming RPC
- Bidirectional streaming RPC



[Using API] ------------------------------------------------------------------------------------------------------------------
Definition(.proto) --> protocol-buffer-compiler-plugins --> generate client & server side code

(server side)
        server implement methods declared by service
        runs a gRPC server to handle client calls
        gRPC infrastructure
        - decodes incoming requests
        - executes service methods
        - encodes service responses
        
(client side)
        client has local obj known as stub
        that implements same methods as service
        client can then just call those methods on local object
        these methods wrap params for the call in the appropriate protocol buffer messaage type
        send requests to server
        return server's protocol buffer responses
        
[Read More] ---------------------------------------------------------------------------------------------------------------------
        Synchronous and Asynchronous RPC calls
        Deadline/timeout
        termination
        metadata info
        
Walkthrough: https://grpc.io/docs/languages/go/   
        

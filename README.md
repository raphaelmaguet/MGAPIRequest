# MGAPIRequest
How to make requests on an API with two output choices in Swift 5+.

Hello everyone I share below an example of a function to make a request in POST with SWIFT 5+.

This function allows you to send a POST request with an API entry point, parameters in the form of [[String: String]] and an Integer to determine the output action.

For the output action we call a function with Switch Case MGRequestAction(MGGetIdRq: Int, MGGetData: String).

The operation is extremely simple. Add the MGRequest to your Swift project.

How to use this, you have two possibilities, the first one is to process what the function MGSetRequestApi() (String) returns or to pass by the function MGRequestAction(MGGetIdRq: Int, MGGetData: String) which will call your Json parse function.

The function MGRequestAction(MGGetIdRq: Int, MGGetData: String) takes for parameter an Integer for the choice of the action and the String of the return of the request

Now to use it do like this:

# How Akka maps to EAI Patterns
 
Might be up for debate or just plain wrong. Just some notes I scribbled down some time ago.

|   |   |   |
| - | - | - |
| EAI PATTERN | AKKA PATTERN | REFERENCE |
| Point to Point Channel | Regular Actor Communication | PointToPointChannel.html |
| Event-Driven Consumer | Regular Actor Receive | EventDrivenConsumer.html |
| Message Selector | Actor with Stash | MessageSelector.html |
| Publish-Subscribe Channel | EventBus or DistributedPubSub | | PublishSubscribeChannel.html |
| Dead Letter Channel |  DeadLetterActor | DeadLetterChannel.html |
| Return Address | Implicit Sender Ref | ReturnAddress.html |
| Command or Event Message | Akka Persistence | CommandMessage.html | 
| Request Reply | Ask Pattern | RequestReply.html |
| Idempotent Receiver | Idempotent Actor | IdempotentReceiver.html |
| Resequencer | Message Sequence Ids | Resequencer.html |
| Aggregator | Ask + Future composition | Aggregator.html |
| PollingConsumer | Polling Actor | PollingConsumer.html |
| Wire Tap or Smart Proxy | Forward Pattern | WireTap.html | 
| Message Store | Akka Persistence | MessageStore.html |
| Message Dispatcher | BalancingDispatcher | MessageDispatcher.html |
| Messaging Gateway | Inbox or ClusterClient | MessagingGateway.html |
| Pipes and Filters | Pipelining or Typed Channels | PipesAndFilters.html |
| Dynamic Router | Adaptive Routers | DynamicRouter.html |
| Broadcast Aggregate | ScatterGather Router | BroadcastAggregate.html |
| Content-Based Router | ConsistentHashing Router | ContentBasedRouter.html |



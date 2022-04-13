trigger AccountTriggerQueue on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        system.enqueueJob(new ContactCreationQueueable(Trigger.new)); //Chaining        
    }
}
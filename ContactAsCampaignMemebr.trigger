/*
>> When contact is insert or update then add contact as campagin memeber if that contact is not existing as campaign member on particular campaign.
>> Create custom look up on contact with campaign .
*/
trigger ContactAsCampaignMemebr on Contact(after insert, after update) {
  // Call CampaignMemberHelper class for insert campaign member
  // if campaign member not existing on particular campaign
  CampaignMemberHelper campaignContactHelper = new CampaignMemberHelper();
  if (Trigger.isInsert && Trigger.isAfter) {
    campaignContactHelper.insertContactAsCampaginMember(Trigger.new);
  }
  if (Trigger.isUpdate && Trigger.isAfter) {
    campaignContactHelper.insertContactAsCampaginMember(Trigger.new);
  }
}

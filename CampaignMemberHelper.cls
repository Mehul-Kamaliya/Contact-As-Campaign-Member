public with sharing class CampaignMemberHelper {
  public void insertContactAsCampaginMember(List<Contact> cons) {
    // Check campaign member is existing or not
    List<CampaignMember> existingCampaignMember = [
      SELECT ContactId
      FROM CampaignMember
      WHERE ContactId = :cons
    ];
    // If Contact as campaignMember does not exisitng on particular campaign
    // then contact add as campaign member on particular campagin
    if (existingCampaignMember.isEmpty()) {
      try {
        List<CampaignMember> insertCampaignMembers = new List<CampaignMember>();
        for (Contact con : cons) {
          if (con.Campaign_Id__c != null) {
            insertCampaignMembers.add(
              new CampaignMember(
                CampaignId = con.Campaign_Id__c,
                ContactId = con.Id
              )
            );
          }
        }
        if (!insertCampaignMembers.isEmpty()) {
          insert insertCampaignMembers;
        }
      } catch (Exception e) {
        system.debug('exception:' + e);
      }
    }
  }
}

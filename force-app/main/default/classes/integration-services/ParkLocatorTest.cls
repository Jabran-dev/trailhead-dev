@isTest
private class ParkLocatorTest 
{
    static testmethod void testParkLocator() 
    {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country_name = 'Germany';
        String[] country_parks = ParkLocator.country(country_name);
        System.assertEquals(country_parks[0], 'XYZ');
    }
}

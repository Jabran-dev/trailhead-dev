@isTest
private class AnimalLocatorTest 
{
    static testmethod void testAnimalLocator() 
    {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String animal_name = AnimalLocator.getAnimalNameById(1);
        System.debug('Animal Name: '+animal_name);
        System.assertEquals(animal_name, 'chicken');
    }
}
